import os

_basedir = os.path.abspath(os.path.dirname(__file__)) #path to this current directory

class Default:
	PORT = 1031
	
class Development(Default):
	DEBUG = True

class Production(Default):
	pass

class Testing(Default):
	TESTING = True

#make a dictionary

config ={
	'DEFAULT': Default,
	'DEVELOPMENT':Development,
	'PRODUCTION':Production,
	'TESTING':Testing
}
