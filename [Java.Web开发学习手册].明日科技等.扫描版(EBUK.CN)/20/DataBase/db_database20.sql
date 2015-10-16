-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.40-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_database23
--

CREATE DATABASE IF NOT EXISTS db_database23;
USE db_database23;

--
-- Definition of table `tb_article`
--

DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `emitTime` datetime DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `articleTypeName` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `articleTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`articleId`),
  KEY `FKD4623425BE94513D` (`articleTypeId`),
  KEY `FKD46234256FFA568F` (`userId`),
  CONSTRAINT `FKD46234256FFA568F` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`userId`),
  CONSTRAINT `FKD4623425BE94513D` FOREIGN KEY (`articleTypeId`) REFERENCES `tb_articletype` (`articleTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_article`
--

/*!40000 ALTER TABLE `tb_article` DISABLE KEYS */;
INSERT INTO `tb_article` (`articleId`,`title`,`content`,`emitTime`,`lastUpdateTime`,`articleTypeName`,`userId`,`articleTypeId`) VALUES 
 (1,'fdsfdsf','sdfdsf','2010-04-26 11:55:34','2010-04-26 11:55:34','Java',1,1),
 (2,'bvnv','vbnvbn','2010-04-26 11:55:34','2010-04-26 11:55:34','Java',1,1);
/*!40000 ALTER TABLE `tb_article` ENABLE KEYS */;


--
-- Definition of table `tb_articletype`
--

DROP TABLE IF EXISTS `tb_articletype`;
CREATE TABLE `tb_articletype` (
  `articleTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `articleTypeName` varchar(255) DEFAULT NULL,
  `articleTypeDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`articleTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_articletype`
--

/*!40000 ALTER TABLE `tb_articletype` DISABLE KEYS */;
INSERT INTO `tb_articletype` (`articleTypeId`,`articleTypeName`,`articleTypeDesc`) VALUES 
 (1,'Java','Java基础知识讨论'),
 (2,'Java Web','Java Web知识讨论'),
 (3,'C#','C#知识讨论'),
 (4,'ASP.NET','Microsoft提供的WEB应用技术，被广泛的应用于网站开发的语言'),
 (5,'ASP','ASP技术讨论'),
 (6,'Visual Basic','Visual Basic知识讨论'),
 (7,'Visual C++','Visual C++知识讨论'),
 (8,'PHP','嵌入HTML文件的一种脚本语言。它的语法大部分是从C，JAVA，PERL语言中借来');
/*!40000 ALTER TABLE `tb_articletype` ENABLE KEYS */;


--
-- Definition of table `tb_reply`
--

DROP TABLE IF EXISTS `tb_reply`;
CREATE TABLE `tb_reply` (
  `replyId` int(11) NOT NULL AUTO_INCREMENT,
  `replyTime` datetime DEFAULT NULL,
  `content` text,
  `userId` int(11) DEFAULT NULL,
  `articleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`replyId`),
  KEY `FKFABD79D9E6D6DC29` (`articleId`),
  KEY `FKFABD79D96FFA568F` (`userId`),
  CONSTRAINT `FKFABD79D96FFA568F` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`userId`),
  CONSTRAINT `FKFABD79D9E6D6DC29` FOREIGN KEY (`articleId`) REFERENCES `tb_article` (`articleId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_reply`
--

/*!40000 ALTER TABLE `tb_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_reply` ENABLE KEYS */;


--
-- Definition of table `tb_scan`
--

DROP TABLE IF EXISTS `tb_scan`;
CREATE TABLE `tb_scan` (
  `scanId` int(11) NOT NULL AUTO_INCREMENT,
  `scanTime` datetime DEFAULT NULL,
  `articleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`scanId`),
  KEY `FKA4FE45AEE6D6DC29` (`articleId`),
  CONSTRAINT `FKA4FE45AEE6D6DC29` FOREIGN KEY (`articleId`) REFERENCES `tb_article` (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_scan`
--

/*!40000 ALTER TABLE `tb_scan` DISABLE KEYS */;
INSERT INTO `tb_scan` (`scanId`,`scanTime`,`articleId`) VALUES 
 (1,'2010-04-26 11:55:40',1);
/*!40000 ALTER TABLE `tb_scan` ENABLE KEYS */;


--
-- Definition of table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `isAdmin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_user`
--

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`userId`,`userName`,`password`,`sex`,`registerTime`,`birthday`,`email`,`tel`,`isAdmin`) VALUES 
 (1,'admin','111','男','2010-04-26 11:51:55','','','','0');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
