from database import Session
from models import User


user = User('admin', '1234', 'male', 12345678, 'moscow')
session = Session()
session.add(user)
session.commit()

print(session.query(User).all())
