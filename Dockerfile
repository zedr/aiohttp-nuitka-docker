FROM library/python:alpine3.7

ENV PYTHONPATH /app

COPY requirements.txt /app/
COPY dist/*.whl /app/

WORKDIR /app

RUN pip install -r requirements.txt
RUN pip install *.whl

EXPOSE 8080

CMD aio-demo-serve
