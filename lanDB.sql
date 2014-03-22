CREATE DATABASE IF NOT EXISTS lanDB;
GRANT ALL PRIVILEGES ON session.* to 'assist'@'localhost' identified by 'assist';
USE lanDB;

--
-- Table for the list of games
--

CREATE TABLE IF NOT EXISTS games(
  id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(30),
  rating VARCHAR(1),
  userid INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (userid) REFERENCES user(id)
)ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4;

--
-- Dumping data for the games table
--

INSERT INTO games (id, title, rating) VALUES
(1,'Dark Souls', 'M'),
(2,'Halo', 'M'),
(3,'The Sims 3', 'E');

--
-- Table for the user accounts
--

CREATE TABLE IF NOT EXISTS users(
  id INTEGER NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(25),
  lastname VARCHAR(25),  
  school VARCHAR(30),
  city VARCHAR(25),
  state VARCHAR(2),  
  game VARCHAR(30),
  gameid INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (gameid) REFERENCES game(id)
)ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for the user accounts table
-- *This is empty as of now sense this table is to be edited

