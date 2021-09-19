FROM python:3.8
COPY . /
RUN pip install -r requirements.txt
EXPOSE 8000
CMD python manage.py import_phones
CMD python manage.py makemigrations
CMD python manage.py migrate
# CMD python manage.py runserver 0.0.0.0:8000
CMD DEBUG=False gunicorn main.wsgi:application -b 0.0.0.0:8000