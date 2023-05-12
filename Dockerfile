FROM python:3.10-rc-slim-buster

RUN apt-get update \
    && apt-get install -yyq netcat libpq-dev gcc libjpeg-dev zlib1g-dev graphviz-dev

WORKDIR /app1/

COPY . /app1/

RUN pip3 install -r requirements.txt

EXPOSE 8000

CMD [ "python3" , "manage.py" ]