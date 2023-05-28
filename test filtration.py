from events import load_events
from time import time
from datetime import datetime


events = load_events()

for event in events:
    if event['расписание в активных периодах']:
        for info in event['расписание в активных периодах']:
            start_time = datetime.strptime(info['start_time'], '%H:%M')
            end_time = datetime.strptime(info['end_time'], '%H:%M')
            start_date = datetime.strptime(info['start_date'], '%d.%m.%Y')
            end_date = datetime.strptime(info['end_date'], '%d.%m.%Y')
            days = info['days']


def check_if_contains_strings(string, string_list):
    return any(substring in string for substring in string_list)


