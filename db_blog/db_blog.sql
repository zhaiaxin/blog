/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17-log : Database - db_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_blog`;

/*Table structure for table `t_blog` */

DROP TABLE IF EXISTS `t_blog`;

CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` varchar(20) DEFAULT NULL COMMENT '博客名称',
  `abstracts` varchar(255) DEFAULT NULL COMMENT '博客摘要',
  `content` text COMMENT '博客内容',
  `category` varchar(10) DEFAULT NULL COMMENT '博客分类',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_blog` */

insert  into `t_blog`(`id`,`title`,`abstracts`,`content`,`category`,`created_time`,`last_modified_time`) values (1,'java从入门到升仙',NULL,'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程[1]  。\nJava具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点[2]  。Java可以编写桌面应用程序、Web应用程序、分布式系统和嵌入式系统应用程序等[3]  。','java','2017-06-19 11:02:26','2017-06-19 11:09:29'),(4,'java从入门到放弃','这个有点难哈','Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程[1]  。\nJava具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点[2]  。Java可以编写桌面应用程序、Web应用程序、分布式系统和嵌入式系统应用程序等[3]  。','java','2017-06-20 14:55:34','2017-06-20 14:55:34');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `introduction` varchar(100) DEFAULT NULL COMMENT '个人介绍',
  `photo` varchar(50) DEFAULT NULL COMMENT '头像',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`introduction`,`photo`,`created_time`,`last_modified_time`) values (1,'axin','87654321','胆大心细','axin.jpg','2017-06-18 20:19:40','2017-06-18 20:19:40');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
