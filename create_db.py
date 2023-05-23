from database import Base, engine
from models.models import User
from models.models import Group

print("Creating database ....")

Base.metadata.create_all(engine)