from flask import Blueprint,request,jsonify
from application.Auth import jwt_required,role_required
from application.db import db

Item_bp=Blueprint("Item",__name__,url_prefix="/api/item")


@Item_bp.route("/addItem",methods=['Post'])
@jwt_required
@role_required(["Admin"])
def addItem():
    try:
        data=request.get_json()
        db.Inventory.insert_one(data)
        return  jsonify({"message":"Item added Successfully into Inventory"}),200
    except Exception as e:
        return jsonify({"error":str(e)}),500

    








    
