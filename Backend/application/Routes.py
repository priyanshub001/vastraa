from application.__init__ import app
from application.db import db
import jwt
from flask import request,jsonify
from dotenv import load_dotenv
import os

@app.route("/")
def default():
    return "server is running "




load_dotenv()

secret=os.getenv("SECRET")
@app.route("/login",methods=["POST"])
def login():
    try:
        data=request.get_json()

        if not data:
            return jsonify({"error":"required all fields"}),400
        
        user=db.Users.find_one({"Email":data.get("Email")})
        admin=db.Admin.find_one({"Email":data.get("Email")})

        if not user and not admin:
            return jsonify({"error":"Email not registered"}),401
        
        if admin:
            if admin.get("Password") == data.get("Password"):
                payload={"Email":admin.get("Email"),"Role":"Admin"} 
                Role="Admin"  
            else :
                return jsonify({"error":"Incorrect Password"}),401
        elif user:
            if user.get("Password") == data.get("Password"):
                payload={"Email":user.get("Email"),"Role":"User"}
                Role="User"      
            else:
                return jsonify({"error":"Incorrect Password"}),401
                
        token=jwt.encode(payload,secret,algorithm="HS256")       
        return jsonify({"message":"login successfully","Token":token,"Role":Role}),200
    except Exception as e:
        return jsonify({"error":str(e)}),500
        

