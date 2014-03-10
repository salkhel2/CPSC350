DROP DATABASE userDB;

CREATE DATABASE IF NOT EXISTS userDB;
GRANT ALL PRIVILEGES ON userDB.* to 'user'@'localhost' 
identified by 'password';
USE userDB;

CREATE TABLE users
(
  firstname VARCHAR(25),
  lastname VARCHAR(25),

  city VARCHAR(25),
  state CHAR(2),
  school VARCHAR(30),
  
  games VARCHAR(100)
);
  
INSERT INTO abductions VALUES ('2010-09-07', 'ann', 'russo', 'Cranford', 'NJ');
INSERT INTO abductions VALUES ('2010-09-07', 'Paul', 'Jackman', 'Westfield', 'NJ');