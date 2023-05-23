from sqlalchemy import Column, String, DateTime, TIMESTAMP
from passlib.context import CryptContext
from database import Base
import uuid


# Crypto context for hashing
pwd_context = CryptContext(schemes=['bcrypt'], deprecated='auto')


def generate_uuid():
    return str(uuid.uuid4())


class User(Base):
    __tablename__ = 'users'

    id = Column(String, primary_key=True, default=generate_uuid)
    registered_at = Column(TIMESTAMP, nullable=False)

    login = Column(String, nullable=False)
    hashed_password = Column(String, nullable=False)
    gender = Column(String, nullable=False)
    born_at = Column(TIMESTAMP, nullable=False)  # TODO: дататайм не робит
    street = Column(String, nullable=False)

    def __init__(self, login: str, password: str, gender: str, born_at: str, street: str):
        self.login = login
        self.hashed_password = pwd_context.hash(password)
        self.gender = gender
        self.born_at = born_at
        self.street = street

    def verify_password(self, plain_password: str):
        return pwd_context.verify(plain_password, self.hashed_password)

    def dict(self):
        return {
            'id': self.id,
            'registered_at': self.registered_at,
            'gender': self.gender,
            'born_at': self.born_at,
            'street': self.street,
            'hashed_password': self.hashed_password,
            'login': self.login
        }


class Group(Base):
    __tablename__ = 'groups'

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

    def __init__(self, direction_1: str, direction_2: str, direction_3: str, event_address: str, big_district: str, small_district: str, open_schedule: str, close_schedule: str):
        self.direction_1 = direction_1
        self.direction_2 = direction_2
        self.direction_3 = direction_3
        self.event_address = event_address
        self.big_district = big_district
        self.small_district = small_district
        self.open_schedule = open_schedule
        self.close_schedule = close_schedule

    def dict(self):
        return {
            'group_id': self.group_id,
            'direction_1': self.direction_1,
            'direction_2': self.direction_2,
            'direction_3': self.direction_3,
            'event_address': self.event_address,
            'big_district': self.big_district,
            'small_district': self.small_district,
            'open_schedule': self.open_schedule,
            'close_schedule': self.close_schedule,
            'plan_schedule': self.plan_schedule,
            'user_id': self.user_id,
        }
