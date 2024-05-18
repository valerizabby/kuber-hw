FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential python3-flask python3-requests
COPY ./src /app
WORKDIR /app
# RUN pip3 install flask
EXPOSE 5001
ENTRYPOINT ["python3"]
CMD ["app.py"]
