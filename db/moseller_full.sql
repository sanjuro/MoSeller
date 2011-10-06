# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.14)
# Database: moseller
# Generation Time: 2011-10-07 00:15:01 +0200
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

CREATE TABLE `account_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table active_admin_comments
# ------------------------------------------------------------

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_user_on_email` (`email`),
  UNIQUE KEY `index_admin_user_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;

INSERT INTO `admin_user` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`)
VALUES
	(1,'shad6ster@gmail.com','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,1,'2011-09-03 17:37:34','2011-09-03 17:37:34','127.0.0.1','127.0.0.1','2011-09-01 02:06:50','2011-09-03 17:37:34');

/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table asset
# ------------------------------------------------------------

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

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `title`)
VALUES
	(1,'airtime');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table client
# ------------------------------------------------------------

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

CREATE TABLE `client_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contact
# ------------------------------------------------------------

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



# Dump of table inventory_level
# ------------------------------------------------------------

CREATE TABLE `inventory_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_source_id` int(11) DEFAULT NULL,
  `clazz` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_level` decimal(8,2) NOT NULL DEFAULT '0.00',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `inventory_level` WRITE;
/*!40000 ALTER TABLE `inventory_level` DISABLE KEYS */;

INSERT INTO `inventory_level` (`id`, `product_source_id`, `clazz`, `stock_level`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,2,'FreepaidInventory',955.51,NULL,'2011-09-01 02:06:50','2011-10-07 02:06:50');

/*!40000 ALTER TABLE `inventory_level` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoice
# ------------------------------------------------------------

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



# Dump of table invoice_item
# ------------------------------------------------------------

CREATE TABLE `invoice_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table invoice_type
# ------------------------------------------------------------

CREATE TABLE `invoice_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table location
# ------------------------------------------------------------

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
	(24,1,'voucher_amount_50',240,'R50.00',NULL,NULL),
	(25,1,'voucher_amount_20',20,'R20.00\n',NULL,NULL);

/*!40000 ALTER TABLE `option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_value_variant
# ------------------------------------------------------------

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
	(29,17),
	(30,2),
	(31,3),
	(32,25),
	(33,7),
	(34,24),
	(35,13),
	(36,19);

/*!40000 ALTER TABLE `option_value_variant` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------

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
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
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
	(1,1,2,'Vodacom','Vodacom Airtime\n',4.56,4.80,'vodacom_5',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(2,1,2,'MTN','MTN Airtime',4.61,4.85,'mtn_5',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(3,1,2,'CellC','Cell C Airtime',4.55,4.81,'cellc_5',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(4,1,2,'Virgin','Virgin Mobile Airtime',13.73,14.37,'virgin_15',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49'),
	(5,1,2,'Heita','Heita Airtime',4.58,4.82,'heita_5',NULL,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_option_type
# ------------------------------------------------------------

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
	('20110725150937'),
	('20110824084915'),
	('20110824084916'),
	('20110905233449'),
	('20110905233450');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table state_event
# ------------------------------------------------------------

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
	(1,1,1,'order','2011-09-30 12:15:19','2011-09-30 12:15:19','cart','complete'),
	(2,NULL,1,'invoice','2011-09-30 12:15:19','2011-09-30 12:15:19','created','mailed'),
	(3,1,1,'invoice','2011-09-30 12:15:19','2011-09-30 12:15:19','processing','unpaid'),
	(4,2,1,'order','2011-10-02 08:06:38','2011-10-02 08:06:38','cart','complete'),
	(5,NULL,1,'invoice','2011-10-02 08:06:38','2011-10-02 08:06:38','created','mailed'),
	(6,2,1,'invoice','2011-10-02 08:06:39','2011-10-02 08:06:39','processing','unpaid'),
	(7,3,1,'order','2011-10-02 11:36:28','2011-10-02 11:36:28','cart','complete'),
	(8,NULL,1,'invoice','2011-10-02 11:36:28','2011-10-02 11:36:28','created','mailed'),
	(9,3,1,'invoice','2011-10-02 11:36:28','2011-10-02 11:36:28','processing','unpaid'),
	(10,4,1,'order','2011-10-02 11:40:08','2011-10-02 11:40:08','cart','complete'),
	(11,NULL,1,'invoice','2011-10-02 11:40:09','2011-10-02 11:40:09','created','mailed'),
	(12,4,1,'invoice','2011-10-02 11:40:09','2011-10-02 11:40:09','processing','unpaid'),
	(13,5,1,'order','2011-10-02 11:41:27','2011-10-02 11:41:27','cart','complete'),
	(14,NULL,1,'invoice','2011-10-02 11:41:28','2011-10-02 11:41:28','created','mailed'),
	(15,5,1,'invoice','2011-10-02 11:41:28','2011-10-02 11:41:28','processing','unpaid'),
	(16,6,1,'order','2011-10-02 11:47:05','2011-10-02 11:47:05','cart','complete'),
	(17,NULL,1,'invoice','2011-10-02 11:47:05','2011-10-02 11:47:05','created','mailed'),
	(18,6,1,'invoice','2011-10-02 11:47:05','2011-10-02 11:47:05','processing','unpaid'),
	(19,7,1,'order','2011-10-02 16:33:16','2011-10-02 16:33:16','cart','complete'),
	(20,NULL,1,'invoice','2011-10-02 16:33:16','2011-10-02 16:33:16','created','mailed'),
	(21,7,1,'invoice','2011-10-02 16:33:16','2011-10-02 16:33:16','processing','unpaid'),
	(22,8,1,'order','2011-10-02 16:46:08','2011-10-02 16:46:08','cart','complete'),
	(23,NULL,1,'invoice','2011-10-02 16:46:08','2011-10-02 16:46:08','created','mailed'),
	(24,8,1,'invoice','2011-10-02 16:46:08','2011-10-02 16:46:08','processing','unpaid'),
	(25,9,1,'order','2011-10-02 16:47:52','2011-10-02 16:47:52','cart','complete'),
	(26,NULL,1,'invoice','2011-10-02 16:47:52','2011-10-02 16:47:52','created','mailed'),
	(27,9,1,'invoice','2011-10-02 16:47:53','2011-10-02 16:47:53','processing','unpaid'),
	(28,10,1,'order','2011-10-02 16:49:00','2011-10-02 16:49:00','cart','complete'),
	(29,NULL,1,'invoice','2011-10-02 16:49:00','2011-10-02 16:49:00','created','mailed'),
	(30,10,1,'invoice','2011-10-02 16:49:00','2011-10-02 16:49:00','processing','unpaid'),
	(31,11,1,'order','2011-10-02 17:17:37','2011-10-02 17:17:37','cart','complete'),
	(32,NULL,1,'invoice','2011-10-02 17:17:37','2011-10-02 17:17:37','created','mailed'),
	(33,11,1,'invoice','2011-10-02 17:17:38','2011-10-02 17:17:38','processing','unpaid');

/*!40000 ALTER TABLE `state_event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supplier
# ------------------------------------------------------------

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
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_on_email` (`email`),
  UNIQUE KEY `index_user_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `client_id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `name`, `username`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'shad6ster@gmail.com','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,27,'2011-10-02 16:32:42','2011-10-02 08:01:41','127.0.0.1','127.0.0.1','shadley','sanjuro','2011-09-01 02:06:50','2011-10-02 16:32:42'),
	(2,NULL,'shadley@eset.co.za','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,2,'2011-09-27 09:46:43','2011-09-18 19:53:15','127.0.0.1','127.0.0.1','shadley','shadley','2011-09-01 02:06:50','2011-09-27 09:46:43'),
	(3,NULL,'uzair.dramat@gmail.com','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'uzair','uzzy','2011-09-01 02:06:50',NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table variant
# ------------------------------------------------------------

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
	(30,5,'FREEPAID000000HEI5',4.58,4.82,5.00,NULL,1),
	(31,5,'FREEPAID00000HEI10\n',9.15,9.60,10.00,NULL,0),
	(32,5,'FREEPAID00000HEI20\n',18.30,19.10,20.00,NULL,0),
	(33,5,'FREEPAID00000HEI30\n',27.45,28.76,30.00,NULL,0),
	(34,5,'FREEPAID00000HEI50',45.75,47.88,50.00,NULL,0),
	(35,5,'FREEPAID0000HEI100\n',91.50,95.75,100.00,NULL,0),
	(36,5,'FREEPAID0000HEI250',228.75,240.00,250.00,NULL,0);

/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
