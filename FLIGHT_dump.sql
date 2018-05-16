-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: FLIGHT
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
-- Table structure for table `AIRCRAFT`
--

DROP TABLE IF EXISTS `AIRCRAFT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AIRCRAFT` (
  `AID` int(11) NOT NULL,
  `ANAME` varchar(15) DEFAULT NULL,
  `CRUISINGRANGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`AID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRCRAFT`
--

LOCK TABLES `AIRCRAFT` WRITE;
/*!40000 ALTER TABLE `AIRCRAFT` DISABLE KEYS */;
INSERT INTO `AIRCRAFT` VALUES (101,'BOEING',1000),(102,'BOEING',1500),(103,'HINDENBURG',2000),(104,'MEMPHIS BELLE',2000),(105,'AIRINDIA',5000);
/*!40000 ALTER TABLE `AIRCRAFT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CERTIFIED`
--

DROP TABLE IF EXISTS `CERTIFIED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CERTIFIED` (
  `EID` int(11) DEFAULT NULL,
  `AID` int(11) DEFAULT NULL,
  KEY `AID` (`AID`),
  KEY `EID` (`EID`),
  CONSTRAINT `CERTIFIED_ibfk_1` FOREIGN KEY (`AID`) REFERENCES `AIRCRAFT` (`AID`),
  CONSTRAINT `CERTIFIED_ibfk_2` FOREIGN KEY (`EID`) REFERENCES `EMPLOYEES` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CERTIFIED`
--

LOCK TABLES `CERTIFIED` WRITE;
/*!40000 ALTER TABLE `CERTIFIED` DISABLE KEYS */;
INSERT INTO `CERTIFIED` VALUES (1,101),(2,105),(3,103),(4,101),(5,102),(7,103),(8,105),(10,102),(1,102),(1,105),(1,103);
/*!40000 ALTER TABLE `CERTIFIED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEES`
--

DROP TABLE IF EXISTS `EMPLOYEES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEES` (
  `EID` int(11) NOT NULL,
  `ENAME` varchar(15) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (1,'PAVAN',500000),(2,'SANKAR',1000000),(3,'CHARAN',10000000),(4,'PHANI',5000000),(5,'JASHBRO',50000),(6,'VAISHNAVI',1000000),(7,'ARUN',2000000),(8,'VIKAS',2000000),(9,'KAUSHIK',5000000),(10,'JASWANTH',100000);
/*!40000 ALTER TABLE `EMPLOYEES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLIGHTS`
--

DROP TABLE IF EXISTS `FLIGHTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FLIGHTS` (
  `FLNO` int(11) NOT NULL,
  `SRC` varchar(15) DEFAULT NULL,
  `DEST` varchar(15) DEFAULT NULL,
  `DISTANCE` int(11) DEFAULT NULL,
  `DEPARTS` time DEFAULT NULL,
  `ARRIVES` time DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  PRIMARY KEY (`FLNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLIGHTS`
--

LOCK TABLES `FLIGHTS` WRITE;
/*!40000 ALTER TABLE `FLIGHTS` DISABLE KEYS */;
INSERT INTO `FLIGHTS` VALUES (1,'CHENNAI','HYDERABAD',600,'08:02:53','10:02:53',1500),(2,'BHEEMAVARAM','KAVALI',300,'08:02:53','08:52:53',500),(3,'CHENNAI','HYDERABAD',700,'08:02:53','09:52:53',2500),(4,'JABALPUR','HYDERABAD',927,'08:02:53','10:00:53',2900),(5,'HYDERABAD','JABALPUR',927,'08:02:53','10:00:53',3100),(6,'MUMBAI','CHENNAI',1500,'08:02:53','09:00:53',4000),(7,'CHENNAI','MUMBAI',1500,'08:02:53','09:00:53',3900),(8,'DELHI','MUMBAI',500,'08:02:53','09:00:53',1500),(9,'MUMBAI','DELHI',500,'08:02:53','09:00:53',1700),(10,'KAVALI','BHEEMAVARAM',300,'08:02:53','08:52:53',500);
/*!40000 ALTER TABLE `FLIGHTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ace`
--

DROP TABLE IF EXISTS `ace`;
/*!50001 DROP VIEW IF EXISTS `ace`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ace` AS SELECT 
 1 AS `EID`,
 1 AS `ENAME`,
 1 AS `SALARY`,
 1 AS `ANAME`,
 1 AS `CRUISINGRANGE`,
 1 AS `AID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `acef`
--

DROP TABLE IF EXISTS `acef`;
/*!50001 DROP VIEW IF EXISTS `acef`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `acef` AS SELECT 
 1 AS `EID`,
 1 AS `ENAME`,
 1 AS `SALARY`,
 1 AS `ANAME`,
 1 AS `CRUISINGRANGE`,
 1 AS `AID`,
 1 AS `FLNO`,
 1 AS `SRC`,
 1 AS `DEST`,
 1 AS `DISTANCE`,
 1 AS `DEPARTS`,
 1 AS `ARRIVES`,
 1 AS `PRICE`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ace`
--

/*!50001 DROP VIEW IF EXISTS `ace`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ace` AS (select `E`.`EID` AS `EID`,`E`.`ENAME` AS `ENAME`,`E`.`SALARY` AS `SALARY`,`A`.`ANAME` AS `ANAME`,`A`.`CRUISINGRANGE` AS `CRUISINGRANGE`,`A`.`AID` AS `AID` from ((`EMPLOYEES` `E` join `AIRCRAFT` `A`) join `CERTIFIED` `C`) where ((`C`.`EID` = `E`.`EID`) and (`C`.`AID` = `A`.`AID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `acef`
--

/*!50001 DROP VIEW IF EXISTS `acef`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `acef` AS select `ace`.`EID` AS `EID`,`ace`.`ENAME` AS `ENAME`,`ace`.`SALARY` AS `SALARY`,`ace`.`ANAME` AS `ANAME`,`ace`.`CRUISINGRANGE` AS `CRUISINGRANGE`,`ace`.`AID` AS `AID`,`FLIGHTS`.`FLNO` AS `FLNO`,`FLIGHTS`.`SRC` AS `SRC`,`FLIGHTS`.`DEST` AS `DEST`,`FLIGHTS`.`DISTANCE` AS `DISTANCE`,`FLIGHTS`.`DEPARTS` AS `DEPARTS`,`FLIGHTS`.`ARRIVES` AS `ARRIVES`,`FLIGHTS`.`PRICE` AS `PRICE` from (`ace` join `FLIGHTS`) where (`ace`.`CRUISINGRANGE` >= `FLIGHTS`.`DISTANCE`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-03  4:21:12
