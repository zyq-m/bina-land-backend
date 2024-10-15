from flask import Blueprint, jsonify, request
from flask_jwt_extended import (
    create_access_token,
    create_refresh_token,
    get_jwt_identity,
    jwt_required,
)
from sqlalchemy import exc

from app.extensions.bcrypt import bcrypt
from app.extensions.marshmallow import UserSchema
from app.extensions.db import db

from app.models.User import User

bp = Blueprint("auth", __name__, url_prefix="/auth")
# schema
single_user = UserSchema()


@bp.post("/login")
def login():
    data = request.get_json()
    user = User.query.filter_by(email=data["email"]).first()

    if not user:
        return jsonify(message="User not found"), 404

    if not bcrypt.check_password_hash(user.password, data["password"]):
        return jsonify(message="Password incorrect"), 400

    user_details = single_user.dump(user)
    user_details["role"] = {"id": user.role.id, "name": user.role.name}  # type: ignore

    access_token = create_access_token(identity=user_details)
    refresh_token = create_refresh_token(identity=user_details)

    return jsonify(access_token=access_token, refresh_token=refresh_token), 200


@bp.post("/sign_up")
def sign_up():
    data = request.get_json()

    if (
        data["email"] == ""
        or data["password"] == ""
        or data["con_password"] == ""
        or data["first_name"] == ""
    ):
        return jsonify(message="Please enter invalid credentials"), 400

    if data["password"] != data["con_password"]:
        return jsonify(message="Confirm password incorrect"), 400

    try:
        new_user = User(
            email=data["email"],  # type: ignore
            first_name=data["first_name"],  # type: ignore
            last_name=data["last_name"],  # type: ignore
            password=bcrypt.generate_password_hash(data["password"]),  # type: ignore
        )

        db.session.add(new_user)
        db.session.commit()

        return jsonify(message="Signup successful. Please log in to your account"), 201
    except exc.IntegrityError as ex:
        return jsonify(message="Email already in use"), 400


@bp.post("/refresh")
@jwt_required(refresh=True)
def refresh_token():
    identity = get_jwt_identity()
    access_token = create_access_token(identity=identity)

    return jsonify(access_token=access_token)
