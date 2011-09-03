# ************************************************************
# Sequel Pro SQL dump
# Version 3348
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.14)
# Database: moseller
# Generation Time: 2011-08-30 09:14:56 +0200
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



# Dump of table category
# ------------------------------------------------------------

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

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;

INSERT INTO `client` (`id`, `client_type_id`, `unique_id`, `registered_name`, `email_address`, `tax`, `telephone`, `url`, `token`, `created_at`, `updated_at`)
VALUES
	(1,NULL,NULL,'Mo Seller Inc.','shad6ster@gmail.com',1,NULL,NULL,NULL,'2011-08-29 18:12:09','2011-08-29 18:12:09');

/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table client_type
# ------------------------------------------------------------



# Dump of table contact
# ------------------------------------------------------------

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;

INSERT INTO `contact` (`id`, `client_id`, `contact_type_id`, `contact_name`, `contact_email`, `contact_number`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,'Shadley Wentzel','shad6ster@gmail.com',NULL,'2011-08-29 18:12:09','2011-08-29 18:12:09');

/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contact_type
# ------------------------------------------------------------

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;

INSERT INTO `contact_type` (`id`, `title`)
VALUES
	(1,'primary');

/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoice
# ------------------------------------------------------------



# Dump of table invoice_item
# ------------------------------------------------------------



# Dump of table invoice_type
# ------------------------------------------------------------



# Dump of table location
# ------------------------------------------------------------

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;

INSERT INTO `location` (`id`, `client_id`, `location_type_id`, `address1`, `address2`, `address3`, `address4`, `latitude`, `longitude`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,'Blue House','23 Jump Street','Jumpville','Cape Town','11232.12323','12312312.123213','2011-08-29 18:12:09','2011-08-29 18:12:09');

/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table location_type
# ------------------------------------------------------------

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

LOCK TABLES `option_type` WRITE;
/*!40000 ALTER TABLE `option_type` DISABLE KEYS */;

INSERT INTO `option_type` (`id`, `name`, `presentation`, `created_at`, `updated_at`)
VALUES
	(1,'update_type','Update Type',NULL,NULL),
	(2,'purchase_type','Purchase Type',NULL,NULL);

/*!40000 ALTER TABLE `option_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_value
# ------------------------------------------------------------

LOCK TABLES `option_value` WRITE;
/*!40000 ALTER TABLE `option_value` DISABLE KEYS */;

INSERT INTO `option_value` (`id`, `option_type_id`, `name`, `position`, `presentation`, `created_at`, `updated_at`)
VALUES
	(1,1,'update_1_year',10,'1 Year',NULL,NULL),
	(2,1,'update_2_year',20,'2 Year',NULL,NULL),
	(3,2,'purchase_new',10,'New',NULL,NULL),
	(4,2,'purchase_renew',20,'Renew',NULL,NULL);

/*!40000 ALTER TABLE `option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_value_variant
# ------------------------------------------------------------

LOCK TABLES `option_value_variant` WRITE;
/*!40000 ALTER TABLE `option_value_variant` DISABLE KEYS */;

INSERT INTO `option_value_variant` (`variant_id`, `option_value_id`)
VALUES
	(1,1),
	(1,3);

/*!40000 ALTER TABLE `option_value_variant` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------



# Dump of table order_item
# ------------------------------------------------------------



# Dump of table payment
# ------------------------------------------------------------



# Dump of table payment_methods
# ------------------------------------------------------------



# Dump of table product
# ------------------------------------------------------------

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `category_id`, `product_source_id`, `name`, `description`, `cost_price`, `customer_price`, `permalink`, `available_on`, `deleted_at`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`)
VALUES
	(1,2,1,'NOD32','ESET NOD32',236.00,312.00,NULL,NULL,NULL,NULL,NULL,'2011-08-29 18:12:09','2011-08-29 18:12:09');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_option_type
# ------------------------------------------------------------

LOCK TABLES `product_option_type` WRITE;
/*!40000 ALTER TABLE `product_option_type` DISABLE KEYS */;

INSERT INTO `product_option_type` (`id`, `product_id`, `option_type_id`, `position`, `created_at`, `updated_at`)
VALUES
	(1,1,1,10,NULL,NULL),
	(2,1,2,20,NULL,NULL);

/*!40000 ALTER TABLE `product_option_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_source
# ------------------------------------------------------------



# Dump of table schema_migrations
# ------------------------------------------------------------

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20110725150933'),
	('20110725150934'),
	('20110725150935'),
	('20110725150936'),
	('20110824084915');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table state_event
# ------------------------------------------------------------



# Dump of table supplier
# ------------------------------------------------------------

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;

INSERT INTO `supplier` (`id`, `registered_name`, `contact_number`, `email_address`, `url`, `created_at`, `updated_at`)
VALUES
	(1,'ESET','0123453434','info@eset.co.za','www.eset.co.za','2011-08-29 18:12:09','2011-08-29 18:12:09'),
	(2,'Freepaid','0123453434','info@freepaid.co.za','www.freepaid.co.za','2011-08-29 18:12:09','2011-08-29 18:12:09'),
	(3,'Blizzard','0123453434','info@blizzard.co.za','www.blizzard.co.za','2011-08-29 18:12:09','2011-08-29 18:12:09');

/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `client_id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `name`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'shad6ster@gmail.com','$2a$10$.tQLX3O5n2DUksqk6hHrTOKYBeIfC/CoTlFjnA/dceF7Qm4/VfSfm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'shadley','2011-08-29 18:12:09','2011-08-29 18:12:09');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table variant
# ------------------------------------------------------------

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;

INSERT INTO `variant` (`id`, `product_id`, `sku`, `cost_price`, `customer_price`, `deleted_at`, `is_master`)
VALUES
	(1,1,'',236.00,312.00,NULL,1);

/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
