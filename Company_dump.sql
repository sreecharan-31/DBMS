-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: Company
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ABC`
--

DROP TABLE IF EXISTS `ABC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABC` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ABC`
--

LOCK TABLES `ABC` WRITE;
/*!40000 ALTER TABLE `ABC` DISABLE KEYS */;
INSERT INTO `ABC` VALUES ('Jignesh',NULL,'Kumar','ced12','1989-11-03','26-185,iiitdm','M',500000.00,'ced32',2),('Pavan',NULL,'Chaithanya','ced32','1989-06-03','26-65,iiitdm','M',600000.00,'coe35',2),('Mounish',NULL,'Vegi','ced35','1989-09-03','26-195,iiitdm','M',400000.00,'ced32',2),('Aneesh',NULL,'Hiregange','coe01','1989-03-03','26-215,iiitdm','M',700000.00,'coe35',1),('Sankar','M','Angini','coe25','1989-03-03','26-5,iiitdm','M',700000.00,'coe35',1),('Sreecharn','S','Reddy','coe35','1989-10-31','26-615,iiitdm','M',600000.00,NULL,1),('Vaishnavi',NULL,'Sriram','coe36','1989-10-03','124,iiitdm','F',600000.00,'coe35',1),('Sai Phani','V','Teja','coe37','1989-10-03','1224,iiitdm','M',600001.00,'coe35',1),('Kaushik',NULL,'Betanabotla','edm03','1989-10-03','1223,iiitdm','M',500000.00,'coe35',3),('Jeshwanth',NULL,'kumar','edm13','1989-03-03','26-115,iiitdm','M',400000.00,'edm03',3);
/*!40000 ALTER TABLE `ABC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `Dname` varchar(30) DEFAULT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` char(9) NOT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `Dname` (`Dname`),
  KEY `Mgr_ssn` (`Mgr_ssn`),
  CONSTRAINT `Department_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `Employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Computer Engineering',1,'coe35','2000-01-01'),('Computer Engineering DD',2,'ced32','2015-05-31'),('Electrical Engineering',3,'edm03','2016-10-16');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependent`
--

DROP TABLE IF EXISTS `Dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `Dependent_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `Employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependent`
--

LOCK TABLES `Dependent` WRITE;
/*!40000 ALTER TABLE `Dependent` DISABLE KEYS */;
INSERT INTO `Dependent` VALUES ('ced12','Nikitha','F','1994-06-12','Spouse'),('ced32','Rushitha','F','1992-02-08','Spouse'),('ced32','Rushwanth','M','2016-12-08','Child'),('ced32','Sri Vinya','F','2011-09-18','Child'),('ced35','Monaika','F','1996-01-15','Spouse'),('coe25','Sanjana','F','1994-01-12','Spouse'),('coe35','Anamika','F','1988-11-15','Spouse'),('edm03','Aryan Singh','F','1996-09-28','Spouse'),('edm03','Pushwanth','M','1989-09-28','Son-in-law'),('edm13','Niveditha','F','1995-01-15','Spouse');
/*!40000 ALTER TABLE `Dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dept_Locations`
--

DROP TABLE IF EXISTS `Dept_Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dept_Locations` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `Dept_Locations_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `Department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dept_Locations`
--

LOCK TABLES `Dept_Locations` WRITE;
/*!40000 ALTER TABLE `Dept_Locations` DISABLE KEYS */;
INSERT INTO `Dept_Locations` VALUES (1,'Hyderabad'),(2,'Kavali'),(3,'Hyderabad');
/*!40000 ALTER TABLE `Dept_Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL,
  PRIMARY KEY (`ssn`),
  KEY `Dno` (`Dno`),
  KEY `Super_ssn` (`Super_ssn`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `Department` (`Dnumber`),
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`Super_ssn`) REFERENCES `Employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('Jignesh',NULL,'Kumar','ced12','1989-11-03','26-185,iiitdm','M',500000.00,'ced32',2),('Pavan',NULL,'Chaithanya','ced32','1989-06-03','26-65,iiitdm','M',600000.00,'coe35',2),('Mounish',NULL,'Vegi','ced35','1989-09-03','26-195,iiitdm','M',400000.00,'ced32',2),('Aneesh',NULL,'Hiregange','coe01','1989-03-03','26-215,iiitdm','M',700000.00,'coe35',1),('Sankar','M','Angini','coe25','1989-03-03','26-5,iiitdm','M',700000.00,'coe35',1),('Sreecharn','S','Reddy','coe35','1989-10-31','26-615,iiitdm','M',600000.00,NULL,1),('Vaishnavi',NULL,'Sriram','coe36','1989-10-03','124,iiitdm','F',600000.00,'coe35',1),('Sai Phani','V','Teja','coe37','1989-10-03','1224,iiitdm','M',600001.00,'coe35',1),('Kaushik',NULL,'Betanabotla','edm03','1989-10-03','1223,iiitdm','M',500000.00,'coe35',3),('Jeshwanth',NULL,'kumar','edm13','1989-03-03','26-115,iiitdm','M',400000.00,'edm03',3);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `Pname` varchar(30) DEFAULT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int(11) NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `Pname` (`Pname`),
  KEY `Dnum` (`Dnum`),
  CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `Department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES ('Alumni Portal',1,'Chennai',1),('Enrollment Form',2,'Kavali',2),('Mess Management',3,'Chennai',1),('Lost Manager',4,'Delhi',1),('Think Pad',5,'Kolkatha',3),('AR mods',6,'Warangal',3),('visual Databases',7,'Nellore',2),('Portable Chargers',8,'Pondicherry',3),('College Feed',9,'Shillong',2),('Railway Reservation',10,'Bombay',1);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works_On`
--

DROP TABLE IF EXISTS `Works_On`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Works_On` (
  `Essn` char(9) NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `Pno` (`Pno`),
  CONSTRAINT `Works_On_ibfk_1` FOREIGN KEY (`Pno`) REFERENCES `Project` (`Pnumber`),
  CONSTRAINT `Works_On_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `Project` (`Pnumber`),
  CONSTRAINT `Works_On_ibfk_3` FOREIGN KEY (`Essn`) REFERENCES `Employee` (`ssn`),
  CONSTRAINT `Works_On_ibfk_4` FOREIGN KEY (`Pno`) REFERENCES `Project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works_On`
--

LOCK TABLES `Works_On` WRITE;
/*!40000 ALTER TABLE `Works_On` DISABLE KEYS */;
INSERT INTO `Works_On` VALUES ('ced12',7,15.0),('ced32',2,4.0),('ced35',9,11.0),('coe01',4,5.0),('coe25',10,5.0),('coe35',1,5.0),('coe35',3,5.0),('coe36',10,6.0),('coe37',10,5.0),('edm03',5,1.0),('edm03',6,3.0),('edm13',8,5.0);
/*!40000 ALTER TABLE `Works_On` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-03  4:19:39
