FROM python:3.7-slim-bullseye
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get install -yyq netcat libpq-dev gcc libjpeg-dev zlib1g-dev graphviz-dev

WORKDIR /app/

COPY . /app/

RUN pip3 install --upgrade pip -r requirements.txt

EXPOSE 8000

CMD ["./entrypoint.sh"]