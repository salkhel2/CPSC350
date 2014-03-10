SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
CREATE DATABASE IF NOT EXISTS alienabductions;
GRANT ALL PRIVILEGES ON alienabductions.* to 'alien'@'localhost'
identified by 'password';
use alienabductions;

CREATE TABLE IF NOT EXISTS `abuctions` (
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(5) NOT NULL,
  `day` int(5) NOT NULL;
  `month` int(5) NOT NULL;
  `year` int(5) NOT NULL;
  `scaryness` int(10) NOT NULL,
  `appearance` varchar(50) NOT NULL,
  `comments` varchar(100) NOT NULL,
);