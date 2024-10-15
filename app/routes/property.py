from flask import Blueprint, json, jsonify, request
from flask_jwt_extended import jwt_required
from sqlalchemy import exc, and_

from app.extensions.marshmallow import PropertySchema
from app.extensions.db import db

from app.models.Property import Property

import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from sklearn.preprocessing import StandardScaler

bp = Blueprint("property", __name__, url_prefix="/property")
# schema
one_property = PropertySchema()
many_property = PropertySchema(many=True)

model = load_model("mlp_model.h5")
tokenizer = Tokenizer(num_words=10000)
scaler = StandardScaler()


@bp.get("/predict")
def predict():
    # Get the JSON data from the request
    data = request.args
    address = data.get("address", "")
    city = data.get("city", "")
    state = data.get("state", "")
    name = data.get("name", "")
    price = data.get("price", 0)
    sqft = data.get("sqft", 0)

    # Preprocess text data
    text_data = address + " " + city + " " + state + " " + name
    text_sequence = tokenizer.texts_to_sequences([text_data])
    padded_text_sequence = pad_sequences(text_sequence, maxlen=20)

    # Preprocess numerical data
    numerical_data = np.array([[float(price), float(sqft)]])
    scaled_numerical_data = scaler.transform(numerical_data)

    # Combine text and numerical data
    combined_features = np.hstack((padded_text_sequence, scaled_numerical_data))

    # Make predictions
    prediction = model.predict(combined_features)

    # Convert prediction to binary (using a threshold, e.g., 0.5)
    prediction_binary = (prediction > 0.5).astype(int).tolist()

    # Return the prediction as a JSON response
    return jsonify(prediction_binary)


@bp.get("/search")
def get_property_by_query():
    query = request.args
    name = query.get("name")
    state = query.get("state")
    city = query.get("city")
    min_price = query.get("min_price")
    max_price = query.get("max_price")
    min_sqft = query.get("min_sqft")
    max_sqft = query.get("max_sqft")

    filters = []

    if name:
        filters.append(Property.name.ilike(f"%{name}%"))
    if state:
        filters.append(Property.state == state)
    if city:
        filters.append(Property.city == city)
    if min_price:
        filters.append(Property.price >= min_price)
    if max_price:
        filters.append(Property.price <= max_price)
    if min_sqft:
        filters.append(Property.sqft >= min_sqft)
    if max_sqft:
        filters.append(Property.sqft <= max_sqft)

    property = Property.query.filter(and_(*filters)).all()

    return jsonify(property=many_property.dump(property)), 200


@bp.get("/<id>")
def get_property_by_id(id):
    # return jsonify(property=id), 200
    property = Property.query.filter_by(id=id).first()
    return jsonify(property=one_property.dump(property)), 200


@bp.post("/")
# @jwt_required()
def create_property():
    data = request.get_json()
    new_properties = [
        Property(
            name=item["name"],  # type: ignore
            price=item["price"],  # type: ignore
            description=item["description"],  # type: ignore
            sqft=item["sqft"],  # type: ignore
            address=item["address"],  # type: ignore
            city=item["city"],  # type: ignore
            state=item["state"],  # type: ignore
            zip=item["zip"],  # type: ignore
            country=item["country"],  # type: ignore
            map=item["map"],  # type: ignore
            image=item["image"],  # type: ignore
            video=item["video"],  # type: ignore
        )
        for item in data
    ]

    try:
        db.session.bulk_save_objects(new_properties)
        db.session.commit()

        return jsonify(property=many_property.dump(new_properties)), 201
    except exc.IntegrityError:
        db.session.rollback()

        return (
            jsonify({"error": "Property already exists"}),
            400,
        )
    except Exception as e:
        db.session.rollback()

        return jsonify({"error": str(e)}), 500
