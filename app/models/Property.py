from sqlalchemy import JSON, Float, Text, text, String, Numeric
from sqlalchemy.orm import Mapped, mapped_column

from app.extensions.db import db


class Property(db.Model):
    __tablename__ = "properties"

    id: Mapped[str] = mapped_column(
        String(255), primary_key=True, default=text("uuid_short()")
    )
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    price: Mapped[float] = mapped_column(Numeric(10, 2), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    sqft: Mapped[float] = mapped_column(Float, nullable=False)

    address: Mapped[str] = mapped_column(Text, nullable=False)
    city: Mapped[str] = mapped_column(String(255), nullable=False)
    state: Mapped[str] = mapped_column(String(255), nullable=False)
    zip: Mapped[str] = mapped_column(String(50), nullable=False)
    country: Mapped[str] = mapped_column(String(255), nullable=False)
    map: Mapped[str] = mapped_column(JSON, nullable=True)

    image: Mapped[str] = mapped_column(JSON, nullable=True)
    video: Mapped[str] = mapped_column(Text, nullable=True)
