from sqlalchemy import MetaData, Table, Column, Integer, String, TIMESTAMP, ForeignKey, JSON, DATE
from datetime import datetime

metadata = MetaData()

users = Table(
    "users",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("registered_at", TIMESTAMP, default=datetime.utcnow),
    Column('gender', String, nullable=False),
    Column("born_at", TIMESTAMP, default=datetime.utcnow),
    Column('street', String, nullable=False),
    Column("hashed_password", String, nullable=False),
    Column("login", String, nullable=False),

)

Groups = Table(
    "groups",
    metadata,
    # думаю что не зависит от юзеров
    Column("group_id", Integer, primary_key=True),
    Column('direction_1', String, nullable=False),
    Column('direction_2', String, nullable=False),
    Column('direction_3', String, nullable=False),
    Column('event_address', String, nullable=False),
    Column('big_district', String, nullable=False),
    Column('small_district', String, nullable=False),
    Column('open_schedule', String, nullable=True),
    Column('close_schedule', String, nullable=False),
    Column('plan_schedule', String, nullable=True),

)