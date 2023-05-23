from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from fastapi import FastAPI, Depends, HTTPException
from datetime import datetime, timedelta
from pydantic import BaseModel
from datetime import date
from database import SessionLocal
import models.models
import uuid
import jwt



app = FastAPI()
security = HTTPBearer()

# Configuration
ALGORITHM = 'HS256'
SECRET_KEY = 'my_secret_key'
ACCESS_TOKEN_EXPIRE_MINUTES = 30

# Users database
users = [
    {'login': 'alice', 'password': '$2b$12$p/ZyDeo2ve7MSozJLxQpRuOUWVTs8vsBgufu5mIaa6cyvOhGLO0YO'},
    {'login': 'bob', 'password': '$2b$12$q2brtEo0GQJ8UxAs8J/UNutck7gRQ29q6ehh2y3h29.N5L5EvoAAW'}
]

# Create instance
class User(BaseModel):
    id: uuid
    registered_at: str
    login: str
    password: str
    gender: str
    born_at: date
    street: str


person = User()
session = SessionLocal()



def create_access_token(data: dict, expires_delta: timedelta):
    """
    Creates access token for user.
    """

    to_encode = data.copy()
    to_encode.update({'exp': datetime.utcnow() + expires_delta})
    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)


def verify_token(token: str):
    """
    Verifies access token.
    """

    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        login = payload.get('sub')

        if login is None:
            raise HTTPException(status_code=401, detail='Invalid token')

        return login
    except jwt.ExpiredSignatureError:
        raise HTTPException(status_code=401, detail='Token has expired')
    except jwt.JWTError:
        raise HTTPException(status_code=401, detail='Invalid token')


def authenticate_user(login: str, password: str):
    """
    User authorization.
    """

    for user in users:
        if user.login == login and user.verify_password(password):
            return user  # TODO: исправить пользователя на бд где лежат


@app.post('/register')
def register(login: str, password: str, gender: str, born_at: date, street: str):
    user = models.models.User(login=login, password=password, gender=gender, born_at=born_at, street=street)
    # users.append(user)  # TODO: исправить пользователя на бд где лежат
    session.add(user)
    session.commit()
    return {'message': 'User registered successfully'}


@app.post('/login')
def login(login: str, password: str):
    user = authenticate_user(login, password)

    if not user:
        raise HTTPException(status_code=401, detail='Invalid login or password')

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token({'sub': user.login}, access_token_expires)

    return {'access_token': access_token, 'token_type': 'bearer'}


@app.get('/protected')
def protected_route(token: str = Depends(security)):
    login = verify_token(token)
    return {'message': f'Hello, {login}!'}
