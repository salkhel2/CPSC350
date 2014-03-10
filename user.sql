DROP DATABASE wlanUsersDB;

CREATE DATABASE IF NOT EXISTS wlanUsersDB;
GRANT ALL PRIVILEGES ON wlanUsersDB.* to 'user'@'localhost' 
identified by 'password';
USE wlanUsersDB;

CREATE TABLE usersinfo
(
  birthDate DATE,
  /* user_id INT NOT NULL AUTO_INCREMENT, */
  firstname VARCHAR(25),
  lastname VARCHAR(25),
  username VARCHAR(25),
  password VARCHAR (16),
  age INT (3),
  email VARCHAR(50),
  city VARCHAR(25),
  state CHAR(2)
);
  
INSERT INTO usersinfo VALUES ('2009-2-3', 'Ann', 'Mark', 'NK1', 'test1234', '24', 'ann21@gg.com', 'city', 'NY');
INSERT INTO usersinfo VALUES ('2008-0-2', 'mike', 'DeLune', 'theboss', 'abcd1234', '21', 'miketheboss@gg.com', 'ROY', 'VA');

