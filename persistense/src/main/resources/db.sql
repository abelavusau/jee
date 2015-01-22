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
DROP DATABASE IF EXISTS `platform`;
CREATE DATABASE IF NOT EXISTS `platform` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `platform`;


-- Dumping structure for table platform.groups
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table platform.users
DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table platform.users_groups
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `FK_users_groups_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_users_groups_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for view platform.v_users_roles
DROP VIEW IF EXISTS `v_users_roles`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_users_roles` (
	`username` VARCHAR(45) NOT NULL COLLATE 'latin1_swedish_ci',
	`password` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`groupname` VARCHAR(20) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view platform.v_users_roles
DROP VIEW IF EXISTS `v_users_roles`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_users_roles`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `v_users_roles` AS SELECT  u.username, u.password, g.name as groupname
FROM `users_groups` ug
INNER JOIN `users` u ON u.id = ug.user_id
INNER JOIN `groups` g ON g.id =  ug.group_id ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
