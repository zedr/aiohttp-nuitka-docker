FROM library/python:3.7-slim

COPY requirements.txt /app/
COPY main.exe /usr/local/bin/

WORKDIR /app

RUN pip3.7 install -r requirements.txt

EXPOSE 8080

CMD main.exe
