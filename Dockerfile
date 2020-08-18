FROM python:3.8-alpine

RUN apk update && apk add gcc libc-dev libffi-dev file make

RUN mkdir -p /deploy

WORKDIR /deploy
ADD requirements.txt /deploy/requirements.txt
RUN pip install -r /deploy/requirements.txt
ADD . /deploy/

EXPOSE 8080

CMD ["gunicorn", "--config", "/deploy/gunicorn.cfg", "server:app"]
