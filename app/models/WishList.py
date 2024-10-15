from sqlalchemy import ForeignKey, String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.User import User
from app.models.Property import Property
from app.extensions.db import db


class WishList(db.Model):
    __tablename__ = "wishlists"

    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    email: Mapped[str] = mapped_column(String(255), ForeignKey("users.email"))
    property_id: Mapped[str] = mapped_column(ForeignKey("properties.id"))

    property: Mapped[Property] = relationship(backref="properties")
    user: Mapped[User] = relationship(backref="users")
