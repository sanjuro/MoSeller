# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.14)
# Database: moseller
# Generation Time: 2011-09-30 00:09:46 +0200
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

DROP TABLE IF EXISTS `account_item`;

CREATE TABLE `account_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `account_item_type_id` int(11) DEFAULT NULL,
  `credit` decimal(8,2) NOT NULL DEFAULT '0.00',
  `debit` decimal(8,2) NOT NULL DEFAULT '0.00',
  `account_status_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table account_item_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_item_type`;

CREATE TABLE `account_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table active_admin_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `active_admin_comments`;

CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_admin_notes_on_resource_type_and_resource_id` (`resource_type`,`resource_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table admin_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_user_on_email` (`email`),
  UNIQUE KEY `index_admin_user_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;

INSERT INTO `admin_user` (`id`, `name`, `created_at`, `updated_at`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`)
VALUES
	(1,'shadley','2011-09-01 02:06:50','2011-09-27 09:47:46','shad6ster@gmail.com','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,3,'2011-09-27 09:47:46','2011-09-27 07:05:03','127.0.0.1','127.0.0.1');

/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table asset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `asset`;

CREATE TABLE `asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewable_id` int(11) DEFAULT NULL,
  `viewable_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_size` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `type` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_updated_at` datetime DEFAULT NULL,
  `attachment_width` int(11) DEFAULT NULL,
  `attachment_height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;

INSERT INTO `asset` (`id`, `viewable_id`, `viewable_type`, `attachment_content_type`, `attachment_file_name`, `attachment_size`, `position`, `type`, `attachment_updated_at`, `attachment_width`, `attachment_height`)
VALUES
	(1,1,NULL,NULL,'eav_box_tabs.jpg',16,10,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `title`)
VALUES
	(1,'airtime'),
	(2,'antivirus'),
	(3,'electricity'),
	(4,'bandwidth');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table client
# ------------------------------------------------------------

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_type_id` int(11) DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registered_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;

INSERT INTO `client` (`id`, `client_type_id`, `unique_id`, `registered_name`, `email_address`, `tax`, `telephone`, `url`, `token`, `created_at`, `updated_at`)
VALUES
	(1,NULL,NULL,'Mo Seller Inc.','shad6ster@gmail.com',1,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49');

/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table client_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `client_type`;

CREATE TABLE `client_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `contact_type_id` int(11) DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;

INSERT INTO `contact` (`id`, `client_id`, `contact_type_id`, `contact_name`, `contact_email`, `contact_number`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,'Shadley Wentzel','shad6ster@gmail.com',NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49');

/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contact_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_type`;

CREATE TABLE `contact_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;

INSERT INTO `contact_type` (`id`, `title`)
VALUES
	(2,'primary');

/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table creditcards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `creditcards`;

CREATE TABLE `creditcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` text COLLATE utf8_unicode_ci,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verification_value` text COLLATE utf8_unicode_ci,
  `cc_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `start_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;

INSERT INTO `creditcards` (`id`, `number`, `month`, `year`, `verification_value`, `cc_type`, `display_number`, `first_name`, `last_name`, `created_at`, `updated_at`, `start_month`, `start_year`, `issue_number`, `address_id`)
VALUES
	(1,'1234123412341234','03','2013','123\n','Visa',NULL,'Shadley','Wentzel',NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gateway
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gateway`;

CREATE TABLE `gateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT '1',
  `environment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'development',
  `server` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'test',
  `test_mode` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table invoice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `margin` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `date_paid` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_type_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;

INSERT INTO `invoice` (`id`, `user_id`, `order_id`, `margin`, `sub_total`, `tax`, `total`, `date_paid`, `email`, `state`, `invoice_type_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,0.00,22.64,0.00,22.64,NULL,'shad6ster@gmail.com','created',NULL,'2011-09-26 14:50:38','2011-09-26 14:50:38'),
	(2,1,2,0.00,568.08,0.00,568.08,NULL,'shad6ster@gmail.com','created',NULL,'2011-09-26 14:53:07','2011-09-26 14:53:07'),
	(3,1,3,0.00,262.85,0.00,262.85,NULL,'shad6ster@gmail.com','created',NULL,'2011-09-27 06:22:34','2011-09-27 06:22:34'),
	(4,1,4,0.00,4.80,0.00,4.80,NULL,'shad6ster@gmail.com','created',NULL,'2011-09-27 06:41:32','2011-09-27 06:41:33'),
	(5,1,5,0.00,4.80,0.00,4.80,NULL,'shad6ster@gmail.com','created',NULL,'2011-09-29 14:48:05','2011-09-29 14:48:05'),
	(6,1,6,0.00,52.57,0.00,52.57,NULL,'shad6ster@gmail.com','created',NULL,'2011-09-29 14:49:20','2011-09-29 14:49:20');

/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoice_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice_item`;

CREATE TABLE `invoice_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `invoice_item` WRITE;
/*!40000 ALTER TABLE `invoice_item` DISABLE KEYS */;

INSERT INTO `invoice_item` (`id`, `invoice_id`, `description`, `total`, `created_at`, `updated_at`)
VALUES
	(1,1,'FREEPAID0000VOD12',22.64,'2011-09-26 14:50:38','2011-09-26 14:50:38'),
	(2,2,'FREEPAID000VOD275',524.58,'2011-09-26 14:53:07','2011-09-26 14:53:07'),
	(3,2,'FREEPAID0000MTN15',43.50,'2011-09-26 14:53:07','2011-09-26 14:53:07'),
	(4,3,'FREEPAID0000VOD55',262.85,'2011-09-27 06:22:34','2011-09-27 06:22:34'),
	(5,4,'FREEPAID00000VOD5',4.80,'2011-09-27 06:41:32','2011-09-27 06:41:32'),
	(6,5,'FREEPAID00000VOD5',4.80,'2011-09-29 14:48:05','2011-09-29 14:48:05'),
	(7,6,'FREEPAID0000VOD55',52.57,'2011-09-29 14:49:20','2011-09-29 14:49:20');

/*!40000 ALTER TABLE `invoice_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoice_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice_type`;

CREATE TABLE `invoice_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `location_type_id` int(11) DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;

INSERT INTO `location` (`id`, `client_id`, `location_type_id`, `address1`, `address2`, `address3`, `address4`, `latitude`, `longitude`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,'Blue House','23 Jump Street','Jumpville','Cape Town','11232.12323','12312312.123213','2011-09-01 02:06:49','2011-09-01 02:06:49');

/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table location_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_type`;

CREATE TABLE `location_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `location_type` WRITE;
/*!40000 ALTER TABLE `location_type` DISABLE KEYS */;

INSERT INTO `location_type` (`id`, `title`)
VALUES
	(1,'postal'),
	(2,'physical');

/*!40000 ALTER TABLE `location_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `option_type`;

CREATE TABLE `option_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presentation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `option_type` WRITE;
/*!40000 ALTER TABLE `option_type` DISABLE KEYS */;

INSERT INTO `option_type` (`id`, `name`, `presentation`, `created_at`, `updated_at`)
VALUES
	(1,'voucher_amount','Voucher',NULL,NULL);

/*!40000 ALTER TABLE `option_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `option_value`;

CREATE TABLE `option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `presentation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `option_value` WRITE;
/*!40000 ALTER TABLE `option_value` DISABLE KEYS */;

INSERT INTO `option_value` (`id`, `option_type_id`, `name`, `position`, `presentation`, `created_at`, `updated_at`)
VALUES
	(1,1,'voucher_amount_2',10,'R2.00',NULL,NULL),
	(2,1,'voucher_amount_5',20,'R5.00',NULL,NULL),
	(3,1,'voucher_amount_10',30,'R10.00',NULL,NULL),
	(4,1,'voucher_amount_12',50,'R12.00',NULL,NULL),
	(5,1,'voucher_amount_15',40,'R15.00',NULL,NULL),
	(6,1,'voucher_amount_29',60,'R29.00',NULL,NULL),
	(7,1,'voucher_amount_30',70,'R30.00',NULL,NULL),
	(8,1,'voucher_amount_55',80,'R55.00',NULL,NULL),
	(9,1,'voucher_amount_60',90,'R60.00',NULL,NULL),
	(10,1,'voucher_amount_70',100,'R70.00',NULL,NULL),
	(11,1,'voucher_amount_80',110,'R80.00',NULL,NULL),
	(12,1,'voucher_amount_99',120,'R99.00',NULL,NULL),
	(13,1,'voucher_amount_100',130,'R100.00',NULL,NULL),
	(14,1,'voucher_amount_110',140,'R110.00',NULL,NULL),
	(15,1,'voucher_amount_120',150,'R120.00',NULL,NULL),
	(16,1,'voucher_amount_150',160,'R150.00',NULL,NULL),
	(17,1,'voucher_amount_180',170,'R180.00',NULL,NULL),
	(18,1,'voucher_amount_200',180,'R200.00',NULL,NULL),
	(19,1,'voucher_amount_250',190,'R250.00',NULL,NULL),
	(20,1,'voucher_amount_275',200,'R275.00',NULL,NULL),
	(21,1,'voucher_amount_1100',210,'R1100.00',NULL,NULL),
	(22,1,'voucher_amount_25',220,'R25.00',NULL,NULL),
	(23,1,'voucher_amount_35',230,'R35.00',NULL,NULL),
	(24,1,'voucher_amount_50',240,'R50.00',NULL,NULL);

/*!40000 ALTER TABLE `option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_value_variant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `option_value_variant`;

CREATE TABLE `option_value_variant` (
  `variant_id` int(11) DEFAULT NULL,
  `option_value_id` int(11) DEFAULT NULL,
  KEY `index_option_values_variants_on_variant_id` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `option_value_variant` WRITE;
/*!40000 ALTER TABLE `option_value_variant` DISABLE KEYS */;

INSERT INTO `option_value_variant` (`variant_id`, `option_value_id`)
VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,14),
	(8,20),
	(9,21),
	(10,2),
	(11,3),
	(12,5),
	(13,7),
	(14,9),
	(15,17),
	(16,2),
	(17,3),
	(18,22),
	(19,23),
	(20,24),
	(21,10),
	(22,16),
	(23,5),
	(24,23),
	(25,24),
	(26,11),
	(27,12),
	(28,15),
	(29,17);

/*!40000 ALTER TABLE `option_value_variant` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `customer_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `billing_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `full_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `email` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adjustment_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `credit_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `index_orders_on_number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table order_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `customer_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `billing_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `full_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_line_items_on_order_id` (`order_id`),
  KEY `index_line_items_on_variant_id` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table package
# ------------------------------------------------------------

DROP TABLE IF EXISTS `package`;

CREATE TABLE `package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) DEFAULT NULL,
  `payload` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;

INSERT INTO `payment` (`id`, `source_id`, `source_type`, `state`, `order_id`, `payment_method_id`, `created_at`, `updated_at`, `amount`)
VALUES
	(1,1,'Creditcard',NULL,1,1,NULL,NULL,0.00);

/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payment_method
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_method`;

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_on` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT '1',
  `environment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'development',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;

INSERT INTO `payment_method` (`id`, `type`, `name`, `display_on`, `description`, `active`, `environment`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,'gateway','Paypal','front_end','Paypal',1,'development',NULL,NULL,NULL);

/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `product_source_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `cost_price` decimal(8,2) DEFAULT NULL,
  `customer_price` decimal(8,2) NOT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available_on` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_available_on` (`available_on`),
  KEY `index_products_on_deleted_at` (`deleted_at`),
  KEY `index_products_on_name` (`name`),
  KEY `index_products_on_permalink` (`permalink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `category_id`, `product_source_id`, `name`, `description`, `cost_price`, `customer_price`, `permalink`, `available_on`, `deleted_at`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'Vodacom','Vodacom Airtime vouchers',4.56,4.80,'vodacom_5',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(2,1,2,'MTN','MTN Airtime Vouchers',4.61,4.85,'mtn_5',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(3,1,2,'CellC','Cell C Airtime vouchers',4.55,4.81,'cellc_5',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(4,1,2,'Virgin','Virgin Mobile Airtime',13.73,14.37,'virgin_15',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(5,1,2,'Heita','Heita Airtime',4.58,4.82,'heita_5',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_option_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_option_type`;

CREATE TABLE `product_option_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `option_type_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table product_source
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_source`;

CREATE TABLE `product_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clazz` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `product_source` WRITE;
/*!40000 ALTER TABLE `product_source` DISABLE KEYS */;

INSERT INTO `product_source` (`id`, `supplier_id`, `name`, `description`, `clazz`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'ESET','ESET SOAP Gateway','Eset',NULL,'2011-09-01 02:06:50','2011-09-01 02:06:50'),
	(2,NULL,'Freepaid','Freepaid Airtime API','Freepaid',NULL,'2011-09-01 02:06:50','2011-09-01 02:06:50');

/*!40000 ALTER TABLE `product_source` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20110725150933'),
	('20110725150934'),
	('20110725150935'),
	('20110725150936'),
	('20110824084915'),
	('20110905213434'),
	('20110905233449'),
	('20110905233450');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table state_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `state_event`;

CREATE TABLE `state_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `previous_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `state_event` WRITE;
/*!40000 ALTER TABLE `state_event` DISABLE KEYS */;

INSERT INTO `state_event` (`id`, `order_id`, `user_id`, `name`, `created_at`, `updated_at`, `previous_state`, `next_state`)
VALUES
	(4,1,1,'order','2011-09-18 06:01:24','2011-09-18 06:01:24','cart','complete'),
	(5,NULL,NULL,'invoice','2011-09-18 06:01:24','2011-09-18 06:01:24','created','mailed'),
	(6,1,NULL,'invoice','2011-09-18 06:01:25','2011-09-18 06:01:25','processing','unpaid'),
	(7,1,1,'order','2011-09-18 06:04:55','2011-09-18 06:04:55','cart','complete'),
	(8,NULL,1,'invoice','2011-09-18 06:04:55','2011-09-18 06:04:55','created','mailed'),
	(9,1,1,'invoice','2011-09-18 06:04:56','2011-09-18 06:04:56','processing','unpaid'),
	(10,1,1,'order','2011-09-18 06:09:29','2011-09-18 06:09:29','cart','complete'),
	(11,NULL,1,'invoice','2011-09-18 06:09:29','2011-09-18 06:09:29','created','mailed'),
	(12,1,1,'invoice','2011-09-18 06:09:30','2011-09-18 06:09:30','processing','unpaid'),
	(13,1,1,'order','2011-09-18 06:10:22','2011-09-18 06:10:22','cart','complete'),
	(14,NULL,1,'invoice','2011-09-18 06:10:22','2011-09-18 06:10:22','created','mailed'),
	(15,1,1,'invoice','2011-09-18 06:10:22','2011-09-18 06:10:22','processing','unpaid'),
	(16,2,1,'order','2011-09-18 06:11:00','2011-09-18 06:11:00','cart','complete'),
	(17,NULL,1,'invoice','2011-09-18 06:11:00','2011-09-18 06:11:00','created','mailed'),
	(18,2,1,'invoice','2011-09-18 06:11:01','2011-09-18 06:11:01','processing','unpaid'),
	(19,3,1,'order','2011-09-18 10:10:19','2011-09-18 10:10:19','cart','complete'),
	(20,NULL,1,'invoice','2011-09-18 10:10:19','2011-09-18 10:10:19','created','mailed'),
	(21,3,1,'invoice','2011-09-18 10:10:19','2011-09-18 10:10:19','processing','unpaid'),
	(22,4,1,'order','2011-09-18 10:12:14','2011-09-18 10:12:14','cart','complete'),
	(23,NULL,1,'invoice','2011-09-18 10:12:14','2011-09-18 10:12:14','created','mailed'),
	(24,4,1,'invoice','2011-09-18 10:12:14','2011-09-18 10:12:14','processing','unpaid'),
	(25,5,1,'order','2011-09-18 10:14:34','2011-09-18 10:14:34','cart','complete'),
	(26,NULL,1,'invoice','2011-09-18 10:14:34','2011-09-18 10:14:34','created','mailed'),
	(27,5,1,'invoice','2011-09-18 10:14:34','2011-09-18 10:14:34','processing','unpaid'),
	(28,6,1,'order','2011-09-18 17:33:52','2011-09-18 17:33:52','cart','complete'),
	(29,NULL,1,'invoice','2011-09-18 17:33:52','2011-09-18 17:33:52','created','mailed'),
	(30,6,1,'invoice','2011-09-18 17:33:52','2011-09-18 17:33:52','processing','unpaid'),
	(31,7,1,'order','2011-09-18 17:36:20','2011-09-18 17:36:20','cart','complete'),
	(32,NULL,1,'invoice','2011-09-18 17:36:20','2011-09-18 17:36:20','created','mailed'),
	(33,7,1,'invoice','2011-09-18 17:36:21','2011-09-18 17:36:21','processing','unpaid'),
	(34,8,1,'order','2011-09-18 17:39:46','2011-09-18 17:39:46','cart','complete'),
	(35,NULL,1,'invoice','2011-09-18 17:39:46','2011-09-18 17:39:46','created','mailed'),
	(36,8,1,'invoice','2011-09-18 17:39:46','2011-09-18 17:39:46','processing','unpaid'),
	(37,9,1,'order','2011-09-18 17:47:13','2011-09-18 17:47:13','cart','complete'),
	(38,NULL,1,'invoice','2011-09-18 17:47:13','2011-09-18 17:47:13','created','mailed'),
	(39,9,1,'invoice','2011-09-18 17:47:14','2011-09-18 17:47:14','processing','unpaid'),
	(40,10,1,'order','2011-09-18 17:51:57','2011-09-18 17:51:57','cart','complete'),
	(41,NULL,1,'invoice','2011-09-18 17:51:57','2011-09-18 17:51:57','created','mailed'),
	(42,10,1,'invoice','2011-09-18 17:51:58','2011-09-18 17:51:58','processing','unpaid'),
	(43,11,1,'order','2011-09-18 17:52:59','2011-09-18 17:52:59','cart','complete'),
	(44,NULL,1,'invoice','2011-09-18 17:52:59','2011-09-18 17:52:59','created','mailed'),
	(45,11,1,'invoice','2011-09-18 17:53:00','2011-09-18 17:53:00','processing','unpaid'),
	(46,1,1,'order','2011-09-18 18:11:53','2011-09-18 18:11:53','cart','complete'),
	(47,NULL,1,'invoice','2011-09-18 18:11:54','2011-09-18 18:11:54','created','mailed'),
	(48,1,1,'invoice','2011-09-18 18:11:54','2011-09-18 18:11:54','processing','unpaid'),
	(49,2,1,'order','2011-09-18 18:15:44','2011-09-18 18:15:44','cart','complete'),
	(50,NULL,1,'invoice','2011-09-18 18:15:44','2011-09-18 18:15:44','created','mailed'),
	(51,2,1,'invoice','2011-09-18 18:15:44','2011-09-18 18:15:44','processing','unpaid'),
	(52,3,1,'order','2011-09-18 18:23:32','2011-09-18 18:23:32','cart','complete'),
	(53,NULL,1,'invoice','2011-09-18 18:23:32','2011-09-18 18:23:32','created','mailed'),
	(54,3,1,'invoice','2011-09-18 18:23:32','2011-09-18 18:23:32','processing','unpaid'),
	(55,1,1,'order','2011-09-18 19:47:06','2011-09-18 19:47:06','cart','complete'),
	(56,NULL,1,'invoice','2011-09-18 19:47:06','2011-09-18 19:47:06','created','mailed'),
	(57,1,1,'invoice','2011-09-18 19:47:06','2011-09-18 19:47:06','processing','unpaid'),
	(64,2,2,'order','2011-09-19 14:25:23','2011-09-19 14:25:23','cart','complete'),
	(65,NULL,2,'invoice','2011-09-19 14:25:23','2011-09-19 14:25:23','created','mailed'),
	(66,2,2,'invoice','2011-09-19 14:25:23','2011-09-19 14:25:23','processing','unpaid'),
	(67,3,2,'order','2011-09-19 14:26:13','2011-09-19 14:26:13','cart','complete'),
	(68,NULL,2,'invoice','2011-09-19 14:26:13','2011-09-19 14:26:13','created','mailed'),
	(69,3,2,'invoice','2011-09-19 14:26:13','2011-09-19 14:26:13','processing','unpaid'),
	(70,4,2,'order','2011-09-19 14:29:26','2011-09-19 14:29:26','cart','complete'),
	(71,NULL,2,'invoice','2011-09-19 14:29:26','2011-09-19 14:29:26','created','mailed'),
	(72,4,2,'invoice','2011-09-19 14:29:27','2011-09-19 14:29:27','processing','unpaid'),
	(73,5,2,'order','2011-09-19 14:32:33','2011-09-19 14:32:33','cart','complete'),
	(74,NULL,2,'invoice','2011-09-19 14:32:33','2011-09-19 14:32:33','created','mailed'),
	(75,5,2,'invoice','2011-09-19 14:32:33','2011-09-19 14:32:33','processing','unpaid'),
	(76,6,2,'order','2011-09-19 14:33:29','2011-09-19 14:33:29','cart','complete'),
	(77,NULL,2,'invoice','2011-09-19 14:33:29','2011-09-19 14:33:29','created','mailed'),
	(78,6,2,'invoice','2011-09-19 14:33:30','2011-09-19 14:33:30','processing','unpaid'),
	(80,8,1,'order','2011-09-21 07:03:56','2011-09-21 07:03:56','cart','complete'),
	(81,NULL,1,'invoice','2011-09-21 07:03:56','2011-09-21 07:03:56','created','mailed'),
	(82,8,1,'invoice','2011-09-21 07:03:56','2011-09-21 07:03:56','processing','unpaid'),
	(83,7,2,'order','2011-09-21 13:34:20','2011-09-21 13:34:20','cart','complete'),
	(84,NULL,2,'invoice','2011-09-21 13:34:20','2011-09-21 13:34:20','created','mailed'),
	(85,7,2,'invoice','2011-09-21 13:34:20','2011-09-21 13:34:20','processing','unpaid'),
	(86,10,2,'order','2011-09-21 21:01:21','2011-09-21 21:01:21','cart','complete'),
	(87,NULL,2,'invoice','2011-09-21 21:01:22','2011-09-21 21:01:22','created','mailed'),
	(88,10,2,'invoice','2011-09-21 21:01:22','2011-09-21 21:01:22','processing','unpaid'),
	(89,11,2,'order','2011-09-21 21:03:57','2011-09-21 21:03:57','cart','complete'),
	(90,NULL,2,'invoice','2011-09-21 21:03:57','2011-09-21 21:03:57','created','mailed'),
	(91,11,2,'invoice','2011-09-21 21:03:57','2011-09-21 21:03:57','processing','unpaid'),
	(92,12,2,'order','2011-09-21 21:15:58','2011-09-21 21:15:58','cart','complete'),
	(93,NULL,2,'invoice','2011-09-21 21:15:58','2011-09-21 21:15:58','created','mailed'),
	(94,12,2,'invoice','2011-09-21 21:15:58','2011-09-21 21:15:58','processing','unpaid'),
	(95,13,2,'order','2011-09-21 21:18:48','2011-09-21 21:18:48','cart','complete'),
	(96,NULL,2,'invoice','2011-09-21 21:18:48','2011-09-21 21:18:48','created','mailed'),
	(97,13,2,'invoice','2011-09-21 21:18:48','2011-09-21 21:18:48','processing','unpaid'),
	(98,16,1,'order','2011-09-23 14:27:21','2011-09-23 14:27:21','cart','complete'),
	(99,NULL,1,'invoice','2011-09-23 14:27:22','2011-09-23 14:27:22','created','mailed'),
	(100,16,1,'invoice','2011-09-23 14:27:22','2011-09-23 14:27:22','processing','unpaid'),
	(101,16,1,'order','2011-09-23 14:27:54','2011-09-23 14:27:54','cart','complete'),
	(102,NULL,1,'invoice','2011-09-23 14:27:54','2011-09-23 14:27:54','created','mailed'),
	(103,16,1,'invoice','2011-09-23 14:27:54','2011-09-23 14:27:54','processing','unpaid'),
	(104,18,1,'order','2011-09-23 14:37:04','2011-09-23 14:37:04','cart','complete'),
	(105,NULL,1,'invoice','2011-09-23 14:37:04','2011-09-23 14:37:04','created','mailed'),
	(106,18,1,'invoice','2011-09-23 14:37:04','2011-09-23 14:37:04','processing','unpaid'),
	(107,19,1,'order','2011-09-23 14:41:24','2011-09-23 14:41:24','cart','complete'),
	(108,NULL,1,'invoice','2011-09-23 14:41:24','2011-09-23 14:41:24','created','mailed'),
	(109,19,1,'invoice','2011-09-23 14:41:24','2011-09-23 14:41:24','processing','unpaid'),
	(111,25,1,'order','2011-09-25 06:43:37','2011-09-25 06:43:37','cart','complete'),
	(112,NULL,1,'invoice','2011-09-25 06:43:37','2011-09-25 06:43:37','created','mailed'),
	(113,25,1,'invoice','2011-09-25 06:43:37','2011-09-25 06:43:37','processing','unpaid'),
	(114,26,1,'order','2011-09-25 06:56:37','2011-09-25 06:56:37','cart','complete'),
	(115,NULL,1,'invoice','2011-09-25 06:56:38','2011-09-25 06:56:38','created','mailed'),
	(116,26,1,'invoice','2011-09-25 06:56:38','2011-09-25 06:56:38','processing','unpaid'),
	(117,1,1,'order','2011-09-25 18:46:19','2011-09-25 18:46:19','cart','complete'),
	(118,NULL,1,'invoice','2011-09-25 18:46:20','2011-09-25 18:46:20','created','mailed'),
	(119,1,1,'invoice','2011-09-25 18:46:20','2011-09-25 18:46:20','processing','unpaid'),
	(120,2,1,'order','2011-09-25 18:53:22','2011-09-25 18:53:22','cart','complete'),
	(121,NULL,1,'invoice','2011-09-25 18:53:23','2011-09-25 18:53:23','created','mailed'),
	(122,2,1,'invoice','2011-09-25 18:53:23','2011-09-25 18:53:23','processing','unpaid'),
	(123,3,1,'order','2011-09-25 18:55:12','2011-09-25 18:55:12','cart','complete'),
	(124,NULL,1,'invoice','2011-09-25 18:55:12','2011-09-25 18:55:12','created','mailed'),
	(125,3,1,'invoice','2011-09-25 18:55:12','2011-09-25 18:55:12','processing','unpaid'),
	(126,4,1,'order','2011-09-25 18:57:01','2011-09-25 18:57:01','cart','complete'),
	(127,NULL,1,'invoice','2011-09-25 18:57:01','2011-09-25 18:57:01','created','mailed'),
	(128,4,1,'invoice','2011-09-25 18:57:01','2011-09-25 18:57:01','processing','unpaid'),
	(129,5,1,'order','2011-09-25 19:03:16','2011-09-25 19:03:16','cart','complete'),
	(130,NULL,1,'invoice','2011-09-25 19:03:16','2011-09-25 19:03:16','created','mailed'),
	(131,5,1,'invoice','2011-09-25 19:03:17','2011-09-25 19:03:17','processing','unpaid'),
	(132,1,1,'order','2011-09-25 19:04:21','2011-09-25 19:04:21','cart','complete'),
	(133,NULL,1,'invoice','2011-09-25 19:04:21','2011-09-25 19:04:21','created','mailed'),
	(134,1,1,'invoice','2011-09-25 19:04:21','2011-09-25 19:04:21','processing','unpaid'),
	(135,2,1,'order','2011-09-26 06:49:24','2011-09-26 06:49:24','cart','complete'),
	(136,NULL,1,'invoice','2011-09-26 06:49:24','2011-09-26 06:49:24','created','mailed'),
	(137,2,1,'invoice','2011-09-26 06:49:24','2011-09-26 06:49:24','processing','unpaid'),
	(138,4,1,'order','2011-09-26 07:18:27','2011-09-26 07:18:27','cart','complete'),
	(139,NULL,1,'invoice','2011-09-26 07:18:27','2011-09-26 07:18:27','created','mailed'),
	(140,4,1,'invoice','2011-09-26 07:18:27','2011-09-26 07:18:27','processing','unpaid'),
	(141,5,1,'order','2011-09-26 14:42:34','2011-09-26 14:42:34','cart','complete'),
	(142,NULL,1,'invoice','2011-09-26 14:42:34','2011-09-26 14:42:34','created','mailed'),
	(143,5,1,'invoice','2011-09-26 14:42:35','2011-09-26 14:42:35','processing','unpaid'),
	(144,6,1,'order','2011-09-26 14:45:03','2011-09-26 14:45:03','cart','complete'),
	(145,NULL,1,'invoice','2011-09-26 14:45:04','2011-09-26 14:45:04','created','mailed'),
	(146,6,1,'invoice','2011-09-26 14:45:04','2011-09-26 14:45:04','processing','unpaid'),
	(147,3,1,'order','2011-09-26 14:46:58','2011-09-26 14:46:58','cart','complete'),
	(148,NULL,1,'invoice','2011-09-26 14:46:59','2011-09-26 14:46:59','created','mailed'),
	(149,3,1,'invoice','2011-09-26 14:46:59','2011-09-26 14:46:59','processing','unpaid'),
	(150,1,1,'order','2011-09-26 14:50:38','2011-09-26 14:50:38','cart','complete'),
	(151,NULL,1,'invoice','2011-09-26 14:50:38','2011-09-26 14:50:38','created','mailed'),
	(152,1,1,'invoice','2011-09-26 14:50:38','2011-09-26 14:50:38','processing','unpaid'),
	(153,2,1,'order','2011-09-26 14:53:07','2011-09-26 14:53:07','cart','complete'),
	(154,NULL,1,'invoice','2011-09-26 14:53:07','2011-09-26 14:53:07','created','mailed'),
	(155,2,1,'invoice','2011-09-26 14:53:07','2011-09-26 14:53:07','processing','unpaid'),
	(156,3,1,'order','2011-09-27 06:22:34','2011-09-27 06:22:34','cart','complete'),
	(157,NULL,1,'invoice','2011-09-27 06:22:34','2011-09-27 06:22:34','created','mailed'),
	(158,3,1,'invoice','2011-09-27 06:22:34','2011-09-27 06:22:34','processing','unpaid'),
	(159,4,1,'order','2011-09-27 06:41:32','2011-09-27 06:41:32','cart','complete'),
	(160,NULL,1,'invoice','2011-09-27 06:41:32','2011-09-27 06:41:32','created','mailed'),
	(161,4,1,'invoice','2011-09-27 06:41:33','2011-09-27 06:41:33','processing','unpaid'),
	(162,5,1,'order','2011-09-29 14:48:05','2011-09-29 14:48:05','cart','complete'),
	(163,NULL,1,'invoice','2011-09-29 14:48:05','2011-09-29 14:48:05','created','mailed'),
	(164,5,1,'invoice','2011-09-29 14:48:05','2011-09-29 14:48:05','processing','unpaid'),
	(165,6,1,'order','2011-09-29 14:49:20','2011-09-29 14:49:20','cart','complete'),
	(166,NULL,1,'invoice','2011-09-29 14:49:20','2011-09-29 14:49:20','created','mailed'),
	(167,6,1,'invoice','2011-09-29 14:49:20','2011-09-29 14:49:20','processing','unpaid');

/*!40000 ALTER TABLE `state_event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registered_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;

INSERT INTO `supplier` (`id`, `registered_name`, `contact_number`, `email_address`, `url`, `created_at`, `updated_at`)
VALUES
	(1,'ESET','0123453434','info@eset.co.za','www.eset.co.za','2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(2,'Freepaid','0123453434','info@freepaid.co.za','www.freepaid.co.za','2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(3,'Blizzard','0123453434','info@blizzard.co.za','www.blizzard.co.za','2011-09-01 02:06:49','2011-09-01 02:06:49');

/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_on_email` (`email`),
  UNIQUE KEY `index_user_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `client_id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `name`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'shad6ster@gmail.com','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,22,'2011-09-29 14:45:19','2011-09-27 06:41:04','127.0.0.1','10.32.1.201','shadley','2011-09-01 02:06:50','2011-09-29 14:45:19'),
	(2,NULL,'shadley@eset.co.za','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,2,'2011-09-27 09:46:43','2011-09-18 19:53:15','127.0.0.1','127.0.0.1','shadley','2011-09-01 02:06:50','2011-09-27 09:46:43'),
	(3,NULL,'uzair.dramat@gmail.com','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'uzair','2011-09-01 02:06:50',NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table variant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `variant`;

CREATE TABLE `variant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cost_price` decimal(8,2) DEFAULT NULL,
  `customer_price` decimal(8,2) DEFAULT NULL,
  `full_price` decimal(8,2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_master` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_variants_on_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;

INSERT INTO `variant` (`id`, `product_id`, `sku`, `cost_price`, `customer_price`, `full_price`, `deleted_at`, `is_master`)
VALUES
	(1,1,'FREEPAID00000VOD2',1.82,1.92,2.00,NULL,1),
	(2,1,'FREEPAID00000VOD5',4.56,4.80,5.00,NULL,0),
	(3,1,'FREEPAID0000VOD10',9.11,9.41,10.00,NULL,0),
	(4,1,'FREEPAID0000VOD12',10.92,11.32,12.00,NULL,0),
	(5,1,'FREEPAID0000VOD29',26.41,27.50,29.00,NULL,0),
	(6,1,'FREEPAID0000VOD55',50.07,52.57,55.00,NULL,0),
	(7,1,'FREEPAID000VOD110',100.12,105.00,110.00,NULL,0),
	(8,1,'FREEPAID000VOD275',250.29,262.29,275.00,NULL,0),
	(9,1,'FREEPAID00VOD1100',912.49,1052.49,1100.00,NULL,0),
	(10,2,'FREEPAID00000MTN5',4.61,4.85,5.00,NULL,1),
	(11,2,'FREEPAID0000MTN10',9.21,9.51,10.00,NULL,0),
	(12,2,'FREEPAID0000MTN15',13.82,14.50,15.00,NULL,0),
	(13,2,'FREEPAID0000MTN30',27.63,29.00,30.00,NULL,0),
	(14,2,'FREEPAID0000MTN60',55.26,58.00,60.00,NULL,0),
	(15,2,'FREEPAID000MTN180',165.78,172.78,180.00,NULL,0),
	(16,3,'FREEPAID00000CELL5',4.55,4.79,5.00,NULL,1),
	(17,3,'FREEPAID0000CELL10',8.98,9.48,10.00,NULL,0),
	(18,3,'FREEPAID0000CELL25',22.45,23.90,25.00,NULL,0),
	(19,3,'FREEPAID0000CELL35',31.41,33.41,35.00,NULL,0),
	(20,3,'FREEPAID0000CELL50',44.88,47.00,50.00,NULL,0),
	(21,3,'FREEPAID0000CELL70',62.83,66.42,70.00,NULL,0),
	(22,3,'FREEPAID000CELL150',134.63,142.63,150.00,NULL,0),
	(23,4,'FREEPAID00000VIR15',13.73,14.53,15.00,NULL,1),
	(24,4,'FREEPAID00000VIR35',32.03,34.00,35.00,NULL,0),
	(25,4,'FREEPAID00000VIR50',45.75,47.00,50.00,NULL,0),
	(26,4,'FREEPAID00000VIR80',73.20,76.20,80.00,NULL,0),
	(27,4,'FREEPAID00000VIR99',90.59,95.60,99.00,NULL,0),
	(28,4,'FREEPAID0000VIR120',109.80,115.00,120.00,NULL,0),
	(29,4,'FREEPAID0000VIR180',166.50,174.00,180.00,NULL,0),
	(30,5,'FREEPAID000000HEI5',4.58,4.82,5.00,NULL,1);

/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
