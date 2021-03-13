from flask import Flask, render_template, Response, request
# import time
import pandas as pd
import os
import pandas_log

dataset=os.environ.get('DBURL')
df = pd.DataFrame()

app = Flask(__name__)


# App specific functions


def shutdown_server():
    func = request.environ.get('werkzeug.server.shutdown')
    if func is None:
        raise RuntimeError('Not running with the Werkzeug Server')
    func()


def generate(csv):
    # x = 0
    global df
    df.drop(df.index, inplace=True)
    for chunk in pd.read_csv(csv, chunksize=50000):
        # global df
        df = pd.concat([df, chunk])
        yield "data:" + str((df.size / 13426356) * 100) + "\n\n"
    yield "data:" + str("Completed") + "\n\n"


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/progress')
def progress():
    return Response(generate(dataset), mimetype='text/event-stream')


@app.route('/shutdown', methods=['GET'])
def shutdown():
    shutdown_server()
    return 'Server shutting down...'


if __name__ == "__main__":

    app.run()
    print(df.size)
    with pandas_log.enable():
        exec(open("./pandasjob.py").read())
