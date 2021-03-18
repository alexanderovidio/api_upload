/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.3.15-MariaDB : Database - reuniones
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`reuniones` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `reuniones`;

/*Table structure for table `calendario` */

DROP TABLE IF EXISTS `calendario`;

CREATE TABLE `calendario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_persona` int(10) unsigned DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `calendario` */

insert  into `calendario`(`id`,`fecha`,`id_persona`,`color`,`created_at`,`updated_at`,`deleted_at`) values 
(26,'2021-02-22',58,'orange','2021-02-19 14:54:26','2021-02-19 14:54:26',NULL),
(27,'2021-03-01',61,'cyan','2021-02-19 14:54:54','2021-02-19 14:54:54',NULL),
(28,'2021-02-19',59,'grey darken-1','2021-02-19 15:46:09','2021-02-19 15:46:09',NULL);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`id`,`nombre`,`icon`,`url`) values 
(1,'Reuniones','mdi-account-group','reuniones'),
(2,'Calendario','mdi-calendar','calendario'),
(3,'Participantes','mdi-account-multiple-plus','participantes');

/*Table structure for table `menu_rol` */

DROP TABLE IF EXISTS `menu_rol`;

CREATE TABLE `menu_rol` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_menu` int(10) unsigned DEFAULT NULL,
  `id_rol` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_menu` (`id_menu`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `menu_rol_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`),
  CONSTRAINT `menu_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `menu_rol` */

insert  into `menu_rol`(`id`,`id_menu`,`id_rol`) values 
(1,1,1),
(2,2,1),
(3,3,1),
(4,1,2);

/*Table structure for table `persona` */

DROP TABLE IF EXISTS `persona`;

CREATE TABLE `persona` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

/*Data for the table `persona` */

insert  into `persona`(`id`,`nombres`,`apellidos`,`telefono`,`cargo`,`email`,`avatar`,`created_at`,`updated_at`,`deleted_at`) values 
(12,'Herson','Chur','44522476','Senior Developer','gerson.roely@gmail.com','avatar/6033c03d1da61.png','2021-02-04 18:35:03','2021-02-22 14:31:25',NULL),
(23,'Juan','Gomez','44522477','Coordinador de Informática','juan.gomez@gmail.com',NULL,'2021-02-04 20:20:44','2021-02-18 19:55:01','2021-02-18 19:55:01'),
(47,'Miguel','Gonzales','44522475','Encargado de Compras','miguel.gonzales@gmail.com',NULL,'2021-02-10 16:59:23','2021-02-18 19:55:03','2021-02-18 19:55:03'),
(48,'Oscar','Perez','44522474','Encargado de Ventas','oscar.perez@gmail.com',NULL,'2021-02-10 17:01:37','2021-02-18 19:55:05','2021-02-18 19:55:05'),
(49,'Ana','Torres','44522478','Supervisora','ana.torres@gmail.com',NULL,'2021-02-10 17:05:18','2021-02-18 19:55:07','2021-02-18 19:55:07'),
(50,'Otto','Hernandez','44778899','Supervisor','otto.he@gmail.com',NULL,'2021-02-10 18:40:17','2021-02-18 19:55:09','2021-02-18 19:55:09'),
(51,'Jorge','Gutierrez','44522412','IT',NULL,NULL,'2021-02-11 18:22:59','2021-02-11 18:54:31','2021-02-11 18:54:31'),
(52,'Jorge','Gu',NULL,NULL,NULL,NULL,'2021-02-11 18:24:48','2021-02-11 18:54:23','2021-02-11 18:54:23'),
(53,'Jorge','Gutierrez','22334455','IT','hchur@muniguate.com','avatar/602c3b2504450.png','2021-02-11 18:29:12','2021-02-18 19:55:14','2021-02-18 19:55:14'),
(54,'Juan','Gonzales','45678912','',NULL,NULL,'2021-02-11 18:44:38','2021-02-11 18:54:19','2021-02-11 18:54:19'),
(57,'Mynor','Gonzales','78789898','Director','mynor@gmail.com','avatar/602c3b0e2d04f.png','2021-02-16 21:28:24','2021-02-18 19:55:16','2021-02-18 19:55:16'),
(58,'Patricia','Sazo','59388799','Asistente','psazo@muniguate.com',NULL,'2021-02-18 20:05:24','2021-02-18 20:05:24',NULL),
(59,'Alexandra','Abac','59324853','Sección de Gestión de Servicios',' labac@muniguate.com',NULL,'2021-02-19 13:25:08','2021-02-19 13:25:08',NULL),
(60,'Dora ','Alejandro','54346410','Atención al Vecino','digarcia@muniguate.com',NULL,'2021-02-19 13:33:48','2021-02-19 13:38:13',NULL),
(61,'Guisela','Chajchalac','55432156','Cuenta Corriente','gchajchalac@muniguate.com',NULL,'2021-02-19 13:40:06','2021-02-19 13:40:06',NULL),
(62,'Maura','Chitay','59599036','Modelos de Gestión','mlchitay@muniguate.com',NULL,'2021-02-19 13:44:45','2021-02-19 13:44:45',NULL),
(63,'Jorge','Gutierrez','59464715','Informática','jgutierrez@muniguate.com',NULL,'2021-02-19 13:46:34','2021-02-19 13:46:34',NULL),
(64,'Angel','Higueros','41549303','Coordinador Catastral','ahigueros@muniguate.com',NULL,'2021-02-19 13:48:07','2021-02-19 13:48:07',NULL),
(65,'Walter','Reyes','42166391','Coordinación Jurídica','wareyes@muniguate.com',NULL,'2021-02-19 13:51:10','2021-02-19 13:51:10',NULL),
(66,'Francisco ','Sisimit','59236622','Sección Técnico Catastral','fsisimit@gmail.com',NULL,'2021-02-19 13:54:35','2021-02-19 13:54:35',NULL),
(67,'Luigi','Toledo ','50182102','Coordinación Técnica','ltoledo@muniguate.com',NULL,'2021-02-19 13:57:17','2021-02-19 13:57:17',NULL),
(68,'Fernando','Bran','55461408','Sección de Gestión de Cartera del IUSI ','jbran@muniguate.com',NULL,'2021-02-19 14:40:48','2021-02-19 14:40:48',NULL),
(69,'Cesar','Herrera','41497725','SIMA','caherrera@muniguate.com',NULL,'2021-02-19 14:42:12','2021-02-19 14:42:12',NULL),
(70,'Violeta','Linares','30221786','Adquisiciones','slinares@muniguate.com',NULL,'2021-02-19 14:43:53','2021-02-19 14:43:53',NULL),
(71,'Oscar','Sánchez','54364331','Coordinación del IUSI','osanchez@muniguate.com',NULL,'2021-02-19 14:50:58','2021-02-19 14:50:58',NULL),
(72,'Bryan','Barillas','41432746','Asistente','bbarillas@muniguate.com',NULL,'2021-02-19 15:29:10','2021-02-19 15:29:10',NULL);

/*Table structure for table `reunion` */

DROP TABLE IF EXISTS `reunion`;

CREATE TABLE `reunion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contenido` longtext DEFAULT NULL,
  `observaciones` mediumtext DEFAULT NULL,
  `registrado_por` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `reunion` */

/*Table structure for table `reunion_compartir` */

DROP TABLE IF EXISTS `reunion_compartir`;

CREATE TABLE `reunion_compartir` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_reunion` int(11) unsigned DEFAULT NULL,
  `id_persona` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

/*Data for the table `reunion_compartir` */

insert  into `reunion_compartir`(`id`,`id_reunion`,`id_persona`) values 
(6,3,49),
(7,3,48),
(8,3,47),
(9,3,23),
(10,3,12),
(11,5,12),
(13,7,49),
(18,6,12),
(19,6,23),
(20,6,47),
(21,2,12),
(22,2,47),
(23,2,23),
(24,2,48),
(25,2,49),
(26,8,12),
(27,9,12),
(33,10,12),
(44,12,12),
(45,12,53),
(46,11,23),
(47,11,48),
(48,11,49),
(49,11,12),
(50,13,53),
(51,16,58);

/*Table structure for table `reunion_envio` */

DROP TABLE IF EXISTS `reunion_envio`;

CREATE TABLE `reunion_envio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_reunion` int(11) unsigned DEFAULT NULL,
  `documento` varchar(1000) DEFAULT NULL,
  `enviado_por` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

/*Data for the table `reunion_envio` */

insert  into `reunion_envio`(`id`,`id_reunion`,`documento`,`enviado_por`,`created_at`,`updated_at`) values 
(13,12,'602e85a8e62a8.pdf',12,'2021-02-18 15:20:09','2021-02-18 15:20:09'),
(14,12,'602e863591c73.pdf',12,'2021-02-18 15:22:29','2021-02-18 15:22:29'),
(15,12,'602e86e340b69.pdf',12,'2021-02-18 15:25:23','2021-02-18 15:25:23'),
(16,12,'602e87225dee9.pdf',12,'2021-02-18 15:26:27','2021-02-18 15:26:27'),
(17,12,'602e9cb58d7a9.pdf',12,'2021-02-18 16:58:30','2021-02-18 16:58:30'),
(18,13,'602ea1abe899d.pdf',12,'2021-02-18 17:19:40','2021-02-18 17:19:40'),
(19,13,'602ea977224b7.pdf',12,'2021-02-18 17:52:55','2021-02-18 17:52:55'),
(20,15,'602ead92ed095.pdf',12,'2021-02-18 18:10:29','2021-02-18 18:10:29'),
(21,16,'602eca36a5689.pdf',58,'2021-02-18 20:12:48','2021-02-18 20:12:48');

/*Table structure for table `reunion_envio_detalle` */

DROP TABLE IF EXISTS `reunion_envio_detalle`;

CREATE TABLE `reunion_envio_detalle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_envio` int(10) unsigned DEFAULT NULL,
  `id_persona` int(10) unsigned DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

/*Data for the table `reunion_envio_detalle` */

insert  into `reunion_envio_detalle`(`id`,`id_envio`,`id_persona`,`email`,`created_at`,`updated_at`) values 
(20,13,53,'hchur@muniguate.com','2021-02-18 15:20:09','2021-02-18 15:20:09'),
(21,14,53,'hchur@muniguate.com','2021-02-18 15:22:30','2021-02-18 15:22:30'),
(22,15,53,'hchur@muniguate.com','2021-02-18 15:25:23','2021-02-18 15:25:23'),
(23,16,53,'hchur@muniguate.com','2021-02-18 15:26:27','2021-02-18 15:26:27'),
(24,17,53,'hchur@muniguate.com','2021-02-18 16:58:30','2021-02-18 16:58:30'),
(25,18,53,'hchur@muniguate.com','2021-02-18 17:19:40','2021-02-18 17:19:40'),
(26,19,53,'hchur@muniguate.com','2021-02-18 17:52:55','2021-02-18 17:52:55'),
(27,20,53,'hchur@muniguate.com','2021-02-18 18:10:29','2021-02-18 18:10:29'),
(28,21,58,'psazo@muniguate.com','2021-02-18 20:12:49','2021-02-18 20:12:49');

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `rol` */

insert  into `rol`(`id`,`nombre`) values 
(1,'Administrador'),
(2,'Redacción');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `id_persona` int(10) unsigned DEFAULT NULL,
  `id_rol` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_persona` (`id_persona`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`id`,`usuario`,`password`,`id_persona`,`id_rol`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'44522476','eyJpdiI6InQraVd3NGZHb09oTWl5VzlVZWl2Unc9PSIsInZhbHVlIjoibkQxN2ZiMktQaGdXQnlxWDRPOWVuZz09IiwibWFjIjoiYzdiYzhlNzg0ODgzZmU1ZWJhOTgzMzJhZGJjMzJiNjk0ZTU3MzNhYTI4MDEyMjUwYmRjNTZhMmIzOTM5YTZjZCJ9',12,1,'2021-02-04 18:35:03','2021-02-11 18:32:28',NULL),
(12,'44522477','eyJpdiI6IlFERmVSUE04NDV5aE45S1IyRWxwQlE9PSIsInZhbHVlIjoieThZVTFnV2ZOMllMSU9DR3FGNUVjQT09IiwibWFjIjoiODJjYTg5NWJiYmQ5MzkwYzhmMWQ5OTM3ZGRiMGE5ZmY5ZjRhMmE5NjMxM2EzMjk3M2E4NjRjYTUzNDgwNmJmOCJ9',23,2,'2021-02-04 20:20:44','2021-02-11 18:32:42',NULL),
(35,'44522475','eyJpdiI6InBMUHMrRXhkZ3hDNDJYY1k0NU02UHc9PSIsInZhbHVlIjoieWVSbEdkNDlGSEdtRDRLK1hGVDlSUT09IiwibWFjIjoiZTJlZmNmY2U5YTA5Yjg4OTgzYjgxNWY5MzQxNzk2Y2U0MzI5MjE4OTg4ZWU1Mzk4M2QzMzNmYzBiZjIxN2JkZiJ9',47,2,'2021-02-10 16:59:24','2021-02-11 18:32:46',NULL),
(37,'22334455','eyJpdiI6IjFLekFsWjRLclp1cStjVVhyMTNSUnc9PSIsInZhbHVlIjoiRlMwMTEyUmc3NU9BbTk3dFN2ZW93UT09IiwibWFjIjoiODk0ZWIyMGE2NThlMzIzNDg3ZjdlY2FkYzE5ZmE3Mjg5MjkwNTljZGQ2OGFkYmVkMzBlM2UwNjZjOGM1YzY3MSJ9',53,2,'2021-02-11 18:29:12','2021-02-16 17:39:59',NULL),
(39,'45678912','eyJpdiI6ImdzUkhmNWorTmdjeXRLWTNndk5qVHc9PSIsInZhbHVlIjoiVkd0cVVOTkx2VEZRSmRuV1VRanBodz09IiwibWFjIjoiMDA4NjEwOTFkY2Q3NGIxM2RlOTc5N2U5YmUwZGVkZjE0NTVlYjVmOWFlYjhjNzRkMmM3N2M5ODBhZWJkOTkwMyJ9',54,1,'2021-02-11 18:46:48','2021-02-11 18:47:11',NULL),
(40,'59388799','eyJpdiI6Im81RlBueXFVZ2UrYU8wd3VCYkt6SUE9PSIsInZhbHVlIjoiSjQ0blJpdmkxSDA4OGxURU4rNlNFdz09IiwibWFjIjoiOWZmOGRmYTZhYjYyMmY0NGQ2MDNlNWFmMDk0NmY3NzhhNjYzYTk5MGY5NTJkZGY0ODE1OGRiZTNjNmZiZjRlNSJ9',58,1,'2021-02-18 20:05:24','2021-02-18 20:05:24',NULL),
(41,'59324853','eyJpdiI6IlUyY21IeXM2ZXVBSlNTa3ViTEtaQ2c9PSIsInZhbHVlIjoiWVk0Y1dpTVBVSE1uMEtEZk15bit6dz09IiwibWFjIjoiOWFmYjhiZDRlYjAxNzZiNGFjMDg1ZDUxZGUyYWI0NjE4YjhjZjY1ODBiNjk3YjE1MTcxZjZmZjJkMzE1MWM5NyJ9',59,2,'2021-02-19 13:25:08','2021-02-19 13:25:08',NULL),
(42,'54346410','eyJpdiI6Ik44WHJTT3JMWG12eEpVclZuRkpvQmc9PSIsInZhbHVlIjoidHI2TXVpNlBsRHpQOWpyMTMrZWNOQT09IiwibWFjIjoiZTkxZjMzM2YyNjVmZjczNThlMzYyYzFkNzNlMzIzZTZlZmRkZmExMmY3NjkzMTljZWQzYWFhNjg3MGNjN2U1NyJ9',60,2,'2021-02-19 13:33:48','2021-02-19 13:33:48',NULL),
(43,'55432156','eyJpdiI6IlE0eXdlejhBQ3JlNjVOV0VzMjBSNWc9PSIsInZhbHVlIjoibWV3WlZCT2tmdDlrNUppWllNWEt3QT09IiwibWFjIjoiYjFjNmFkMzAxNmUzNTNkZDBiZmZmZTk1ZmVkZDI2MDEwMjdhMDc5YTdlYjNjMThlY2E4M2E4ZmQ4ZjYwZTM2OCJ9',61,2,'2021-02-19 13:40:06','2021-02-19 13:40:06',NULL),
(44,'59599036','eyJpdiI6IjBqb0hqK25TQ3ZMK2ZyVE0rWU5RTmc9PSIsInZhbHVlIjoiaTd0OXV0QVV3Q1hUeEdncTZOYk4zUT09IiwibWFjIjoiNDM0NjYzM2ZiZDlkNWMwMjhmNmNjMjczZGFmZDkzZGNhOGUzN2JkOWM0YjMxNzgwZTU1ZjkwNjA3NTIxMmY0NiJ9',62,2,'2021-02-19 13:44:45','2021-02-19 13:44:45',NULL),
(45,'59464715','eyJpdiI6IjdzUm5oay9PZ0VGMGE3azJmWGRqVnc9PSIsInZhbHVlIjoiUjdNNFJER1M0cEdHUTB3Y3NKbnkrZz09IiwibWFjIjoiODRkZGFkYTZjZjAyYWYxMjQwNDYyMWE4NGEwOTQ0N2IyM2I0ZmNjZDc3YWY2MTRkN2MxYmFkOGJlZjcxOTIzMyJ9',63,2,'2021-02-19 13:46:34','2021-02-19 13:46:34',NULL),
(46,'41549303','eyJpdiI6Ilc1RjI5TEpBYkxTZUdJRkkxbUV2RXc9PSIsInZhbHVlIjoiaTQ0TlF0TFlVK3dpZ09uLzZpT0VUUT09IiwibWFjIjoiNDIxZGI5MjQ3MWIxY2FhN2JkYTRjNzVmNWZkYWE3N2M2ODI2MzhmYzAyNThiMTY1MGE1ZTU3ODUxYmE5MGE1NSJ9',64,2,'2021-02-19 13:48:07','2021-02-19 13:48:07',NULL),
(47,'42166391','eyJpdiI6Ii9xaVhxek9VVVpJZGhFRGZhaWs4Nnc9PSIsInZhbHVlIjoidnVITE45aEFGSDE2bkF0ZzRPOXNLZz09IiwibWFjIjoiYjlhNGE2ZmIzNGQ0ZTRkZDZhZDhjN2I2NzU1NDE5MzYyMTM0NzBkNjg2ZTNkOGUzZWIzODdjYzI2YzIwYjU4YyJ9',65,2,'2021-02-19 13:51:10','2021-02-19 13:51:10',NULL),
(48,'59236622','eyJpdiI6IlZTWGVKRlZDMk9jbkFYajV2RW5oV3c9PSIsInZhbHVlIjoiVEZTTmYzSmpnREdRbmFpR2krbUdmQT09IiwibWFjIjoiMmQxNWJlMTlmMGFhMjEyM2Q0MTE5YWI4MDVjOGVlZGE4MWFlZmYwYTFhNzU3NTY4OWZkZTg5NTljNmNmNDVkZSJ9',66,2,'2021-02-19 13:54:35','2021-02-19 13:54:35',NULL),
(49,'50182102','eyJpdiI6IjlialY2MHZveCtRNTJJZksxa2FleUE9PSIsInZhbHVlIjoiZFBlbmt2TDBsZkdJRmhvM2owbnNWdz09IiwibWFjIjoiZjViM2I2Yzk5ZjkyNjI0Nzk0YTAwMjQ1NDdkNzY0ZjlmOTA1ZDllZGZlMzZkMmViZjllNDY3MDNlYWQzM2M5YiJ9',67,2,'2021-02-19 13:57:17','2021-02-19 13:57:17',NULL),
(50,'55461408','eyJpdiI6IjZPMGp4YktxemRxUHBRajNXRDNsbHc9PSIsInZhbHVlIjoiU3J5a3FWNEpLdGhzT1lRVWllT0g2UT09IiwibWFjIjoiMDc2Y2RiMWVhODQxYzdhNjVkZGY0YjMzMDg2M2Y4NzA2MWE4NTE2YWFhYmNhNDM3MmE3YzRlMTdmZDBmZjM3MCJ9',68,2,'2021-02-19 14:40:48','2021-02-19 14:40:48',NULL),
(51,'41497725','eyJpdiI6IjFxdFp5Wk1KcjVGdEdvNnZFT0N1UHc9PSIsInZhbHVlIjoiODhzaHAxZWJuRUdnU0J2RDNXZ2RhUT09IiwibWFjIjoiMTU0NWQ0MWFjNjg0ODg4OTVmMjRiMjM0YzdkZTdkMTM5ZWYzZmRmYjhlNjZiYzRlOWJhNWY4YzlmMDZiOWYxNyJ9',69,2,'2021-02-19 14:42:12','2021-02-19 14:42:12',NULL),
(52,'30221786','eyJpdiI6IkticUZ2YWlpa3RtWitWcVErTU1wQXc9PSIsInZhbHVlIjoiRzh0amJLY1UxVDFHamFFT3hRaVE1QT09IiwibWFjIjoiZjNjMGUzNDBkZGM0OWNkOWY3NDcxZTg1Nzk1NDY5YjlhYzdjOTZkYWRmOTA2ZjhlNDcwOWFlMjNiNTkzM2IxMSJ9',70,2,'2021-02-19 14:43:53','2021-02-19 14:43:53',NULL),
(53,'54364331','eyJpdiI6IkZ5M3hBM1ZTaDIxWkZKK2s0UUw4bVE9PSIsInZhbHVlIjoicDBKVlQrOHE3dk43dlZwbEFaNUV4QT09IiwibWFjIjoiM2Y1YWE1YzcwZjVkNDI2NTZhM2MxY2E2YTUzMzgxYWQyYzg2YTRjYjhlZmUyY2Y2M2Q5YzllNTkzZWVjZmE1NSJ9',71,2,'2021-02-19 14:50:58','2021-02-19 14:50:58',NULL),
(54,'41432746','eyJpdiI6Ikc1L2Z2aE0wSDY3WG1NZUxSRUY1RFE9PSIsInZhbHVlIjoiVGpZTTZLNHZNT1J2SWJ3T1lJdTV1dz09IiwibWFjIjoiZGRkNWQyNTMyYmVhYWIwNzQ0YjliZWU4ZWE5MzM1MGJlOGNkZmY4OTA3MzE5NjU3YmE4ZGVmNjFjNWM2OWVkMSJ9',72,2,'2021-02-19 15:29:10','2021-02-19 15:29:10',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
