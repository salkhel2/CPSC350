# utils.py
import MySQLdb

DATABASE='lanDB'
DB_USER = 'assist'
DB_PASSWORD = 'assist'
HOST = 'localhost'

def db_connect():
  return MySQLdb.connect(HOST, DB_USER, DB_PASSWORD, DATABASE)