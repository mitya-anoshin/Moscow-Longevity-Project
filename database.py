from sqlalchemy.orm import declarative_base, sessionmaker
from sqlalchemy import create_engine


engine = create_engine('postgresql://postgres:user@localhost:5432/pension', echo=True)

Base = declarative_base()

Session = sessionmaker(bind=engine)
