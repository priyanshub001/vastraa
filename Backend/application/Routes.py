from application.__init__ import app
from application.db import db




@app.route("/")
def default():
    return "server is running "



   
        

