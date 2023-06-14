#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z postgres 5432; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# Uncomment below to flush db e.g. after running tests
# Just make sure you really mean it 
# python manage.py flush --no-input

# We have base custom user model so need to makemigrations out of box

#python manage.py flush --no-input
python manage.py migrate
#python manage.py runserver 0.0.0.0:8000

python manage.py collectstatic --noinput

# you can use either. its no big deal
gunicorn backend.wsgi --bind 0.0.0.0:8000 --workers 4 --threads 4



exec "$@"