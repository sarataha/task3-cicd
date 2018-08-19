from flask import Flask
import random
import pymysql
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_bcrypt import Bcrypt

app = Flask(__name__)


@app.route('/')
def hello():
	numbers = random.random()
	return "If you are reading this, the deployment has worked! You're random number is " + str(numbers) + ". Click refresh for a new one."

if __name__ == '__main__':
	app.run()
