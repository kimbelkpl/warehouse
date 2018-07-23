/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.0.45-community-nt : Database - warehouse_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`warehouse_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `warehouse_db`;

/*Table structure for table `basic_unit` */

DROP TABLE IF EXISTS `basic_unit`;

CREATE TABLE `basic_unit` (
  `basic_unit_id` int(10) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`basic_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `basic_unit` */

LOCK TABLES `basic_unit` WRITE;

UNLOCK TABLES;

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `brand_id` int(10) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `brand` */

LOCK TABLES `brand` WRITE;

UNLOCK TABLES;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(10) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

LOCK TABLES `category` WRITE;

UNLOCK TABLES;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `phone_no` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

LOCK TABLES `customer` WRITE;

UNLOCK TABLES;

/*Table structure for table `damage` */

DROP TABLE IF EXISTS `damage`;

CREATE TABLE `damage` (
  `damage_id` int(10) NOT NULL auto_increment,
  `damage_date` varchar(100) default NULL,
  `merchandise_id` int(10) default NULL,
  `merchandise` varchar(50) default NULL,
  `qty` int(10) default NULL,
  `sub_unit` varchar(50) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`damage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `damage` */

LOCK TABLES `damage` WRITE;

UNLOCK TABLES;

/*Table structure for table `merchandise` */

DROP TABLE IF EXISTS `merchandise`;

CREATE TABLE `merchandise` (
  `merchandise_id` int(10) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `unit_price` double default NULL,
  `sub_category_id` int(10) default NULL,
  `sub_unit_id` int(10) default NULL,
  `brand_id` int(10) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(10) default NULL,
  `convertion_unit_id` int(10) default NULL,
  `convertion_value` int(10) default NULL,
  PRIMARY KEY  (`merchandise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `merchandise` */

LOCK TABLES `merchandise` WRITE;

UNLOCK TABLES;

/*Table structure for table `merchandise_brand` */

DROP TABLE IF EXISTS `merchandise_brand`;

CREATE TABLE `merchandise_brand` (
  `merchandise_brand_id` int(10) NOT NULL auto_increment,
  `brand_id` int(10) default NULL,
  `merchandise_id` int(10) default NULL,
  PRIMARY KEY  (`merchandise_brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `merchandise_brand` */

LOCK TABLES `merchandise_brand` WRITE;

UNLOCK TABLES;

/*Table structure for table `price_history` */

DROP TABLE IF EXISTS `price_history`;

CREATE TABLE `price_history` (
  `merchandise_id` int(10) default NULL,
  `date` date default NULL,
  `unit_price` double default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `price_history` */

LOCK TABLES `price_history` WRITE;

UNLOCK TABLES;

/*Table structure for table `stock_balance` */

DROP TABLE IF EXISTS `stock_balance`;

CREATE TABLE `stock_balance` (
  `stock_balance_id` int(10) NOT NULL auto_increment,
  `merchandise_id` int(50) default NULL,
  `warehouse_id` int(50) default NULL,
  `qty` int(11) default NULL,
  `remark` varchar(200) default NULL,
  PRIMARY KEY  (`stock_balance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `stock_balance` */

LOCK TABLES `stock_balance` WRITE;

UNLOCK TABLES;

/*Table structure for table `stock_in` */

DROP TABLE IF EXISTS `stock_in`;

CREATE TABLE `stock_in` (
  `stock_in_id` int(10) NOT NULL auto_increment,
  `container_arrival_date` varchar(50) default NULL,
  `stock_in_date` varchar(50) default NULL,
  `supplier_id` varchar(500) default NULL,
  `vr_no` varchar(20) default NULL,
  `warehouse_id` varchar(50) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`stock_in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `stock_in` */

LOCK TABLES `stock_in` WRITE;

UNLOCK TABLES;

/*Table structure for table `stock_in_detail` */

DROP TABLE IF EXISTS `stock_in_detail`;

CREATE TABLE `stock_in_detail` (
  `stock_in_detail_id` int(10) NOT NULL auto_increment,
  `merchandise_id` int(50) default NULL,
  `merchandise_name` varchar(50) default NULL,
  `qty` int(50) default NULL,
  `sub_unit_id` varchar(50) default NULL,
  `remark` varchar(200) default NULL,
  `vr_no` varchar(50) default NULL,
  `stock_in_id` int(30) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`stock_in_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `stock_in_detail` */

LOCK TABLES `stock_in_detail` WRITE;

UNLOCK TABLES;

/*Table structure for table `stock_out` */

DROP TABLE IF EXISTS `stock_out`;

CREATE TABLE `stock_out` (
  `stock_out_id` int(10) NOT NULL auto_increment,
  `stock_out_date` varchar(11) default NULL,
  `fromwarehouse_id` varchar(100) default NULL,
  `towarehouse_id` varchar(100) default NULL,
  `customer_id` varchar(100) default NULL,
  `vr_no` varchar(200) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` varchar(50) default NULL,
  `modified_date` varchar(50) default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`stock_out_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `stock_out` */

LOCK TABLES `stock_out` WRITE;

UNLOCK TABLES;

/*Table structure for table `stock_out_detail` */

DROP TABLE IF EXISTS `stock_out_detail`;

CREATE TABLE `stock_out_detail` (
  `stock_out_detail_id` int(10) NOT NULL auto_increment,
  `stock_out_id` int(10) default NULL,
  `merchandise_id` int(10) default NULL,
  `merchandise` varchar(50) default NULL,
  `qty` int(10) default NULL,
  `sub_unit` varchar(50) default NULL,
  `voucherno` varchar(50) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` varchar(50) default NULL,
  `modified_date` varchar(50) default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`stock_out_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `stock_out_detail` */

LOCK TABLES `stock_out_detail` WRITE;

UNLOCK TABLES;

/*Table structure for table `sub_category` */

DROP TABLE IF EXISTS `sub_category`;

CREATE TABLE `sub_category` (
  `sub_category_id` int(10) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `remark` varchar(200) default NULL,
  `category_id` int(10) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`sub_category_id`),
  KEY `sub_category_ibfk_1` (`category_id`),
  CONSTRAINT `sub_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sub_category` */

LOCK TABLES `sub_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `sub_category_and_brand` */

DROP TABLE IF EXISTS `sub_category_and_brand`;

CREATE TABLE `sub_category_and_brand` (
  `sub_category_and_brand_id` int(10) NOT NULL auto_increment,
  `sub_category_id` int(10) default NULL,
  `brand_id` int(10) default NULL,
  `created_date` date default NULL,
  PRIMARY KEY  (`sub_category_and_brand_id`),
  KEY `sub_category_id` (`sub_category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `sub_category_and_brand_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`sub_category_id`),
  CONSTRAINT `sub_category_and_brand_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `sub_category_and_brand` */

LOCK TABLES `sub_category_and_brand` WRITE;

UNLOCK TABLES;

/*Table structure for table `sub_unit` */

DROP TABLE IF EXISTS `sub_unit`;

CREATE TABLE `sub_unit` (
  `sub_unit_id` int(10) NOT NULL auto_increment,
  `basic_unit_id` int(10) default NULL,
  `name` varchar(200) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`sub_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `sub_unit` */

LOCK TABLES `sub_unit` WRITE;

UNLOCK TABLES;

/*Table structure for table `subunit_merchandise` */

DROP TABLE IF EXISTS `subunit_merchandise`;

CREATE TABLE `subunit_merchandise` (
  `subunit_merchandise_id` int(10) NOT NULL auto_increment,
  `sub_unit_id` int(10) default NULL,
  `merchandise_id` int(10) default NULL,
  PRIMARY KEY  (`subunit_merchandise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `subunit_merchandise` */

LOCK TABLES `subunit_merchandise` WRITE;

UNLOCK TABLES;

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `supplier_id` int(10) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `phone_no` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

LOCK TABLES `supplier` WRITE;

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL auto_increment,
  `user_level_id` int(10) default NULL,
  `name` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `user_level_id` (`user_level_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_level_id`) REFERENCES `user_level` (`user_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`user_id`,`user_level_id`,`name`,`password`,`created_user_id`,`modified_user_id`,`created_date`,`modified_date`,`flag`) values (1,1,'admin','-91d91e31f07c6ee244726ea3e4c917fbaafcd2c',1,1,'2018-07-15 10:18:02','2018-07-15 10:18:05',1);

UNLOCK TABLES;

/*Table structure for table `user_level` */

DROP TABLE IF EXISTS `user_level`;

CREATE TABLE `user_level` (
  `user_level_id` int(10) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`user_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user_level` */

LOCK TABLES `user_level` WRITE;

insert  into `user_level`(`user_level_id`,`name`,`remark`,`created_user_id`,`modified_user_id`,`created_date`,`modified_date`,`flag`) values (1,'admin','--',1,1,'2018-07-15 10:17:32','2018-07-15 10:17:37',1);

UNLOCK TABLES;

/*Table structure for table `warehouse` */

DROP TABLE IF EXISTS `warehouse`;

CREATE TABLE `warehouse` (
  `warehouse_id` int(10) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `phone_no` varchar(50) default NULL,
  `remark` varchar(200) default NULL,
  `created_user_id` int(10) default NULL,
  `modified_user_id` int(10) default NULL,
  `created_date` datetime default NULL,
  `modified_date` datetime default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `warehouse` */

LOCK TABLES `warehouse` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
