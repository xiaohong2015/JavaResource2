-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.39-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_database11
--

CREATE DATABASE IF NOT EXISTS db_database11;
USE db_database11;

--
-- Definition of table `tb_book`
--

DROP TABLE IF EXISTS `tb_book`;
CREATE TABLE `tb_book` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT 'ID编号',
  `name` varchar(45) NOT NULL COMMENT '图书名称',
  `price` double NOT NULL COMMENT '价格',
  `bookCount` int(10) unsigned NOT NULL COMMENT '数量',
  `author` varchar(45) NOT NULL COMMENT '作者',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_book`
--

/*!40000 ALTER TABLE `tb_book` DISABLE KEYS */;
INSERT INTO `tb_book` (`id`,`name`,`price`,`bookCount`,`author`) VALUES 
 (1,'Java开发典型模块大全',79,50,'明日科技'),
 (2,'Java程序设计自学手册',49,50,'明日科技'),
 (3,'JSP开发技术大全',49,50,'明日科技');
/*!40000 ALTER TABLE `tb_book` ENABLE KEYS */;


--
-- Definition of table `tb_book_find`
--

DROP TABLE IF EXISTS `tb_book_find`;
CREATE TABLE `tb_book_find` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `pcount` int(10) unsigned NOT NULL,
  `author` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_book_find`
--

/*!40000 ALTER TABLE `tb_book_find` DISABLE KEYS */;
INSERT INTO `tb_book_find` (`id`,`name`,`price`,`pcount`,`author`) VALUES 
 (1,'Java开发典型模块大全',79,50,'明日科技'),
 (2,'Java程序设计自学手册',49,50,'明日科技'),
 (3,'JSP开发技术大全',49,50,'明日科技'),
 (4,'Java项目开发实例自学手册',45,52,'明日科技'),
 (5,'JAVA程序设计标准教程',49,50,'明日科技');
/*!40000 ALTER TABLE `tb_book_find` ENABLE KEYS */;


--
-- Definition of table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '编号',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `unit` varchar(10) NOT NULL COMMENT '单位',
  `num` int(10) unsigned NOT NULL COMMENT '数量',
  `price` double NOT NULL COMMENT '价格',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_product`
--

/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` (`id`,`name`,`unit`,`num`,`price`) VALUES 
 (1,'苹果','箱',50,30.5),
 (2,'桔子','箱',80,40.5),
 (3,'梨','箱',55,15.8),
 (4,'柚子','箱',100,55.5),
 (5,'西红柿','箱',30,22.8);
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;


--
-- Definition of table `tb_student_add`
--

DROP TABLE IF EXISTS `tb_student_add`;
CREATE TABLE `tb_student_add` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `age` int(10) unsigned default NULL,
  `sex` varchar(45) default NULL,
  `classes` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_student_add`
--

/*!40000 ALTER TABLE `tb_student_add` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_student_add` ENABLE KEYS */;


--
-- Definition of table `tb_student_batch`
--

DROP TABLE IF EXISTS `tb_student_batch`;
CREATE TABLE `tb_student_batch` (
  `id` int(11) NOT NULL COMMENT '学号',
  `name` varchar(45) NOT NULL COMMENT '姓名',
  `sex` tinyint(1) NOT NULL COMMENT '性别',
  `age` varchar(45) NOT NULL COMMENT '年龄',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_student_batch`
--

/*!40000 ALTER TABLE `tb_student_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_student_batch` ENABLE KEYS */;


--
-- Definition of table `tb_student_del`
--

DROP TABLE IF EXISTS `tb_student_del`;
CREATE TABLE `tb_student_del` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `age` int(10) unsigned default NULL,
  `sex` varchar(45) default NULL,
  `classes` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_student_del`
--

/*!40000 ALTER TABLE `tb_student_del` DISABLE KEYS */;
INSERT INTO `tb_student_del` (`id`,`name`,`age`,`sex`,`classes`) VALUES 
 (1,'刘*明',12,'男','一年一班'),
 (2,'李*明',11,'女','一年一班'),
 (3,'赵*明',10,'女','一年一班'),
 (4,'孙*明',9,'女','一年一班'),
 (5,'陈*明',8,'女','一年一班');
/*!40000 ALTER TABLE `tb_student_del` ENABLE KEYS */;


--
-- Definition of table `tb_student_find`
--

DROP TABLE IF EXISTS `tb_student_find`;
CREATE TABLE `tb_student_find` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `age` int(10) unsigned default NULL,
  `sex` varchar(45) default NULL,
  `classes` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_student_find`
--

/*!40000 ALTER TABLE `tb_student_find` DISABLE KEYS */;
INSERT INTO `tb_student_find` (`id`,`name`,`age`,`sex`,`classes`) VALUES 
 (1,'刘*明',12,'男','一年一班'),
 (2,'李*明',11,'女','一年一班'),
 (3,'赵*明',10,'女','一年一班'),
 (4,'孙*明',9,'女','一年一班'),
 (5,'陈*明',8,'女','一年一班');
/*!40000 ALTER TABLE `tb_student_find` ENABLE KEYS */;


--
-- Definition of procedure `findAllBook`
--

DROP PROCEDURE IF EXISTS `findAllBook`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `findAllBook`()
BEGIN
  SELECT * FROM tb_book order by id desc;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
