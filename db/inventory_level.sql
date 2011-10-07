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
	(1,2,'FreepaidInventory',955.10,NULL,'2011-09-01 02:06:50','2011-10-07 05:31:54');

/*!40000 ALTER TABLE `inventory_level` ENABLE KEYS */;
UNLOCK TABLES;
