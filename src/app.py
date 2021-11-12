from flask import Flask
from repository.database import Database

if __name__ == "__main__":
    db = Database()
    app = Flask(__name__)

    @app.route("/")
    def hello_world():
        return "<p>Hello, World!</p>"

    app.run()
