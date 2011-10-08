# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.14)
# Database: moseller
# Generation Time: 2011-10-08 09:56:18 +0200
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
	(24,1,'voucher_amount_50',240,'R50.00',NULL,NULL),
	(25,1,'voucher_amount_20',20,'R20.00\n',NULL,NULL);

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
	(5,6),
	(6,8),
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
