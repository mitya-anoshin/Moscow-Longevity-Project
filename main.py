from tokens import create_access_token, verify_token, ACCESS_TOKEN_EXPIRE_MINUTES
from fastapi import FastAPI, Depends, HTTPException
from fastapi.security import HTTPBearer
from datetime import timedelta
import gevent as gevent
import uvicorn

from database import Session
from models import User


app = FastAPI()
session = Session()
security = HTTPBearer()


@app.get('/register')
def register(login: str, password: str, gender: str, born_at: int, street: str):
    user = User(login=login, password=password, gender=gender, born_at=born_at, street=street)

    if user in session.query(User).all():
        print(f'User is already registered: {user}')
        return {'ok': False, 'message': 'User is already registered'}

    try:
        session.add(user)
        session.commit()
    except gevent.Timeout:
        session.invalidate()
        print(f'Request timeout: {user}')
        return {'ok': False, 'message': 'Request timeout'}
    except Exception as exception:
        session.rollback()
        print(f'Request raised exception: {user} {exception}')
        return {'ok': False, 'message': 'Unexpected error'}

    print(f'User registered successfully {user}')
    return {'ok': True, 'message': 'User registered successfully'}


@app.get('/login')
def login(login: str, password: str):
    user_str = f'<User login={login!r}; password={password!r}>'
    print(f'{user_str} tried to login!')

    for temp_user in session.query(User).all():
        if temp_user.login == login and temp_user.verify_password(password):
            break
    else:
        print(f'{user_str} does not exist in database')
        raise {'ok': False, 'message': 'Invalid login or password'}

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token({'sub': login}, access_token_expires)

    print(f'{user_str} successfully logged in')
    return {'ok': True, 'access_token': access_token, 'token_type': 'bearer'}


@app.get('/protected')
def protected_route(token: str = Depends(security)):
    login = verify_token(token)
    return {'message': f'Hello, {login}!'}


if __name__ == '__main__':
    uvicorn.run(app, host='0.0.0.0', port=80)
