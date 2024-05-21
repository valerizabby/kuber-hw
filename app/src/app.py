# app.py

from flask import Flask
from datetime import datetime
import requests

app = Flask(__name__)

time_get_counter = 0


def return_current_time():
    return datetime.now().strftime("%H:%M:%S")


@app.route("/time", methods=['GET'])
def time():
    global time_get_counter
    time_get_counter += 1
    response = requests.get('http://worldtimeapi.org/api/timezone/Europe/Moscow')
    return response.json()['datetime']


@app.route("/statistics", methods=['GET'])
def statistics():
    global time_get_counter
    return str(time_get_counter)


if __name__ == "__main__":
    app.run(port=5001, debug=True, host='0.0.0.0')
