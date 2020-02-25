from flask import Flask
from flask import json

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Hello René!"

if __name__ == "__main__":
    app.run()

@app.route("/healthz")
def healthz():
    return json.dumps({'success':True}), 200, {'ContentType':'application/json'}
