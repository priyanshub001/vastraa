from flask import Flask
from flask_cors import CORS
from application.db import conn
from application.cloudinary import cloud_Connectione
from application.Routes import register_routes



def Start_App():
    app=Flask(__name__)
    CORS(app)
    conn()
    cloud_Connectione()
    register_routes(app)
    return app




