import sys
import requests
import json

if __name__ == '__main__':
    arg_dict=dict()

    response = ""
    try:
      message = sys.argv[2]   
                
      
    except Exception as e:
      message = {"Error": "Error in running Script, Error=>" + str(e)}
      message = json.dumps(message)
      code=400

    print(str(message))         
