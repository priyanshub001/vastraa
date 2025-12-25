from application.__init__ import app


@app.route("/")
def default():
    return "server is running "