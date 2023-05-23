from database import Base, engine
from models import User

print("create database ....")

Base.metadata.create_all(engine)