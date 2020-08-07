FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip3 install -r requirements.txt

CMD [ "gunicorn", "app:app"  ]
