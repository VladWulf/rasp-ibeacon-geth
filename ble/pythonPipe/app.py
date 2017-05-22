from flask import Flask, render_template
from random import randint
import json

app = Flask(__name__)

@app.route("/")
def hello():
    return render_template('index.html')

@app.route("/api/get-nodes")
def getNodes():
  return json.dumps([randint(1,10),randint(1,10),randint(1,10)])


if __name__ == "__main__":
    app.run()