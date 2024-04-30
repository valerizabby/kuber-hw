from datetime import datetime


def return_current_time():
    return datetime.now().strftime("%H:%M:%S")
