/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.5.8-MariaDB-1:10.5.8+maria~focal : Database - toko_online
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`toko_online` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `toko_online`;

/*Table structure for table `akses` */

DROP TABLE IF EXISTS `akses`;

CREATE TABLE `akses` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `akses` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `akses` */

insert  into `akses`(`id`,`akses`) values 
(1,'admin'),
(2,'user');

/*Table structure for table `cart_item` */

DROP TABLE IF EXISTS `cart_item`;

CREATE TABLE `cart_item` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `price` int(7) DEFAULT NULL,
  `qty` int(3) DEFAULT NULL,
  `image_url` varchar(150) DEFAULT NULL,
  `user` int(3) DEFAULT NULL,
  `product` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cart_item` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`id`,`name`) values 
(1,'baju'),
(2,'celana');

/*Table structure for table `delivery_address` */

DROP TABLE IF EXISTS `delivery_address`;

CREATE TABLE `delivery_address` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `alamat` varchar(200) DEFAULT NULL,
  `propinsi` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `detail` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `delivery_address` */

insert  into `delivery_address`(`id`,`alamat`,`propinsi`,`kabupaten`,`kecamatan`,`kelurahan`,`detail`) values 
(1,'Priyan trirenggo Bantul','D.I Yogyakarta','Bantul','Bantul','Trirenggo','dekat masjid,utara Bintang cell');

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `subtotal` int(7) DEFAULT NULL,
  `delivery_fee` int(6) DEFAULT NULL,
  `delivery_address` varchar(150) DEFAULT NULL,
  `total` int(8) DEFAULT NULL,
  `payment_status` enum('waiting_payment','paid') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `invoice` */

insert  into `invoice`(`id`,`subtotal`,`delivery_fee`,`delivery_address`,`total`,`payment_status`) values 
(1,500000,14000,'Priyan trirenggo Bantul',514000,'waiting_payment');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `status` enum('waiting payment','processing','in_delivery','delivered') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order` */

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `qty` int(3) DEFAULT NULL,
  `product` varchar(150) DEFAULT NULL,
  `order` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `order_item` */

insert  into `order_item`(`id`,`name`,`price`,`qty`,`product`,`order`) values 
(1,'baju koko',500000,1,NULL,'processing');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `price` int(7) DEFAULT NULL,
  `image_url` varchar(150) DEFAULT NULL,
  `category` varchar(150) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`description`,`price`,`image_url`,`category`,`tag`) values 
(1,'baju koko dewasa','baju koko utuk orang dewasa',500000,'-','baju','koko');

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tag` */

insert  into `tag`(`id`,`name`) values 
(1,'koko'),
(2,'daster');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `hak_akses` int(2) DEFAULT 3,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`created_at`,`updated_at`,`hak_akses`) values 
(1,'ujang','-DGtfs-M2YPUhi6bbuVlN1poIwlA9Vqk','$2y$13$/Z46VzQcSvNa3I1CGS9iS.jt6gJLcELTmJC2LmbThJ90QWf4i/8qK',NULL,'uj@rsud.com',10,1528082314,1614388937,4),
(8,'admin','xWUGFVKYz-G4ZS8bIzj58wf1IQGNqZGk','$2y$13$4AauEygysGDUz8mToIeL6uMXRqkWh4HK7hL6q3SoDzxQGkeYM/5va',NULL,'test@yahoo.com',10,1592106132,1592106132,1),
(12,'coba3','EmPPjpBGbLSQFVgOBLqa4ap_5yz66pEz','$2y$13$wR2lUDwyfOM.nh0ztzDYa.m2zVneSNYzl4ExFYI7b6n1Ujzu7QtFS',NULL,'coba@ahoo.com',10,1613971920,1613971920,4),
(13,'coba-lagi','2lVZxQ67loll4fdUq60yB71IeV5nK4mE','$2y$13$UdmTi6iGqDnSOWyQ2xu9MOm98LRpLM3CAr0BIJomItDNf5hHGdgO6',NULL,'cobalagi@yahoo.com',10,1613972059,1613972249,3),
(14,'observasi','WA-O6HLv-9NCDpa_TLkTQ-i6hOs4Sy1k','$2y$13$XwbTdZENQcTbHSKvcnpPBOofVcmu/lsb.rjxjf.1ujCwGuaPsJAvq',NULL,'observasi@yahoo.com',10,1614303617,1614303648,5),
(15,'arika','kMVtSHJNldmrP6k93g1RF5PRiEeaZ6EC','$2y$13$653xypMA.4Q4nX1IilDM4.FYKRvaJVBjpJrXABSLPloXI7L7cjgDK',NULL,'arika@gmail.com',10,1614387428,1614387463,3),
(16,'hestuningwinda','mG1mAH8JoNqldBjSKtnTLp0xkiO-21Ux','$2y$13$oGZadV2ds7iv17XeH3T/4OqsStRpCoSNScg543Yr8z0qhwYbWeQK2',NULL,'hestuningwinda@gmail.com',10,1614391997,1614392026,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
