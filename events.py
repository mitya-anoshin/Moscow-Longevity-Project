import random
import json


def load_events():
    with open('dump.json', 'r', encoding='utf-8') as file:
        json_data = file.read()
        events = json.loads(json_data)
    return events


def get_random_events(events, num_events=25):
    random_events = random.sample(events, num_events)
    return random_events
