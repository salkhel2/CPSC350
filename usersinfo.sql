DROP DATABASE wlanUsersDB;
CREATE DATABASE IF NOT EXISTS wlanUsersDB;
GRANT ALL PRIVILEGES ON wlanUsersDB.* to 'user'@'localhost' 
identified by 'password';
USE wlanUsersDB;

CREATE TABLE users
(
  user_id INT NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(25) default NULL,
  lastname VARCHAR(25) default NULL,
  username VARCHAR(15) default NULL,
  email VARCHAR (50) default NULL,
  gender CHAR(1),
  password VARCHAR(15) default NULL,
  city VARCHAR(25) default NULL,
  state CHAR(2) default NULL,
  school VARCHAR(30) default NULL,
  interests VARCHAR(160),
  games VARCHAR(100) default NULL,
  PRIMARY KEY (user_id)
);
  
INSERT INTO  VALUES ( user_id, 'ann', 'russo', 'russoa', 'russoa@live.com', 'F', 'pass1234', 'Cranford', 'NJ', 'UNJ', 'games', 'call of duty');
INSERT INTO  VALUES ( user_id, 'Paul', 'Jackman', 'biggamer', 'paul@g.com', 'M', 'abcd1234', 'Westfield', 'NJ',  'UNJ', 'love playing games', 'call of duty');