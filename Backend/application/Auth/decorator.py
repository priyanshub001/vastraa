from functools import wraps
from flask import request, jsonify
from .Jwt_utils import Decode_Token

def jwt_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        auth_header = request.headers.get("Authorization")

        if not auth_header:
            return jsonify({"error": "Token missing"}), 401

        token = auth_header.split(" ")[1]
        decoded = Decode_Token(token)

        if not decoded:
            return jsonify({"error": "Invalid or expired token"}), 401

        request.user_id = decoded["userId"]
        return f(*args, **kwargs)

    return decorated



def role_required(allowed_roles):
    def decorator(f):
        @wraps(f)
        def wrapper(*args, **kwargs):
            if request.user["role"] not in allowed_roles:
                return jsonify({"error": "Forbidden"}), 403
            return f(*args, **kwargs)
        return wrapper
    return decorator