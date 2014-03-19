CREATE DATABASE IF NOT EXISTS lanDB;
GRANT ALL PRIVILEGES ON session.* to 'assist'@'localhost' identified by 'assist';
USE session;

--
-- Table for the list of games
--

CREATE TABLE IF NOT EXISTS games
(
  title VARCHAR(30),
  rating VARCHAR(1)
);

--
-- Dumping data for the games table
--

INSERT INTO games (title, rating) VALUES
('Dark Souls', 'M'),
('Halo', 'M'),
('The Sims 3', 'E');

--
-- Table for the user accounts
--

CREATE TABLE IF NOT EXISTS users
(
  firstname VARCHAR(25),
  lastname VARCHAR(25),  
  school VARCHAR(30),
  city VARCHAR(25),
  state VARCHAR(2),  
  game VARCHAR(30),
);

--
-- Dumping data for the user accounts table
-- *This is empty as of now sense this table is to be edited

