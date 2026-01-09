from pymongo import MongoClient
from dotenv import load_dotenv
import os 

load_dotenv()

Mongo_uri=os.getenv("MONGO_URI")

db=None

def conn():
    global db
    
    client=MongoClient(Mongo_uri)
    db=client['Vastraa']
    if db is not None:
        print("db connected successully")
    else:
        print("Db Connection Failed")
        
        
    
    
    

   








