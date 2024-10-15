import click
from flask import current_app, g
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase


class Base(DeclarativeBase):
    pass


db = SQLAlchemy(model_class=Base)


# def get_db():
#     if "db" not in g:
#         g.db = db

#     return g.db


# def close_db():
#     db = g.pop("db", None)

#     if db is not None:
#         db.close()


# def init_db():
#     b = get_db()

#     with current_app.app_context():
#         b.create_all()


# @click.command("init-db")
# def init_db_command():
#     init_db()
#     click.echo("Initialized the database.")


# def init_app(app):
#     # app.teardown_appcontext(close_db)
#     b = get_db()
#     app.cli.add_command(init_db_command)
