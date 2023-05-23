import uuid
from database import Base
from sqlalchemy import Column, String, DateTime, ForeignKey


def generate_uuid():
    return str(uuid.uuid4())


class User(Base):
    __tablename__ = "user"

    id = Column(String, primary_key=True, default=generate_uuid)
    registered_at = Column(DateTime, nullable=False)
    gender = Column(String, nullable=False)
    born_at = Column(DateTime, nullable=False) # TODO: дататайм не робит
    street = Column(String, nullable=False)
    hashed_password = Column(String, nullable=False)
    login = Column(String, nullable=False)

    def __init__(self, login: str, hashed_password: str, gender: str, born_at: str, street: str):
        self.login = login
        self.hashed_password = hashed_password
        self.gender = gender
        self.born_at = born_at
        self.street = street


    def dict(self):
        return {
            "id": self.id,
            "registered_at": self.registered_at,
            "gender": self.gender,
            "born_at": self.born_at,
            "street": self.street,
            "hashed_password": self.hashed_password,
            "login": self.login
        }


class Group(Base):
    __tablename__ = "group"

    id = Column(String, primary_key=True, default=generate_uuid)
    direction_1 = Column(String, nullable=False)
    direction_2 = Column(String, nullable=False)
    direction_3 = Column(String, nullable=False)
    event_address = Column(String, nullable=False)
    big_district = Column(String, nullable=False)
    small_district = Column(String, nullable=False)
    open_schedule = Column(String, nullable=True)
    close_schedule = Column(String, nullable=False)
    plan_schedule = Column(String, nullable=True)
# user_id = Column(String, ForeignKey("user.id"))

    def dict(self):
        return {
            "group_id": self.group_id,
            "direction_1": self.direction_1,
            "direction_2": self.direction_2,
            "direction_3": self.direction_3,
            "event_address": self.event_address,
            "big_district": self.big_district,
            "small_district": self.small_district,
            "open_schedule": self.open_schedule,
            "close_schedule": self.close_schedule,
            "plan_schedule": self.plan_schedule,
            "user_id": self.user_id,
        }
