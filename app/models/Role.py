from flask import current_app
from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column

from app.extensions.db import db


class Role(db.Model):
    __tablename__ = "roles"

    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column(String(20), nullable=False)
