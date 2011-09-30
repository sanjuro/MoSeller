# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.14)
# Database: moseller
# Generation Time: 2011-09-30 14:17:13 +0200
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

LOCK TABLES `account_item` WRITE;
/*!40000 ALTER TABLE `account_item` DISABLE KEYS */;

INSERT INTO `account_item` (`id`, `user_id`, `account_item_type_id`, `credit`, `debit`, `account_status_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,0.00,262.29,'1','2011-09-30 12:15:20','2011-09-30 12:15:20');

/*!40000 ALTER TABLE `account_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table account_item_type
# ------------------------------------------------------------



# Dump of table active_admin_comments
# ------------------------------------------------------------



# Dump of table admin_user
# ------------------------------------------------------------

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;

INSERT INTO `admin_user` (`id`, `name`, `created_at`, `updated_at`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`)
VALUES
	(1,'shadley','2011-09-01 02:06:50','2011-09-03 17:37:34','shad6ster@gmail.com','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,1,'2011-09-03 17:37:34','2011-09-03 17:37:34','127.0.0.1','127.0.0.1');

/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table asset
# ------------------------------------------------------------

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;

INSERT INTO `asset` (`id`, `viewable_id`, `viewable_type`, `attachment_content_type`, `attachment_file_name`, `attachment_size`, `position`, `type`, `attachment_updated_at`, `attachment_width`, `attachment_height`)
VALUES
	(1,1,NULL,NULL,'eav_box_tabs.jpg',16,10,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,NULL,NULL,'Mo Seller Inc.','shad6ster@gmail.com',1,NULL,NULL,NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49');

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
	(1,NULL,1,'Shadley Wentzel','shad6ster@gmail.com',NULL,'2011-09-01 02:06:49','2011-09-01 02:06:49');

/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contact_type
# ------------------------------------------------------------

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;

INSERT INTO `contact_type` (`id`, `title`)
VALUES
	(2,'primary');

/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table creditcards
# ------------------------------------------------------------

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;

INSERT INTO `creditcards` (`id`, `number`, `month`, `year`, `verification_value`, `cc_type`, `display_number`, `first_name`, `last_name`, `created_at`, `updated_at`, `start_month`, `start_year`, `issue_number`, `address_id`)
VALUES
	(1,'1234123412341234','03','2013','123\n','Visa',NULL,'Shadley','Wentzel',NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gateway
# ------------------------------------------------------------



# Dump of table invoice
# ------------------------------------------------------------

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;

INSERT INTO `invoice` (`id`, `user_id`, `order_id`, `margin`, `sub_total`, `tax`, `total`, `date_paid`, `email`, `state`, `invoice_type_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,0.00,262.29,0.00,262.29,NULL,'shad6ster@gmail.com','created',NULL,'2011-09-30 12:15:19','2011-09-30 12:15:19');

/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoice_item
# ------------------------------------------------------------

LOCK TABLES `invoice_item` WRITE;
/*!40000 ALTER TABLE `invoice_item` DISABLE KEYS */;

INSERT INTO `invoice_item` (`id`, `invoice_id`, `description`, `total`, `created_at`, `updated_at`)
VALUES
	(1,1,'FREEPAID000VOD275',262.29,'2011-09-30 12:15:19','2011-09-30 12:15:19');

/*!40000 ALTER TABLE `invoice_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoice_type
# ------------------------------------------------------------



# Dump of table location
# ------------------------------------------------------------

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;

INSERT INTO `location` (`id`, `client_id`, `location_type_id`, `address1`, `address2`, `address3`, `address4`, `latitude`, `longitude`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,'Blue House','23 Jump Street','Jumpville','Cape Town','11232.12323','12312312.123213','2011-09-01 02:06:49','2011-09-01 02:06:49');

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
	(1,'voucher_amount','Voucher',NULL,NULL);

/*!40000 ALTER TABLE `option_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table option_value
# ------------------------------------------------------------

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

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;

INSERT INTO `order` (`id`, `supplier_id`, `client_id`, `user_id`, `number`, `item_total`, `customer_total`, `billing_total`, `full_total`, `email`, `mobile_number`, `customer_name`, `created_at`, `updated_at`, `completed_at`, `state`, `token`, `adjustment_total`, `credit_total`)
VALUES
	(1,NULL,NULL,1,'R828380663',262.29,262.29,262.29,262.29,'','','','2011-09-30 11:12:33','2011-09-30 12:15:15','2011-09-30 12:15:15','complete',NULL,0.00,0.00);

/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_item
# ------------------------------------------------------------

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;

INSERT INTO `order_item` (`id`, `order_id`, `product_id`, `variant_id`, `quantity`, `customer_price`, `billing_price`, `full_price`, `created_at`, `updated_at`)
VALUES
	(1,1,1,8,1,262.29,262.29,0.00,'2011-09-30 11:12:33','2011-09-30 12:15:13');

/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table package
# ------------------------------------------------------------

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;

INSERT INTO `package` (`id`, `order_item_id`, `payload`, `permalink`, `created_at`, `updated_at`)
VALUES
	(1,1,'PIN: 250319204526, SERIAL: 2673648775',NULL,'2011-09-30 12:15:15','2011-09-30 12:15:15');

/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payment
# ------------------------------------------------------------

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;

INSERT INTO `payment` (`id`, `source_id`, `source_type`, `state`, `order_id`, `payment_method_id`, `created_at`, `updated_at`, `amount`)
VALUES
	(1,1,'Creditcard',NULL,1,1,NULL,NULL,0.00);

/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payment_method
# ------------------------------------------------------------

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;

INSERT INTO `payment_method` (`id`, `type`, `name`, `display_on`, `description`, `active`, `environment`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,'gateway','Paypal','front_end','Paypal',1,'development',NULL,NULL,NULL);

/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

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



# Dump of table product_source
# ------------------------------------------------------------

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
	('20110905233450'),
	('20110930103738');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table state_event
# ------------------------------------------------------------

LOCK TABLES `state_event` WRITE;
/*!40000 ALTER TABLE `state_event` DISABLE KEYS */;

INSERT INTO `state_event` (`id`, `order_id`, `user_id`, `name`, `created_at`, `updated_at`, `previous_state`, `next_state`)
VALUES
	(1,1,1,'order','2011-09-30 12:15:19','2011-09-30 12:15:19','cart','complete'),
	(2,NULL,1,'invoice','2011-09-30 12:15:19','2011-09-30 12:15:19','created','mailed'),
	(3,1,1,'invoice','2011-09-30 12:15:19','2011-09-30 12:15:19','processing','unpaid');

/*!40000 ALTER TABLE `state_event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supplier
# ------------------------------------------------------------

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

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `client_id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `name`, `created_at`, `updated_at`, `username`)
VALUES
	(1,NULL,'shad6ster@gmail.com','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,24,'2011-09-30 11:10:37','2011-09-30 10:46:45','127.0.0.1','127.0.0.1','shadley','2011-09-01 02:06:50','2011-09-30 11:10:37','sanjuro'),
	(2,NULL,'shadley@eset.co.za','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,2,'2011-09-27 09:46:43','2011-09-18 19:53:15','127.0.0.1','127.0.0.1','shadley','2011-09-01 02:06:50','2011-09-27 09:46:43','shadley'),
	(3,NULL,'uzair.dramat@gmail.com','$2a$10$dUtGGLLqMRbvR/N.ZuwP7uxD9q.1bYw50ariaEoLDarZF.bEC5wLS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'uzair','2011-09-01 02:06:50',NULL,'uzzy');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table variant
# ------------------------------------------------------------

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
