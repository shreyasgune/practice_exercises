from flask import Flask
from config import config #imports config file into this file

def create_app(environment): #function creates a app instance
	app = Flask(__name__) #gets the name
	app.config.from_object(config[environment]) #gets the config for the said environment
	
	from .root import root 
	app.register_blueprint(root, url_prefix='/users') #orginized stuff
	
	return app #return the app 
	