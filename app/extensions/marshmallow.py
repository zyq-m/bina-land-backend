from flask_marshmallow import Marshmallow

from app.models.Property import Property
from app.models.Role import Role
from app.models.User import User

ma = Marshmallow()


class RoleSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Role


class UserSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = User
        fields = ("email", "role")

    role = ma.auto_field


class PropertySchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Property
