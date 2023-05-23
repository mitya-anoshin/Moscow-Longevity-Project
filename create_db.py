from database import Base, engine

# Do not fucking touch, shit does not work without it :)
from models import User


print('Create database...')
Base.metadata.create_all(engine)
