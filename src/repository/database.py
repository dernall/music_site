import logging
import os

import psycopg2


log = logging.getLogger(__name__)


class Database():

    def __init__(self):
        self.connection = None
        try:
            self.__check_env()
            self.make_connection()
            log.info("Database was successfully connected!")
        except IOError:
            log.error("Failed to connect to database.")

    def __check_env(self):
        if not ("DATABASE_NAME" in os.environ and
                "DATABASE_USER" in os.environ and
                "DATABASE_PASSWORD" in os.environ and
                "DATABASE_HOST" in os.environ and
                "DATABASE_PORT" in os.environ):
            log.error("Database connection parameters are not set correctly.")
            raise Exception("Database parameters are not set.")

    def make_connection(self):
        db_name = os.getenv("DATABASE_NAME")
        db_user = os.getenv("DATABASE_USER")
        db_pass = os.getenv("DATABASE_PASSWORD")
        db_host = os.getenv("DATABASE_HOST")
        db_port = os.getenv("DATABASE_PORT")

        try:
            self.connection = psycopg2.connect(database=db_name,
                                               user=db_user,
                                               password=db_pass,
                                               host=db_host,
                                               port=db_port)
        except psycopg2.DatabaseError:
            log.error("Could not connect to the database.")

    def __del__(self):
        if self.connection is not None:
            self.connection.close()
