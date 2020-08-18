from flask import Flask
from flask import json

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Hello World!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)

@app.route("/healthz")
def healthz():
    return json.dumps({'success':True}), 200, {'ContentType':'application/json'}
