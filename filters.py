import json
from json import load, dump

import regex

with open('output.json', encoding='utf-8') as file:
    events = json.load(file)

for num, event in enumerate(events):
    fields = [
        'расписание в активных периодах',
        'расписание в закрытых периодах',
        'расписание в плановом периоде',
    ]

    for type in fields:
        if event[type]:
            events_info = event.pop(type).split(';')

            for i, row in enumerate(events_info):
                info = regex.search(r'c (?P<sd>.*?) по (?P<ed>.*?), (?P<wd>.*) (?P<st>\d+:\d+)-(?P<et>\d+:\d+), без перерыва', row)

                if info:
                    events_info[i] = {
                        'start_date': info.group('sd'),
                        'end_date': info.group('ed'),
                        'days': info.group('wd'),
                        'start_time': info.group('st'),
                        'end_time': info.group('et')
                    }

            events[num][type] = events_info

with open('dump.json', 'w') as file:
    dump(events, file, indent=4)


def check_if_contains_strings(string, string_list):
    return any(substring in string for substring in string_list)