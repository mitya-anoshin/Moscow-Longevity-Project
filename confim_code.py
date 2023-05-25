from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from generate_code import generate_confirmation_code
import smtplib


def send_confirmation_code(email, code):
    msg = MIMEMultipart()
    msg['From'] = 'muhtararmagedonovich@yandex.com'
    msg['To'] = email
    msg['Subject'] = 'Код подтверждения'

    body = f'Ваш код подтверждения: {code}'
    msg.attach(MIMEText(body, 'plain'))

    server = smtplib.SMTP_SSL('smtp.yandex.com', 465)
    server.ehlo()
    server.starttls()
    server.login(msg['From'], 'lhnoiqcihxjtegjg')

    server.sendmail(msg['From'], msg['To'], msg.as_string())
    server.quit()

    print(f"Код подтверждения успешно отправлен на {email}.")


confirmation_code = generate_confirmation_code()
send_confirmation_code('eazy10ballov@gmail.com', confirmation_code)

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

