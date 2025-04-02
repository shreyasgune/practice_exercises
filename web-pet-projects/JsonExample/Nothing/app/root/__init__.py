from flask import Blueprint #this is like a small app that binds to a larger app 

root = Blueprint('root', __name__)
from . import views, errors
