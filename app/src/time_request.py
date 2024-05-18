import requests
import time


response = requests.get("http://app-service/statistics")
with open("data/data.txt", "a") as file:
    file.write(response.text + '\n')
time.sleep(5)

