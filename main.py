import uvicorn
from fastapi import FastAPI, Depends, HTTPException
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from passlib.context import CryptContext
from datetime import datetime, timedelta

import models.models
from models.models import User, Group
import jwt

app = FastAPI()
security = HTTPBearer()

# Конфигурация
SECRET_KEY = "mysecretkey"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30

# Хранение пользователей (для примера)
# ебаная бд
users = [
    {"login": "alice", "password": "$2b$12$p/ZyDeo2ve7MSozJLxQpRuOUWVTs8vsBgufu5mIaa6cyvOhGLO0YO"},
    {"login": "bob", "password": "$2b$12$q2brtEo0GQJ8UxAs8J/UNutck7gRQ29q6ehh2y3h29.N5L5EvoAAW"}
]

# Хеширование пароля
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


# Генерация токена доступа
def create_access_token(data: dict, expires_delta: timedelta):
    to_encode = data.copy()
    expire = datetime.utcnow() + expires_delta
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


# Верификация токена доступа
def verify_token(token: str):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        login = payload.get("sub")
        if login is None:
            raise HTTPException(status_code=401, detail="Invalid token")
        return login
    except jwt.ExpiredSignatureError:
        raise HTTPException(status_code=401, detail="Token has expired")
    except jwt.JWTError:
        raise HTTPException(status_code=401, detail="Invalid token")


# Получение хеша пароля
def get_hashed_password(password: str):
    return pwd_context.hash(password)


# Проверка хеша пароля
def verify_password(plain_password: str, hashed_password: str):
    return pwd_context.verify(plain_password, hashed_password)


# Регистрация пользователя
def register_user(login: str, password: str, gender: str, born_at: str, street: str):
    hashed_password = get_hashed_password(password)
    user = models.models.User(login=login, hashed_password=hashed_password, gender=gender, born_at=born_at, street=street)
    users.append(user)  # TODO: исправить пользователя на бд где лежат


# Авторизация пользователя
def authenticate_user(login: str, password: str):
    for user in users:
        if user.login == login and verify_password(password, user.hashed_password):
            return user  # TODO: исправить пользователя на бд где лежат


# Роуты
@app.post("/register")
def register(login: str, password: str, gender: str, born_at: str, street: str):
    register_user(login, password, gender, born_at, street)
    return {"message": "User registered successfully"}


@app.post("/login")
def login(credentials: HTTPAuthorizationCredentials = Depends(security)):
    login = credentials.login
    password = credentials.password

    user = authenticate_user(login, password)
    if not user:
        raise HTTPException(status_code=401, detail="Invalid login or password")

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token({"sub": user.login}, access_token_expires)

    return {"access_token": access_token, "token_type": "bearer"}


@app.get("/protected")
def protected_route(token: str = Depends(security)):
    login = verify_token(token)
    return {"message": f"Hello, {login}!"}
