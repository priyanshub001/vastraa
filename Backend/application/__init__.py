from flask import Flask
from flask_cors import CORS
from application.db import conn
from application.cloudinary import cloud_Connectione

app=Flask(__name__)
CORS(app)
conn()
cloud_Connectione()
from application import Routes
from application import UserRoutes

