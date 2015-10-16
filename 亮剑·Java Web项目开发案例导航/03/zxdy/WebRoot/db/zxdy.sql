-- MySQL dump 10.11
--
-- Host: localhost    Database: zxdy
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dy_apply`
--

DROP TABLE IF EXISTS `dy_apply`;
CREATE TABLE `dy_apply` (
  `AID` int(11) NOT NULL auto_increment,
  `UID` int(11) default NULL,
  `TGID` int(11) default NULL,
  `AReason` varchar(200) NOT NULL,
  `AFlag` int(11) default '0',
  `AStatus` char(10) default '������',
  PRIMARY KEY  (`AID`),
  KEY `UID` (`UID`),
  KEY `TGID` (`TGID`),
  CONSTRAINT `dy_apply_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `dy_user` (`UID`) ON DELETE CASCADE,
  CONSTRAINT `dy_apply_ibfk_2` FOREIGN KEY (`TGID`) REFERENCES `dy_topic_group` (`TGID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dy_apply`
--

LOCK TABLES `dy_apply` WRITE;
/*!40000 ALTER TABLE `dy_apply` DISABLE KEYS */;
INSERT INTO `dy_apply` VALUES (2,1,10002,'��������������',1,'�ܾ�����'),(3,1,10004,'����������',0,'������'),(4,1,10000,'fsfaf',1,'�ܾ�����'),(5,1,10002,'dsf',1,'�ܾ�����'),(7,3,10002,'������������',1,'ͬ������'),(8,1,10002,'feafdsafdsafdas',1,'ͬ������'),(9,1,10000,'fefewfewa',1,'ͬ������'),(10,1,10003,'21',0,'������'),(11,1,10008,'fdsa',0,'������'),(12,1,10006,'��ѧϰ',0,'������');
/*!40000 ALTER TABLE `dy_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_revert`
--

DROP TABLE IF EXISTS `dy_revert`;
CREATE TABLE `dy_revert` (
  `RID` int(11) NOT NULL auto_increment,
  `TID` int(11) default NULL,
  `UID` int(11) default NULL,
  `RTitle` varchar(200) default NULL,
  `RContent` text NOT NULL,
  `RDate` datetime NOT NULL,
  PRIMARY KEY  (`RID`),
  KEY `TID` (`TID`),
  KEY `UID` (`UID`),
  CONSTRAINT `dy_revert_ibfk_1` FOREIGN KEY (`TID`) REFERENCES `dy_topic` (`TID`) ON DELETE CASCADE,
  CONSTRAINT `dy_revert_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `dy_user` (`UID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dy_revert`
--

LOCK TABLES `dy_revert` WRITE;
/*!40000 ALTER TABLE `dy_revert` DISABLE KEYS */;
INSERT INTO `dy_revert` VALUES (1,2,3,'','���飬����������','2008-12-08 11:08:31'),(2,1,3,'','��˵�°汾��JAVA ���Զ�����BYTE��Χ�ڵ�ֵ.','2008-12-08 11:08:31'),(3,1,3,'','¥�������𣿿��Բο�Java���Դ����','2008-12-08 11:08:31'),(4,1,3,'','лл���ָ��','2008-12-08 11:08:31'),(5,3,3,'','����ѧϰ��ר���о��Ļ��ͺ�ѧ','2008-12-08 11:08:31'),(6,10,1,'','\r\n���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10\r\n���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10\r\n���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10','2008-12-08 20:13:07'),(7,10,1,'�ش� xyz ������','\r\n���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10\r\n���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10\r\n���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10','2008-12-08 20:13:15'),(8,1,2,'','����һ����????','2008-12-10 23:01:33'),(9,6,2,'','�°汾�Ỻ��� �Ǻ�','2008-12-11 23:24:32'),(10,8,1,'','�ٴβ��԰����� ��','2008-12-12 01:16:36'),(11,10,1,'','ѧ��\r\n\r\nע��ʱ�� 2008-12-08\r\n\r\n����½ 2008-12-12\r\n 2¥  ������ 2008-12-08 20:13:15 �ش� xyz ������\r\n���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10 ���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10 ���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10 ','2008-12-12 01:16:56'),(12,4,2,'','�ش�����������㷨','2008-12-12 10:58:57'),(13,10,2,'','�ش���ˣ��ǲ���û����ô','2008-12-12 13:08:35'),(14,3,2,'','�ش��� лл �Ǻǡ�����','2008-12-12 13:27:24'),(15,15,1,'','bbbbbbbbbbbbbbbbb','2009-03-16 20:45:19'),(16,15,1,'','ccccccccccccccc','2009-03-16 20:59:07'),(17,17,1,'','ssssssssssssssssss','2009-03-16 21:00:10');
/*!40000 ALTER TABLE `dy_revert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_topic`
--

DROP TABLE IF EXISTS `dy_topic`;
CREATE TABLE `dy_topic` (
  `TID` int(11) NOT NULL auto_increment,
  `UID` int(11) default NULL,
  `TGID` int(11) default NULL,
  `TTitle` varchar(200) NOT NULL,
  `TContent` text NOT NULL,
  `TDate` datetime NOT NULL,
  `TReadCount` int(11) default '0',
  PRIMARY KEY  (`TID`),
  KEY `UID` (`UID`),
  KEY `TGID` (`TGID`),
  CONSTRAINT `dy_topic_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `dy_user` (`UID`) ON DELETE CASCADE,
  CONSTRAINT `dy_topic_ibfk_2` FOREIGN KEY (`TGID`) REFERENCES `dy_topic_group` (`TGID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dy_topic`
--

LOCK TABLES `dy_topic` WRITE;
/*!40000 ALTER TABLE `dy_topic` DISABLE KEYS */;
INSERT INTO `dy_topic` VALUES (1,1,10001,'����ѧϰ���ssh','ѧϰstruts spring hibernate ��˳����ssh��  ˳������ҵ�����Ƽ�������','2008-12-08 11:07:16',31),(2,2,10003,'C++������Ӧ����ô��ѧϰ��','������Ƽ�����C++���飬���ҽ�Щѧϰ����лл','2008-12-08 11:07:16',19),(3,2,10001,'����','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���','2008-12-08 11:07:16',19),(4,1,10001,'JAVA������Ӧ����ô��ѧϰ��','������Ƽ�����JAVA���飬���ҽ�Щѧϰ����лл','2008-12-08 11:07:16',14),(5,1,10002,'���һ��SQL��ôд����','���SQL���Ѱ���Ӧ����ôѧ��','2008-12-08 11:07:16',12),(6,1,10001,'Integer���һ��С���� ==�Ƚ�','Integer�ڵ�ֵ�Ĵ�С��Byte��Χ��ʱ��==�ȽϷ���true ���Ƿ�Χ֮�ⷵ��false \n����Ϊʲô�أ�Ϊʲô���������� ','2008-12-08 11:07:34',32),(7,1,10002,'����71','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���7','2008-12-08 11:08:09',13),(8,1,10001,'����81','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���8','2008-12-08 11:08:09',21),(9,1,10002,'����91','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���9','2008-12-08 11:08:09',16),(10,1,10001,'����101','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10','2008-12-08 11:08:09',29),(11,1,10002,'����111','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���11','2008-12-08 11:08:09',12),(12,1,10001,'����121','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���12','2008-12-08 11:08:09',13),(13,1,10005,'�Զ����ƵĿα����ĸ���','�Զ����ƵĿα����ĸ����Զ����ƵĿα����ĸ����Զ����ƵĿα����ĸ���','2008-12-12 01:18:07',2),(14,1,10000,'���ǵ�һ�����������','��һ�����ʵ�Ŷ �Ǻ�','2008-12-12 14:01:29',1),(15,1,10000,'aaaaaaaaaa','aabbbbbbbbbbbbbbbbbbbb','2009-03-16 20:44:05',6),(16,1,10000,'bbccccccccccccc','aaaaaaaaaaaaaa','2009-03-16 20:58:57',0),(17,1,10000,'11111111111111111','22222222222222222222','2009-03-16 21:00:00',2);
/*!40000 ALTER TABLE `dy_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_topic_group`
--

DROP TABLE IF EXISTS `dy_topic_group`;
CREATE TABLE `dy_topic_group` (
  `TGID` int(11) NOT NULL auto_increment,
  `TGName` varchar(50) NOT NULL,
  `TDetail` varchar(200) NOT NULL,
  PRIMARY KEY  (`TGID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dy_topic_group`
--

LOCK TABLES `dy_topic_group` WRITE;
/*!40000 ALTER TABLE `dy_topic_group` DISABLE KEYS */;
INSERT INTO `dy_topic_group` VALUES (10000,'Java������','��������Զ�����ѧԺ'),(10001,'���ݿ�ϵͳ����','��������Զ�����ѧԺ'),(10002,'C���Գ������','��������Զ�����ѧԺ'),(10003,'�ߵ���ѧ','��ѧԺ'),(10004,'���Դ���','��ѧԺ'),(10005,'�Զ�����ԭ��','��еѧԺ'),(10006,'��ѧӢ��1','�����ѧԺ'),(10007,'�˳�ѧ','���ù���ѧԺ'),(10008,'�˳�ѧ','���ù���ѧԺ'),(10009,'��ѧ����','�����γ�'),(10010,'�ߵ���ѧ','�����γ�');
/*!40000 ALTER TABLE `dy_topic_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_tu`
--

DROP TABLE IF EXISTS `dy_tu`;
CREATE TABLE `dy_tu` (
  `TUID` int(11) NOT NULL auto_increment,
  `UID` int(11) default NULL,
  `TGID` int(11) default NULL,
  PRIMARY KEY  (`TUID`),
  KEY `UID` (`UID`),
  KEY `TGID` (`TGID`),
  CONSTRAINT `dy_tu_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `dy_user` (`UID`) ON DELETE CASCADE,
  CONSTRAINT `dy_tu_ibfk_2` FOREIGN KEY (`TGID`) REFERENCES `dy_topic_group` (`TGID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dy_tu`
--

LOCK TABLES `dy_tu` WRITE;
/*!40000 ALTER TABLE `dy_tu` DISABLE KEYS */;
INSERT INTO `dy_tu` VALUES (1,2,10000),(2,2,10001),(3,2,10002),(4,1,10001),(6,1,10005),(10,3,10002),(12,1,10000),(13,1,10002),(14,3,10001),(15,4,10001),(17,7,10001);
/*!40000 ALTER TABLE `dy_tu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_user`
--

DROP TABLE IF EXISTS `dy_user`;
CREATE TABLE `dy_user` (
  `UID` int(11) NOT NULL auto_increment,
  `UName` varchar(20) NOT NULL,
  `UPwd` varchar(20) NOT NULL,
  `UGender` char(2) default '��',
  `UEmail` varchar(40) default NULL,
  `URole` int(11) default '0',
  `UHead` varchar(50) default 'UserHead/no_head.jpg',
  `URegDate` date default NULL,
  `ULastLogin` datetime default NULL,
  `ULastEmit` datetime default NULL,
  `UPermit` int(11) default '1',
  PRIMARY KEY  (`UID`),
  UNIQUE KEY `UName` (`UName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dy_user`
--

LOCK TABLES `dy_user` WRITE;
/*!40000 ALTER TABLE `dy_user` DISABLE KEYS */;
INSERT INTO `dy_user` VALUES (1,'xyz','123456','��','fgdsa@163.com',0,'UserHead/1.jpg','2008-12-08','2009-03-16 22:16:20','2009-03-16 21:00:10',1),(2,'zrk','123456','��','sfdsaga@163.com',1,'UserHead/2.JPG','2008-12-08','2009-03-16 23:12:04','2008-12-12 13:27:24',1),(3,'���ٷ�','123456','Ů','wereq@163.com',0,'UserHead/3.jpg','2008-12-08','2008-12-12 09:26:47',NULL,1),(4,'wyf','123456','��','gr4eg@163.com',3,'UserHead/1.jpg','2008-12-08','2009-03-17 15:11:32','2008-12-12 14:01:29',1),(5,'fdsa','123123','��','rfews@3421.com',0,'UserHead/no_head.jpg','2009-03-16','2009-03-16 17:41:24','2009-03-16 17:41:24',1),(7,'wfa','123123','��','fdsa@123.com',0,'UserHead/no_head.jpg','2009-03-16','2009-03-16 17:44:32','2009-03-16 17:44:32',1),(8,'few','123123','��','fdsa@123.com',0,'UserHead/no_head.jpg','2009-03-16','2009-03-16 17:45:11','2009-03-16 17:45:11',1);
/*!40000 ALTER TABLE `dy_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-03-17  7:23:17
