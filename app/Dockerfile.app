FROM python:3.9

RUN pip install flask requests

WORKDIR /app
COPY ./src/app.py /app

EXPOSE 5001

CMD ["python", "app.py"]
