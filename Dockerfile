FROM ubuntu:latest

MAINTAINER Sara ElZayat "st.elzayat@gmail.com"

RUN apt-get update && \
  apt-get install -y python3

RUN apt-get install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools

RUN pip install gunicorn json-logging-py flask pymysql SQLAlchemy flask_sqlalchemy flask_login flask_bcrypt

COPY logging.conf /logging.conf
COPY gunicorn.conf /gunicorn.conf

COPY testApp /

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/gunicorn", "--config", "/gunicorn.conf", "--log-config", "/logging.conf", "-b", ":8000", "testApp:app"]
# ENTRYPOINT ["/usr/local/bin/gunicorn", "-b", ":8000", "testApp:app"]
