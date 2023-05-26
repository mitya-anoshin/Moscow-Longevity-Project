from tokens import create_access_token, verify_token, ACCESS_TOKEN_EXPIRE_MINUTES
from confim_code import generate_confirmation_code, send_confirmation_code
from datetime import datetime, timedelta
from fastapi.security import HTTPBearer
from fastapi import FastAPI, Depends
from datetime import timedelta
import gevent as gevent
import uvicorn

from database import Session
from models import User, Code

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib

app = FastAPI()
session = Session()
security = HTTPBearer()


@app.get('/register')
def register(login: str, password: str, gender: str, born_at: int, street: str):
    if not login:
        return {'ok': False, 'message': 'Login field is empty'}
    elif not password:
        return {'ok': False, 'message': 'Password field is empty'}
    elif not gender:
        return {'ok': False, 'message': 'Gender field is empty'}
    elif not born_at:
        return {'ok': False, 'message': 'Born_at field is empty'}
    elif not street:
        return {'ok': False, 'message': 'Street field is empty'}

    try:
        user = User(login=login, password=password, gender=gender, born_at=born_at, street=street)
        session.add(user)
        session.commit()
        # write code into db and send it to mail
        code = Code(user_id=user.id)
        session.add(code)
        session.commit()
        send_confirmation_code(login, code.code)
    except gevent.Timeout:
        session.invalidate()
        print(f'Request timeout: {user}')
        return {'ok': False, 'message': 'Request timeout'}
    except Exception as exception:
        session.rollback()
        print(f'Request raised exception: {user} {exception}')
        raise exception

        return {'ok': False, 'message': 'Unexpected error'}

    print(f'User registered successfully {user}')
    return {'ok': True, 'message': 'User registered successfully'}


@app.get('/login')
def login(login: str, password: str):
    if not login:
        return {'ok': False, 'message': 'Login field is empty'}
    elif not password:
        return {'ok': False, 'message': 'Password field is empty'}

    user_str = f'<User login={login!r}; password={password!r}>'
    print(f'{user_str} tried to login!')

    for temp_user in session.query(User).all():
        if temp_user.login == login and temp_user.verify_password(password):
            break
    else:
        print(f'{user_str} does not exist in database!')
        return {'ok': False, 'message': 'Invalid login or password'}

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token({'sub': login}, access_token_expires)

    print(f'{user_str} logged in successfully!')
    return {'ok': True, 'access_token': access_token, 'token_type': 'bearer'}


@app.get('/confirming_code')
def confirming_code(login: str, code: str, user_id: str):
    for temp_code in session.query(Code).all():
        if temp_code.user_id == login and temp_code.verify_password(password):
            break


@app.post("/verify-email")
def verify_email(code: str, user_id: str):
    user_code = f'<User code={code!r}>'

    for temp_code in session.query(Code).all():
        if temp_code.code == code and temp_code.user_id == user_id:
            break
    else:
        print(f'{user_code} does not exist in database!')
        return {'ok': False, 'message': 'Invalid login or password'}

    return {"message": "Ваш код успешно подтвержден"}


@app.get('/protected')
def protected_route(token: str = Depends(security)):
    login = verify_token(token)
    return {'ok': True, 'message': f'Hello, {login}!'}


if __name__ == '__main__':
    uvicorn.run(app, host='0.0.0.0', port=80)
