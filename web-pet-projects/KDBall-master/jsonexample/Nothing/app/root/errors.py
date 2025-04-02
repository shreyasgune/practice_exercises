from . import root
from flask import render_template

@root.app_errorhandler(500) #if the app exits with a 500 , do this::
def internal_server_error():
	return render_template('errors/five_hundred.html'), 500
	
@root.app_errorhandler(404) #if the app hits a 404
def page_not_found(e):
	return render_template('errors/page_not_found'), 404

