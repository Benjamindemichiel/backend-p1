FROM python:3.8-slim-buster

RUN apt-get update \
    && apt-get install -yyq netcat libpq-dev gcc libjpeg-dev zlib1g-dev graphviz-dev

WORKDIR /app/

COPY . /app/

RUN pip3 install -r requirements.txt

EXPOSE 8000

CMD ["./entrypoint.sh"]