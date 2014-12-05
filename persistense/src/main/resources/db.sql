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
-- Dumping data for table platform.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `role`) VALUES
	(1, 'ROLE_ADMIN'),
	(2, 'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping data for table platform.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `enabled`) VALUES
	(1, 'Aliaksandr', 'Belavusau', 'abelavusau', '$2a$10$hv2kxATuhK78HPz9eVMXEuRUQvg0YBA9Z/QqqidprBNQkqkaj4tFG', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping data for table platform.user_role: ~0 rows (approximately)
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
