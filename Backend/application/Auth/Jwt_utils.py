import jwt
import os 
from dotenv import load_dotenv
from datetime import datetime,timedelta

load_dotenv()
secret=os.getenv("SECRET")

def Generate_Token(userId,Role):
     
    payload={"userId":userId,"role":Role,"exp":datetime.utcnow()+timedelta(hours=24),"iat":datetime.utcnow()} 
    token=jwt.encode(payload,secret,algorithm="HS256")
    return token

def Decode_Token(token):
        decode=jwt.decode(token,secret,algorithms="HS256")
        return decode
   