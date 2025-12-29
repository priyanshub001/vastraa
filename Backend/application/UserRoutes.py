from application.__init__ import app
from application.db import db
from flask import request,jsonify
from dotenv import load_dotenv
import os

load_dotenv()

secret=os.getenv("SECRET")
