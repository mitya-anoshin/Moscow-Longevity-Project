from email.mime.text import MIMEText
from random import choices
import smtplib
import string

USERNAME = 'muhtararmagedonovich@yandex.com'
PASSWORD = 'gwtzigqswemcavhn'


def generate_confirmation_code(alpha: str = string.digits) -> str:
    return ''.join(choices(alpha, k=6))


def send_confirmation_code(email, code):
    message = MIMEText(f'Ваш код подтверждения: {code}')
    message['From'] = USERNAME
    message['To'] = email

    server = smtplib.SMTP_SSL(host='smtp.yandex.com', port=465)
    server.login(USERNAME, PASSWORD)
    server.send_message(message)
    server.quit()

