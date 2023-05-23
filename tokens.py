from datetime import datetime, timedelta
from fastapi import HTTPException
from jose import jwt, exceptions


# Configuration
ALGORITHM = 'HS256'
SECRET_KEY = 'XkJtkO5TaQNXLlpP4Ujiu5qj0jFhUJKgRyoUv2SUdzCK4fTKpkjkcQIsP6jhrcj4'
ACCESS_TOKEN_EXPIRE_MINUTES = 30


def create_access_token(data: dict, expires_delta: timedelta):
    """
    Creates access token for user.
    """

    payload = data.copy()
    payload.update({'exp': datetime.utcnow() + expires_delta})

    try:
        return jwt.encode(payload, key=SECRET_KEY, algorithm=ALGORITHM)
    except exceptions.JWTError:
        raise HTTPException(status_code=401, detail='Could not create access token')


def verify_token(token: str):
    """
    Verifies access token.
    """

    try:
        payload = jwt.decode(token, key=SECRET_KEY, algorithms=ALGORITHM)
        login = payload.get('sub')

        if login is None:
            raise HTTPException(status_code=401, detail='Invalid token')

        return login
    except exceptions.JWTClaimsError:
        raise HTTPException(status_code=401, detail='Token does not belong to you')
    except exceptions.ExpiredSignatureError:
        raise HTTPException(status_code=401, detail='Token has expired')
    except exceptions.JWTError:
        raise HTTPException(status_code=401, detail='Invalid token')
