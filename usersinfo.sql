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

CREATE DATABASE IF NOT EXISTS session;
GRANT ALL PRIVILEGES ON session.* to 'assist'@'localhost' identified by 'assist';
USE session;

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` varchar(64) NOT NULL,
  `zipcode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

INSERT INTO `login` (`id`, `username`, `password`, `zipcode`) VALUES
(1, 'sam', SHA2('p00d13',0), 22314),
(2, 'mike', SHA2('changeme',0), 22401),
(3, 'sallie', SHA2('qwerty',0), 20007);
