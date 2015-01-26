-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.15 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for platform
CREATE DATABASE IF NOT EXISTS `platform` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `platform`;


-- Dumping structure for table platform.bill
CREATE TABLE IF NOT EXISTS `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__users` (`user_id`),
  CONSTRAINT `FK__users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table platform.bill: ~0 rows (approximately)
DELETE FROM `bill`;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;


-- Dumping structure for table platform.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table platform.groups: ~2 rows (approximately)
DELETE FROM `groups`;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`, `desc`, `create_date`, `update_date`) VALUES
	(1, 'USER', 'Regular users', '2015-01-22 17:39:16', '2015-01-22 17:39:16'),
	(2, 'ADMIN', 'Administration users', '2015-01-22 17:39:16', '2015-01-22 17:39:16');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


-- Dumping structure for table platform.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table platform.users: ~6 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `create_date`, `update_date`) VALUES
	(1, 'Aliaksandr', 'Belavusau', 'abelavusau', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2015-01-22 17:31:53', '2015-01-22 17:31:53'),
	(2, 'Maryna', 'Belavusava', 'mbelavusava', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2015-01-22 17:31:53', '2015-01-22 17:31:53'),
	(3, 'Vasili', 'Root', 'user', '4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2', '2015-01-22 17:31:53', '2015-01-22 17:31:53'),
	(4, 'Sheldon', 'Cooper', 'sheldon', '23b00f3aae2634f1b35057cca336e1950473a1e037d0b405302d988f360f8268', '2015-01-22 17:31:53', '2015-01-22 17:31:53'),
	(6, 'test', 'user', 'testuser', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2015-01-22 17:31:53', '2015-01-22 17:31:53'),
	(7, 'u1', 'u1', 'u1', 'bb82030dbc2bcaba32a90bf2e207a84a856fc5f033b77c480836ab6f77f40f19', '2015-01-22 17:31:53', '2015-01-22 17:31:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table platform.users_groups
CREATE TABLE IF NOT EXISTS `users_groups` (
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `FK_users_groups_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_users_groups_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table platform.users_groups: ~6 rows (approximately)
DELETE FROM `users_groups`;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` (`user_id`, `group_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 1),
	(3, 1),
	(4, 1),
	(6, 1),
	(7, 1);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;


-- Dumping structure for view platform.v_users_roles
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_users_roles` (
	`username` VARCHAR(45) NOT NULL COLLATE 'latin1_swedish_ci',
	`password` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`groupname` VARCHAR(20) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view platform.v_users_roles
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_users_roles`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `v_users_roles` AS SELECT  u.username, u.password, g.name as groupname
FROM `users_groups` ug
INNER JOIN `users` u ON u.id = ug.user_id
INNER JOIN `groups` g ON g.id =  ug.group_id ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
