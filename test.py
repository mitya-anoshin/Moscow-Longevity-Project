from database import SessionLocal
from models import User

user = User("asfasfasf", "asdfasf", "asdfasf", 1421412, "asdhfasf")
session = SessionLocal()
session.add(user)
session.commit()