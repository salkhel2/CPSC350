#utils2.py
import MySQLdb

DATABASE='gameDB'
DB_USER = 'game'
DB_PASSWORD = 'password'
HOST = 'localhost'

def db_connect2():
  return MySQLdb.connect(HOST, DB_USER, DB_PASSWORD, DATABASE)