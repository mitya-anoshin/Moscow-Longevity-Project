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

    try:
        session.add(user)
        session.commit()
    except gevent.Timeout:
        session.invalidate()
        print(f'Request timeout: <User {login} {password}>')
        return {'ok': False, 'message': 'Request timeout'}
    except Exception as exception:
        session.rollback()
        print(f'Exception occurred: {exception}')
        return {'ok': False, 'message': 'Unexpected error'}

    return {'ok': True, 'message': 'User registered successfully'}


@app.get('/login')
def login(login: str, password: str):

    results = session.query(User).all().filter(User.login == login and User.verify_password(password))
    print(results, list(results))

    for some_user in results:
        if some_user.login == login and some_user.verify_password(password):
            user = some_user

    if not user:
        raise HTTPException(status_code=401, detail='Invalid login or password')

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token({'sub': user.login}, access_token_expires)

    return {'access_token': access_token, 'token_type': 'bearer'}


@app.get('/protected')
def protected_route(token: str = Depends(security)):
    login = verify_token(token)
    return {'message': f'Hello, {login}!'}


if __name__ == '__main__':
    uvicorn.run(app, host='0.0.0.0', port=80)
