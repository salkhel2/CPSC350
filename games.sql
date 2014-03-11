DROP DATABASE gameDB;

CREATE DATABASE IF NOT EXISTS gameDB;
GRANT ALL PRIVILEGES ON gameDB.* to 'game'@'localhost' 
identified by 'password';
USE gameDB;

CREATE TABLE games
(
  title VARCHAR(30),
  rating VARCHAR(1)
  
  
);

INSERT INTO games VALUES ('Dark Souls', 'M');