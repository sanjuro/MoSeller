# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.14)
# Database: moseller
# Generation Time: 2011-10-16 00:06:47 +0200
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table account_item
# ------------------------------------------------------------



# Dump of table account_item_type
# ------------------------------------------------------------



# Dump of table active_admin_comments
# ------------------------------------------------------------



# Dump of table admin_user
# ------------------------------------------------------------

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_user_on_email` (`email`),
  UNIQUE KEY `index_admin_user_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;

INSERT INTO `admin_user` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `username`)
VALUES
	(1,'shad6ster@gmail.com','$2a$10$ET6iS6505m82ZqbVJirKrO3ADlA5LKBSplgb3cTy/ITGlfoxij/D.',NULL,NULL,NULL,7,'2011-10-15 22:03:36','2011-10-15 22:00:27','127.0.0.1','127.0.0.1','2011-09-01 02:06:50','2011-10-15 22:03:36','sanjuro');

/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table asset
# ------------------------------------------------------------



# Dump of table category
# ------------------------------------------------------------



# Dump of table client
# ------------------------------------------------------------



# Dump of table client_type
# ------------------------------------------------------------



# Dump of table contact
# ------------------------------------------------------------



# Dump of table contact_type
# ------------------------------------------------------------



# Dump of table creditcards
# ------------------------------------------------------------



# Dump of table gateway
# ------------------------------------------------------------



# Dump of table inventory_level
# ------------------------------------------------------------



# Dump of table invoice
# ------------------------------------------------------------



# Dump of table invoice_item
# ------------------------------------------------------------



# Dump of table invoice_type
# ------------------------------------------------------------



# Dump of table location
# ------------------------------------------------------------



# Dump of table location_type
# ------------------------------------------------------------



# Dump of table option_type
# ------------------------------------------------------------



# Dump of table option_value
# ------------------------------------------------------------



# Dump of table option_value_variant
# ------------------------------------------------------------



# Dump of table order
# ------------------------------------------------------------



# Dump of table order_item
# ------------------------------------------------------------



# Dump of table package
# ------------------------------------------------------------



# Dump of table payment
# ------------------------------------------------------------



# Dump of table payment_method
# ------------------------------------------------------------



# Dump of table product
# ------------------------------------------------------------



# Dump of table product_option_type
# ------------------------------------------------------------



# Dump of table product_source
# ------------------------------------------------------------



# Dump of table schema_migrations
# ------------------------------------------------------------



# Dump of table state_event
# ------------------------------------------------------------



# Dump of table supplier
# ------------------------------------------------------------



# Dump of table user
# ------------------------------------------------------------



# Dump of table variant
# ------------------------------------------------------------




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
