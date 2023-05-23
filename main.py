from tokens import create_access_token, verify_token
from fastapi import FastAPI, Depends, HTTPException
from tokens import ACCESS_TOKEN_EXPIRE_MINUTES
from fastapi.security import HTTPBearer
from database import SessionLocal
from datetime import timedelta
from models import User
import uvicorn


app = FastAPI()
security = HTTPBearer()


# Create instance
# class User(BaseModel):
#     id: UUID
#     registered_at: strF
#     login: str
#     password: str
#     gender: str
#     born_at: date
#     street: str
session = SessionLocal()


@app.post('/register')
def register(login: str, password: str, gender: str, born_at: int, street: str):
    user = User(login=login, password=password, gender=gender, born_at=born_at, street=street)
    session.add(user)
    session.commit()

    return {'message': 'User registered successfully'}


@app.post('/login')
def login(login: str, password: str):

    results = session.query(User).all()

    for some_user in results:
        if some_user.login == login and some_user.verify_password(password):
            user = some_user
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


# async def main():
#     await uvicorn.run(app, host='127.0.0.1', port=8000)
#
#
# if __name__ == '__main__':
#     main()
