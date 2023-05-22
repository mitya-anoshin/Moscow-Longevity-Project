from sqlalchemy import MetaData, Table, Column, Integer, String, TIMESTAMP, ForeignKey, JSON, DATE, Boolean
from datetime import datetime
from core.db import Base

metadata = MetaData()


class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    registered_at = Column(TIMESTAMP, default=datetime.utcnow)
    gender = Column(String, nullable=False)
    born_at = Column(TIMESTAMP, default=datetime.utcnow)
    street = Column(String, nullable=False)
    is_active = Column(Boolean, default=True, nullable=False)
    is_superuser = Column(Boolean, default=False, nullable=False)
    is_verified = Column(Boolean, default=False, nullable=False)


class Group(Base):
    __tablename__ = 'group'
    group_id = Column(Integer, primary_key=True)
    direction_1 = Column(String, nullable=False)
    direction_2 = Column(String, nullable=False)
    direction_3 = Column(String, nullable=False)
    event_address = Column(String, nullable=False)
    big_district = Column(String, nullable=False)
    small_district = Column(String, nullable=False)
    open_schedule = Column(String, nullable=True)
    close_schedule = Column(String, nullable=False)
    plan_schedule = Column(String, nullable=True)
