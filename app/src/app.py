# app.py

from flask import Flask
import requests

app = Flask(__name__)

time_get_counter = 0


@app.route("/time", methods=['GET'])
def time():
    global time_get_counter
    time_get_counter += 1
    response = requests.get('http://worldtimeapi.org/api/timezone/Europe/Moscow')
    if response.status_code == 200:
        return response.json()['datetime']
    else:
        return "response from server is not ok"


@app.route("/statistics", methods=['GET'])
def statistics():
    global time_get_counter
    return str(time_get_counter)


if __name__ == "__main__":
    app.run(port=5001, debug=True)
