from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from generate_code import generate_confirmation_code

from fastapi.staticfiles import StaticFiles

from email.message import EmailMessage

# def send_confirmation_code(email, code):
#     msg = MIMEMultipart()
#     msg['From'] = 'muhtararmagedonovich@yandex.com'
#     msg['To'] = email
#     msg['Subject'] = 'Код подтверждения'
#
#     body = f'Ваш код подтверждения: {code}'
#     msg.attach(MIMEText(body, 'plain'))
#
#     server = smtplib.SMTP('smtp.yandex.com', 465)
#     server.ehlo()
#     server.starttls()
#     server.login(msg['From'], 'lhnoiqcihxjtegjg')
#
#     server.sendmail(msg['From'], msg['To'], msg.as_string())
#     server.quit()
#
#     print(f"Код подтверждения успешно отправлен на {email}.")
#
#
# confirmation_code = generate_confirmation_code()
# send_confirmation_code('eazy10ballov@gmail.com', confirmation_code)

# import smtplib
# from email.mime.text import MIMEText
#
# mail_server = "smtp.yandex.com"
# mail_port = 465
# username = "muhtararmagedonovich"  # замените на свой адрес электронной почты
# password = "lhnoiqcihxjtegjg"  # замените на пароль приложения, который вы создали
#
# msg = MIMEText("Текст вашего сообщения")
# msg['Subject'] = "Тема вашего сообщения"
# msg['From'] = username
# msg['To'] = "tempolate@mail.ru"  # замените на адрес получателя
#
# server = smtplib.SMTP_SSL(mail_server, mail_port)
# server.login(username, password)
# server.send_message(msg)
# server.quit()
#
# EMAIL_USE_TLS = True
# EMAIL_USE_SSL = False


# email_address = "dmitry.anoshin@mail.ru"  # type Email
# email_password = "9yMWhgSEz97kaVWQ5Cnn"  # If you do not have a gmail apps password, create a new app with using generate password. Check your apps and passwords https://myaccount.google.com/apppasswords
#
# # create email
# msg = EmailMessage()
# msg['Subject'] = "Email subject"
# msg['From'] = email_address
# msg['To'] = "tempolate@mail.ru"  # type Email
#
# with smtplib.SMTP('smtp.mail.ru', 465) as smtp:
#     smtp.login(email_address, email_password)
#     smtp.send_message(msg)

import smtplib
import getpass

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

HOST = "smtp.mail.ru"
PORT = 465

FROM_EMAIL = "dmitry.anoshin@mail.ru"
TO_EMAIL = "tempolate@mail.ru"
PASSWORD = "9yMWhgSEz97kaVWQ5Cnn"

message = MIMEMultipart("alternative")
message['Subject'] = "ebal rot"
message['From'] = FROM_EMAIL
message['To'] = TO_EMAIL
message['Cc'] = FROM_EMAIL
message['Bcc'] = FROM_EMAIL

smtp = smtplib.SMTP(HOST, PORT)

status_code, response = smtp.ehlo()
print(f"[*] Echoing the server: {status_code} {response}")

status_code, response = smtp.starttls()
print(f"[*] Starting TLS connection: {status_code} {response}")

status_code, response = smtp.login(FROM_EMAIL, PASSWORD)
print(f"[*] Logging in: {status_code} {response}")

smtp.sendmail(FROM_EMAIL, TO_EMAIL, message.as_string())
smtp.quit()



