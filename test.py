from database import SessionLocal
from models.models import User
import time

user = User(2424, "asdfasf", "asdfasf", 234234, "asdhfasf")
session = SessionLocal()
session.add(user)
session.commit()