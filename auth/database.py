from datetime import datetime
from typing import AsyncGenerator

from fastapi import Depends
from fastapi_users.db import SQLAlchemyBaseUserTable, SQLAlchemyUserDatabase
from sqlalchemy import Column, String, Boolean, Integer, TIMESTAMP, ForeignKey
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.ext.declarative import DeclarativeMeta, declarative_base
from sqlalchemy.orm import sessionmaker


DATABASE_URL = f"postgresql+asyncpg://postgres:user@localhost/retirees"
Base: DeclarativeMeta = declarative_base()


class User(SQLAlchemyBaseUserTable[int], Base):
    id = Column(Integer, primary_key=True),
    registered_at = Column(TIMESTAMP, default=datetime.utcnow),
    gender = Column(String, nullable=False),
    born_at = Column(TIMESTAMP, default=datetime.utcnow),
    street = Column(String, nullable=False),
    login = Column(String, nullable=False),
    hashed_password: str = Column(String(length=1024), nullable=False)


engine = create_async_engine(DATABASE_URL)
async_session_maker = sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)


async def get_async_session() -> AsyncGenerator[AsyncSession, None]:
    async with async_session_maker() as session:
        yield session


async def get_user_db(session: AsyncSession = Depends(get_async_session)):
    yield SQLAlchemyUserDatabase(session, User)