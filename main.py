from tokens import create_access_token, verify_token
from fastapi import FastAPI, Depends, HTTPException
from fastapi.security import HTTPBearer
import models


app = FastAPI()
security = HTTPBearer()


# Users database
users = [
    {'login': 'alice', 'password': '$2b$12$p/ZyDeo2ve7MSozJLxQpRuOUWVTs8vsBgufu5mIaa6cyvOhGLO0YO'},
    {'login': 'bob', 'password': '$2b$12$q2brtEo0GQJ8UxAs8J/UNutck7gRQ29q6ehh2y3h29.N5L5EvoAAW'}
]


@app.post('/register')
def register(login: str, password: str, gender: str, born_at: str, street: str):
    user = models.User(login=login, password=password, gender=gender, born_at=born_at, street=street)
    users.append(user)  # TODO: исправить пользователя на бд где лежат

    return {'message': 'User registered successfully'}


@app.post('/login')
def login(login: str, password: str):

    for some_user in users:
        if some_user.login == login and some_user.verify_password(password):
            user = some_user # TODO: исправить пользователя на бд где лежат
            break

    if not user:
        raise HTTPException(status_code=401, detail='Invalid login or password')

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token({'sub': user.login}, access_token_expires)

    return {'access_token': access_token, 'token_type': 'bearer'}


@app.get('/protected')
def protected_route(token: str = Depends(security)):
    login = verify_token(token)
    return {'message': f'Hello, {login}!'}
