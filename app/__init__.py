from datetime import timedelta
import os

from flask import Flask

# extensions
from app.extensions.cors import cors
from app.extensions.db import db
from app.extensions.bcrypt import bcrypt
from app.extensions.jwt import jwt
from app.extensions.marshmallow import ma

# routes
from app.routes import auth, property

# models
from app.models import Role, User, Property, WishList


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SQLALCHEMY_DATABASE_URI="mysql://root@localhost/bina_land_dev",
        JWT_SECRET_KEY="secret",
        JWT_ACCESS_TOKEN_EXPIRES=timedelta(hours=1),
        JWT_REFRESH_TOKEN_EXPIRES=timedelta(days=30),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile("config.py", silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # initialize extension
    db.init_app(app)
    bcrypt.init_app(app)
    jwt.init_app(app)
    ma.init_app(app)
    cors.init_app(app)

    # blueprints
    app.register_blueprint(auth.bp)
    app.register_blueprint(property.bp)

    return app
