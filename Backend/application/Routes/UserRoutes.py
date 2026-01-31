from flask import request,jsonify,Blueprint
from dotenv import load_dotenv
import os
from application import db
from application.Auth import Generate_Token,jwt_required
from bson.objectid import ObjectId


load_dotenv()

secret=os.getenv("SECRET")

user_bp = Blueprint("user", __name__, url_prefix="/api/users")

   
@user_bp.route("/Register",methods=["POST"])
def Register():
    try:
        data=request.get_json()
        if not data.get("Email") or not data.get("Password") or not data.get("Username") or not data.get("Age"):
            return jsonify({"error":"required all fields"}),404
        check_if_already_registered=db.db.Users.find_one({"Email":data.get("Email")})

        if check_if_already_registered:
            return jsonify({"error":"Email Already Registered"}),401
        
        db.db.Users.insert_one(data)
        return jsonify({"message":"Registered Successfull","User":data.get("Username")}),200
    except Exception as e:
        return jsonify({"error":str(e)}),500


@user_bp.route("/Login",methods=["POST"])
def Login():
    try:
        data=request.get_json()
        if not data.get("Email") or not data.get("Password"):
            return jsonify({"error":"Missing Email or Password "}),404
        check_if_User=db.db.Users.find_one({"Email":data.get("Email")})
        check_if_Admin=db.db.Admin.find_one({"Email":data.get("Email")})

        if not check_if_User and not check_if_Admin:
            return jsonify({"error":"Email Not Registered"}),401
        
        if check_if_Admin:
            if check_if_Admin["Password"] != data.get("Password"):
                return jsonify({"error":"Invalid Password"}),401
            token =Generate_Token(str(check_if_Admin["_id"]),"Admin")
            return jsonify({"message":"Login Successfull","Token":token,"Role":"Admin"}),200
            
        if check_if_User:

            if  check_if_User["Password"] != data.get("Password"):
                return jsonify({"error":"Invalid Password"}),401
            token=Generate_Token(str(check_if_User["_id"]),"User") 
            return jsonify({"message":"Login Successfull","Token":token,"Role":"user"}),200 
    except Exception as e:
        return jsonify({"error",str(e)}),500


@user_bp.route("/Profile",methods=["GET"])
@jwt_required
def Profile():
    user_id=request.user_id
    user_data=db.db.Users.find_one({"_id":ObjectId(user_id)},{"Password":0})
    user_data["_id"] = str(user_data["_id"])
    return jsonify({"message":"fetched Successfull","data":user_data})


