-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para marketplace
DROP DATABASE IF EXISTS `marketplace`;
CREATE DATABASE IF NOT EXISTS `marketplace` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `marketplace`;

-- Volcando estructura para tabla marketplace.attachmens
DROP TABLE IF EXISTS `attachmens`;
CREATE TABLE IF NOT EXISTS `attachmens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `extension` varchar(5) NOT NULL,
  `bucket` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla información archivos adjuntos';

-- Volcando datos para la tabla marketplace.attachmens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `attachmens` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachmens` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tabla categorias principales. Texto. Video - Animación. Fotografía. Audio - Música. Diseño. Traducciones';

-- Volcando datos para la tabla marketplace.categories: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
REPLACE INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Arte', NULL, NULL),
	(2, 'Cultura', NULL, NULL),
	(3, 'Estilo de vida', NULL, NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.category_format
DROP TABLE IF EXISTS `category_format`;
CREATE TABLE IF NOT EXISTS `category_format` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `format_file_id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_format_category` (`format_file_id`),
  CONSTRAINT `FK_format_category` FOREIGN KEY (`format_file_id`) REFERENCES `formats_file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Categorias para formatos';

-- Volcando datos para la tabla marketplace.category_format: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `category_format` DISABLE KEYS */;
REPLACE INTO `category_format` (`id`, `format_file_id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 4, 'Texto especializados', NULL, NULL);
/*!40000 ALTER TABLE `category_format` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabla paises';

-- Volcando datos para la tabla marketplace.countries: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
REPLACE INTO `countries` (`id`, `name`, `update_at`, `created_at`) VALUES
	(1, 'Venezuela', NULL, NULL),
	(2, 'Bolivia', NULL, NULL),
	(3, 'Brazil', NULL, NULL),
	(4, 'Perú', NULL, NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.credits
DROP TABLE IF EXISTS `credits`;
CREATE TABLE IF NOT EXISTS `credits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `balance` decimal(10,2) unsigned DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_credit_user` (`user_id`),
  CONSTRAINT `FK_credit_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla creditos disponibles del usuario';

-- Volcando datos para la tabla marketplace.credits: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `credits` DISABLE KEYS */;
REPLACE INTO `credits` (`id`, `user_id`, `balance`, `created_at`, `updated_at`) VALUES
	(2, 1, 34.00, NULL, NULL);
/*!40000 ALTER TABLE `credits` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.credit_transaction
DROP TABLE IF EXISTS `credit_transaction`;
CREATE TABLE IF NOT EXISTS `credit_transaction` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `credit_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_type_transaction` (`credit_type_id`),
  KEY `FK_credit_transaction_user` (`user_id`),
  CONSTRAINT `FK_credit_transaction_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_type_transaction` FOREIGN KEY (`credit_type_id`) REFERENCES `credit_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='tabla para el control de cada una de las tranasacciones';

-- Volcando datos para la tabla marketplace.credit_transaction: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `credit_transaction` DISABLE KEYS */;
REPLACE INTO `credit_transaction` (`id`, `credit_type_id`, `user_id`, `amount`, `description`, `created_at`, `update_at`) VALUES
	(7, 2, 1, 20.00, 'Recarga 20 creditos', '2020-09-25 06:10:33', '2020-09-25 06:10:33'),
	(8, 2, 1, 20.00, 'Recarga 20 creditos', '2020-09-25 06:11:29', '2020-09-25 06:11:29'),
	(9, 2, 1, 22.00, 'Recarga 22 creditos', '2020-09-25 06:14:08', '2020-09-25 06:14:08'),
	(10, 2, 1, 22.00, 'Recarga 22 creditos', '2020-09-25 06:17:13', '2020-09-25 06:17:13');
/*!40000 ALTER TABLE `credit_transaction` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.credit_type
DROP TABLE IF EXISTS `credit_type`;
CREATE TABLE IF NOT EXISTS `credit_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='tablas tipos de transacciones Credito, Debito';

-- Volcando datos para la tabla marketplace.credit_type: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `credit_type` DISABLE KEYS */;
REPLACE INTO `credit_type` (`id`, `name`, `created_at`, `update_at`) VALUES
	(1, 'Debito', NULL, NULL),
	(2, 'Credito', NULL, NULL);
/*!40000 ALTER TABLE `credit_type` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.formats_file
DROP TABLE IF EXISTS `formats_file`;
CREATE TABLE IF NOT EXISTS `formats_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `base_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='-- text\r\n-- video\r\n-- audio\r\n-- photograpy, translation';

-- Volcando datos para la tabla marketplace.formats_file: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `formats_file` DISABLE KEYS */;
REPLACE INTO `formats_file` (`id`, `name`, `base_amount`, `created_at`, `updated_at`) VALUES
	(1, 'Diseño', 0.00, NULL, NULL),
	(2, 'Video - Animación', 0.00, NULL, NULL),
	(3, 'Fotografía', 0.00, NULL, NULL),
	(4, 'Texto', 0.00, NULL, NULL);
/*!40000 ALTER TABLE `formats_file` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `format_file_id` bigint(20) unsigned NOT NULL,
  `category_format_id` bigint(20) unsigned NOT NULL,
  `ranking_id` bigint(20) unsigned NOT NULL,
  `words` int(11) NOT NULL DEFAULT '0',
  `description` varchar(500) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tecnical_language` tinyint(4) NOT NULL DEFAULT '0',
  `SEO` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_item_order` (`order_id`),
  CONSTRAINT `FK_item_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Descripción de cada pedido en la solicitud';

-- Volcando datos para la tabla marketplace.items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.languages
DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='tabla de idiomas';

-- Volcando datos para la tabla marketplace.languages: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
REPLACE INTO `languages` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Español', NULL, NULL),
	(2, 'Ingles', NULL, NULL),
	(3, 'Frances', NULL, NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `type_order_id` bigint(20) unsigned NOT NULL,
  `language_id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) unsigned NOT NULL,
  `attach_file_id` bigint(20) unsigned DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `step` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_user` (`user_id`),
  KEY `FK_order_type` (`type_order_id`),
  KEY `FK_order_language` (`language_id`),
  KEY `FK_order_state` (`state_id`),
  CONSTRAINT `FK_order_language` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_state` FOREIGN KEY (`state_id`) REFERENCES `states_marketplace` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_type` FOREIGN KEY (`type_order_id`) REFERENCES `types_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Toda lña información correspondiente a la solicitud. El campo step funciona para ir marcando que paso de la solicitud se ha completado.';

-- Volcando datos para la tabla marketplace.orders: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.order_attach
DROP TABLE IF EXISTS `order_attach`;
CREATE TABLE IF NOT EXISTS `order_attach` (
  `order_id` bigint(20) unsigned NOT NULL,
  `attach_id` bigint(20) unsigned NOT NULL,
  KEY `FK_order_attach` (`order_id`),
  KEY `FK_attach_order` (`attach_id`),
  CONSTRAINT `FK_attach_order` FOREIGN KEY (`attach_id`) REFERENCES `attachmens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_attach` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla de archivos adjuntos a la solicitud.';

-- Volcando datos para la tabla marketplace.order_attach: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `order_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_attach` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.order_category
DROP TABLE IF EXISTS `order_category`;
CREATE TABLE IF NOT EXISTS `order_category` (
  `order_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  KEY `FK_order_category` (`category_id`),
  KEY `FK_order` (`order_id`),
  CONSTRAINT `FK_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para almacenar las distintas categorias correspondientes a una solicitud. en relación M:M';

-- Volcando datos para la tabla marketplace.order_category: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `order_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_category` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.order_country
DROP TABLE IF EXISTS `order_country`;
CREATE TABLE IF NOT EXISTS `order_country` (
  `order_id` bigint(20) unsigned NOT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  KEY `FK_order_country` (`country_id`),
  KEY `FK_order_order` (`order_id`),
  CONSTRAINT `FK_order_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para almacenar los distintos paises, correspondientes a una solicitud. en relación M:M';

-- Volcando datos para la tabla marketplace.order_country: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `order_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_country` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.proposal
DROP TABLE IF EXISTS `proposal`;
CREATE TABLE IF NOT EXISTS `proposal` (
  `id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `attach_id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) unsigned NOT NULL,
  `descripion` varchar(500) NOT NULL,
  `approved_proposal` tinyint(4) NOT NULL DEFAULT '0',
  `development_time` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `percentage` decimal(2,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `FK_proposal_order` (`order_id`),
  KEY `FK_proposal_user` (`user_id`),
  KEY `FK_proposal_attach` (`attach_id`),
  KEY `FK_proposal_state` (`state_id`),
  CONSTRAINT `FK_proposal_attach` FOREIGN KEY (`attach_id`) REFERENCES `attachmens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_proposal_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_proposal_state` FOREIGN KEY (`state_id`) REFERENCES `states_marketplace` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_proposal_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tablas para las propuesta de los proveedores hacia los clientes, el monto a cobrar al proveedor por parte de la empresa se calcula con el total y el porcentaje.';

-- Volcando datos para la tabla marketplace.proposal: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `proposal` ENABLE KEYS */;

-- Volcando estructura para procedimiento marketplace.sp_CreditsUpdate
DROP PROCEDURE IF EXISTS `sp_CreditsUpdate`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreditsUpdate`(
	IN `p_credit_type_id` INT,
	IN `p_user_id` INT,
	IN `p_amount` DECIMAL(10,2),
	IN `p_description` VARCHAR(500)




)
    COMMENT 'Actualiza los creditos del Usuario Cliente'
BEGIN
	IF p_credit_type_id = 1 THEN 
		UPDATE credits SET credits.balance = credits.balance - p_amount WHERE credits.user_id = p_user_id;
	ELSE 
		UPDATE credits SET credits.balance = credits.balance + p_amount WHERE credits.user_id = p_user_id;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para tabla marketplace.states_marketplace
DROP TABLE IF EXISTS `states_marketplace`;
CREATE TABLE IF NOT EXISTS `states_marketplace` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Estados de la solicitudes';

-- Volcando datos para la tabla marketplace.states_marketplace: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `states_marketplace` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_marketplace` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.types_order
DROP TABLE IF EXISTS `types_order`;
CREATE TABLE IF NOT EXISTS `types_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='tabla tipo de ordenes, concurso, proveedor favorito\r\n';

-- Volcando datos para la tabla marketplace.types_order: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `types_order` DISABLE KEYS */;
REPLACE INTO `types_order` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Concurso', NULL, NULL),
	(2, 'Proveedor favorito', NULL, NULL);
/*!40000 ALTER TABLE `types_order` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.types_user
DROP TABLE IF EXISTS `types_user`;
CREATE TABLE IF NOT EXISTS `types_user` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='-- client\r\n-- provider';

-- Volcando datos para la tabla marketplace.types_user: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `types_user` DISABLE KEYS */;
REPLACE INTO `types_user` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Client', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'Provider', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `types_user` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_user_id` bigint(20) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_user_type` (`type_user_id`),
  CONSTRAINT `FK_user_type` FOREIGN KEY (`type_user_id`) REFERENCES `types_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='tabla usuarios';

-- Volcando datos para la tabla marketplace.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `type_user_id`, `email`, `password`, `created_at`, `updated_at`) VALUES
	(1, 1, 'rubenrang@gmail.com', '123456', NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla marketplace.user_information
DROP TABLE IF EXISTS `user_information`;
CREATE TABLE IF NOT EXISTS `user_information` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_information` (`user_id`),
  CONSTRAINT `FK_user_information` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='tabla información especifica de cada usuario';

-- Volcando datos para la tabla marketplace.user_information: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_information` DISABLE KEYS */;
REPLACE INTO `user_information` (`id`, `user_id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Rubén rangel', '0412', 'Mérida', NULL, NULL);
/*!40000 ALTER TABLE `user_information` ENABLE KEYS */;

-- Volcando estructura para vista marketplace.viewcategories
DROP VIEW IF EXISTS `viewcategories`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `viewcategories` (
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`name` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`created_at` DATETIME NULL,
	`updated_at` DATETIME NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista marketplace.viewcategoriesformat
DROP VIEW IF EXISTS `viewcategoriesformat`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `viewcategoriesformat` (
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`format_file_id` BIGINT(20) UNSIGNED NOT NULL,
	`name` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`created_at` DATETIME NULL,
	`updated_at` DATETIME NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista marketplace.viewcountries
DROP VIEW IF EXISTS `viewcountries`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `viewcountries` (
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`name` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`update_at` DATETIME NULL,
	`created_at` DATETIME NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista marketplace.viewcredits
DROP VIEW IF EXISTS `viewcredits`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `viewcredits` (
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`user_id` BIGINT(20) UNSIGNED NOT NULL,
	`balance` DECIMAL(10,2) UNSIGNED NULL,
	`created_at` DATETIME NULL,
	`updated_at` DATETIME NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista marketplace.viewcredittypes
DROP VIEW IF EXISTS `viewcredittypes`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `viewcredittypes` (
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`name` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`created_at` DATETIME NULL,
	`update_at` DATETIME NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista marketplace.viewusers
DROP VIEW IF EXISTS `viewusers`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `viewusers` (
	`id` BIGINT(20) UNSIGNED NOT NULL,
	`type_user_id` BIGINT(20) UNSIGNED NOT NULL,
	`email` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`password` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`created_at` TIMESTAMP NULL,
	`updated_at` TIMESTAMP NULL
) ENGINE=MyISAM;

-- Volcando estructura para disparador marketplace.trigger_CreditTransactions
DROP TRIGGER IF EXISTS `trigger_CreditTransactions`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_CreditTransactions` AFTER INSERT ON `credit_transaction` FOR EACH ROW BEGIN
	CALL sp_CreditsUpdate(NEW.credit_type_id, New.user_id, NEW.amount, New.description);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para vista marketplace.viewcategories
DROP VIEW IF EXISTS `viewcategories`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `viewcategories`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewcategories` AS SELECT * FROM Categories ;

-- Volcando estructura para vista marketplace.viewcategoriesformat
DROP VIEW IF EXISTS `viewcategoriesformat`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `viewcategoriesformat`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewcategoriesformat` AS SELECT * FROM category_format ;

-- Volcando estructura para vista marketplace.viewcountries
DROP VIEW IF EXISTS `viewcountries`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `viewcountries`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewcountries` AS SELECT * from countries ;

-- Volcando estructura para vista marketplace.viewcredits
DROP VIEW IF EXISTS `viewcredits`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `viewcredits`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewcredits` AS SELECT * FROM credits ;

-- Volcando estructura para vista marketplace.viewcredittypes
DROP VIEW IF EXISTS `viewcredittypes`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `viewcredittypes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewcredittypes` AS SELECT * FROM credit_type ;

-- Volcando estructura para vista marketplace.viewusers
DROP VIEW IF EXISTS `viewusers`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `viewusers`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewusers` AS SELECT * FROM users ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
