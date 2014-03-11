DROP DATABASE userDB;

CREATE DATABASE IF NOT EXISTS userDB;
GRANT ALL PRIVILEGES ON userDB.* to 'user'@'localhost' 
identified by 'password';
USE userDB;

CREATE TABLE users
(
  firstname VARCHAR(25),
  lastname VARCHAR(25),  
  school VARCHAR(30),
  city VARCHAR(25),
  state CHAR(2),  
  game VARCHAR(30),
  userID VARCHAR(35)
);
  
