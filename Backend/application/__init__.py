from flask import Flask
from flask_cors import CORS
from application.db import conn

app=Flask(__name__)
CORS(app)
conn()
from application import Routes


