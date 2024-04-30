# main.py

from flask import Flask
from utils.time import return_current_time

app = Flask(__name__)

time_get_counter = 0


@app.route("/time", methods=['GET'])
def time():
    global time_get_counter
    time_get_counter += 1
    return return_current_time()


@app.route("/statistics", methods=['GET'])
def statistics():
    global time_get_counter
    return str(time_get_counter)


if __name__ == "__main__":
    app.run(port=5001, debug=True)
