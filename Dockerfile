FROM python:3.7.4-alpine3.10

RUN apk update && apk add gcc libc-dev

RUN mkdir -p /deploy

WORKDIR /deploy
ADD requirements.txt /deploy/requirements.txt
RUN pip install -r /deploy/requirements.txt
ADD . /deploy/

EXPOSE 8080

CMD ["gunicorn", "--config", "/deploy/gunicorn.cfg", "server:app"]
