-- MySQL dump 10.13  Distrib 5.7.22, for osx10.12 (x86_64)
--
-- Host: localhost    Database: rentroll
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `AR`
--

DROP TABLE IF EXISTS `AR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AR` (
  `ARID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `SubARID` bigint(20) NOT NULL DEFAULT '0',
  `ARType` smallint(6) NOT NULL DEFAULT '0',
  `RARequired` smallint(6) NOT NULL DEFAULT '0',
  `DebitLID` bigint(20) NOT NULL DEFAULT '0',
  `CreditLID` bigint(20) NOT NULL DEFAULT '0',
  `Description` varchar(1024) NOT NULL DEFAULT '',
  `DtStart` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtStop` datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `DefaultAmount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `DefaultRentCycle` smallint(6) NOT NULL DEFAULT '0',
  `DefaultProrationCycle` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ARID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AR`
--

LOCK TABLES `AR` WRITE;
/*!40000 ALTER TABLE `AR` DISABLE KEYS */;
INSERT INTO `AR` VALUES (1,1,'Application Fee',0,0,0,9,46,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(2,1,'Application Fee (no assessment)',0,1,0,7,46,'Application fee taken, no assessment made','0000-00-00 00:00:00','9999-12-31 00:00:00',5,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(3,1,'Apply Payment',0,1,0,10,9,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(4,1,'Bad Debt Write-Off',0,2,0,71,9,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(5,1,'Bank Service Fee (Deposit Account)',0,2,0,72,4,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(6,1,'Bank Service Fee (Operating Account)',0,2,0,72,3,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(7,1,'Broken Window charge',0,0,0,9,59,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(8,1,'Damage Fee',0,0,0,9,59,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(9,1,'Deposit to Deposit Account (FRB96953)',0,1,0,4,6,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(10,1,'Deposit to Operating Account (FRB54320)',0,1,0,3,6,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(11,1,'Electric Base Fee',0,0,0,9,36,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(12,1,'Electric Overage',0,0,0,9,37,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(13,1,'Eviction Fee Reimbursement',0,0,0,9,56,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(14,1,'Auto-Generated Floating Deposit Assessment',0,3,0,9,12,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(15,1,'Receive Floating Security Deposit',0,1,0,6,9,'','0000-00-00 00:00:00','9999-12-31 00:00:00',13,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(16,1,'Gas Base Fee',0,0,0,9,40,'','1900-01-01 00:00:00','9999-12-29 00:00:00',2,50.0000,'2018-07-23 16:16:36',211,'2017-11-10 23:24:23',0,6,4),(17,1,'Gas Base Overage',0,0,0,9,41,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(18,1,'Insufficient Funds Fee',0,0,0,9,48,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(19,1,'Late Fee',0,0,0,9,47,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(20,1,'Month to Month Fee',0,0,0,9,49,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(21,1,'No Show / Termination Fee',0,0,0,9,51,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(22,1,'Other Special Tenant Charges',0,0,0,9,61,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(23,1,'Pet Fee',0,0,0,9,52,'','1900-01-01 00:00:00','9999-12-31 00:00:00',192,50.0000,'2018-07-04 04:13:35',211,'2017-11-10 23:24:23',0,0,0),(24,1,'Pet Rent',0,0,0,9,53,'','1900-01-01 00:00:00','9999-12-30 00:00:00',144,10.0000,'2018-07-23 16:16:52',211,'2017-11-10 23:24:23',0,6,4),(25,1,'Receive a Payment',0,1,0,6,10,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(26,1,'Rent Non-Taxable',0,0,0,9,18,'','1900-01-01 00:00:00','9999-12-30 00:00:00',16,0.0000,'2018-07-23 16:14:54',211,'2017-11-10 23:24:23',0,6,4),(27,1,'Rent Taxable',0,0,0,9,17,'','1900-01-01 00:00:00','9999-12-30 00:00:00',16,0.0000,'2018-07-23 16:15:28',211,'2017-11-10 23:24:23',0,4,0),(28,1,'Security Deposit Assessment',0,0,0,9,11,'normal deposit','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(29,1,'Security Deposit Forfeiture',0,0,0,11,58,'Forfeit','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(30,1,'Security Deposit Refund',0,0,0,11,5,'Refund','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(31,1,'Special Cleaning Fee',0,0,0,9,55,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(32,1,'Tenant Expense Chargeback',0,0,0,9,54,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(33,1,'Vending Income',0,1,0,7,65,'','0000-00-00 00:00:00','9999-12-31 00:00:00',5,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(34,1,'Water and Sewer Base Fee',0,0,0,9,38,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(35,1,'Water and Sewer Overage',0,0,0,9,39,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(36,1,'Auto-gen Application Fee Asmt',0,3,0,9,46,'','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(37,1,'Receive Application Fee (auto-gen asmt)',0,1,0,6,9,'Application fee taken, autogen asmt','0000-00-00 00:00:00','9999-12-31 00:00:00',13,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(38,1,'XFER  Operating to SecDep',0,2,0,4,3,'Move money from Operating acct to Sec Dep','0000-00-00 00:00:00','9999-12-31 00:00:00',0,0.0000,'2017-11-27 21:49:03',0,'2017-11-10 23:24:23',0,0,0),(39,1,'Vehicle Registration Fee',0,0,3,9,75,'','2018-01-01 00:00:00','9999-12-31 00:00:00',320,10.0000,'2018-07-04 04:14:56',211,'2018-07-03 02:47:47',211,0,0),(40,1,'Rent ST000',0,0,0,9,18,'Default rent assessment for rentable type RType000','1970-01-01 00:00:00','9999-12-31 00:00:00',20,1000.0000,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,0,0),(41,1,'Rent ST001',0,0,0,9,18,'Default rent assessment for rentable type RType001','1970-01-01 00:00:00','9999-12-31 00:00:00',20,1500.0000,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,0,0),(42,1,'Rent ST002',0,0,0,9,18,'Default rent assessment for rentable type RType002','1970-01-01 00:00:00','9999-12-31 00:00:00',20,1750.0000,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,0,0),(43,1,'Rent ST003',0,0,0,9,18,'Default rent assessment for rentable type RType003','1970-01-01 00:00:00','9999-12-31 00:00:00',20,2500.0000,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,0,0),(44,1,'Rent CP000',0,0,0,9,18,'Default rent assessment for rentable type Car Port 000','1970-01-01 00:00:00','9999-12-31 00:00:00',20,35.0000,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,0,0);
/*!40000 ALTER TABLE `AR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssessmentTax`
--

DROP TABLE IF EXISTS `AssessmentTax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AssessmentTax` (
  `ASMID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `TAXID` bigint(20) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `OverrideTaxApprover` mediumint(9) NOT NULL DEFAULT '0',
  `OverrideAmount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssessmentTax`
--

LOCK TABLES `AssessmentTax` WRITE;
/*!40000 ALTER TABLE `AssessmentTax` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssessmentTax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assessments`
--

DROP TABLE IF EXISTS `Assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assessments` (
  `ASMID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PASMID` bigint(20) NOT NULL DEFAULT '0',
  `RPASMID` bigint(20) NOT NULL DEFAULT '0',
  `AGRCPTID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `AssocElemType` bigint(20) NOT NULL DEFAULT '0',
  `AssocElemID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `Start` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `Stop` datetime NOT NULL DEFAULT '2066-01-01 00:00:00',
  `RentCycle` smallint(6) NOT NULL DEFAULT '0',
  `ProrationCycle` smallint(6) NOT NULL DEFAULT '0',
  `InvoiceNo` bigint(20) NOT NULL DEFAULT '0',
  `AcctRule` varchar(200) NOT NULL DEFAULT '',
  `ARID` bigint(20) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Comment` varchar(256) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ASMID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assessments`
--

LOCK TABLES `Assessments` WRITE;
/*!40000 ALTER TABLE `Assessments` DISABLE KEYS */;
INSERT INTO `Assessments` VALUES (1,0,0,0,1,1,0,0,1,1000.0000,'2018-03-01 00:00:00','2020-03-01 00:00:00',6,4,0,'',26,0,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,0,0,1,1,0,0,1,1000.0000,'2018-03-01 00:00:00','2018-03-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(3,1,0,0,1,1,0,0,1,1000.0000,'2018-04-01 00:00:00','2018-04-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(4,1,0,0,1,1,0,0,1,1000.0000,'2018-05-01 00:00:00','2018-05-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(5,1,0,0,1,1,0,0,1,1000.0000,'2018-06-01 00:00:00','2018-06-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(6,1,0,0,1,1,0,0,1,1000.0000,'2018-07-01 00:00:00','2018-07-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(7,0,0,0,1,1,0,0,1,2000.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',28,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(8,0,0,0,1,1,14,1,1,10.0000,'2018-03-01 00:00:00','2020-03-01 00:00:00',6,4,0,'',24,8,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(9,8,0,0,1,1,14,1,1,10.0000,'2018-03-01 00:00:00','2018-03-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(10,8,0,0,1,1,14,1,1,10.0000,'2018-04-01 00:00:00','2018-04-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(11,8,0,0,1,1,14,1,1,10.0000,'2018-05-01 00:00:00','2018-05-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(12,8,0,0,1,1,14,1,1,10.0000,'2018-06-01 00:00:00','2018-06-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(13,8,0,0,1,1,14,1,1,10.0000,'2018-07-01 00:00:00','2018-07-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(14,0,0,0,1,1,0,0,1,571.4300,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',26,2,'prorated for 16 of 28 days','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(15,0,0,0,1,1,14,1,1,50.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',23,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(16,0,0,0,1,1,14,1,1,5.7100,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',24,2,'prorated for 16 of 28 days','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(17,0,0,0,1,1,15,1,1,10.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',39,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(18,0,0,0,1,2,0,0,2,1000.0000,'2018-03-01 00:00:00','2020-03-01 00:00:00',6,4,0,'',26,0,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(19,18,0,0,1,2,0,0,2,1000.0000,'2018-03-01 00:00:00','2018-03-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(20,18,0,0,1,2,0,0,2,1000.0000,'2018-04-01 00:00:00','2018-04-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(21,18,0,0,1,2,0,0,2,1000.0000,'2018-05-01 00:00:00','2018-05-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(22,18,0,0,1,2,0,0,2,1000.0000,'2018-06-01 00:00:00','2018-06-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(23,18,0,0,1,2,0,0,2,1000.0000,'2018-07-01 00:00:00','2018-07-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(24,0,0,0,1,2,0,0,2,2000.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',28,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(25,0,0,0,1,2,14,2,2,10.0000,'2018-03-01 00:00:00','2020-03-01 00:00:00',6,4,0,'',24,8,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(26,25,0,0,1,2,14,2,2,10.0000,'2018-03-01 00:00:00','2018-03-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(27,25,0,0,1,2,14,2,2,10.0000,'2018-04-01 00:00:00','2018-04-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(28,25,0,0,1,2,14,2,2,10.0000,'2018-05-01 00:00:00','2018-05-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(29,25,0,0,1,2,14,2,2,10.0000,'2018-06-01 00:00:00','2018-06-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(30,25,0,0,1,2,14,2,2,10.0000,'2018-07-01 00:00:00','2018-07-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(31,0,0,0,1,2,0,0,2,571.4300,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',26,2,'prorated for 16 of 28 days','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(32,0,0,0,1,2,14,2,2,50.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',23,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(33,0,0,0,1,2,14,2,2,5.7100,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',24,2,'prorated for 16 of 28 days','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(34,0,0,0,1,2,15,2,2,10.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',39,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(35,0,0,0,1,3,0,0,3,1500.0000,'2018-03-01 00:00:00','2020-03-01 00:00:00',6,4,0,'',26,0,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(36,35,0,0,1,3,0,0,3,1500.0000,'2018-03-01 00:00:00','2018-03-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(37,35,0,0,1,3,0,0,3,1500.0000,'2018-04-01 00:00:00','2018-04-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(38,35,0,0,1,3,0,0,3,1500.0000,'2018-05-01 00:00:00','2018-05-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(39,35,0,0,1,3,0,0,3,1500.0000,'2018-06-01 00:00:00','2018-06-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(40,35,0,0,1,3,0,0,3,1500.0000,'2018-07-01 00:00:00','2018-07-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(41,0,0,0,1,3,0,0,3,3000.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',28,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(42,0,0,0,1,3,14,3,3,10.0000,'2018-03-01 00:00:00','2020-03-01 00:00:00',6,4,0,'',24,8,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(43,42,0,0,1,3,14,3,3,10.0000,'2018-03-01 00:00:00','2018-03-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(44,42,0,0,1,3,14,3,3,10.0000,'2018-04-01 00:00:00','2018-04-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(45,42,0,0,1,3,14,3,3,10.0000,'2018-05-01 00:00:00','2018-05-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(46,42,0,0,1,3,14,3,3,10.0000,'2018-06-01 00:00:00','2018-06-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(47,42,0,0,1,3,14,3,3,10.0000,'2018-07-01 00:00:00','2018-07-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(48,0,0,0,1,3,0,0,3,857.1400,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',26,2,'prorated for 16 of 28 days','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(49,0,0,0,1,3,14,3,3,50.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',23,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(50,0,0,0,1,3,14,3,3,5.7100,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',24,2,'prorated for 16 of 28 days','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(51,0,0,0,1,3,15,3,3,10.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',39,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(52,0,0,0,1,4,0,0,4,1500.0000,'2018-03-01 00:00:00','2020-03-01 00:00:00',6,4,0,'',26,0,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(53,52,0,0,1,4,0,0,4,1500.0000,'2018-03-01 00:00:00','2018-03-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(54,52,0,0,1,4,0,0,4,1500.0000,'2018-04-01 00:00:00','2018-04-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(55,52,0,0,1,4,0,0,4,1500.0000,'2018-05-01 00:00:00','2018-05-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(56,52,0,0,1,4,0,0,4,1500.0000,'2018-06-01 00:00:00','2018-06-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(57,52,0,0,1,4,0,0,4,1500.0000,'2018-07-01 00:00:00','2018-07-02 00:00:00',6,4,0,'',26,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(58,0,0,0,1,4,0,0,4,3000.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',28,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(59,0,0,0,1,4,14,4,4,10.0000,'2018-03-01 00:00:00','2020-03-01 00:00:00',6,4,0,'',24,8,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(60,59,0,0,1,4,14,4,4,10.0000,'2018-03-01 00:00:00','2018-03-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(61,59,0,0,1,4,14,4,4,10.0000,'2018-04-01 00:00:00','2018-04-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(62,59,0,0,1,4,14,4,4,10.0000,'2018-05-01 00:00:00','2018-05-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(63,59,0,0,1,4,14,4,4,10.0000,'2018-06-01 00:00:00','2018-06-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(64,59,0,0,1,4,14,4,4,10.0000,'2018-07-01 00:00:00','2018-07-02 00:00:00',6,4,0,'',24,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(65,0,0,0,1,4,0,0,4,857.1400,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',26,2,'prorated for 16 of 28 days','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(66,0,0,0,1,4,14,4,4,50.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',23,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(67,0,0,0,1,4,14,4,4,5.7100,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',24,2,'prorated for 16 of 28 days','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(68,0,0,0,1,4,15,4,4,10.0000,'2018-02-13 00:00:00','2018-02-13 00:00:00',0,0,0,'',39,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `Assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AvailabilityTypes`
--

DROP TABLE IF EXISTS `AvailabilityTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AvailabilityTypes` (
  `AVAILID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AVAILID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AvailabilityTypes`
--

LOCK TABLES `AvailabilityTypes` WRITE;
/*!40000 ALTER TABLE `AvailabilityTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `AvailabilityTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Building`
--

DROP TABLE IF EXISTS `Building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Building` (
  `BLDGID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Address` varchar(100) NOT NULL DEFAULT '',
  `Address2` varchar(100) NOT NULL DEFAULT '',
  `City` varchar(100) NOT NULL DEFAULT '',
  `State` char(25) NOT NULL DEFAULT '',
  `PostalCode` varchar(100) NOT NULL DEFAULT '',
  `Country` varchar(100) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`BLDGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Building`
--

LOCK TABLES `Building` WRITE;
/*!40000 ALTER TABLE `Building` DISABLE KEYS */;
/*!40000 ALTER TABLE `Building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Business`
--

DROP TABLE IF EXISTS `Business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Business` (
  `BID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BUD` varchar(100) NOT NULL DEFAULT '',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `DefaultRentCycle` smallint(6) NOT NULL DEFAULT '0',
  `DefaultProrationCycle` smallint(6) NOT NULL DEFAULT '0',
  `DefaultGSRPC` smallint(6) NOT NULL DEFAULT '0',
  `ClosePeriodTLID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Business`
--

LOCK TABLES `Business` WRITE;
/*!40000 ALTER TABLE `Business` DISABLE KEYS */;
INSERT INTO `Business` VALUES (1,'REX','JGM First, LLC',6,4,4,1,'2018-06-05 23:06:51',0,'2017-11-10 23:24:22',0,1);
/*!40000 ALTER TABLE `Business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessAssessments`
--

DROP TABLE IF EXISTS `BusinessAssessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BusinessAssessments` (
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `ATypeLID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessAssessments`
--

LOCK TABLES `BusinessAssessments` WRITE;
/*!40000 ALTER TABLE `BusinessAssessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `BusinessAssessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessPaymentTypes`
--

DROP TABLE IF EXISTS `BusinessPaymentTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BusinessPaymentTypes` (
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `PMTID` mediumint(9) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessPaymentTypes`
--

LOCK TABLES `BusinessPaymentTypes` WRITE;
/*!40000 ALTER TABLE `BusinessPaymentTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `BusinessPaymentTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessProperties`
--

DROP TABLE IF EXISTS `BusinessProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BusinessProperties` (
  `BPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Data` json DEFAULT NULL,
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`BPID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessProperties`
--

LOCK TABLES `BusinessProperties` WRITE;
/*!40000 ALTER TABLE `BusinessProperties` DISABLE KEYS */;
INSERT INTO `BusinessProperties` VALUES (1,1,'general',0,'{\"Epochs\": {\"Daily\": \"2017-01-01T00:00:00Z\", \"Weekly\": \"2017-01-01T00:00:00Z\", \"Yearly\": \"2017-01-01T00:00:00Z\", \"Monthly\": \"2017-01-01T00:00:00Z\", \"Quarterly\": \"2017-01-01T00:00:00Z\"}, \"PetFees\": [\"Pet Fee\", \"Pet Rent\"], \"VehicleFees\": [\"Vehicle Registration Fee\"]}','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `BusinessProperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClosePeriod`
--

DROP TABLE IF EXISTS `ClosePeriod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClosePeriod` (
  `CPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `TLID` bigint(20) NOT NULL DEFAULT '0',
  `Dt` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClosePeriod`
--

LOCK TABLES `ClosePeriod` WRITE;
/*!40000 ALTER TABLE `ClosePeriod` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClosePeriod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CommissionLedger`
--

DROP TABLE IF EXISTS `CommissionLedger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommissionLedger` (
  `CLID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `Salesperson` varchar(100) NOT NULL DEFAULT '',
  `Percent` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `PaymentDueDate` date NOT NULL DEFAULT '1970-01-01',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommissionLedger`
--

LOCK TABLES `CommissionLedger` WRITE;
/*!40000 ALTER TABLE `CommissionLedger` DISABLE KEYS */;
/*!40000 ALTER TABLE `CommissionLedger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomAttr`
--

DROP TABLE IF EXISTS `CustomAttr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomAttr` (
  `CID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Type` smallint(6) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Value` varchar(256) NOT NULL DEFAULT '',
  `Units` varchar(256) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomAttr`
--

LOCK TABLES `CustomAttr` WRITE;
/*!40000 ALTER TABLE `CustomAttr` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomAttr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomAttrRef`
--

DROP TABLE IF EXISTS `CustomAttrRef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomAttrRef` (
  `ElementType` bigint(20) NOT NULL,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `ID` bigint(20) NOT NULL,
  `CID` bigint(20) NOT NULL,
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `CARID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`CARID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomAttrRef`
--

LOCK TABLES `CustomAttrRef` WRITE;
/*!40000 ALTER TABLE `CustomAttrRef` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomAttrRef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DemandSource`
--

DROP TABLE IF EXISTS `DemandSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DemandSource` (
  `SourceSLSID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(100) DEFAULT NULL,
  `Industry` varchar(100) DEFAULT NULL,
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SourceSLSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DemandSource`
--

LOCK TABLES `DemandSource` WRITE;
/*!40000 ALTER TABLE `DemandSource` DISABLE KEYS */;
/*!40000 ALTER TABLE `DemandSource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deposit`
--

DROP TABLE IF EXISTS `Deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Deposit` (
  `DID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `DEPID` bigint(20) NOT NULL DEFAULT '0',
  `DPMID` bigint(20) NOT NULL DEFAULT '0',
  `Dt` date NOT NULL DEFAULT '1970-01-01',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `ClearedAmount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deposit`
--

LOCK TABLES `Deposit` WRITE;
/*!40000 ALTER TABLE `Deposit` DISABLE KEYS */;
INSERT INTO `Deposit` VALUES (1,1,2,1,'2018-02-13',3119.9800,0.0000,0,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(2,1,1,1,'2018-02-13',10000.0000,0.0000,0,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(3,1,2,1,'2018-03-01',5040.0000,0.0000,0,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(4,1,2,1,'2018-04-01',5040.0000,0.0000,0,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(5,1,2,1,'2018-05-01',5040.0000,0.0000,0,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(6,1,2,1,'2018-06-01',5040.0000,0.0000,0,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(7,1,2,1,'2018-07-01',5040.0000,0.0000,0,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0);
/*!40000 ALTER TABLE `Deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DepositMethod`
--

DROP TABLE IF EXISTS `DepositMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DepositMethod` (
  `DPMID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Method` varchar(50) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DPMID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DepositMethod`
--

LOCK TABLES `DepositMethod` WRITE;
/*!40000 ALTER TABLE `DepositMethod` DISABLE KEYS */;
INSERT INTO `DepositMethod` VALUES (1,1,'Hand Delivery','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(2,1,'Scanned/Electronic Batch','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(3,1,'ACH','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(4,1,'US Mail','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0);
/*!40000 ALTER TABLE `DepositMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DepositPart`
--

DROP TABLE IF EXISTS `DepositPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DepositPart` (
  `DPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RCPTID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DPID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DepositPart`
--

LOCK TABLES `DepositPart` WRITE;
/*!40000 ALTER TABLE `DepositPart` DISABLE KEYS */;
INSERT INTO `DepositPart` VALUES (1,1,1,12,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(2,1,1,13,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(3,1,1,14,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(4,1,1,15,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(5,1,1,27,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(6,1,1,28,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(7,1,1,29,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(8,1,1,30,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(9,1,1,42,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(10,1,1,43,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(11,1,1,44,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(12,1,1,45,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(13,1,1,57,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(14,1,1,58,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(15,1,1,59,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(16,1,1,60,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(17,2,1,6,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(18,2,1,21,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(19,2,1,36,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(20,2,1,51,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(21,3,1,1,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(22,3,1,7,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(23,3,1,16,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(24,3,1,22,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(25,3,1,31,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(26,3,1,37,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(27,3,1,46,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(28,3,1,52,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(29,4,1,2,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(30,4,1,8,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(31,4,1,17,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(32,4,1,23,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(33,4,1,32,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(34,4,1,38,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(35,4,1,47,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(36,4,1,53,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(37,5,1,3,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(38,5,1,9,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(39,5,1,18,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(40,5,1,24,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(41,5,1,33,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(42,5,1,39,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(43,5,1,48,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(44,5,1,54,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(45,6,1,4,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(46,6,1,10,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(47,6,1,19,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(48,6,1,25,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(49,6,1,34,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(50,6,1,40,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(51,6,1,49,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(52,6,1,55,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(53,7,1,5,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(54,7,1,11,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(55,7,1,20,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(56,7,1,26,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(57,7,1,35,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(58,7,1,41,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(59,7,1,50,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(60,7,1,56,'2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0);
/*!40000 ALTER TABLE `DepositPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Depository`
--

DROP TABLE IF EXISTS `Depository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depository` (
  `DEPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `LID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(256) DEFAULT NULL,
  `AccountNo` varchar(256) DEFAULT NULL,
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DEPID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Depository`
--

LOCK TABLES `Depository` WRITE;
/*!40000 ALTER TABLE `Depository` DISABLE KEYS */;
INSERT INTO `Depository` VALUES (1,1,3,'Wells Fargo','987654321','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(2,1,4,'Bank Of America','12345678','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0);
/*!40000 ALTER TABLE `Depository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Expense`
--

DROP TABLE IF EXISTS `Expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Expense` (
  `EXPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RPEXPID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `Dt` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `AcctRule` varchar(200) NOT NULL DEFAULT '',
  `ARID` bigint(20) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Comment` varchar(256) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EXPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Expense`
--

LOCK TABLES `Expense` WRITE;
/*!40000 ALTER TABLE `Expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `Expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flow`
--

DROP TABLE IF EXISTS `Flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flow` (
  `FlowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `UserRefNo` varchar(50) NOT NULL DEFAULT '',
  `FlowType` varchar(50) NOT NULL DEFAULT '',
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `Data` json DEFAULT NULL,
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FlowID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flow`
--

LOCK TABLES `Flow` WRITE;
/*!40000 ALTER TABLE `Flow` DISABLE KEYS */;
/*!40000 ALTER TABLE `Flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GLAccount`
--

DROP TABLE IF EXISTS `GLAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GLAccount` (
  `LID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PLID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `GLNumber` varchar(100) NOT NULL DEFAULT '',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `AcctType` varchar(100) NOT NULL DEFAULT '',
  `AllowPost` tinyint(1) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Description` varchar(1024) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GLAccount`
--

LOCK TABLES `GLAccount` WRITE;
/*!40000 ALTER TABLE `GLAccount` DISABLE KEYS */;
INSERT INTO `GLAccount` VALUES (1,0,1,0,0,'10000','Cash','Cash',0,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(2,0,1,0,0,'10100','Petty Cash','Cash',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(3,1,1,0,0,'10104','FRB 54320 (operating account)','Bank Account',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(4,1,1,0,0,'10105','FRB 96953 (deposit account)','Bank Account',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(5,1,1,0,0,'10199','Security Deposit Refund','Cash',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(6,1,1,0,0,'10999','Undeposited Funds','Cash',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(7,0,1,0,0,'11000','Credit Cards Funds in Transit','Cash',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(8,0,1,0,0,'12000','Accounts Receivable','Accounts Receivable',0,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(9,8,1,0,0,'12001','Rent Roll Receivables','Accounts Receivable',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(10,0,1,0,0,'12999','Unapplied Funds','Asset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(11,0,1,0,0,'30000','Security Deposit Liability','Liability Security Deposit',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(12,0,1,0,0,'30001','Floating Security Deposits','Liability Security Deposit',1,0,'Sec Dep posted before rentable identified','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(13,0,1,0,0,'30100','Collected Taxes','Liabilities',0,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(14,13,1,0,0,'30101','Sales Taxes Collected','Liabilities',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(15,13,1,0,0,'30102','Transient Occupancy Taxes Collected','Liabilities',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(16,13,1,0,0,'30199','Other Collected Taxes','Liabilities',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(17,0,1,0,0,'41000','Gross Scheduled Rent-Taxable','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(18,0,1,0,0,'41001','Gross Scheduled Rent-Not Taxable','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(19,0,1,0,0,'41100','Unit Income Offsets','Income Offset',0,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(20,19,1,0,0,'41101','Vacancy','Income Offset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(21,19,1,0,0,'41102','Loss (Gain) to Lease','Income Offset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(22,19,1,0,0,'41103','Employee Concessions','Income Offset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(23,19,1,0,0,'41104','Resident Concessions','Income Offset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(24,19,1,0,0,'41105','Owner Concession','Income Offset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(25,19,1,0,0,'41106','Administrative Concession','Income Offset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(26,19,1,0,0,'41107','Off Line Renovations','Income Offset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(27,19,1,0,0,'41108','Off Line Maintenance','Income Offset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(28,19,1,0,0,'41199','Othe Income Offsets','Income Offset',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(29,0,1,0,0,'41200','Service Fees','Income',0,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(30,29,1,0,0,'41201','Broadcast and IT Services','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(31,29,1,0,0,'41202','Food Services','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(32,29,1,0,0,'41203','Linen Services','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(33,29,1,0,0,'41204','Wash N Fold Services','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(34,29,1,0,0,'41299','Other Service Fees','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(35,0,1,0,0,'41300','Utility Fees','Income',0,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(36,35,1,0,0,'41301','Electric Base Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(37,35,1,0,0,'41302','Electric Overage','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(38,35,1,0,0,'41303','Water and Sewer Base Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(39,35,1,0,0,'41304','Water and Sewer Overage','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(40,35,1,0,0,'41305','Gas Base Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(41,35,1,0,0,'41306','Gas Overage','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(42,35,1,0,0,'41307','Trash Collection Base Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(43,35,1,0,0,'41308','Trash Collection Overage','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(44,35,1,0,0,'41399','Other Utility Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(45,0,1,0,0,'41400','Special Tenant Charges','Income',0,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(46,45,1,0,0,'41401','Application Fees','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(47,45,1,0,0,'41402','Late Fees','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(48,45,1,0,0,'41403','Insufficient Funds Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(49,45,1,0,0,'41404','Month to Month Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(50,45,1,0,0,'41405','Rentable Specialties','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(51,45,1,0,0,'41406','No Show or Termination Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(52,45,1,0,0,'41407','Pet Fees','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(53,45,1,0,0,'41408','Pet Rent','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(54,45,1,0,0,'41409','Tenant Expense Chargeback','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(55,45,1,0,0,'41410','Special Cleaning Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(56,45,1,0,0,'41411','Eviction Fee Reimbursement','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(57,45,1,0,0,'41412','Extra Person Charge','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(58,45,1,0,0,'41413','Security Deposit Forfeiture','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(59,45,1,0,0,'41414','Damage Fee','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(60,45,1,0,0,'41415','CAM Fees','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(61,45,1,0,0,'41499','Other Special Tenant Charges','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(62,0,1,0,0,'42000','Business Income','Income',0,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(63,62,1,0,0,'42100','Convenience Store','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(64,62,1,0,0,'42200','Fitness Center Revenue','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(65,62,1,0,0,'42300','Vending Income','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(66,62,1,0,0,'42400','Restaurant Sales','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(67,62,1,0,0,'42500','Bar Sales','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(68,62,1,0,0,'42600','Spa Sales','Income',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(69,0,1,0,0,'50000','Expenses','Expenses',0,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(70,69,1,0,0,'50001','Cash Over/Short','Expenses',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(71,69,1,0,0,'50002','Bad Debt','Expenses',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(72,69,1,0,0,'50003','Bank Service Fee','Expenses',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(73,69,1,0,0,'50999','Other Expenses','Expenses',1,0,'','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(74,0,1,0,0,'999911','test 1','Cash',1,0,'laskdjf','2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(75,45,1,0,0,'41416','Vehicle Fees','Income',1,0,'Vehicle Registration fees','2018-07-03 02:45:37',211,'2018-07-03 02:45:37',211);
/*!40000 ALTER TABLE `GLAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `InvoiceNo` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Dt` date NOT NULL DEFAULT '1970-01-01',
  `DtDue` date NOT NULL DEFAULT '1970-01-01',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `DeliveredBy` varchar(256) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`InvoiceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceAssessment`
--

DROP TABLE IF EXISTS `InvoiceAssessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceAssessment` (
  `InvoiceNo` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `ASMID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `InvoiceASMID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`InvoiceASMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceAssessment`
--

LOCK TABLES `InvoiceAssessment` WRITE;
/*!40000 ALTER TABLE `InvoiceAssessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceAssessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoicePayor`
--

DROP TABLE IF EXISTS `InvoicePayor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoicePayor` (
  `InvoiceNo` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `PID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `InvoicePayorID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`InvoicePayorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoicePayor`
--

LOCK TABLES `InvoicePayor` WRITE;
/*!40000 ALTER TABLE `InvoicePayor` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoicePayor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Journal`
--

DROP TABLE IF EXISTS `Journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Journal` (
  `JID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Dt` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `Type` smallint(6) NOT NULL DEFAULT '0',
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `Comment` varchar(256) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`JID`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Journal`
--

LOCK TABLES `Journal` WRITE;
/*!40000 ALTER TABLE `Journal` DISABLE KEYS */;
INSERT INTO `Journal` VALUES (1,1,'2018-03-01 00:00:00',1000.0000,1,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,'2018-04-01 00:00:00',1000.0000,1,3,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,1,'2018-05-01 00:00:00',1000.0000,1,4,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,1,'2018-06-01 00:00:00',1000.0000,1,5,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(5,1,'2018-07-01 00:00:00',1000.0000,1,6,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(6,1,'2018-02-13 00:00:00',2000.0000,1,7,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(7,1,'2018-03-01 00:00:00',10.0000,1,9,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(8,1,'2018-04-01 00:00:00',10.0000,1,10,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(9,1,'2018-05-01 00:00:00',10.0000,1,11,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(10,1,'2018-06-01 00:00:00',10.0000,1,12,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(11,1,'2018-07-01 00:00:00',10.0000,1,13,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(12,1,'2018-02-13 00:00:00',571.4300,1,14,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(13,1,'2018-02-13 00:00:00',50.0000,1,15,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(14,1,'2018-02-13 00:00:00',5.7100,1,16,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(15,1,'2018-02-13 00:00:00',10.0000,1,17,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(16,1,'2018-03-01 00:00:00',1000.0000,1,19,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(17,1,'2018-04-01 00:00:00',1000.0000,1,20,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(18,1,'2018-05-01 00:00:00',1000.0000,1,21,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(19,1,'2018-06-01 00:00:00',1000.0000,1,22,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(20,1,'2018-07-01 00:00:00',1000.0000,1,23,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(21,1,'2018-02-13 00:00:00',2000.0000,1,24,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(22,1,'2018-03-01 00:00:00',10.0000,1,26,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(23,1,'2018-04-01 00:00:00',10.0000,1,27,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(24,1,'2018-05-01 00:00:00',10.0000,1,28,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(25,1,'2018-06-01 00:00:00',10.0000,1,29,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(26,1,'2018-07-01 00:00:00',10.0000,1,30,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(27,1,'2018-02-13 00:00:00',571.4300,1,31,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(28,1,'2018-02-13 00:00:00',50.0000,1,32,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(29,1,'2018-02-13 00:00:00',5.7100,1,33,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(30,1,'2018-02-13 00:00:00',10.0000,1,34,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(31,1,'2018-03-01 00:00:00',1500.0000,1,36,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(32,1,'2018-04-01 00:00:00',1500.0000,1,37,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(33,1,'2018-05-01 00:00:00',1500.0000,1,38,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(34,1,'2018-06-01 00:00:00',1500.0000,1,39,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(35,1,'2018-07-01 00:00:00',1500.0000,1,40,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(36,1,'2018-02-13 00:00:00',3000.0000,1,41,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(37,1,'2018-03-01 00:00:00',10.0000,1,43,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(38,1,'2018-04-01 00:00:00',10.0000,1,44,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(39,1,'2018-05-01 00:00:00',10.0000,1,45,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(40,1,'2018-06-01 00:00:00',10.0000,1,46,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(41,1,'2018-07-01 00:00:00',10.0000,1,47,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(42,1,'2018-02-13 00:00:00',857.1400,1,48,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(43,1,'2018-02-13 00:00:00',50.0000,1,49,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(44,1,'2018-02-13 00:00:00',5.7100,1,50,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(45,1,'2018-02-13 00:00:00',10.0000,1,51,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(46,1,'2018-03-01 00:00:00',1500.0000,1,53,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(47,1,'2018-04-01 00:00:00',1500.0000,1,54,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(48,1,'2018-05-01 00:00:00',1500.0000,1,55,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(49,1,'2018-06-01 00:00:00',1500.0000,1,56,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(50,1,'2018-07-01 00:00:00',1500.0000,1,57,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(51,1,'2018-02-13 00:00:00',3000.0000,1,58,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(52,1,'2018-03-01 00:00:00',10.0000,1,60,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(53,1,'2018-04-01 00:00:00',10.0000,1,61,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(54,1,'2018-05-01 00:00:00',10.0000,1,62,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(55,1,'2018-06-01 00:00:00',10.0000,1,63,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(56,1,'2018-07-01 00:00:00',10.0000,1,64,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(57,1,'2018-02-13 00:00:00',857.1400,1,65,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(58,1,'2018-02-13 00:00:00',50.0000,1,66,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(59,1,'2018-02-13 00:00:00',5.7100,1,67,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(60,1,'2018-02-13 00:00:00',10.0000,1,68,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(61,1,'2018-03-01 00:00:00',1000.0000,2,1,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(62,1,'2018-04-01 00:00:00',1000.0000,2,2,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(63,1,'2018-05-01 00:00:00',1000.0000,2,3,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(64,1,'2018-06-01 00:00:00',1000.0000,2,4,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(65,1,'2018-07-01 00:00:00',1000.0000,2,5,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(66,1,'2018-02-13 00:00:00',2000.0000,2,6,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(67,1,'2018-03-01 00:00:00',10.0000,2,7,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(68,1,'2018-04-01 00:00:00',10.0000,2,8,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(69,1,'2018-05-01 00:00:00',10.0000,2,9,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(70,1,'2018-06-01 00:00:00',10.0000,2,10,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(71,1,'2018-07-01 00:00:00',10.0000,2,11,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(72,1,'2018-02-13 00:00:00',571.4300,2,12,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(73,1,'2018-02-13 00:00:00',50.0000,2,13,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(74,1,'2018-02-13 00:00:00',5.7100,2,14,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(75,1,'2018-02-13 00:00:00',10.0000,2,15,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(76,1,'2018-03-01 00:00:00',1000.0000,2,16,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(77,1,'2018-04-01 00:00:00',1000.0000,2,17,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(78,1,'2018-05-01 00:00:00',1000.0000,2,18,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(79,1,'2018-06-01 00:00:00',1000.0000,2,19,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(80,1,'2018-07-01 00:00:00',1000.0000,2,20,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(81,1,'2018-02-13 00:00:00',2000.0000,2,21,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(82,1,'2018-03-01 00:00:00',10.0000,2,22,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(83,1,'2018-04-01 00:00:00',10.0000,2,23,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(84,1,'2018-05-01 00:00:00',10.0000,2,24,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(85,1,'2018-06-01 00:00:00',10.0000,2,25,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(86,1,'2018-07-01 00:00:00',10.0000,2,26,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(87,1,'2018-02-13 00:00:00',571.4300,2,27,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(88,1,'2018-02-13 00:00:00',50.0000,2,28,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(89,1,'2018-02-13 00:00:00',5.7100,2,29,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(90,1,'2018-02-13 00:00:00',10.0000,2,30,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(91,1,'2018-03-01 00:00:00',1500.0000,2,31,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(92,1,'2018-04-01 00:00:00',1500.0000,2,32,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(93,1,'2018-05-01 00:00:00',1500.0000,2,33,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(94,1,'2018-06-01 00:00:00',1500.0000,2,34,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(95,1,'2018-07-01 00:00:00',1500.0000,2,35,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(96,1,'2018-02-13 00:00:00',3000.0000,2,36,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(97,1,'2018-03-01 00:00:00',10.0000,2,37,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(98,1,'2018-04-01 00:00:00',10.0000,2,38,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(99,1,'2018-05-01 00:00:00',10.0000,2,39,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(100,1,'2018-06-01 00:00:00',10.0000,2,40,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(101,1,'2018-07-01 00:00:00',10.0000,2,41,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(102,1,'2018-02-13 00:00:00',857.1400,2,42,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(103,1,'2018-02-13 00:00:00',50.0000,2,43,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(104,1,'2018-02-13 00:00:00',5.7100,2,44,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(105,1,'2018-02-13 00:00:00',10.0000,2,45,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(106,1,'2018-03-01 00:00:00',1500.0000,2,46,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(107,1,'2018-04-01 00:00:00',1500.0000,2,47,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(108,1,'2018-05-01 00:00:00',1500.0000,2,48,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(109,1,'2018-06-01 00:00:00',1500.0000,2,49,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(110,1,'2018-07-01 00:00:00',1500.0000,2,50,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(111,1,'2018-02-13 00:00:00',3000.0000,2,51,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(112,1,'2018-03-01 00:00:00',10.0000,2,52,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(113,1,'2018-04-01 00:00:00',10.0000,2,53,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(114,1,'2018-05-01 00:00:00',10.0000,2,54,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(115,1,'2018-06-01 00:00:00',10.0000,2,55,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(116,1,'2018-07-01 00:00:00',10.0000,2,56,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(117,1,'2018-02-13 00:00:00',857.1400,2,57,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(118,1,'2018-02-13 00:00:00',50.0000,2,58,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(119,1,'2018-02-13 00:00:00',5.7100,2,59,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(120,1,'2018-02-13 00:00:00',10.0000,2,60,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(121,1,'2018-02-13 00:00:00',2000.0000,2,21,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(122,1,'2018-02-13 00:00:00',571.4300,2,27,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(123,1,'2018-02-13 00:00:00',50.0000,2,28,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(124,1,'2018-02-13 00:00:00',5.7100,2,29,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(125,1,'2018-02-13 00:00:00',10.0000,2,30,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(126,1,'2018-03-01 00:00:00',1000.0000,2,16,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(127,1,'2018-03-01 00:00:00',10.0000,2,22,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(128,1,'2018-04-01 00:00:00',1000.0000,2,17,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(129,1,'2018-04-01 00:00:00',10.0000,2,23,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(130,1,'2018-05-01 00:00:00',1000.0000,2,18,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(131,1,'2018-05-01 00:00:00',10.0000,2,24,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(132,1,'2018-06-01 00:00:00',1000.0000,2,19,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(133,1,'2018-06-01 00:00:00',10.0000,2,25,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(134,1,'2018-07-01 00:00:00',1000.0000,2,20,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(135,1,'2018-07-01 00:00:00',10.0000,2,26,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(136,1,'2018-02-13 00:00:00',3000.0000,2,36,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(137,1,'2018-02-13 00:00:00',857.1400,2,42,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(138,1,'2018-02-13 00:00:00',50.0000,2,43,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(139,1,'2018-02-13 00:00:00',5.7100,2,44,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(140,1,'2018-02-13 00:00:00',10.0000,2,45,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(141,1,'2018-03-01 00:00:00',1500.0000,2,31,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(142,1,'2018-03-01 00:00:00',10.0000,2,37,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(143,1,'2018-04-01 00:00:00',1500.0000,2,32,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(144,1,'2018-04-01 00:00:00',10.0000,2,38,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(145,1,'2018-05-01 00:00:00',1500.0000,2,33,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(146,1,'2018-05-01 00:00:00',10.0000,2,39,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(147,1,'2018-06-01 00:00:00',1500.0000,2,34,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(148,1,'2018-06-01 00:00:00',10.0000,2,40,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(149,1,'2018-07-01 00:00:00',1500.0000,2,35,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(150,1,'2018-07-01 00:00:00',10.0000,2,41,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(151,1,'2018-02-13 00:00:00',3000.0000,2,51,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(152,1,'2018-02-13 00:00:00',857.1400,2,57,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(153,1,'2018-02-13 00:00:00',50.0000,2,58,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(154,1,'2018-02-13 00:00:00',5.7100,2,59,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(155,1,'2018-02-13 00:00:00',10.0000,2,60,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(156,1,'2018-03-01 00:00:00',1500.0000,2,46,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(157,1,'2018-03-01 00:00:00',10.0000,2,52,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(158,1,'2018-04-01 00:00:00',1500.0000,2,47,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(159,1,'2018-04-01 00:00:00',10.0000,2,53,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(160,1,'2018-05-01 00:00:00',1500.0000,2,48,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(161,1,'2018-05-01 00:00:00',10.0000,2,54,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(162,1,'2018-06-01 00:00:00',1500.0000,2,49,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(163,1,'2018-06-01 00:00:00',10.0000,2,55,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(164,1,'2018-07-01 00:00:00',1500.0000,2,50,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(165,1,'2018-07-01 00:00:00',10.0000,2,56,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(166,1,'2018-02-13 00:00:00',2000.0000,2,6,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(167,1,'2018-02-13 00:00:00',571.4300,2,12,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(168,1,'2018-02-13 00:00:00',50.0000,2,13,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(169,1,'2018-02-13 00:00:00',5.7100,2,14,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(170,1,'2018-02-13 00:00:00',10.0000,2,15,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(171,1,'2018-03-01 00:00:00',1000.0000,2,1,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(172,1,'2018-03-01 00:00:00',10.0000,2,7,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(173,1,'2018-04-01 00:00:00',1000.0000,2,2,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(174,1,'2018-04-01 00:00:00',10.0000,2,8,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(175,1,'2018-05-01 00:00:00',1000.0000,2,3,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(176,1,'2018-05-01 00:00:00',10.0000,2,9,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(177,1,'2018-06-01 00:00:00',1000.0000,2,4,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(178,1,'2018-06-01 00:00:00',10.0000,2,10,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(179,1,'2018-07-01 00:00:00',1000.0000,2,5,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(180,1,'2018-07-01 00:00:00',10.0000,2,11,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(181,1,'2018-02-13 00:00:00',571.4300,4,12,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(182,1,'2018-02-13 00:00:00',50.0000,4,13,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(183,1,'2018-02-13 00:00:00',5.7100,4,14,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(184,1,'2018-02-13 00:00:00',10.0000,4,15,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(185,1,'2018-02-13 00:00:00',571.4300,4,27,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(186,1,'2018-02-13 00:00:00',50.0000,4,28,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(187,1,'2018-02-13 00:00:00',5.7100,4,29,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(188,1,'2018-02-13 00:00:00',10.0000,4,30,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(189,1,'2018-02-13 00:00:00',857.1400,4,42,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(190,1,'2018-02-13 00:00:00',50.0000,4,43,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(191,1,'2018-02-13 00:00:00',5.7100,4,44,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(192,1,'2018-02-13 00:00:00',10.0000,4,45,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(193,1,'2018-02-13 00:00:00',857.1400,4,57,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(194,1,'2018-02-13 00:00:00',50.0000,4,58,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(195,1,'2018-02-13 00:00:00',5.7100,4,59,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(196,1,'2018-02-13 00:00:00',10.0000,4,60,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(197,1,'2018-02-13 00:00:00',2000.0000,4,6,'auto-transfer for deposit DEP-1','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(198,1,'2018-02-13 00:00:00',2000.0000,4,21,'auto-transfer for deposit DEP-1','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(199,1,'2018-02-13 00:00:00',3000.0000,4,36,'auto-transfer for deposit DEP-1','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(200,1,'2018-02-13 00:00:00',3000.0000,4,51,'auto-transfer for deposit DEP-1','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(201,1,'2018-03-01 00:00:00',1000.0000,4,1,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(202,1,'2018-03-01 00:00:00',10.0000,4,7,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(203,1,'2018-03-01 00:00:00',1000.0000,4,16,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(204,1,'2018-03-01 00:00:00',10.0000,4,22,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(205,1,'2018-03-01 00:00:00',1500.0000,4,31,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(206,1,'2018-03-01 00:00:00',10.0000,4,37,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(207,1,'2018-03-01 00:00:00',1500.0000,4,46,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(208,1,'2018-03-01 00:00:00',10.0000,4,52,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(209,1,'2018-04-01 00:00:00',1000.0000,4,2,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(210,1,'2018-04-01 00:00:00',10.0000,4,8,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(211,1,'2018-04-01 00:00:00',1000.0000,4,17,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(212,1,'2018-04-01 00:00:00',10.0000,4,23,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(213,1,'2018-04-01 00:00:00',1500.0000,4,32,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(214,1,'2018-04-01 00:00:00',10.0000,4,38,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(215,1,'2018-04-01 00:00:00',1500.0000,4,47,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(216,1,'2018-04-01 00:00:00',10.0000,4,53,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(217,1,'2018-05-01 00:00:00',1000.0000,4,3,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(218,1,'2018-05-01 00:00:00',10.0000,4,9,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(219,1,'2018-05-01 00:00:00',1000.0000,4,18,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(220,1,'2018-05-01 00:00:00',10.0000,4,24,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(221,1,'2018-05-01 00:00:00',1500.0000,4,33,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(222,1,'2018-05-01 00:00:00',10.0000,4,39,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(223,1,'2018-05-01 00:00:00',1500.0000,4,48,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(224,1,'2018-05-01 00:00:00',10.0000,4,54,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(225,1,'2018-06-01 00:00:00',1000.0000,4,4,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(226,1,'2018-06-01 00:00:00',10.0000,4,10,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(227,1,'2018-06-01 00:00:00',1000.0000,4,19,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(228,1,'2018-06-01 00:00:00',10.0000,4,25,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(229,1,'2018-06-01 00:00:00',1500.0000,4,34,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(230,1,'2018-06-01 00:00:00',10.0000,4,40,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(231,1,'2018-06-01 00:00:00',1500.0000,4,49,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(232,1,'2018-06-01 00:00:00',10.0000,4,55,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(233,1,'2018-07-01 00:00:00',1000.0000,4,5,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(234,1,'2018-07-01 00:00:00',10.0000,4,11,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(235,1,'2018-07-01 00:00:00',1000.0000,4,20,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(236,1,'2018-07-01 00:00:00',10.0000,4,26,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(237,1,'2018-07-01 00:00:00',1500.0000,4,35,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(238,1,'2018-07-01 00:00:00',10.0000,4,41,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(239,1,'2018-07-01 00:00:00',1500.0000,4,50,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(240,1,'2018-07-01 00:00:00',10.0000,4,56,'auto-transfer for deposit DEP-2','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0);
/*!40000 ALTER TABLE `Journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JournalAllocation`
--

DROP TABLE IF EXISTS `JournalAllocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JournalAllocation` (
  `JAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `JID` bigint(20) NOT NULL DEFAULT '0',
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `RCPTID` bigint(20) NOT NULL DEFAULT '0',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `ASMID` bigint(20) NOT NULL DEFAULT '0',
  `EXPID` bigint(20) NOT NULL DEFAULT '0',
  `AcctRule` varchar(200) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`JAID`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JournalAllocation`
--

LOCK TABLES `JournalAllocation` WRITE;
/*!40000 ALTER TABLE `JournalAllocation` DISABLE KEYS */;
INSERT INTO `JournalAllocation` VALUES (1,1,1,1,1,0,0,1000.0000,2,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,2,1,1,0,0,1000.0000,3,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,1,3,1,1,0,0,1000.0000,4,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,1,4,1,1,0,0,1000.0000,5,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(5,1,5,1,1,0,0,1000.0000,6,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(6,1,6,1,1,0,0,2000.0000,7,0,'d 12001 2000.00, c 30000 2000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(7,1,7,1,1,0,0,10.0000,9,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(8,1,8,1,1,0,0,10.0000,10,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(9,1,9,1,1,0,0,10.0000,11,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(10,1,10,1,1,0,0,10.0000,12,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(11,1,11,1,1,0,0,10.0000,13,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(12,1,12,1,1,0,0,571.4300,14,0,'d 12001 571.43, c 41001 571.43','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(13,1,13,1,1,0,0,50.0000,15,0,'d 12001 50.00, c 41407 50.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(14,1,14,1,1,0,0,5.7100,16,0,'d 12001 5.71, c 41408 5.71','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(15,1,15,1,1,0,0,10.0000,17,0,'d 12001 10.00, c 41416 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(16,1,16,2,2,0,0,1000.0000,19,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(17,1,17,2,2,0,0,1000.0000,20,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(18,1,18,2,2,0,0,1000.0000,21,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(19,1,19,2,2,0,0,1000.0000,22,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(20,1,20,2,2,0,0,1000.0000,23,0,'d 12001 1000.00, c 41001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(21,1,21,2,2,0,0,2000.0000,24,0,'d 12001 2000.00, c 30000 2000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(22,1,22,2,2,0,0,10.0000,26,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(23,1,23,2,2,0,0,10.0000,27,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(24,1,24,2,2,0,0,10.0000,28,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(25,1,25,2,2,0,0,10.0000,29,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(26,1,26,2,2,0,0,10.0000,30,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(27,1,27,2,2,0,0,571.4300,31,0,'d 12001 571.43, c 41001 571.43','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(28,1,28,2,2,0,0,50.0000,32,0,'d 12001 50.00, c 41407 50.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(29,1,29,2,2,0,0,5.7100,33,0,'d 12001 5.71, c 41408 5.71','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(30,1,30,2,2,0,0,10.0000,34,0,'d 12001 10.00, c 41416 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(31,1,31,3,3,0,0,1500.0000,36,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(32,1,32,3,3,0,0,1500.0000,37,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(33,1,33,3,3,0,0,1500.0000,38,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(34,1,34,3,3,0,0,1500.0000,39,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(35,1,35,3,3,0,0,1500.0000,40,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(36,1,36,3,3,0,0,3000.0000,41,0,'d 12001 3000.00, c 30000 3000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(37,1,37,3,3,0,0,10.0000,43,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(38,1,38,3,3,0,0,10.0000,44,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(39,1,39,3,3,0,0,10.0000,45,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(40,1,40,3,3,0,0,10.0000,46,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(41,1,41,3,3,0,0,10.0000,47,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(42,1,42,3,3,0,0,857.1400,48,0,'d 12001 857.14, c 41001 857.14','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(43,1,43,3,3,0,0,50.0000,49,0,'d 12001 50.00, c 41407 50.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(44,1,44,3,3,0,0,5.7100,50,0,'d 12001 5.71, c 41408 5.71','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(45,1,45,3,3,0,0,10.0000,51,0,'d 12001 10.00, c 41416 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(46,1,46,4,4,0,0,1500.0000,53,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(47,1,47,4,4,0,0,1500.0000,54,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(48,1,48,4,4,0,0,1500.0000,55,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(49,1,49,4,4,0,0,1500.0000,56,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(50,1,50,4,4,0,0,1500.0000,57,0,'d 12001 1500.00, c 41001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(51,1,51,4,4,0,0,3000.0000,58,0,'d 12001 3000.00, c 30000 3000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(52,1,52,4,4,0,0,10.0000,60,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(53,1,53,4,4,0,0,10.0000,61,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(54,1,54,4,4,0,0,10.0000,62,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(55,1,55,4,4,0,0,10.0000,63,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(56,1,56,4,4,0,0,10.0000,64,0,'d 12001 10.00, c 41408 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(57,1,57,4,4,0,0,857.1400,65,0,'d 12001 857.14, c 41001 857.14','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(58,1,58,4,4,0,0,50.0000,66,0,'d 12001 50.00, c 41407 50.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(59,1,59,4,4,0,0,5.7100,67,0,'d 12001 5.71, c 41408 5.71','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(60,1,60,4,4,0,0,10.0000,68,0,'d 12001 10.00, c 41416 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(61,1,61,0,0,1,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(62,1,62,0,0,1,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(63,1,63,0,0,1,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(64,1,64,0,0,1,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(65,1,65,0,0,1,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(66,1,66,0,0,1,0,2000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(67,1,67,0,0,1,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(68,1,68,0,0,1,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(69,1,69,0,0,1,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(70,1,70,0,0,1,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(71,1,71,0,0,1,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(72,1,72,0,0,1,0,571.4300,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(73,1,73,0,0,1,0,50.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(74,1,74,0,0,1,0,5.7100,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(75,1,75,0,0,1,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(76,1,76,0,0,2,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(77,1,77,0,0,2,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(78,1,78,0,0,2,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(79,1,79,0,0,2,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(80,1,80,0,0,2,0,1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(81,1,81,0,0,2,0,2000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(82,1,82,0,0,2,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(83,1,83,0,0,2,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(84,1,84,0,0,2,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(85,1,85,0,0,2,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(86,1,86,0,0,2,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(87,1,87,0,0,2,0,571.4300,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(88,1,88,0,0,2,0,50.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(89,1,89,0,0,2,0,5.7100,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(90,1,90,0,0,2,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(91,1,91,0,0,3,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(92,1,92,0,0,3,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(93,1,93,0,0,3,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(94,1,94,0,0,3,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(95,1,95,0,0,3,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(96,1,96,0,0,3,0,3000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(97,1,97,0,0,3,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(98,1,98,0,0,3,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(99,1,99,0,0,3,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(100,1,100,0,0,3,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(101,1,101,0,0,3,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(102,1,102,0,0,3,0,857.1400,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(103,1,103,0,0,3,0,50.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(104,1,104,0,0,3,0,5.7100,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(105,1,105,0,0,3,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(106,1,106,0,0,4,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(107,1,107,0,0,4,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(108,1,108,0,0,4,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(109,1,109,0,0,4,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(110,1,110,0,0,4,0,1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(111,1,111,0,0,4,0,3000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(112,1,112,0,0,4,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(113,1,113,0,0,4,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(114,1,114,0,0,4,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(115,1,115,0,0,4,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(116,1,116,0,0,4,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(117,1,117,0,0,4,0,857.1400,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(118,1,118,0,0,4,0,50.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(119,1,119,0,0,4,0,5.7100,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(120,1,120,0,0,4,0,10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(121,1,121,2,2,2,21,2000.0000,24,0,'ASM(24) d 12999 2000.00,c 12001 2000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(122,1,122,2,2,2,27,571.4300,31,0,'ASM(31) d 12999 571.43,c 12001 571.43','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(123,1,123,2,2,2,28,50.0000,32,0,'ASM(32) d 12999 50.00,c 12001 50.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(124,1,124,2,2,2,29,5.7100,33,0,'ASM(33) d 12999 5.71,c 12001 5.71','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(125,1,125,2,2,2,30,10.0000,34,0,'ASM(34) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(126,1,126,2,2,2,16,1000.0000,19,0,'ASM(19) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(127,1,127,2,2,2,22,10.0000,26,0,'ASM(26) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(128,1,128,2,2,2,17,1000.0000,20,0,'ASM(20) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(129,1,129,2,2,2,23,10.0000,27,0,'ASM(27) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(130,1,130,2,2,2,18,1000.0000,21,0,'ASM(21) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(131,1,131,2,2,2,24,10.0000,28,0,'ASM(28) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(132,1,132,2,2,2,19,1000.0000,22,0,'ASM(22) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(133,1,133,2,2,2,25,10.0000,29,0,'ASM(29) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(134,1,134,2,2,2,20,1000.0000,23,0,'ASM(23) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(135,1,135,2,2,2,26,10.0000,30,0,'ASM(30) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(136,1,136,3,3,3,36,3000.0000,41,0,'ASM(41) d 12999 3000.00,c 12001 3000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(137,1,137,3,3,3,42,857.1400,48,0,'ASM(48) d 12999 857.14,c 12001 857.14','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(138,1,138,3,3,3,43,50.0000,49,0,'ASM(49) d 12999 50.00,c 12001 50.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(139,1,139,3,3,3,44,5.7100,50,0,'ASM(50) d 12999 5.71,c 12001 5.71','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(140,1,140,3,3,3,45,10.0000,51,0,'ASM(51) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(141,1,141,3,3,3,31,1500.0000,36,0,'ASM(36) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(142,1,142,3,3,3,37,10.0000,43,0,'ASM(43) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(143,1,143,3,3,3,32,1500.0000,37,0,'ASM(37) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(144,1,144,3,3,3,38,10.0000,44,0,'ASM(44) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(145,1,145,3,3,3,33,1500.0000,38,0,'ASM(38) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(146,1,146,3,3,3,39,10.0000,45,0,'ASM(45) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(147,1,147,3,3,3,34,1500.0000,39,0,'ASM(39) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(148,1,148,3,3,3,40,10.0000,46,0,'ASM(46) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(149,1,149,3,3,3,35,1500.0000,40,0,'ASM(40) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(150,1,150,3,3,3,41,10.0000,47,0,'ASM(47) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(151,1,151,4,4,4,51,3000.0000,58,0,'ASM(58) d 12999 3000.00,c 12001 3000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(152,1,152,4,4,4,57,857.1400,65,0,'ASM(65) d 12999 857.14,c 12001 857.14','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(153,1,153,4,4,4,58,50.0000,66,0,'ASM(66) d 12999 50.00,c 12001 50.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(154,1,154,4,4,4,59,5.7100,67,0,'ASM(67) d 12999 5.71,c 12001 5.71','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(155,1,155,4,4,4,60,10.0000,68,0,'ASM(68) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(156,1,156,4,4,4,46,1500.0000,53,0,'ASM(53) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(157,1,157,4,4,4,52,10.0000,60,0,'ASM(60) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(158,1,158,4,4,4,47,1500.0000,54,0,'ASM(54) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(159,1,159,4,4,4,53,10.0000,61,0,'ASM(61) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(160,1,160,4,4,4,48,1500.0000,55,0,'ASM(55) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(161,1,161,4,4,4,54,10.0000,62,0,'ASM(62) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(162,1,162,4,4,4,49,1500.0000,56,0,'ASM(56) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(163,1,163,4,4,4,55,10.0000,63,0,'ASM(63) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(164,1,164,4,4,4,50,1500.0000,57,0,'ASM(57) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(165,1,165,4,4,4,56,10.0000,64,0,'ASM(64) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(166,1,166,1,1,1,6,2000.0000,7,0,'ASM(7) d 12999 2000.00,c 12001 2000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(167,1,167,1,1,1,12,571.4300,14,0,'ASM(14) d 12999 571.43,c 12001 571.43','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(168,1,168,1,1,1,13,50.0000,15,0,'ASM(15) d 12999 50.00,c 12001 50.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(169,1,169,1,1,1,14,5.7100,16,0,'ASM(16) d 12999 5.71,c 12001 5.71','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(170,1,170,1,1,1,15,10.0000,17,0,'ASM(17) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(171,1,171,1,1,1,1,1000.0000,2,0,'ASM(2) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(172,1,172,1,1,1,7,10.0000,9,0,'ASM(9) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(173,1,173,1,1,1,2,1000.0000,3,0,'ASM(3) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(174,1,174,1,1,1,8,10.0000,10,0,'ASM(10) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(175,1,175,1,1,1,3,1000.0000,4,0,'ASM(4) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(176,1,176,1,1,1,9,10.0000,11,0,'ASM(11) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(177,1,177,1,1,1,4,1000.0000,5,0,'ASM(5) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(178,1,178,1,1,1,10,10.0000,12,0,'ASM(12) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(179,1,179,1,1,1,5,1000.0000,6,0,'ASM(6) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(180,1,180,1,1,1,11,10.0000,13,0,'ASM(13) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(181,1,181,0,1,1,12,571.4300,14,0,'d 10105 571.4300, c 10999 571.4300','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(182,1,182,0,1,1,13,50.0000,15,0,'d 10105 50.0000, c 10999 50.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(183,1,183,0,1,1,14,5.7100,16,0,'d 10105 5.7100, c 10999 5.7100','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(184,1,184,0,1,1,15,10.0000,17,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(185,1,185,0,2,2,27,571.4300,31,0,'d 10105 571.4300, c 10999 571.4300','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(186,1,186,0,2,2,28,50.0000,32,0,'d 10105 50.0000, c 10999 50.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(187,1,187,0,2,2,29,5.7100,33,0,'d 10105 5.7100, c 10999 5.7100','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(188,1,188,0,2,2,30,10.0000,34,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(189,1,189,0,3,3,42,857.1400,48,0,'d 10105 857.1400, c 10999 857.1400','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(190,1,190,0,3,3,43,50.0000,49,0,'d 10105 50.0000, c 10999 50.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(191,1,191,0,3,3,44,5.7100,50,0,'d 10105 5.7100, c 10999 5.7100','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(192,1,192,0,3,3,45,10.0000,51,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(193,1,193,0,4,4,57,857.1400,65,0,'d 10105 857.1400, c 10999 857.1400','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(194,1,194,0,4,4,58,50.0000,66,0,'d 10105 50.0000, c 10999 50.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(195,1,195,0,4,4,59,5.7100,67,0,'d 10105 5.7100, c 10999 5.7100','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(196,1,196,0,4,4,60,10.0000,68,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(197,1,197,0,1,1,6,2000.0000,7,0,'d 10104 2000.0000, c 10999 2000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(198,1,198,0,2,2,21,2000.0000,24,0,'d 10104 2000.0000, c 10999 2000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(199,1,199,0,3,3,36,3000.0000,41,0,'d 10104 3000.0000, c 10999 3000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(200,1,200,0,4,4,51,3000.0000,58,0,'d 10104 3000.0000, c 10999 3000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(201,1,201,0,1,1,1,1000.0000,2,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(202,1,202,0,1,1,7,10.0000,9,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(203,1,203,0,2,2,16,1000.0000,19,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(204,1,204,0,2,2,22,10.0000,26,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(205,1,205,0,3,3,31,1500.0000,36,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(206,1,206,0,3,3,37,10.0000,43,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(207,1,207,0,4,4,46,1500.0000,53,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(208,1,208,0,4,4,52,10.0000,60,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(209,1,209,0,1,1,2,1000.0000,3,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(210,1,210,0,1,1,8,10.0000,10,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(211,1,211,0,2,2,17,1000.0000,20,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(212,1,212,0,2,2,23,10.0000,27,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(213,1,213,0,3,3,32,1500.0000,37,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(214,1,214,0,3,3,38,10.0000,44,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(215,1,215,0,4,4,47,1500.0000,54,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(216,1,216,0,4,4,53,10.0000,61,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(217,1,217,0,1,1,3,1000.0000,4,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(218,1,218,0,1,1,9,10.0000,11,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(219,1,219,0,2,2,18,1000.0000,21,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(220,1,220,0,2,2,24,10.0000,28,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(221,1,221,0,3,3,33,1500.0000,38,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(222,1,222,0,3,3,39,10.0000,45,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(223,1,223,0,4,4,48,1500.0000,55,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(224,1,224,0,4,4,54,10.0000,62,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(225,1,225,0,1,1,4,1000.0000,5,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(226,1,226,0,1,1,10,10.0000,12,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(227,1,227,0,2,2,19,1000.0000,22,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(228,1,228,0,2,2,25,10.0000,29,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(229,1,229,0,3,3,34,1500.0000,39,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(230,1,230,0,3,3,40,10.0000,46,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(231,1,231,0,4,4,49,1500.0000,56,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(232,1,232,0,4,4,55,10.0000,63,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(233,1,233,0,1,1,5,1000.0000,6,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(234,1,234,0,1,1,11,10.0000,13,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(235,1,235,0,2,2,20,1000.0000,23,0,'d 10105 1000.0000, c 10999 1000.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(236,1,236,0,2,2,26,10.0000,30,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(237,1,237,0,3,3,35,1500.0000,40,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(238,1,238,0,3,3,41,10.0000,47,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(239,1,239,0,4,4,50,1500.0000,57,0,'d 10105 1500.0000, c 10999 1500.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(240,1,240,0,4,4,56,10.0000,64,0,'d 10105 10.0000, c 10999 10.0000','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0);
/*!40000 ALTER TABLE `JournalAllocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JournalAudit`
--

DROP TABLE IF EXISTS `JournalAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JournalAudit` (
  `JID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `UID` mediumint(9) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JournalAudit`
--

LOCK TABLES `JournalAudit` WRITE;
/*!40000 ALTER TABLE `JournalAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `JournalAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JournalMarker`
--

DROP TABLE IF EXISTS `JournalMarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JournalMarker` (
  `JMID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `State` smallint(6) NOT NULL DEFAULT '0',
  `DtStart` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtStop` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`JMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JournalMarker`
--

LOCK TABLES `JournalMarker` WRITE;
/*!40000 ALTER TABLE `JournalMarker` DISABLE KEYS */;
/*!40000 ALTER TABLE `JournalMarker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JournalMarkerAudit`
--

DROP TABLE IF EXISTS `JournalMarkerAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JournalMarkerAudit` (
  `JMID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `UID` mediumint(9) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JournalMarkerAudit`
--

LOCK TABLES `JournalMarkerAudit` WRITE;
/*!40000 ALTER TABLE `JournalMarkerAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `JournalMarkerAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LeadSource`
--

DROP TABLE IF EXISTS `LeadSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LeadSource` (
  `LSID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(100) DEFAULT NULL,
  `IndustrySLID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LeadSource`
--

LOCK TABLES `LeadSource` WRITE;
/*!40000 ALTER TABLE `LeadSource` DISABLE KEYS */;
/*!40000 ALTER TABLE `LeadSource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LedgerAudit`
--

DROP TABLE IF EXISTS `LedgerAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LedgerAudit` (
  `LEID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `UID` mediumint(9) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LedgerAudit`
--

LOCK TABLES `LedgerAudit` WRITE;
/*!40000 ALTER TABLE `LedgerAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `LedgerAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LedgerEntry`
--

DROP TABLE IF EXISTS `LedgerEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LedgerEntry` (
  `LEID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `JID` bigint(20) NOT NULL DEFAULT '0',
  `JAID` bigint(20) NOT NULL DEFAULT '0',
  `LID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `Dt` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `Comment` varchar(256) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LEID`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LedgerEntry`
--

LOCK TABLES `LedgerEntry` WRITE;
/*!40000 ALTER TABLE `LedgerEntry` DISABLE KEYS */;
INSERT INTO `LedgerEntry` VALUES (1,1,1,1,9,1,1,0,'2018-03-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,1,1,18,1,1,0,'2018-03-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,1,2,2,9,1,1,0,'2018-04-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,1,2,2,18,1,1,0,'2018-04-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(5,1,3,3,9,1,1,0,'2018-05-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(6,1,3,3,18,1,1,0,'2018-05-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(7,1,4,4,9,1,1,0,'2018-06-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(8,1,4,4,18,1,1,0,'2018-06-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(9,1,5,5,9,1,1,0,'2018-07-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(10,1,5,5,18,1,1,0,'2018-07-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(11,1,6,6,9,1,1,0,'2018-02-13 00:00:00',2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(12,1,6,6,11,1,1,0,'2018-02-13 00:00:00',-2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(13,1,7,7,9,1,1,0,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(14,1,7,7,53,1,1,0,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(15,1,8,8,9,1,1,0,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(16,1,8,8,53,1,1,0,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(17,1,9,9,9,1,1,0,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(18,1,9,9,53,1,1,0,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(19,1,10,10,9,1,1,0,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(20,1,10,10,53,1,1,0,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(21,1,11,11,9,1,1,0,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(22,1,11,11,53,1,1,0,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(23,1,12,12,9,1,1,0,'2018-02-13 00:00:00',571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(24,1,12,12,18,1,1,0,'2018-02-13 00:00:00',-571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(25,1,13,13,9,1,1,0,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(26,1,13,13,52,1,1,0,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(27,1,14,14,9,1,1,0,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(28,1,14,14,53,1,1,0,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(29,1,15,15,9,1,1,0,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(30,1,15,15,75,1,1,0,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(31,1,16,16,9,2,2,0,'2018-03-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(32,1,16,16,18,2,2,0,'2018-03-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(33,1,17,17,9,2,2,0,'2018-04-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(34,1,17,17,18,2,2,0,'2018-04-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(35,1,18,18,9,2,2,0,'2018-05-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(36,1,18,18,18,2,2,0,'2018-05-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(37,1,19,19,9,2,2,0,'2018-06-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(38,1,19,19,18,2,2,0,'2018-06-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(39,1,20,20,9,2,2,0,'2018-07-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(40,1,20,20,18,2,2,0,'2018-07-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(41,1,21,21,9,2,2,0,'2018-02-13 00:00:00',2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(42,1,21,21,11,2,2,0,'2018-02-13 00:00:00',-2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(43,1,22,22,9,2,2,0,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(44,1,22,22,53,2,2,0,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(45,1,23,23,9,2,2,0,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(46,1,23,23,53,2,2,0,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(47,1,24,24,9,2,2,0,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(48,1,24,24,53,2,2,0,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(49,1,25,25,9,2,2,0,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(50,1,25,25,53,2,2,0,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(51,1,26,26,9,2,2,0,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(52,1,26,26,53,2,2,0,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(53,1,27,27,9,2,2,0,'2018-02-13 00:00:00',571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(54,1,27,27,18,2,2,0,'2018-02-13 00:00:00',-571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(55,1,28,28,9,2,2,0,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(56,1,28,28,52,2,2,0,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(57,1,29,29,9,2,2,0,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(58,1,29,29,53,2,2,0,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(59,1,30,30,9,2,2,0,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(60,1,30,30,75,2,2,0,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(61,1,31,31,9,3,3,0,'2018-03-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(62,1,31,31,18,3,3,0,'2018-03-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(63,1,32,32,9,3,3,0,'2018-04-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(64,1,32,32,18,3,3,0,'2018-04-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(65,1,33,33,9,3,3,0,'2018-05-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(66,1,33,33,18,3,3,0,'2018-05-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(67,1,34,34,9,3,3,0,'2018-06-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(68,1,34,34,18,3,3,0,'2018-06-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(69,1,35,35,9,3,3,0,'2018-07-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(70,1,35,35,18,3,3,0,'2018-07-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(71,1,36,36,9,3,3,0,'2018-02-13 00:00:00',3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(72,1,36,36,11,3,3,0,'2018-02-13 00:00:00',-3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(73,1,37,37,9,3,3,0,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(74,1,37,37,53,3,3,0,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(75,1,38,38,9,3,3,0,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(76,1,38,38,53,3,3,0,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(77,1,39,39,9,3,3,0,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(78,1,39,39,53,3,3,0,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(79,1,40,40,9,3,3,0,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(80,1,40,40,53,3,3,0,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(81,1,41,41,9,3,3,0,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(82,1,41,41,53,3,3,0,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(83,1,42,42,9,3,3,0,'2018-02-13 00:00:00',857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(84,1,42,42,18,3,3,0,'2018-02-13 00:00:00',-857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(85,1,43,43,9,3,3,0,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(86,1,43,43,52,3,3,0,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(87,1,44,44,9,3,3,0,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(88,1,44,44,53,3,3,0,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(89,1,45,45,9,3,3,0,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(90,1,45,45,75,3,3,0,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(91,1,46,46,9,4,4,0,'2018-03-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(92,1,46,46,18,4,4,0,'2018-03-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(93,1,47,47,9,4,4,0,'2018-04-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(94,1,47,47,18,4,4,0,'2018-04-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(95,1,48,48,9,4,4,0,'2018-05-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(96,1,48,48,18,4,4,0,'2018-05-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(97,1,49,49,9,4,4,0,'2018-06-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(98,1,49,49,18,4,4,0,'2018-06-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(99,1,50,50,9,4,4,0,'2018-07-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(100,1,50,50,18,4,4,0,'2018-07-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(101,1,51,51,9,4,4,0,'2018-02-13 00:00:00',3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(102,1,51,51,11,4,4,0,'2018-02-13 00:00:00',-3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(103,1,52,52,9,4,4,0,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(104,1,52,52,53,4,4,0,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(105,1,53,53,9,4,4,0,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(106,1,53,53,53,4,4,0,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(107,1,54,54,9,4,4,0,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(108,1,54,54,53,4,4,0,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(109,1,55,55,9,4,4,0,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(110,1,55,55,53,4,4,0,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(111,1,56,56,9,4,4,0,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(112,1,56,56,53,4,4,0,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(113,1,57,57,9,4,4,0,'2018-02-13 00:00:00',857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(114,1,57,57,18,4,4,0,'2018-02-13 00:00:00',-857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(115,1,58,58,9,4,4,0,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(116,1,58,58,52,4,4,0,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(117,1,59,59,9,4,4,0,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(118,1,59,59,53,4,4,0,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(119,1,60,60,9,4,4,0,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(120,1,60,60,75,4,4,0,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(121,1,61,61,6,0,0,1,'2018-03-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(122,1,61,61,10,0,0,1,'2018-03-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(123,1,62,62,6,0,0,1,'2018-04-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(124,1,62,62,10,0,0,1,'2018-04-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(125,1,63,63,6,0,0,1,'2018-05-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(126,1,63,63,10,0,0,1,'2018-05-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(127,1,64,64,6,0,0,1,'2018-06-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(128,1,64,64,10,0,0,1,'2018-06-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(129,1,65,65,6,0,0,1,'2018-07-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(130,1,65,65,10,0,0,1,'2018-07-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(131,1,66,66,6,0,0,1,'2018-02-13 00:00:00',2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(132,1,66,66,10,0,0,1,'2018-02-13 00:00:00',-2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(133,1,67,67,6,0,0,1,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(134,1,67,67,10,0,0,1,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(135,1,68,68,6,0,0,1,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(136,1,68,68,10,0,0,1,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(137,1,69,69,6,0,0,1,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(138,1,69,69,10,0,0,1,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(139,1,70,70,6,0,0,1,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(140,1,70,70,10,0,0,1,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(141,1,71,71,6,0,0,1,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(142,1,71,71,10,0,0,1,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(143,1,72,72,6,0,0,1,'2018-02-13 00:00:00',571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(144,1,72,72,10,0,0,1,'2018-02-13 00:00:00',-571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(145,1,73,73,6,0,0,1,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(146,1,73,73,10,0,0,1,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(147,1,74,74,6,0,0,1,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(148,1,74,74,10,0,0,1,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(149,1,75,75,6,0,0,1,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(150,1,75,75,10,0,0,1,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(151,1,76,76,6,0,0,2,'2018-03-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(152,1,76,76,10,0,0,2,'2018-03-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(153,1,77,77,6,0,0,2,'2018-04-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(154,1,77,77,10,0,0,2,'2018-04-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(155,1,78,78,6,0,0,2,'2018-05-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(156,1,78,78,10,0,0,2,'2018-05-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(157,1,79,79,6,0,0,2,'2018-06-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(158,1,79,79,10,0,0,2,'2018-06-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(159,1,80,80,6,0,0,2,'2018-07-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(160,1,80,80,10,0,0,2,'2018-07-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(161,1,81,81,6,0,0,2,'2018-02-13 00:00:00',2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(162,1,81,81,10,0,0,2,'2018-02-13 00:00:00',-2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(163,1,82,82,6,0,0,2,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(164,1,82,82,10,0,0,2,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(165,1,83,83,6,0,0,2,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(166,1,83,83,10,0,0,2,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(167,1,84,84,6,0,0,2,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(168,1,84,84,10,0,0,2,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(169,1,85,85,6,0,0,2,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(170,1,85,85,10,0,0,2,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(171,1,86,86,6,0,0,2,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(172,1,86,86,10,0,0,2,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(173,1,87,87,6,0,0,2,'2018-02-13 00:00:00',571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(174,1,87,87,10,0,0,2,'2018-02-13 00:00:00',-571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(175,1,88,88,6,0,0,2,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(176,1,88,88,10,0,0,2,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(177,1,89,89,6,0,0,2,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(178,1,89,89,10,0,0,2,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(179,1,90,90,6,0,0,2,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(180,1,90,90,10,0,0,2,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(181,1,91,91,6,0,0,3,'2018-03-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(182,1,91,91,10,0,0,3,'2018-03-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(183,1,92,92,6,0,0,3,'2018-04-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(184,1,92,92,10,0,0,3,'2018-04-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(185,1,93,93,6,0,0,3,'2018-05-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(186,1,93,93,10,0,0,3,'2018-05-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(187,1,94,94,6,0,0,3,'2018-06-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(188,1,94,94,10,0,0,3,'2018-06-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(189,1,95,95,6,0,0,3,'2018-07-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(190,1,95,95,10,0,0,3,'2018-07-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(191,1,96,96,6,0,0,3,'2018-02-13 00:00:00',3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(192,1,96,96,10,0,0,3,'2018-02-13 00:00:00',-3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(193,1,97,97,6,0,0,3,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(194,1,97,97,10,0,0,3,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(195,1,98,98,6,0,0,3,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(196,1,98,98,10,0,0,3,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(197,1,99,99,6,0,0,3,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(198,1,99,99,10,0,0,3,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(199,1,100,100,6,0,0,3,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(200,1,100,100,10,0,0,3,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(201,1,101,101,6,0,0,3,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(202,1,101,101,10,0,0,3,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(203,1,102,102,6,0,0,3,'2018-02-13 00:00:00',857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(204,1,102,102,10,0,0,3,'2018-02-13 00:00:00',-857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(205,1,103,103,6,0,0,3,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(206,1,103,103,10,0,0,3,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(207,1,104,104,6,0,0,3,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(208,1,104,104,10,0,0,3,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(209,1,105,105,6,0,0,3,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(210,1,105,105,10,0,0,3,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(211,1,106,106,6,0,0,4,'2018-03-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(212,1,106,106,10,0,0,4,'2018-03-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(213,1,107,107,6,0,0,4,'2018-04-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(214,1,107,107,10,0,0,4,'2018-04-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(215,1,108,108,6,0,0,4,'2018-05-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(216,1,108,108,10,0,0,4,'2018-05-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(217,1,109,109,6,0,0,4,'2018-06-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(218,1,109,109,10,0,0,4,'2018-06-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(219,1,110,110,6,0,0,4,'2018-07-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(220,1,110,110,10,0,0,4,'2018-07-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(221,1,111,111,6,0,0,4,'2018-02-13 00:00:00',3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(222,1,111,111,10,0,0,4,'2018-02-13 00:00:00',-3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(223,1,112,112,6,0,0,4,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(224,1,112,112,10,0,0,4,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(225,1,113,113,6,0,0,4,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(226,1,113,113,10,0,0,4,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(227,1,114,114,6,0,0,4,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(228,1,114,114,10,0,0,4,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(229,1,115,115,6,0,0,4,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(230,1,115,115,10,0,0,4,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(231,1,116,116,6,0,0,4,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(232,1,116,116,10,0,0,4,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(233,1,117,117,6,0,0,4,'2018-02-13 00:00:00',857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(234,1,117,117,10,0,0,4,'2018-02-13 00:00:00',-857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(235,1,118,118,6,0,0,4,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(236,1,118,118,10,0,0,4,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(237,1,119,119,6,0,0,4,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(238,1,119,119,10,0,0,4,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(239,1,120,120,6,0,0,4,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(240,1,120,120,10,0,0,4,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(241,1,121,121,10,2,2,2,'2018-02-13 00:00:00',2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(242,1,121,121,9,2,2,2,'2018-02-13 00:00:00',-2000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(243,1,122,122,10,2,2,2,'2018-02-13 00:00:00',571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(244,1,122,122,9,2,2,2,'2018-02-13 00:00:00',-571.4300,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(245,1,123,123,10,2,2,2,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(246,1,123,123,9,2,2,2,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(247,1,124,124,10,2,2,2,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(248,1,124,124,9,2,2,2,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(249,1,125,125,10,2,2,2,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(250,1,125,125,9,2,2,2,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(251,1,126,126,10,2,2,2,'2018-03-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(252,1,126,126,9,2,2,2,'2018-03-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(253,1,127,127,10,2,2,2,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(254,1,127,127,9,2,2,2,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(255,1,128,128,10,2,2,2,'2018-04-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(256,1,128,128,9,2,2,2,'2018-04-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(257,1,129,129,10,2,2,2,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(258,1,129,129,9,2,2,2,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(259,1,130,130,10,2,2,2,'2018-05-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(260,1,130,130,9,2,2,2,'2018-05-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(261,1,131,131,10,2,2,2,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(262,1,131,131,9,2,2,2,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(263,1,132,132,10,2,2,2,'2018-06-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(264,1,132,132,9,2,2,2,'2018-06-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(265,1,133,133,10,2,2,2,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(266,1,133,133,9,2,2,2,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(267,1,134,134,10,2,2,2,'2018-07-01 00:00:00',1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(268,1,134,134,9,2,2,2,'2018-07-01 00:00:00',-1000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(269,1,135,135,10,2,2,2,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(270,1,135,135,9,2,2,2,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(271,1,136,136,10,3,3,3,'2018-02-13 00:00:00',3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(272,1,136,136,9,3,3,3,'2018-02-13 00:00:00',-3000.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(273,1,137,137,10,3,3,3,'2018-02-13 00:00:00',857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(274,1,137,137,9,3,3,3,'2018-02-13 00:00:00',-857.1400,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(275,1,138,138,10,3,3,3,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(276,1,138,138,9,3,3,3,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(277,1,139,139,10,3,3,3,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(278,1,139,139,9,3,3,3,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(279,1,140,140,10,3,3,3,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(280,1,140,140,9,3,3,3,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(281,1,141,141,10,3,3,3,'2018-03-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(282,1,141,141,9,3,3,3,'2018-03-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(283,1,142,142,10,3,3,3,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(284,1,142,142,9,3,3,3,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(285,1,143,143,10,3,3,3,'2018-04-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(286,1,143,143,9,3,3,3,'2018-04-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(287,1,144,144,10,3,3,3,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(288,1,144,144,9,3,3,3,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(289,1,145,145,10,3,3,3,'2018-05-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(290,1,145,145,9,3,3,3,'2018-05-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(291,1,146,146,10,3,3,3,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(292,1,146,146,9,3,3,3,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(293,1,147,147,10,3,3,3,'2018-06-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(294,1,147,147,9,3,3,3,'2018-06-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(295,1,148,148,10,3,3,3,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(296,1,148,148,9,3,3,3,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(297,1,149,149,10,3,3,3,'2018-07-01 00:00:00',1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(298,1,149,149,9,3,3,3,'2018-07-01 00:00:00',-1500.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(299,1,150,150,10,3,3,3,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(300,1,150,150,9,3,3,3,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(301,1,151,151,10,4,4,4,'2018-02-13 00:00:00',3000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(302,1,151,151,9,4,4,4,'2018-02-13 00:00:00',-3000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(303,1,152,152,10,4,4,4,'2018-02-13 00:00:00',857.1400,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(304,1,152,152,9,4,4,4,'2018-02-13 00:00:00',-857.1400,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(305,1,153,153,10,4,4,4,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(306,1,153,153,9,4,4,4,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(307,1,154,154,10,4,4,4,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(308,1,154,154,9,4,4,4,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(309,1,155,155,10,4,4,4,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(310,1,155,155,9,4,4,4,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(311,1,156,156,10,4,4,4,'2018-03-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(312,1,156,156,9,4,4,4,'2018-03-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(313,1,157,157,10,4,4,4,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(314,1,157,157,9,4,4,4,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(315,1,158,158,10,4,4,4,'2018-04-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(316,1,158,158,9,4,4,4,'2018-04-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(317,1,159,159,10,4,4,4,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(318,1,159,159,9,4,4,4,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(319,1,160,160,10,4,4,4,'2018-05-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(320,1,160,160,9,4,4,4,'2018-05-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(321,1,161,161,10,4,4,4,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(322,1,161,161,9,4,4,4,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(323,1,162,162,10,4,4,4,'2018-06-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(324,1,162,162,9,4,4,4,'2018-06-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(325,1,163,163,10,4,4,4,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(326,1,163,163,9,4,4,4,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(327,1,164,164,10,4,4,4,'2018-07-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(328,1,164,164,9,4,4,4,'2018-07-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(329,1,165,165,10,4,4,4,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(330,1,165,165,9,4,4,4,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(331,1,166,166,10,1,1,1,'2018-02-13 00:00:00',2000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(332,1,166,166,9,1,1,1,'2018-02-13 00:00:00',-2000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(333,1,167,167,10,1,1,1,'2018-02-13 00:00:00',571.4300,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(334,1,167,167,9,1,1,1,'2018-02-13 00:00:00',-571.4300,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(335,1,168,168,10,1,1,1,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(336,1,168,168,9,1,1,1,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(337,1,169,169,10,1,1,1,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(338,1,169,169,9,1,1,1,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(339,1,170,170,10,1,1,1,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(340,1,170,170,9,1,1,1,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(341,1,171,171,10,1,1,1,'2018-03-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(342,1,171,171,9,1,1,1,'2018-03-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(343,1,172,172,10,1,1,1,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(344,1,172,172,9,1,1,1,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(345,1,173,173,10,1,1,1,'2018-04-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(346,1,173,173,9,1,1,1,'2018-04-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(347,1,174,174,10,1,1,1,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(348,1,174,174,9,1,1,1,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(349,1,175,175,10,1,1,1,'2018-05-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(350,1,175,175,9,1,1,1,'2018-05-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(351,1,176,176,10,1,1,1,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(352,1,176,176,9,1,1,1,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(353,1,177,177,10,1,1,1,'2018-06-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(354,1,177,177,9,1,1,1,'2018-06-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(355,1,178,178,10,1,1,1,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(356,1,178,178,9,1,1,1,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(357,1,179,179,10,1,1,1,'2018-07-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(358,1,179,179,9,1,1,1,'2018-07-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(359,1,180,180,10,1,1,1,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(360,1,180,180,9,1,1,1,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(361,1,181,181,4,1,0,1,'2018-02-13 00:00:00',571.4300,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(362,1,181,181,6,1,0,1,'2018-02-13 00:00:00',-571.4300,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(363,1,182,182,4,1,0,1,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(364,1,182,182,6,1,0,1,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(365,1,183,183,4,1,0,1,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(366,1,183,183,6,1,0,1,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(367,1,184,184,4,1,0,1,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(368,1,184,184,6,1,0,1,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(369,1,185,185,4,2,0,2,'2018-02-13 00:00:00',571.4300,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(370,1,185,185,6,2,0,2,'2018-02-13 00:00:00',-571.4300,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(371,1,186,186,4,2,0,2,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(372,1,186,186,6,2,0,2,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(373,1,187,187,4,2,0,2,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(374,1,187,187,6,2,0,2,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(375,1,188,188,4,2,0,2,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(376,1,188,188,6,2,0,2,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(377,1,189,189,4,3,0,3,'2018-02-13 00:00:00',857.1400,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(378,1,189,189,6,3,0,3,'2018-02-13 00:00:00',-857.1400,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(379,1,190,190,4,3,0,3,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(380,1,190,190,6,3,0,3,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(381,1,191,191,4,3,0,3,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(382,1,191,191,6,3,0,3,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(383,1,192,192,4,3,0,3,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(384,1,192,192,6,3,0,3,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(385,1,193,193,4,4,0,4,'2018-02-13 00:00:00',857.1400,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(386,1,193,193,6,4,0,4,'2018-02-13 00:00:00',-857.1400,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(387,1,194,194,4,4,0,4,'2018-02-13 00:00:00',50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(388,1,194,194,6,4,0,4,'2018-02-13 00:00:00',-50.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(389,1,195,195,4,4,0,4,'2018-02-13 00:00:00',5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(390,1,195,195,6,4,0,4,'2018-02-13 00:00:00',-5.7100,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(391,1,196,196,4,4,0,4,'2018-02-13 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(392,1,196,196,6,4,0,4,'2018-02-13 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(393,1,197,197,3,1,0,1,'2018-02-13 00:00:00',2000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(394,1,197,197,6,1,0,1,'2018-02-13 00:00:00',-2000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(395,1,198,198,3,2,0,2,'2018-02-13 00:00:00',2000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(396,1,198,198,6,2,0,2,'2018-02-13 00:00:00',-2000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(397,1,199,199,3,3,0,3,'2018-02-13 00:00:00',3000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(398,1,199,199,6,3,0,3,'2018-02-13 00:00:00',-3000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(399,1,200,200,3,4,0,4,'2018-02-13 00:00:00',3000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(400,1,200,200,6,4,0,4,'2018-02-13 00:00:00',-3000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(401,1,201,201,4,1,0,1,'2018-03-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(402,1,201,201,6,1,0,1,'2018-03-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(403,1,202,202,4,1,0,1,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(404,1,202,202,6,1,0,1,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(405,1,203,203,4,2,0,2,'2018-03-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(406,1,203,203,6,2,0,2,'2018-03-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(407,1,204,204,4,2,0,2,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(408,1,204,204,6,2,0,2,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(409,1,205,205,4,3,0,3,'2018-03-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(410,1,205,205,6,3,0,3,'2018-03-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(411,1,206,206,4,3,0,3,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(412,1,206,206,6,3,0,3,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(413,1,207,207,4,4,0,4,'2018-03-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(414,1,207,207,6,4,0,4,'2018-03-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(415,1,208,208,4,4,0,4,'2018-03-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(416,1,208,208,6,4,0,4,'2018-03-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(417,1,209,209,4,1,0,1,'2018-04-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(418,1,209,209,6,1,0,1,'2018-04-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(419,1,210,210,4,1,0,1,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(420,1,210,210,6,1,0,1,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(421,1,211,211,4,2,0,2,'2018-04-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(422,1,211,211,6,2,0,2,'2018-04-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(423,1,212,212,4,2,0,2,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(424,1,212,212,6,2,0,2,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(425,1,213,213,4,3,0,3,'2018-04-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(426,1,213,213,6,3,0,3,'2018-04-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(427,1,214,214,4,3,0,3,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(428,1,214,214,6,3,0,3,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(429,1,215,215,4,4,0,4,'2018-04-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(430,1,215,215,6,4,0,4,'2018-04-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(431,1,216,216,4,4,0,4,'2018-04-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(432,1,216,216,6,4,0,4,'2018-04-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(433,1,217,217,4,1,0,1,'2018-05-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(434,1,217,217,6,1,0,1,'2018-05-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(435,1,218,218,4,1,0,1,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(436,1,218,218,6,1,0,1,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(437,1,219,219,4,2,0,2,'2018-05-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(438,1,219,219,6,2,0,2,'2018-05-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(439,1,220,220,4,2,0,2,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(440,1,220,220,6,2,0,2,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(441,1,221,221,4,3,0,3,'2018-05-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(442,1,221,221,6,3,0,3,'2018-05-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(443,1,222,222,4,3,0,3,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(444,1,222,222,6,3,0,3,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(445,1,223,223,4,4,0,4,'2018-05-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(446,1,223,223,6,4,0,4,'2018-05-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(447,1,224,224,4,4,0,4,'2018-05-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(448,1,224,224,6,4,0,4,'2018-05-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(449,1,225,225,4,1,0,1,'2018-06-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(450,1,225,225,6,1,0,1,'2018-06-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(451,1,226,226,4,1,0,1,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(452,1,226,226,6,1,0,1,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(453,1,227,227,4,2,0,2,'2018-06-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(454,1,227,227,6,2,0,2,'2018-06-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(455,1,228,228,4,2,0,2,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(456,1,228,228,6,2,0,2,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(457,1,229,229,4,3,0,3,'2018-06-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(458,1,229,229,6,3,0,3,'2018-06-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(459,1,230,230,4,3,0,3,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(460,1,230,230,6,3,0,3,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(461,1,231,231,4,4,0,4,'2018-06-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(462,1,231,231,6,4,0,4,'2018-06-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(463,1,232,232,4,4,0,4,'2018-06-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(464,1,232,232,6,4,0,4,'2018-06-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(465,1,233,233,4,1,0,1,'2018-07-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(466,1,233,233,6,1,0,1,'2018-07-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(467,1,234,234,4,1,0,1,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(468,1,234,234,6,1,0,1,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(469,1,235,235,4,2,0,2,'2018-07-01 00:00:00',1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(470,1,235,235,6,2,0,2,'2018-07-01 00:00:00',-1000.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(471,1,236,236,4,2,0,2,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(472,1,236,236,6,2,0,2,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(473,1,237,237,4,3,0,3,'2018-07-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(474,1,237,237,6,3,0,3,'2018-07-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(475,1,238,238,4,3,0,3,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(476,1,238,238,6,3,0,3,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(477,1,239,239,4,4,0,4,'2018-07-01 00:00:00',1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(478,1,239,239,6,4,0,4,'2018-07-01 00:00:00',-1500.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(479,1,240,240,4,4,0,4,'2018-07-01 00:00:00',10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(480,1,240,240,6,4,0,4,'2018-07-01 00:00:00',-10.0000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0);
/*!40000 ALTER TABLE `LedgerEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LedgerMarker`
--

DROP TABLE IF EXISTS `LedgerMarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LedgerMarker` (
  `LMID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `Dt` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `Balance` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `State` smallint(6) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LMID`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LedgerMarker`
--

LOCK TABLES `LedgerMarker` WRITE;
/*!40000 ALTER TABLE `LedgerMarker` DISABLE KEYS */;
INSERT INTO `LedgerMarker` VALUES (1,1,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(2,2,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(3,3,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(4,4,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(5,5,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(6,6,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(7,7,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(8,8,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(9,9,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(10,10,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(11,11,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(12,12,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(13,13,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(14,14,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(15,15,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(16,16,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(17,17,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(18,18,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(19,19,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(20,20,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(21,21,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(22,22,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(23,23,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(24,24,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(25,25,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(26,26,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(27,27,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(28,28,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(29,29,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(30,30,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(31,31,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(32,32,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(33,33,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(34,34,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(35,35,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(36,36,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(37,37,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(38,38,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(39,39,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(40,40,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(41,41,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(42,42,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(43,43,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(44,44,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(45,45,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(46,46,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(47,47,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(48,48,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(49,49,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(50,50,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(51,51,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(52,52,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(53,53,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(54,54,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(55,55,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(56,56,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(57,57,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(58,58,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(59,59,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(60,60,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(61,61,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(62,62,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(63,63,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(64,64,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(65,65,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(66,66,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(67,67,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(68,68,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(69,69,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(70,70,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(71,71,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(72,72,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(73,73,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(74,74,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2017-11-10 23:24:22',0,'2017-11-10 23:24:22',0),(75,75,1,0,0,0,'1970-01-01 00:00:00',0.0000,3,'2018-07-03 02:45:37',211,'2018-07-03 02:45:37',211),(76,0,1,1,0,0,'2018-01-30 00:00:00',0.0000,3,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(77,0,1,1,1,0,'2018-01-30 00:00:00',0.0000,3,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(78,0,1,2,0,0,'2018-01-30 00:00:00',0.0000,3,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(79,0,1,2,2,0,'2018-01-30 00:00:00',0.0000,3,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(80,0,1,3,0,0,'2018-01-30 00:00:00',0.0000,3,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(81,0,1,3,3,0,'2018-01-30 00:00:00',0.0000,3,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(82,0,1,4,0,0,'2018-01-30 00:00:00',0.0000,3,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(83,0,1,4,4,0,'2018-01-30 00:00:00',0.0000,3,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `LedgerMarker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LedgerMarkerAudit`
--

DROP TABLE IF EXISTS `LedgerMarkerAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LedgerMarkerAudit` (
  `LMID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `UID` mediumint(9) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LedgerMarkerAudit`
--

LOCK TABLES `LedgerMarkerAudit` WRITE;
/*!40000 ALTER TABLE `LedgerMarkerAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `LedgerMarkerAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MRHistory`
--

DROP TABLE IF EXISTS `MRHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MRHistory` (
  `MRHID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MRStatus` smallint(6) NOT NULL DEFAULT '0',
  `DtMRStart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DtMRStop` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MRHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MRHistory`
--

LOCK TABLES `MRHistory` WRITE;
/*!40000 ALTER TABLE `MRHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `MRHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NoteList`
--

DROP TABLE IF EXISTS `NoteList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NoteList` (
  `NLID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NoteList`
--

LOCK TABLES `NoteList` WRITE;
/*!40000 ALTER TABLE `NoteList` DISABLE KEYS */;
/*!40000 ALTER TABLE `NoteList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NoteType`
--

DROP TABLE IF EXISTS `NoteType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NoteType` (
  `NTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(128) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NoteType`
--

LOCK TABLES `NoteType` WRITE;
/*!40000 ALTER TABLE `NoteType` DISABLE KEYS */;
/*!40000 ALTER TABLE `NoteType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notes`
--

DROP TABLE IF EXISTS `Notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notes` (
  `NID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `NLID` bigint(20) NOT NULL DEFAULT '0',
  `PNID` bigint(20) NOT NULL DEFAULT '0',
  `NTID` bigint(20) NOT NULL DEFAULT '0',
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `Comment` varchar(1024) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notes`
--

LOCK TABLES `Notes` WRITE;
/*!40000 ALTER TABLE `Notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OtherDeliverables`
--

DROP TABLE IF EXISTS `OtherDeliverables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OtherDeliverables` (
  `ODID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(256) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ODID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OtherDeliverables`
--

LOCK TABLES `OtherDeliverables` WRITE;
/*!40000 ALTER TABLE `OtherDeliverables` DISABLE KEYS */;
/*!40000 ALTER TABLE `OtherDeliverables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentType`
--

DROP TABLE IF EXISTS `PaymentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentType` (
  `PMTID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Description` varchar(256) NOT NULL DEFAULT '',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PMTID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentType`
--

LOCK TABLES `PaymentType` WRITE;
/*!40000 ALTER TABLE `PaymentType` DISABLE KEYS */;
INSERT INTO `PaymentType` VALUES (1,1,'Cash','Cash','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(2,1,'Check','Personal check from payor','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(3,1,'VISA','Credit card charge','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(4,1,'AMEX','American Express credit card','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(5,1,'ACH','','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0);
/*!40000 ALTER TABLE `PaymentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payor`
--

DROP TABLE IF EXISTS `Payor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payor` (
  `TCID` bigint(20) NOT NULL,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `TaxpayorID` char(128) NOT NULL DEFAULT '',
  `CreditLimit` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `EligibleFuturePayor` tinyint(1) NOT NULL DEFAULT '1',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `DriversLicense` char(128) NOT NULL DEFAULT '',
  `GrossIncome` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payor`
--

LOCK TABLES `Payor` WRITE;
/*!40000 ALTER TABLE `Payor` DISABLE KEYS */;
INSERT INTO `Payor` VALUES (1,1,'9b66e7e9b461076fde64f76a6a8ec91ae76ee6b5b918f533b629ef7436f41529013c0f8a',11983.0000,1,0,'6918a5b8a466e9aff02172b48dfcf82e12dd0b76548455caf986017985ecf872f392265b',123374.0000,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,'662f7dfc35b0901e1cbe3102caeb82d1bc43e762b2e20d6db287b1271025bb3556a2ecd6',24872.0000,1,0,'f7d43946c63bb15f1fa16eb697da67c89a8a28d4b0bb7f9b23a63a4b25e928c1e6717da7',30888.0000,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,1,'aa28aeb3f2d87a43242133d35f0eca3f5439b49951642f81f549d54a77c01e9bface6e7e',11060.0000,1,0,'0f94c0f3b999d55ec839098c2c5d706e2307072e5404c53b6f88f474c6f157157e6b523c',130997.0000,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,1,'5490b9fa3ffa9c574e378ce91c7375d388ab9f89144996fc92060194a9b3da18755a26bc',22034.0000,1,0,'aa8ba9e73ae2768c905c1c8c4e841c02632cafb9fa8e5d40b115cbf8635ed3736c08f187',55733.0000,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `Payor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pets`
--

DROP TABLE IF EXISTS `Pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pets` (
  `PETID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `Type` varchar(100) NOT NULL DEFAULT '',
  `Breed` varchar(100) NOT NULL DEFAULT '',
  `Color` varchar(100) NOT NULL DEFAULT '',
  `Weight` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `DtStart` date NOT NULL DEFAULT '1970-01-01',
  `DtStop` date NOT NULL DEFAULT '1970-01-01',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PETID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pets`
--

LOCK TABLES `Pets` WRITE;
/*!40000 ALTER TABLE `Pets` DISABLE KEYS */;
INSERT INTO `Pets` VALUES (1,1,1,1,'dog','Norwegian Elkhound','Spotted',35.0000,'Gus','2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,2,2,'cat','American Bobtail','Harlequin',13.0000,'Chloe ','2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,1,3,3,'dog','Rhodesian Ridgeback','Chocolate',10.0000,'Simba','2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,1,4,4,'dog','Belgian Tervuren','Red',50.0000,'Sammy','2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `Pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prospect`
--

DROP TABLE IF EXISTS `Prospect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prospect` (
  `TCID` bigint(20) NOT NULL,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `CompanyAddress` varchar(100) NOT NULL DEFAULT '',
  `CompanyCity` varchar(100) NOT NULL DEFAULT '',
  `CompanyState` varchar(100) NOT NULL DEFAULT '',
  `CompanyPostalCode` varchar(100) NOT NULL DEFAULT '',
  `CompanyEmail` varchar(100) NOT NULL DEFAULT '',
  `CompanyPhone` varchar(100) NOT NULL DEFAULT '',
  `Occupation` varchar(100) NOT NULL DEFAULT '',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `EvictedDes` varchar(2048) NOT NULL DEFAULT '',
  `ConvictedDes` varchar(2048) NOT NULL DEFAULT '',
  `BankruptcyDes` varchar(2048) NOT NULL DEFAULT '',
  `OtherPreferences` varchar(1024) NOT NULL DEFAULT '',
  `SpecialNeeds` varchar(1024) NOT NULL DEFAULT '',
  `FollowUpDate` date NOT NULL DEFAULT '1970-01-01',
  `CurrentAddress` varchar(200) NOT NULL DEFAULT '',
  `CurrentLandLordName` varchar(100) NOT NULL DEFAULT '',
  `CurrentLandLordPhoneNo` varchar(20) NOT NULL DEFAULT '',
  `CurrentReasonForMoving` bigint(20) NOT NULL DEFAULT '0',
  `CurrentLengthOfResidency` varchar(100) NOT NULL DEFAULT '',
  `PriorAddress` varchar(200) NOT NULL DEFAULT '',
  `PriorLandLordName` varchar(100) NOT NULL DEFAULT '',
  `PriorLandLordPhoneNo` varchar(20) NOT NULL DEFAULT '',
  `PriorReasonForMoving` bigint(20) NOT NULL DEFAULT '0',
  `PriorLengthOfResidency` varchar(100) NOT NULL DEFAULT '',
  `CommissionableThirdParty` text NOT NULL,
  `ThirdPartySource` varchar(100) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prospect`
--

LOCK TABLES `Prospect` WRITE;
/*!40000 ALTER TABLE `Prospect` DISABLE KEYS */;
INSERT INTO `Prospect` VALUES (1,1,'65528 Holly','Arlington','OK','84059','Temple-InlandIncArlington88@abiz.com','(548) 946-4249','assistant housekeeper (domestic help)',0,'','','','','','0000-00-00','9480 New Jersey, Brighton, VA 02081','Shea Rich','(398) 542-8102',114,'3 years 5 months','50794 Second, Santa Maria, HI 41318','Evangelina Dodson','(574) 491-8628',109,'4 years 3 months','','10','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,'23699 Twelfth','Bridgeport','MD','03300','TerexCorpBridgeport239@gmail.com','(757) 891-0210','track engineer',0,'','','','','','0000-00-00','48685 7th, Wichita, IA 10694','Treasa Higgins','(306) 942-8046',109,'5 years 7 months','75076 Seventh, Palm Bay, CT 78511','Annalee Gentry','(447) 436-0093',84,'5 years 9 months','','134','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,1,'60245 West','Reading','PA','33274','DollarGeneralCorporationReading263@hotmail.com','(245) 746-3101','pizza maker',0,'','','','','','0000-00-00','38100 Palo Verde, Elizabeth, DC 11211','Adeline Hester','(766) 985-7139',121,'8 years 6 months','20234 Pioneer, Evansville, MT 31445','Adella Mack','(795) 297-2867',92,'5 years 7 months','','220','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,1,'20137 8th','ClarkeCounty','MI','65466','AClarkeCounty6704@gmail.com','(145) 212-8340','computer equipment operator (information technology operator)',0,'','','','','','0000-00-00','51506 Delaware, Lubbock, NE 11528','Emogene Clemons','(154) 865-7409',86,'4 years 3 months','35481 Pioneer, Thousand Oaks, NC 86258','Keitha Cash','(346) 300-0965',86,'5 years 4 months','','178','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `Prospect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RatePlan`
--

DROP TABLE IF EXISTS `RatePlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RatePlan` (
  `RPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RatePlan`
--

LOCK TABLES `RatePlan` WRITE;
/*!40000 ALTER TABLE `RatePlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `RatePlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RatePlanOD`
--

DROP TABLE IF EXISTS `RatePlanOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RatePlanOD` (
  `RPRID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `ODID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RatePlanOD`
--

LOCK TABLES `RatePlanOD` WRITE;
/*!40000 ALTER TABLE `RatePlanOD` DISABLE KEYS */;
/*!40000 ALTER TABLE `RatePlanOD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RatePlanRef`
--

DROP TABLE IF EXISTS `RatePlanRef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RatePlanRef` (
  `RPRID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RPID` bigint(20) NOT NULL DEFAULT '0',
  `DtStart` date DEFAULT '1970-01-01',
  `DtStop` date DEFAULT '1970-01-01',
  `FeeAppliesAge` smallint(6) NOT NULL DEFAULT '0',
  `MaxNoFeeUsers` smallint(6) NOT NULL DEFAULT '0',
  `AdditionalUserFee` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `PromoCode` varchar(100) DEFAULT NULL,
  `CancellationFee` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RPRID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RatePlanRef`
--

LOCK TABLES `RatePlanRef` WRITE;
/*!40000 ALTER TABLE `RatePlanRef` DISABLE KEYS */;
/*!40000 ALTER TABLE `RatePlanRef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RatePlanRefRTRate`
--

DROP TABLE IF EXISTS `RatePlanRefRTRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RatePlanRefRTRate` (
  `RPRID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RTID` bigint(20) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Val` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `RPRRTRateID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`RPRRTRateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RatePlanRefRTRate`
--

LOCK TABLES `RatePlanRefRTRate` WRITE;
/*!40000 ALTER TABLE `RatePlanRefRTRate` DISABLE KEYS */;
/*!40000 ALTER TABLE `RatePlanRefRTRate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RatePlanRefSPRate`
--

DROP TABLE IF EXISTS `RatePlanRefSPRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RatePlanRefSPRate` (
  `RPRID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RTID` bigint(20) NOT NULL DEFAULT '0',
  `RSPID` bigint(20) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Val` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `RPRSPRateID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`RPRSPRateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RatePlanRefSPRate`
--

LOCK TABLES `RatePlanRefSPRate` WRITE;
/*!40000 ALTER TABLE `RatePlanRefSPRate` DISABLE KEYS */;
/*!40000 ALTER TABLE `RatePlanRefSPRate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receipt`
--

DROP TABLE IF EXISTS `Receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Receipt` (
  `RCPTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRCPTID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `PMTID` bigint(20) NOT NULL DEFAULT '0',
  `DEPID` bigint(20) NOT NULL DEFAULT '0',
  `DID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `Dt` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DocNo` varchar(50) NOT NULL DEFAULT '',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `AcctRuleReceive` varchar(215) NOT NULL DEFAULT '',
  `ARID` bigint(20) NOT NULL DEFAULT '0',
  `AcctRuleApply` varchar(4096) NOT NULL DEFAULT '',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Comment` varchar(256) NOT NULL DEFAULT '',
  `OtherPayorName` varchar(128) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RCPTID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receipt`
--

LOCK TABLES `Receipt` WRITE;
/*!40000 ALTER TABLE `Receipt` DISABLE KEYS */;
INSERT INTO `Receipt` VALUES (1,0,1,1,2,1,3,1,'2018-03-01 00:00:00','786623',1000.0000,'',25,'ASM(2) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-2','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(2,0,1,1,2,1,4,1,'2018-04-01 00:00:00','988459',1000.0000,'',25,'ASM(3) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-3','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(3,0,1,1,2,1,5,1,'2018-05-01 00:00:00','641803',1000.0000,'',25,'ASM(4) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-4','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(4,0,1,1,2,1,6,1,'2018-06-01 00:00:00','361739',1000.0000,'',25,'ASM(5) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-5','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(5,0,1,1,2,1,7,1,'2018-07-01 00:00:00','761883',1000.0000,'',25,'ASM(6) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-6','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(6,0,1,1,2,2,2,1,'2018-02-13 00:00:00','38907',2000.0000,'',25,'ASM(7) d 12999 2000.00,c 12001 2000.00',2,'payment for ASM-7','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(7,0,1,1,2,1,3,1,'2018-03-01 00:00:00','658932',10.0000,'',25,'ASM(9) d 12999 10.00,c 12001 10.00',2,'payment for ASM-9','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(8,0,1,1,2,1,4,1,'2018-04-01 00:00:00','387780',10.0000,'',25,'ASM(10) d 12999 10.00,c 12001 10.00',2,'payment for ASM-10','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(9,0,1,1,2,1,5,1,'2018-05-01 00:00:00','383115',10.0000,'',25,'ASM(11) d 12999 10.00,c 12001 10.00',2,'payment for ASM-11','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(10,0,1,1,2,1,6,1,'2018-06-01 00:00:00','742716',10.0000,'',25,'ASM(12) d 12999 10.00,c 12001 10.00',2,'payment for ASM-12','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(11,0,1,1,2,1,7,1,'2018-07-01 00:00:00','50020',10.0000,'',25,'ASM(13) d 12999 10.00,c 12001 10.00',2,'payment for ASM-13','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(12,0,1,1,2,1,1,1,'2018-02-13 00:00:00','623071',571.4300,'',25,'ASM(14) d 12999 571.43,c 12001 571.43',2,'payment for ASM-14','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(13,0,1,1,2,1,1,1,'2018-02-13 00:00:00','134652',50.0000,'',25,'ASM(15) d 12999 50.00,c 12001 50.00',2,'payment for ASM-15','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(14,0,1,1,2,1,1,1,'2018-02-13 00:00:00','281907',5.7100,'',25,'ASM(16) d 12999 5.71,c 12001 5.71',2,'payment for ASM-16','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(15,0,1,1,2,1,1,1,'2018-02-13 00:00:00','772719',10.0000,'',25,'ASM(17) d 12999 10.00,c 12001 10.00',2,'payment for ASM-17','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(16,0,1,2,2,1,3,2,'2018-03-01 00:00:00','659062',1000.0000,'',25,'ASM(19) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-19','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(17,0,1,2,2,1,4,2,'2018-04-01 00:00:00','663110',1000.0000,'',25,'ASM(20) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-20','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(18,0,1,2,2,1,5,2,'2018-05-01 00:00:00','961397',1000.0000,'',25,'ASM(21) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-21','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(19,0,1,2,2,1,6,2,'2018-06-01 00:00:00','813105',1000.0000,'',25,'ASM(22) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-22','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(20,0,1,2,2,1,7,2,'2018-07-01 00:00:00','569721',1000.0000,'',25,'ASM(23) d 12999 1000.00,c 12001 1000.00',2,'payment for ASM-23','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(21,0,1,2,2,2,2,2,'2018-02-13 00:00:00','585917',2000.0000,'',25,'ASM(24) d 12999 2000.00,c 12001 2000.00',2,'payment for ASM-24','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(22,0,1,2,2,1,3,2,'2018-03-01 00:00:00','764712',10.0000,'',25,'ASM(26) d 12999 10.00,c 12001 10.00',2,'payment for ASM-26','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(23,0,1,2,2,1,4,2,'2018-04-01 00:00:00','264449',10.0000,'',25,'ASM(27) d 12999 10.00,c 12001 10.00',2,'payment for ASM-27','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(24,0,1,2,2,1,5,2,'2018-05-01 00:00:00','989579',10.0000,'',25,'ASM(28) d 12999 10.00,c 12001 10.00',2,'payment for ASM-28','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(25,0,1,2,2,1,6,2,'2018-06-01 00:00:00','156333',10.0000,'',25,'ASM(29) d 12999 10.00,c 12001 10.00',2,'payment for ASM-29','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(26,0,1,2,2,1,7,2,'2018-07-01 00:00:00','879825',10.0000,'',25,'ASM(30) d 12999 10.00,c 12001 10.00',2,'payment for ASM-30','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(27,0,1,2,2,1,1,2,'2018-02-13 00:00:00','312746',571.4300,'',25,'ASM(31) d 12999 571.43,c 12001 571.43',2,'payment for ASM-31','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(28,0,1,2,2,1,1,2,'2018-02-13 00:00:00','343734',50.0000,'',25,'ASM(32) d 12999 50.00,c 12001 50.00',2,'payment for ASM-32','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(29,0,1,2,2,1,1,2,'2018-02-13 00:00:00','771718',5.7100,'',25,'ASM(33) d 12999 5.71,c 12001 5.71',2,'payment for ASM-33','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(30,0,1,2,2,1,1,2,'2018-02-13 00:00:00','377901',10.0000,'',25,'ASM(34) d 12999 10.00,c 12001 10.00',2,'payment for ASM-34','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(31,0,1,3,2,1,3,3,'2018-03-01 00:00:00','65704',1500.0000,'',25,'ASM(36) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-36','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(32,0,1,3,2,1,4,3,'2018-04-01 00:00:00','87610',1500.0000,'',25,'ASM(37) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-37','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(33,0,1,3,2,1,5,3,'2018-05-01 00:00:00','975024',1500.0000,'',25,'ASM(38) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-38','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(34,0,1,3,2,1,6,3,'2018-06-01 00:00:00','624717',1500.0000,'',25,'ASM(39) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-39','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(35,0,1,3,2,1,7,3,'2018-07-01 00:00:00','802269',1500.0000,'',25,'ASM(40) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-40','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(36,0,1,3,2,2,2,3,'2018-02-13 00:00:00','729479',3000.0000,'',25,'ASM(41) d 12999 3000.00,c 12001 3000.00',2,'payment for ASM-41','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(37,0,1,3,2,1,3,3,'2018-03-01 00:00:00','286269',10.0000,'',25,'ASM(43) d 12999 10.00,c 12001 10.00',2,'payment for ASM-43','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(38,0,1,3,2,1,4,3,'2018-04-01 00:00:00','331750',10.0000,'',25,'ASM(44) d 12999 10.00,c 12001 10.00',2,'payment for ASM-44','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(39,0,1,3,2,1,5,3,'2018-05-01 00:00:00','119657',10.0000,'',25,'ASM(45) d 12999 10.00,c 12001 10.00',2,'payment for ASM-45','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(40,0,1,3,2,1,6,3,'2018-06-01 00:00:00','895923',10.0000,'',25,'ASM(46) d 12999 10.00,c 12001 10.00',2,'payment for ASM-46','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(41,0,1,3,2,1,7,3,'2018-07-01 00:00:00','642512',10.0000,'',25,'ASM(47) d 12999 10.00,c 12001 10.00',2,'payment for ASM-47','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(42,0,1,3,2,1,1,3,'2018-02-13 00:00:00','113702',857.1400,'',25,'ASM(48) d 12999 857.14,c 12001 857.14',2,'payment for ASM-48','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(43,0,1,3,2,1,1,3,'2018-02-13 00:00:00','334655',50.0000,'',25,'ASM(49) d 12999 50.00,c 12001 50.00',2,'payment for ASM-49','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(44,0,1,3,2,1,1,3,'2018-02-13 00:00:00','907257',5.7100,'',25,'ASM(50) d 12999 5.71,c 12001 5.71',2,'payment for ASM-50','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(45,0,1,3,2,1,1,3,'2018-02-13 00:00:00','831643',10.0000,'',25,'ASM(51) d 12999 10.00,c 12001 10.00',2,'payment for ASM-51','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(46,0,1,4,2,1,3,4,'2018-03-01 00:00:00','797301',1500.0000,'',25,'ASM(53) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-53','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(47,0,1,4,2,1,4,4,'2018-04-01 00:00:00','819019',1500.0000,'',25,'ASM(54) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-54','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(48,0,1,4,2,1,5,4,'2018-05-01 00:00:00','233018',1500.0000,'',25,'ASM(55) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-55','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(49,0,1,4,2,1,6,4,'2018-06-01 00:00:00','498694',1500.0000,'',25,'ASM(56) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-56','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(50,0,1,4,2,1,7,4,'2018-07-01 00:00:00','140041',1500.0000,'',25,'ASM(57) d 12999 1500.00,c 12001 1500.00',2,'payment for ASM-57','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(51,0,1,4,2,2,2,4,'2018-02-13 00:00:00','862788',3000.0000,'',25,'ASM(58) d 12999 3000.00,c 12001 3000.00',2,'payment for ASM-58','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(52,0,1,4,2,1,3,4,'2018-03-01 00:00:00','919021',10.0000,'',25,'ASM(60) d 12999 10.00,c 12001 10.00',2,'payment for ASM-60','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(53,0,1,4,2,1,4,4,'2018-04-01 00:00:00','62911',10.0000,'',25,'ASM(61) d 12999 10.00,c 12001 10.00',2,'payment for ASM-61','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(54,0,1,4,2,1,5,4,'2018-05-01 00:00:00','458280',10.0000,'',25,'ASM(62) d 12999 10.00,c 12001 10.00',2,'payment for ASM-62','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(55,0,1,4,2,1,6,4,'2018-06-01 00:00:00','424343',10.0000,'',25,'ASM(63) d 12999 10.00,c 12001 10.00',2,'payment for ASM-63','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(56,0,1,4,2,1,7,4,'2018-07-01 00:00:00','8055',10.0000,'',25,'ASM(64) d 12999 10.00,c 12001 10.00',2,'payment for ASM-64','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(57,0,1,4,2,1,1,4,'2018-02-13 00:00:00','692041',857.1400,'',25,'ASM(65) d 12999 857.14,c 12001 857.14',2,'payment for ASM-65','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(58,0,1,4,2,1,1,4,'2018-02-13 00:00:00','812453',50.0000,'',25,'ASM(66) d 12999 50.00,c 12001 50.00',2,'payment for ASM-66','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(59,0,1,4,2,1,1,4,'2018-02-13 00:00:00','18631',5.7100,'',25,'ASM(67) d 12999 5.71,c 12001 5.71',2,'payment for ASM-67','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0),(60,0,1,4,2,1,1,4,'2018-02-13 00:00:00','858217',10.0000,'',25,'ASM(68) d 12999 10.00,c 12001 10.00',2,'payment for ASM-68','','2018-07-27 06:49:31',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `Receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReceiptAllocation`
--

DROP TABLE IF EXISTS `ReceiptAllocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReceiptAllocation` (
  `RCPAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RCPTID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `Dt` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `Amount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `ASMID` bigint(20) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `AcctRule` varchar(150) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RCPAID`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReceiptAllocation`
--

LOCK TABLES `ReceiptAllocation` WRITE;
/*!40000 ALTER TABLE `ReceiptAllocation` DISABLE KEYS */;
INSERT INTO `ReceiptAllocation` VALUES (1,1,1,1,'2018-03-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,2,1,1,'2018-04-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,3,1,1,'2018-05-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,4,1,1,'2018-06-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(5,5,1,1,'2018-07-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(6,6,1,1,'2018-02-13 00:00:00',2000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(7,7,1,1,'2018-03-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(8,8,1,1,'2018-04-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(9,9,1,1,'2018-05-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(10,10,1,1,'2018-06-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(11,11,1,1,'2018-07-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(12,12,1,1,'2018-02-13 00:00:00',571.4300,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(13,13,1,1,'2018-02-13 00:00:00',50.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(14,14,1,1,'2018-02-13 00:00:00',5.7100,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(15,15,1,1,'2018-02-13 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(16,16,1,2,'2018-03-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(17,17,1,2,'2018-04-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(18,18,1,2,'2018-05-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(19,19,1,2,'2018-06-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(20,20,1,2,'2018-07-01 00:00:00',1000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(21,21,1,2,'2018-02-13 00:00:00',2000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(22,22,1,2,'2018-03-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(23,23,1,2,'2018-04-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(24,24,1,2,'2018-05-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(25,25,1,2,'2018-06-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(26,26,1,2,'2018-07-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(27,27,1,2,'2018-02-13 00:00:00',571.4300,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(28,28,1,2,'2018-02-13 00:00:00',50.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(29,29,1,2,'2018-02-13 00:00:00',5.7100,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(30,30,1,2,'2018-02-13 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(31,31,1,3,'2018-03-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(32,32,1,3,'2018-04-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(33,33,1,3,'2018-05-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(34,34,1,3,'2018-06-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(35,35,1,3,'2018-07-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(36,36,1,3,'2018-02-13 00:00:00',3000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(37,37,1,3,'2018-03-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(38,38,1,3,'2018-04-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(39,39,1,3,'2018-05-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(40,40,1,3,'2018-06-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(41,41,1,3,'2018-07-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(42,42,1,3,'2018-02-13 00:00:00',857.1400,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(43,43,1,3,'2018-02-13 00:00:00',50.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(44,44,1,3,'2018-02-13 00:00:00',5.7100,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(45,45,1,3,'2018-02-13 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(46,46,1,4,'2018-03-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(47,47,1,4,'2018-04-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(48,48,1,4,'2018-05-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(49,49,1,4,'2018-06-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(50,50,1,4,'2018-07-01 00:00:00',1500.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(51,51,1,4,'2018-02-13 00:00:00',3000.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(52,52,1,4,'2018-03-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(53,53,1,4,'2018-04-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(54,54,1,4,'2018-05-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(55,55,1,4,'2018-06-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(56,56,1,4,'2018-07-01 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(57,57,1,4,'2018-02-13 00:00:00',857.1400,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(58,58,1,4,'2018-02-13 00:00:00',50.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(59,59,1,4,'2018-02-13 00:00:00',5.7100,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(60,60,1,4,'2018-02-13 00:00:00',10.0000,0,0,'d 10999 _, c 12999 _','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(61,21,1,2,'2018-02-13 00:00:00',2000.0000,24,0,'ASM(24) d 12999 2000.00,c 12001 2000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(62,27,1,2,'2018-02-13 00:00:00',571.4300,31,0,'ASM(31) d 12999 571.43,c 12001 571.43','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(63,28,1,2,'2018-02-13 00:00:00',50.0000,32,0,'ASM(32) d 12999 50.00,c 12001 50.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(64,29,1,2,'2018-02-13 00:00:00',5.7100,33,0,'ASM(33) d 12999 5.71,c 12001 5.71','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(65,30,1,2,'2018-02-13 00:00:00',10.0000,34,0,'ASM(34) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(66,16,1,2,'2018-03-01 00:00:00',1000.0000,19,0,'ASM(19) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(67,22,1,2,'2018-03-01 00:00:00',10.0000,26,0,'ASM(26) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(68,17,1,2,'2018-04-01 00:00:00',1000.0000,20,0,'ASM(20) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(69,23,1,2,'2018-04-01 00:00:00',10.0000,27,0,'ASM(27) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(70,18,1,2,'2018-05-01 00:00:00',1000.0000,21,0,'ASM(21) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(71,24,1,2,'2018-05-01 00:00:00',10.0000,28,0,'ASM(28) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(72,19,1,2,'2018-06-01 00:00:00',1000.0000,22,0,'ASM(22) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(73,25,1,2,'2018-06-01 00:00:00',10.0000,29,0,'ASM(29) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(74,20,1,2,'2018-07-01 00:00:00',1000.0000,23,0,'ASM(23) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(75,26,1,2,'2018-07-01 00:00:00',10.0000,30,0,'ASM(30) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(76,36,1,3,'2018-02-13 00:00:00',3000.0000,41,0,'ASM(41) d 12999 3000.00,c 12001 3000.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(77,42,1,3,'2018-02-13 00:00:00',857.1400,48,0,'ASM(48) d 12999 857.14,c 12001 857.14','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(78,43,1,3,'2018-02-13 00:00:00',50.0000,49,0,'ASM(49) d 12999 50.00,c 12001 50.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(79,44,1,3,'2018-02-13 00:00:00',5.7100,50,0,'ASM(50) d 12999 5.71,c 12001 5.71','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(80,45,1,3,'2018-02-13 00:00:00',10.0000,51,0,'ASM(51) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(81,31,1,3,'2018-03-01 00:00:00',1500.0000,36,0,'ASM(36) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(82,37,1,3,'2018-03-01 00:00:00',10.0000,43,0,'ASM(43) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(83,32,1,3,'2018-04-01 00:00:00',1500.0000,37,0,'ASM(37) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(84,38,1,3,'2018-04-01 00:00:00',10.0000,44,0,'ASM(44) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(85,33,1,3,'2018-05-01 00:00:00',1500.0000,38,0,'ASM(38) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(86,39,1,3,'2018-05-01 00:00:00',10.0000,45,0,'ASM(45) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(87,34,1,3,'2018-06-01 00:00:00',1500.0000,39,0,'ASM(39) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(88,40,1,3,'2018-06-01 00:00:00',10.0000,46,0,'ASM(46) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(89,35,1,3,'2018-07-01 00:00:00',1500.0000,40,0,'ASM(40) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(90,41,1,3,'2018-07-01 00:00:00',10.0000,47,0,'ASM(47) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(91,51,1,4,'2018-02-13 00:00:00',3000.0000,58,0,'ASM(58) d 12999 3000.00,c 12001 3000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(92,57,1,4,'2018-02-13 00:00:00',857.1400,65,0,'ASM(65) d 12999 857.14,c 12001 857.14','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(93,58,1,4,'2018-02-13 00:00:00',50.0000,66,0,'ASM(66) d 12999 50.00,c 12001 50.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(94,59,1,4,'2018-02-13 00:00:00',5.7100,67,0,'ASM(67) d 12999 5.71,c 12001 5.71','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(95,60,1,4,'2018-02-13 00:00:00',10.0000,68,0,'ASM(68) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(96,46,1,4,'2018-03-01 00:00:00',1500.0000,53,0,'ASM(53) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(97,52,1,4,'2018-03-01 00:00:00',10.0000,60,0,'ASM(60) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(98,47,1,4,'2018-04-01 00:00:00',1500.0000,54,0,'ASM(54) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(99,53,1,4,'2018-04-01 00:00:00',10.0000,61,0,'ASM(61) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(100,48,1,4,'2018-05-01 00:00:00',1500.0000,55,0,'ASM(55) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(101,54,1,4,'2018-05-01 00:00:00',10.0000,62,0,'ASM(62) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(102,49,1,4,'2018-06-01 00:00:00',1500.0000,56,0,'ASM(56) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(103,55,1,4,'2018-06-01 00:00:00',10.0000,63,0,'ASM(63) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(104,50,1,4,'2018-07-01 00:00:00',1500.0000,57,0,'ASM(57) d 12999 1500.00,c 12001 1500.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(105,56,1,4,'2018-07-01 00:00:00',10.0000,64,0,'ASM(64) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(106,6,1,1,'2018-02-13 00:00:00',2000.0000,7,0,'ASM(7) d 12999 2000.00,c 12001 2000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(107,12,1,1,'2018-02-13 00:00:00',571.4300,14,0,'ASM(14) d 12999 571.43,c 12001 571.43','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(108,13,1,1,'2018-02-13 00:00:00',50.0000,15,0,'ASM(15) d 12999 50.00,c 12001 50.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(109,14,1,1,'2018-02-13 00:00:00',5.7100,16,0,'ASM(16) d 12999 5.71,c 12001 5.71','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(110,15,1,1,'2018-02-13 00:00:00',10.0000,17,0,'ASM(17) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(111,1,1,1,'2018-03-01 00:00:00',1000.0000,2,0,'ASM(2) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(112,7,1,1,'2018-03-01 00:00:00',10.0000,9,0,'ASM(9) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(113,2,1,1,'2018-04-01 00:00:00',1000.0000,3,0,'ASM(3) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(114,8,1,1,'2018-04-01 00:00:00',10.0000,10,0,'ASM(10) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(115,3,1,1,'2018-05-01 00:00:00',1000.0000,4,0,'ASM(4) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(116,9,1,1,'2018-05-01 00:00:00',10.0000,11,0,'ASM(11) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(117,4,1,1,'2018-06-01 00:00:00',1000.0000,5,0,'ASM(5) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(118,10,1,1,'2018-06-01 00:00:00',10.0000,12,0,'ASM(12) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(119,5,1,1,'2018-07-01 00:00:00',1000.0000,6,0,'ASM(6) d 12999 1000.00,c 12001 1000.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(120,11,1,1,'2018-07-01 00:00:00',10.0000,13,0,'ASM(13) d 12999 10.00,c 12001 10.00','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(121,12,1,1,'2018-02-13 00:00:00',571.4300,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(122,13,1,1,'2018-02-13 00:00:00',50.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(123,14,1,1,'2018-02-13 00:00:00',5.7100,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(124,15,1,1,'2018-02-13 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(125,27,1,2,'2018-02-13 00:00:00',571.4300,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(126,28,1,2,'2018-02-13 00:00:00',50.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(127,29,1,2,'2018-02-13 00:00:00',5.7100,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(128,30,1,2,'2018-02-13 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(129,42,1,3,'2018-02-13 00:00:00',857.1400,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(130,43,1,3,'2018-02-13 00:00:00',50.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(131,44,1,3,'2018-02-13 00:00:00',5.7100,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(132,45,1,3,'2018-02-13 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(133,57,1,4,'2018-02-13 00:00:00',857.1400,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(134,58,1,4,'2018-02-13 00:00:00',50.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(135,59,1,4,'2018-02-13 00:00:00',5.7100,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(136,60,1,4,'2018-02-13 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(137,6,1,1,'2018-02-13 00:00:00',2000.0000,0,0,'d 10104 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(138,21,1,2,'2018-02-13 00:00:00',2000.0000,0,0,'d 10104 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(139,36,1,3,'2018-02-13 00:00:00',3000.0000,0,0,'d 10104 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(140,51,1,4,'2018-02-13 00:00:00',3000.0000,0,0,'d 10104 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(141,1,1,1,'2018-03-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(142,7,1,1,'2018-03-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(143,16,1,2,'2018-03-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(144,22,1,2,'2018-03-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(145,31,1,3,'2018-03-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(146,37,1,3,'2018-03-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(147,46,1,4,'2018-03-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(148,52,1,4,'2018-03-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(149,2,1,1,'2018-04-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(150,8,1,1,'2018-04-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(151,17,1,2,'2018-04-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(152,23,1,2,'2018-04-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(153,32,1,3,'2018-04-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(154,38,1,3,'2018-04-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(155,47,1,4,'2018-04-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(156,53,1,4,'2018-04-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(157,3,1,1,'2018-05-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(158,9,1,1,'2018-05-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(159,18,1,2,'2018-05-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(160,24,1,2,'2018-05-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(161,33,1,3,'2018-05-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(162,39,1,3,'2018-05-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(163,48,1,4,'2018-05-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(164,54,1,4,'2018-05-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(165,4,1,1,'2018-06-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(166,10,1,1,'2018-06-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(167,19,1,2,'2018-06-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(168,25,1,2,'2018-06-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(169,34,1,3,'2018-06-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(170,40,1,3,'2018-06-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(171,49,1,4,'2018-06-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(172,55,1,4,'2018-06-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(173,5,1,1,'2018-07-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(174,11,1,1,'2018-07-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(175,20,1,2,'2018-07-01 00:00:00',1000.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(176,26,1,2,'2018-07-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(177,35,1,3,'2018-07-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(178,41,1,3,'2018-07-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(179,50,1,4,'2018-07-01 00:00:00',1500.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(180,56,1,4,'2018-07-01 00:00:00',10.0000,0,0,'d 10105 _, c 10999 _','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0);
/*!40000 ALTER TABLE `ReceiptAllocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rentable`
--

DROP TABLE IF EXISTS `Rentable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rentable` (
  `RID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `PRID` bigint(20) NOT NULL DEFAULT '0',
  `RentableName` varchar(100) NOT NULL DEFAULT '',
  `AssignmentTime` smallint(6) NOT NULL DEFAULT '0',
  `MRStatus` smallint(6) NOT NULL DEFAULT '0',
  `DtMRStart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `Comment` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rentable`
--

LOCK TABLES `Rentable` WRITE;
/*!40000 ALTER TABLE `Rentable` DISABLE KEYS */;
INSERT INTO `Rentable` VALUES (1,1,0,'Rentable001',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(2,1,0,'Rentable002',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(3,1,0,'Rentable003',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(4,1,0,'Rentable004',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(5,1,0,'Rentable005',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(6,1,0,'Rentable006',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(7,1,0,'Rentable007',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(8,1,0,'Rentable008',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(9,1,0,'CP001',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(10,1,0,'CP002',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(11,1,0,'CP003',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(12,1,0,'CP004',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(13,1,0,'CP005',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(14,1,0,'CP006',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(15,1,0,'CP007',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,''),(16,1,0,'CP008',0,0,'0000-00-00 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0,'');
/*!40000 ALTER TABLE `Rentable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentableMarketRate`
--

DROP TABLE IF EXISTS `RentableMarketRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentableMarketRate` (
  `RMRID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RTID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `MarketRate` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `DtStart` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtStop` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RMRID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentableMarketRate`
--

LOCK TABLES `RentableMarketRate` WRITE;
/*!40000 ALTER TABLE `RentableMarketRate` DISABLE KEYS */;
INSERT INTO `RentableMarketRate` VALUES (1,1,0,1000.0000,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,2,0,1500.0000,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,3,0,1750.0000,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,4,0,2500.0000,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(5,5,0,35.0000,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `RentableMarketRate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentableSpecialty`
--

DROP TABLE IF EXISTS `RentableSpecialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentableSpecialty` (
  `RSPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Fee` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `Description` varchar(256) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RSPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentableSpecialty`
--

LOCK TABLES `RentableSpecialty` WRITE;
/*!40000 ALTER TABLE `RentableSpecialty` DISABLE KEYS */;
/*!40000 ALTER TABLE `RentableSpecialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentableSpecialtyRef`
--

DROP TABLE IF EXISTS `RentableSpecialtyRef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentableSpecialtyRef` (
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `RSPID` bigint(20) NOT NULL DEFAULT '0',
  `DtStart` date NOT NULL DEFAULT '1970-01-01',
  `DtStop` date NOT NULL DEFAULT '1970-01-01',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  `RSPRefID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`RSPRefID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentableSpecialtyRef`
--

LOCK TABLES `RentableSpecialtyRef` WRITE;
/*!40000 ALTER TABLE `RentableSpecialtyRef` DISABLE KEYS */;
/*!40000 ALTER TABLE `RentableSpecialtyRef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentableStatus`
--

DROP TABLE IF EXISTS `RentableStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentableStatus` (
  `RSID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `UseStatus` smallint(6) NOT NULL DEFAULT '0',
  `LeaseStatus` smallint(6) NOT NULL DEFAULT '0',
  `DtStart` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtStop` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtNoticeToVacate` date NOT NULL DEFAULT '1970-01-01',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RSID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentableStatus`
--

LOCK TABLES `RentableStatus` WRITE;
/*!40000 ALTER TABLE `RentableStatus` DISABLE KEYS */;
INSERT INTO `RentableStatus` VALUES (1,1,1,1,5,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,2,1,1,5,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,3,1,1,5,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,4,1,1,5,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(5,5,1,1,5,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(6,6,1,1,5,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(7,7,1,1,5,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(8,8,1,1,5,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(9,9,1,1,2,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(10,10,1,1,2,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(11,11,1,1,2,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(12,12,1,1,2,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(13,13,1,1,2,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(14,14,1,1,2,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(15,15,1,1,2,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(16,16,1,1,2,'2018-01-01 00:00:00','3001-01-01 00:00:00','0000-00-00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `RentableStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentableTypeRef`
--

DROP TABLE IF EXISTS `RentableTypeRef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentableTypeRef` (
  `RTRID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RTID` bigint(20) NOT NULL DEFAULT '0',
  `OverrideRentCycle` bigint(20) NOT NULL DEFAULT '0',
  `OverrideProrationCycle` bigint(20) NOT NULL DEFAULT '0',
  `DtStart` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtStop` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RTRID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentableTypeRef`
--

LOCK TABLES `RentableTypeRef` WRITE;
/*!40000 ALTER TABLE `RentableTypeRef` DISABLE KEYS */;
INSERT INTO `RentableTypeRef` VALUES (1,1,1,1,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,2,1,1,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,3,1,2,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,4,1,2,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(5,5,1,3,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(6,6,1,3,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(7,7,1,4,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(8,8,1,4,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(9,9,1,5,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(10,10,1,5,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(11,11,1,5,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(12,12,1,5,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(13,13,1,5,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(14,14,1,5,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(15,15,1,5,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(16,16,1,5,0,0,'2018-01-01 00:00:00','3001-01-01 00:00:00','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `RentableTypeRef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentableTypeTax`
--

DROP TABLE IF EXISTS `RentableTypeTax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentableTypeTax` (
  `RTID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `TAXID` bigint(20) NOT NULL DEFAULT '0',
  `DtStart` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtStop` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentableTypeTax`
--

LOCK TABLES `RentableTypeTax` WRITE;
/*!40000 ALTER TABLE `RentableTypeTax` DISABLE KEYS */;
/*!40000 ALTER TABLE `RentableTypeTax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentableTypes`
--

DROP TABLE IF EXISTS `RentableTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentableTypes` (
  `RTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Style` char(255) NOT NULL DEFAULT '',
  `Name` varchar(256) NOT NULL DEFAULT '',
  `RentCycle` bigint(20) NOT NULL DEFAULT '0',
  `Proration` bigint(20) NOT NULL DEFAULT '0',
  `GSRPC` bigint(20) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `ARID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RTID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentableTypes`
--

LOCK TABLES `RentableTypes` WRITE;
/*!40000 ALTER TABLE `RentableTypes` DISABLE KEYS */;
INSERT INTO `RentableTypes` VALUES (1,1,'ST000','RType000',6,4,4,4,40,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,'ST001','RType001',6,4,4,4,41,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,1,'ST002','RType002',6,4,4,4,42,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,1,'ST003','RType003',6,4,4,4,43,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(5,1,'CP000','Car Port 000',6,4,4,6,44,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `RentableTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentableUsers`
--

DROP TABLE IF EXISTS `RentableUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentableUsers` (
  `RUID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `DtStart` date NOT NULL DEFAULT '1970-01-01',
  `DtStop` date NOT NULL DEFAULT '1970-01-01',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RUID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentableUsers`
--

LOCK TABLES `RentableUsers` WRITE;
/*!40000 ALTER TABLE `RentableUsers` DISABLE KEYS */;
INSERT INTO `RentableUsers` VALUES (1,1,1,1,'2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,2,1,2,'2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,3,1,3,'2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,4,1,4,'2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `RentableUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentalAgreement`
--

DROP TABLE IF EXISTS `RentalAgreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentalAgreement` (
  `RAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRAID` bigint(20) NOT NULL DEFAULT '0',
  `ORIGIN` bigint(20) NOT NULL DEFAULT '0',
  `RATID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `NLID` bigint(20) NOT NULL DEFAULT '0',
  `DocumentDate` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `AgreementStart` date NOT NULL DEFAULT '1970-01-01',
  `AgreementStop` date NOT NULL DEFAULT '1970-01-01',
  `PossessionStart` date NOT NULL DEFAULT '1970-01-01',
  `PossessionStop` date NOT NULL DEFAULT '1970-01-01',
  `RentStart` date NOT NULL DEFAULT '1970-01-01',
  `RentStop` date NOT NULL DEFAULT '1970-01-01',
  `RentCycleEpoch` date NOT NULL DEFAULT '1970-01-01',
  `UnspecifiedAdults` smallint(6) NOT NULL DEFAULT '0',
  `UnspecifiedChildren` smallint(6) NOT NULL DEFAULT '0',
  `Renewal` smallint(6) NOT NULL DEFAULT '0',
  `SpecialProvisions` varchar(1024) NOT NULL DEFAULT '',
  `LeaseType` bigint(20) NOT NULL DEFAULT '0',
  `ExpenseAdjustmentType` bigint(20) NOT NULL DEFAULT '0',
  `ExpensesStop` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `ExpenseStopCalculation` varchar(128) NOT NULL DEFAULT '',
  `BaseYearEnd` date NOT NULL DEFAULT '1970-01-01',
  `ExpenseAdjustment` date NOT NULL DEFAULT '1970-01-01',
  `EstimatedCharges` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `RateChange` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `CSAgent` bigint(20) NOT NULL DEFAULT '0',
  `NextRateChange` date NOT NULL DEFAULT '1970-01-01',
  `PermittedUses` varchar(128) NOT NULL DEFAULT '',
  `ExclusiveUses` varchar(128) NOT NULL DEFAULT '',
  `ExtensionOption` varchar(128) NOT NULL DEFAULT '',
  `ExtensionOptionNotice` date NOT NULL DEFAULT '1970-01-01',
  `ExpansionOption` varchar(128) NOT NULL DEFAULT '',
  `ExpansionOptionNotice` date NOT NULL DEFAULT '1970-01-01',
  `RightOfFirstRefusal` varchar(128) NOT NULL DEFAULT '',
  `DesiredUsageStartDate` date NOT NULL DEFAULT '1970-01-01',
  `RentableTypePreference` bigint(20) NOT NULL DEFAULT '0',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `ApplicationReadyUID` bigint(20) NOT NULL DEFAULT '0',
  `ApplicationReadyDate` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `Approver1` bigint(20) NOT NULL DEFAULT '0',
  `DecisionDate1` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DeclineReason1` bigint(20) NOT NULL DEFAULT '0',
  `Approver2` bigint(20) NOT NULL DEFAULT '0',
  `DecisionDate2` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DeclineReason2` bigint(20) NOT NULL DEFAULT '0',
  `MoveInUID` bigint(20) NOT NULL DEFAULT '0',
  `MoveInDate` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `ActiveUID` bigint(20) NOT NULL DEFAULT '0',
  `ActiveDate` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `Outcome` bigint(20) NOT NULL DEFAULT '0',
  `NoticeToMoveUID` bigint(20) NOT NULL DEFAULT '0',
  `NoticeToMoveDate` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `NoticeToMoveReported` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `TerminatorUID` bigint(20) NOT NULL DEFAULT '0',
  `TerminationDate` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `LeaseTerminationReason` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RAID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentalAgreement`
--

LOCK TABLES `RentalAgreement` WRITE;
/*!40000 ALTER TABLE `RentalAgreement` DISABLE KEYS */;
INSERT INTO `RentalAgreement` VALUES (1,0,0,1,1,0,'0000-00-00 00:00:00','2018-02-13','2020-03-01','2018-02-13','2020-03-01','2018-02-13','2020-03-01','2018-03-01',2,0,2,'',0,0,0.0000,'','0000-00-00','0000-00-00',0.0000,0.0000,192,'0000-00-00','','','','0000-00-00','','0000-00-00','','0000-00-00',0,52,0,'1970-01-01 00:00:00',37,'2018-02-13 00:00:00',0,153,'2018-02-13 00:00:00',0,0,'1970-01-01 00:00:00',0,'1970-01-01 00:00:00',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,0,0,1,1,0,'0000-00-00 00:00:00','2018-02-13','2020-03-01','2018-02-13','2020-03-01','2018-02-13','2020-03-01','2018-03-01',0,1,2,'',0,0,0.0000,'','0000-00-00','0000-00-00',0.0000,0.0000,126,'0000-00-00','','','','0000-00-00','','0000-00-00','','0000-00-00',0,52,0,'1970-01-01 00:00:00',147,'2018-02-13 00:00:00',0,144,'2018-02-13 00:00:00',0,0,'1970-01-01 00:00:00',0,'1970-01-01 00:00:00',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,0,0,1,1,0,'0000-00-00 00:00:00','2018-02-13','2020-03-01','2018-02-13','2020-03-01','2018-02-13','2020-03-01','2018-03-01',0,2,2,'',0,0,0.0000,'','0000-00-00','0000-00-00',0.0000,0.0000,268,'0000-00-00','','','','0000-00-00','','0000-00-00','','0000-00-00',0,52,0,'1970-01-01 00:00:00',256,'2018-02-13 00:00:00',0,274,'2018-02-13 00:00:00',0,0,'1970-01-01 00:00:00',0,'1970-01-01 00:00:00',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,0,0,1,1,0,'0000-00-00 00:00:00','2018-02-13','2020-03-01','2018-02-13','2020-03-01','2018-02-13','2020-03-01','2018-03-01',0,2,2,'',0,0,0.0000,'','0000-00-00','0000-00-00',0.0000,0.0000,164,'0000-00-00','','','','0000-00-00','','0000-00-00','','0000-00-00',0,52,0,'1970-01-01 00:00:00',108,'2018-02-13 00:00:00',0,268,'2018-02-13 00:00:00',0,0,'1970-01-01 00:00:00',0,'1970-01-01 00:00:00',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `RentalAgreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentalAgreementPayors`
--

DROP TABLE IF EXISTS `RentalAgreementPayors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentalAgreementPayors` (
  `RAPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `DtStart` date NOT NULL DEFAULT '1970-01-01',
  `DtStop` date NOT NULL DEFAULT '1970-01-01',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RAPID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentalAgreementPayors`
--

LOCK TABLES `RentalAgreementPayors` WRITE;
/*!40000 ALTER TABLE `RentalAgreementPayors` DISABLE KEYS */;
INSERT INTO `RentalAgreementPayors` VALUES (1,1,1,1,'2018-02-13','2020-03-01',0,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,2,1,2,'2018-02-13','2020-03-01',0,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,3,1,3,'2018-02-13','2020-03-01',0,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,4,1,4,'2018-02-13','2020-03-01',0,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `RentalAgreementPayors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentalAgreementRentables`
--

DROP TABLE IF EXISTS `RentalAgreementRentables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentalAgreementRentables` (
  `RARID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RID` bigint(20) NOT NULL DEFAULT '0',
  `PRID` bigint(20) NOT NULL DEFAULT '0',
  `CLID` bigint(20) NOT NULL DEFAULT '0',
  `ContractRent` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `RARDtStart` date NOT NULL DEFAULT '1970-01-01',
  `RARDtStop` date NOT NULL DEFAULT '1970-01-01',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RARID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentalAgreementRentables`
--

LOCK TABLES `RentalAgreementRentables` WRITE;
/*!40000 ALTER TABLE `RentalAgreementRentables` DISABLE KEYS */;
INSERT INTO `RentalAgreementRentables` VALUES (1,1,1,1,0,0,1000.0000,'2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,2,1,2,0,0,1000.0000,'2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,3,1,3,0,0,1500.0000,'2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,4,1,4,0,0,1500.0000,'2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `RentalAgreementRentables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentalAgreementTax`
--

DROP TABLE IF EXISTS `RentalAgreementTax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentalAgreementTax` (
  `RAID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `DtStart` date NOT NULL DEFAULT '1970-01-01',
  `DtStop` date NOT NULL DEFAULT '1970-01-01',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentalAgreementTax`
--

LOCK TABLES `RentalAgreementTax` WRITE;
/*!40000 ALTER TABLE `RentalAgreementTax` DISABLE KEYS */;
/*!40000 ALTER TABLE `RentalAgreementTax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentalAgreementTemplate`
--

DROP TABLE IF EXISTS `RentalAgreementTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentalAgreementTemplate` (
  `RATID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `RATemplateName` varchar(100) DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RATID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentalAgreementTemplate`
--

LOCK TABLES `RentalAgreementTemplate` WRITE;
/*!40000 ALTER TABLE `RentalAgreementTemplate` DISABLE KEYS */;
INSERT INTO `RentalAgreementTemplate` VALUES (1,1,'Agreement3722.1.doc','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(2,1,'Agreement4421.2.doc','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(3,1,'Agreement4980.3.doc','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(4,1,'Agreement5342.7.doc','2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0);
/*!40000 ALTER TABLE `RentalAgreementTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SLString`
--

DROP TABLE IF EXISTS `SLString`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SLString` (
  `SLSID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `SLID` bigint(20) NOT NULL DEFAULT '0',
  `Value` varchar(256) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SLSID`)
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SLString`
--

LOCK TABLES `SLString` WRITE;
/*!40000 ALTER TABLE `SLString` DISABLE KEYS */;
INSERT INTO `SLString` VALUES (1,1,1,'4Walls','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(2,1,1,'Apartment Finder Blue Book','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(3,1,1,'Apartment Guide','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(4,1,1,'Apartment Locator','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(5,1,1,'Apartment Map','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(6,1,1,'ApartmentFinder.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(7,1,1,'ApartmentGuide.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(8,1,1,'ApartmentGuyze.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(9,1,1,'ApartmentHomeLiving.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(10,1,1,'ApartmentLints.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(11,1,1,'ApartmentMag.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(12,1,1,'ApartmentMarketer.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(13,1,1,'ApartmentMatching.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(14,1,1,'ApartmentRatings.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(15,1,1,'ApartmentSearch.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(16,1,1,'ApartmentShowcase.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(17,1,1,'Apartments.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(18,1,1,'Apartments24-7.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(19,1,1,'ApartmentsNationwide.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(20,1,1,'ApartmentsPlus.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(21,1,1,'Brochure/Flyer','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(22,1,1,'CitySearch.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(23,1,1,'CollegeRentals.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(24,1,1,'CraigsList.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(25,1,1,'Current resident','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(26,1,1,'Direct Mail - Conventional','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(27,1,1,'Direct Mail - FullService','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(28,1,1,'Drive by','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(29,1,1,'EasyRent.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(30,1,1,'El Nacional','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(31,1,1,'EliteRenting.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(32,1,1,'For Rent Magazine','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(33,1,1,'ForRent.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(34,1,1,'Google Internet Program','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(35,1,1,'Google.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(36,1,1,'HotPads.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(37,1,1,'LivingChoices.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(38,1,1,'Local Line Rolloer','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(39,1,1,'Locator Service','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(40,1,1,'Move.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(41,1,1,'MoveForFree.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(42,1,1,'MyNewPlace.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(43,1,1,'Oklahoma Gazette','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(44,1,1,'Oodle.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(45,1,1,'Other','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(46,1,1,'Other','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(47,1,1,'Other OneSite property','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(48,1,1,'Other property','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(49,1,1,'Other publication','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(50,1,1,'Other site','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(51,1,1,'PMC-owned Website','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(52,1,1,'PeopleWithPets.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(53,1,1,'Preferred employer program','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(54,1,1,'Prior resident','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(55,1,1,'Property website','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(56,1,1,'Radio Advertising','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(57,1,1,'Referral companies/merchants','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(58,1,1,'Rent.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(59,1,1,'RentAndMove.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(60,1,1,'RentClicks.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(61,1,1,'RentJungle.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(62,1,1,'RentNet.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(63,1,1,'RentWiki.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(64,1,1,'Rentals.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(65,1,1,'Rentping.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(66,1,1,'Roomster.net','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(67,1,1,'Senior Living Magazine','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(68,1,1,'Site-owned website','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(69,1,1,'TV Advertising','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(70,1,1,'Tinker Take Off','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(71,1,1,'UMoveFree.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(72,1,1,'Unknown/Would not give','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(73,1,1,'Yahoo.com','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(74,1,1,'Yellow pages','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(75,1,2,'Criminal background','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(76,1,2,'No credit history','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(77,1,2,'No employment history','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(78,1,2,'No poor credit history','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(79,1,2,'No poor employment history','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(80,1,2,'No poor rental history','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(81,1,2,'No rental history','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(82,1,2,'Other','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(83,1,3,'Abandoned Apartment','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(84,1,3,'Acquired a pet','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(85,1,3,'Added a roommate','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(86,1,3,'Amenities lacking','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(87,1,3,'Bought condominium','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(88,1,3,'Bought home','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(89,1,3,'Bought townhome','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(90,1,3,'Changed jobs','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(91,1,3,'Closer to airport','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(92,1,3,'Closer to town/city','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(93,1,3,'Closer to work','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(94,1,3,'Corporate or short term lease only','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(95,1,3,'Death or illness','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(96,1,3,'Dissatisfied for another reason','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(97,1,3,'Divorce','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(98,1,3,'Employment transfer','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(99,1,3,'Evicted for another reason','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(100,1,3,'Evicted for criminal reasons','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(101,1,3,'Evicted for non-compliance with community policies','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(102,1,3,'Evicted for non-payment of rent','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(103,1,3,'Generally unhappy with property','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(104,1,3,'Getting married','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(105,1,3,'High utility costs','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(106,1,3,'Leaving/graduating school','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(107,1,3,'Lifestyle change for another reason','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(108,1,3,'Loss of employment from the PMC','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(109,1,3,'Lost a job','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(110,1,3,'Lost a roommate','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(111,1,3,'Marital status change','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(112,1,3,'Military transfer','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(113,1,3,'Money problems','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(114,1,3,'Moving closer to home','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(115,1,3,'Moving home','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(116,1,3,'No reason given','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(117,1,3,'Noise problem','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(118,1,3,'Non-renewal of lease','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(119,1,3,'Other','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(120,1,3,'Parking problems','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(121,1,3,'Personal reasons/concerns','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(122,1,3,'Property disaster','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(123,1,3,'Rental increase','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(124,1,3,'Rentin home','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(125,1,3,'Returning/going to school','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(126,1,3,'Road construction','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(127,1,3,'Selling/old house','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(128,1,3,'Skipped during eviction process','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(129,1,3,'Skipped without notice','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(130,1,4,'ADA accessible','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(131,1,4,'Amenities lacking','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(132,1,4,'Color palette','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(133,1,4,'Drive up appeal','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(134,1,4,'Furniture','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(135,1,4,'Lease term','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(136,1,4,'Location to employment','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(137,1,4,'Location to family','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(138,1,4,'Location to shopping and entertainment','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(139,1,4,'Meets square footage needs','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(140,1,4,'Personnel','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(141,1,4,'Pet allowances','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(142,1,4,'Point of lease e-commerce offers','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(143,1,4,'Priing','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(144,1,4,'Public transportation','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(145,1,4,'School district','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(146,1,4,'Special','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(147,1,5,'Amenities ^ Amenities lacking','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(148,1,5,'Amenities ^ Bedroom size','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(149,1,5,'Amenities ^ Color scheme','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(150,1,5,'Amenities ^ Competition has better amenities','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(151,1,5,'Amenities ^ Objection to floor plan','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(152,1,5,'Cost ^ Competition is less expensive','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(153,1,5,'Cost ^ No specials/concessions','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(154,1,5,'Cost ^ Too expensive','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(155,1,5,'Inactive ^ Inactive','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(156,1,5,'Location ^ Location','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(157,1,5,'Location ^ Road construction','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(158,1,5,'Location ^ Too close to highway','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(159,1,5,'Not available ^ Unit/floor plan not available','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(160,1,5,'Not interested ^ Bought/rented house instead','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(161,1,5,'Not interested ^ Changed their mind','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(162,1,5,'Not interested ^ Not interested','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(163,1,5,'Not qualified ^ Credit rating below standard','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(164,1,5,'Not qualified ^ Criminal history not allowed','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(165,1,5,'Not qualified ^ Does not meet property criteria','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(166,1,5,'Not qualified ^ Oversized/unallowable pet','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(167,1,5,'Not qualified ^ Rental history not allowed','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(168,1,5,'Not qualified ^ Roommate/spouse unqualified','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(169,1,5,'Not qualified ^ Too many occupants','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(170,1,2,'Application declined','2018-06-30 00:53:45',0,'2018-06-30 00:53:45',0),(175,1,7,'Accountants','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(176,1,7,'Advertising/Public Relations','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(177,1,7,'Aerospace','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(178,1,7,'Agribusiness','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(179,1,7,'Agricultural Services & Products','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(180,1,7,'Agriculture','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(181,1,7,'Air Transport','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(182,1,7,'Air Transport Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(183,1,7,'Airlines','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(184,1,7,'Alcoholic Beverages','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(185,1,7,'Alternative Energy Production & Services','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(186,1,7,'Architectural Services','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(187,1,7,'Attorneys/Law Firms','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(188,1,7,'Auto Dealers','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(189,1,7,'Auto Dealers','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(190,1,7,'Auto Manufacturers','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(191,1,7,'Automotive','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(192,1,7,'Banking','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(193,1,7,'Banks','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(194,1,7,'Banks','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(195,1,7,'Bars & Restaurants','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(196,1,7,'Beer','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(197,1,7,'Books','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(198,1,7,'Broadcasters','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(199,1,7,'Builders/General Contractors','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(200,1,7,'Builders/Residential','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(201,1,7,'Building Materials & Equipment','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(202,1,7,'Building Trade Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(203,1,7,'Business Associations','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(204,1,7,'Business Services','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(205,1,7,'Cable & Satellite TV Production & Distribution','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(206,1,7,'Candidate Committees','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(207,1,7,'Candidate Committees','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(208,1,7,'Candidate Committees','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(209,1,7,'Car Dealers','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(210,1,7,'Car Dealers','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(211,1,7,'Car Manufacturers','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(212,1,7,'Casinos / Gambling','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(213,1,7,'Cattle Ranchers/Livestock','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(214,1,7,'Chemical & Related Manufacturing','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(215,1,7,'Chiropractors','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(216,1,7,'Civil Servants/Public Officials','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(217,1,7,'Clergy & Religious Organizations','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(218,1,7,'Clothing Manufacturing','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(219,1,7,'Coal Mining','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(220,1,7,'Colleges','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(221,1,7,'Commercial Banks','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(222,1,7,'Commercial TV & Radio Stations','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(223,1,7,'Communications/Electronics','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(224,1,7,'Computer Software','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(225,1,7,'Conservative/Republican','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(226,1,7,'Construction','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(227,1,7,'Construction Services','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(228,1,7,'Construction Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(229,1,7,'Credit Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(230,1,7,'Crop Production & Basic Processing','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(231,1,7,'Cruise Lines','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(232,1,7,'Cruise Ships & Lines','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(233,1,7,'Dairy','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(234,1,7,'Defense','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(235,1,7,'Defense Aerospace','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(236,1,7,'Defense Electronics','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(237,1,7,'Defense/Foreign Policy Advocates','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(238,1,7,'Democratic Candidate Committees','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(239,1,7,'Democratic Leadership PACs','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(240,1,7,'Democratic/Liberal','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(241,1,7,'Dentists','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(242,1,7,'Doctors & Other Health Professionals','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(243,1,7,'Drug Manufacturers','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(244,1,7,'Education','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(245,1,7,'Electric Utilities','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(246,1,7,'Electronics Manufacturing & Equipment','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(247,1,7,'Electronics','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(248,1,7,'Energy & Natural Resources','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(249,1,7,'Entertainment Industry','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(250,1,7,'Environment','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(251,1,7,'Farm Bureaus','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(252,1,7,'Farming','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(253,1,7,'Finance / Credit Companies','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(254,1,7,'Finance','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(255,1,7,'Food & Beverage','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(256,1,7,'Food Processing & Sales','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(257,1,7,'Food Products Manufacturing','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(258,1,7,'Food Stores','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(259,1,7,'For-profit Education','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(260,1,7,'For-profit Prisons','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(261,1,7,'Foreign & Defense Policy','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(262,1,7,'Forestry & Forest Products','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(263,1,7,'Foundations','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(264,1,7,'Funeral Services','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(265,1,7,'Gambling & Casinos','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(266,1,7,'Gambling','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(267,1,7,'Garbage Collection/Waste Management','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(268,1,7,'Gas & Oil','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(269,1,7,'Gay & Lesbian Rights & Issues','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(270,1,7,'General Contractors','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(271,1,7,'Government Employee Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(272,1,7,'Government Employees','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(273,1,7,'Gun Control','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(274,1,7,'Gun Rights','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(275,1,7,'Health','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(276,1,7,'Health Professionals','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(277,1,7,'Health Services/HMOs','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(278,1,7,'Hedge Funds','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(279,1,7,'HMOs & Health Care Services','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(280,1,7,'Home Builders','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(281,1,7,'Hospitals & Nursing Homes','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(282,1,7,'Hotels','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(283,1,7,'Human Rights','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(284,1,7,'Ideological/Single-Issue','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(285,1,7,'Indian Gaming','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(286,1,7,'Industrial Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(287,1,7,'Insurance','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(288,1,7,'Internet','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(289,1,7,'Israel Policy','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(290,1,7,'Labor','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(291,1,7,'Lawyers & Lobbyists','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(292,1,7,'Lawyers / Law Firms','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(293,1,7,'Leadership PACs','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(294,1,7,'Liberal/Democratic','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(295,1,7,'Liquor','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(296,1,7,'Livestock','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(297,1,7,'Lobbyists','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(298,1,7,'Lodging / Tourism','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(299,1,7,'Logging','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(300,1,7,'Manufacturing','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(301,1,7,'Marine Transport','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(302,1,7,'Meat processing & products','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(303,1,7,'Medical Supplies','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(304,1,7,'Mining','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(305,1,7,'Misc Business','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(306,1,7,'Misc Finance','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(307,1,7,'Misc Manufacturing & Distributing','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(308,1,7,'Misc Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(309,1,7,'Miscellaneous Defense','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(310,1,7,'Miscellaneous Services','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(311,1,7,'Mortgage Bankers & Brokers','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(312,1,7,'Motion Picture Production & Distribution','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(313,1,7,'Music Production','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(314,1,7,'Natural Gas Pipelines','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(315,1,7,'Newspaper','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(316,1,7,'Non-profits','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(317,1,7,'Nurses','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(318,1,7,'Nursing Homes/Hospitals','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(319,1,7,'Nutritional & Dietary Supplements','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(320,1,7,'Oil & Gas','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(321,1,7,'Payday Lenders','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(322,1,7,'Pharmaceutical Manufacturing','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(323,1,7,'Pharmaceuticals / Health Products','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(324,1,7,'Phone Companies','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(325,1,7,'Physicians & Other Health Professionals','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(326,1,7,'Postal Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(327,1,7,'Poultry & Eggs','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(328,1,7,'Power Utilities','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(329,1,7,'Printing & Publishing','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(330,1,7,'Private Equity & Investment Firms','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(331,1,7,'Pro-Israel','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(332,1,7,'Professional Sports','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(333,1,7,'Progressive/Democratic','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(334,1,7,'Public Employees','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(335,1,7,'Public Sector Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(336,1,7,'Publishing & Printing','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(337,1,7,'Radio/TV Stations','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(338,1,7,'Railroads','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(339,1,7,'Real Estate','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(340,1,7,'Record Companies/Singers','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(341,1,7,'Recorded Music & Music Production','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(342,1,7,'Recreation / Live Entertainment','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(343,1,7,'Religious Organizations/Clergy','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(344,1,7,'Republican Candidate Committees','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(345,1,7,'Republican Leadership PACs','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(346,1,7,'Republican/Conservative','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(347,1,7,'Residential Construction','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(348,1,7,'Restaurants & Drinking Establishments','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(349,1,7,'Retail Sales','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(350,1,7,'Retired','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(351,1,7,'Savings & Loans','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(352,1,7,'Schools/Education','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(353,1,7,'Sea Transport','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(354,1,7,'Securities & Investment','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(355,1,7,'Special Trade Contractors','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(356,1,7,'Sports','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(357,1,7,'Steel Production','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(358,1,7,'Stock Brokers/Investment Industry','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(359,1,7,'Student Loan Companies','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(360,1,7,'Sugar Cane & Sugar Beets','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(361,1,7,'Teachers Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(362,1,7,'Teachers/Education','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(363,1,7,'Telecom Services & Equipment','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(364,1,7,'Telephone Utilities','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(365,1,7,'Textiles','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(366,1,7,'Timber','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(367,1,7,'Tobacco','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(368,1,7,'Transportation','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(369,1,7,'Transportation Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(370,1,7,'Trash Collection/Waste Management','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(371,1,7,'Trucking','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(372,1,7,'TV / Movies / Music','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(373,1,7,'TV Production','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(374,1,7,'Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(375,1,7,'Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(376,1,7,'Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(377,1,7,'Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(378,1,7,'Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(379,1,7,'Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(380,1,7,'Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(381,1,7,'Unions','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(382,1,7,'Universities','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(383,1,7,'Vegetables & Fruits','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(384,1,7,'Venture Capital','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(385,1,7,'Waste Management','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(386,1,7,'Wine','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0),(387,1,7,'Women\'s Issues','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0);
/*!40000 ALTER TABLE `SLString` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StringList`
--

DROP TABLE IF EXISTS `StringList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StringList` (
  `SLID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(50) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SLID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StringList`
--

LOCK TABLES `StringList` WRITE;
/*!40000 ALTER TABLE `StringList` DISABLE KEYS */;
INSERT INTO `StringList` VALUES (1,1,'HowFound','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(2,1,'ApplDeny','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(3,1,'WhyLeaving','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(4,1,'WhyChoose','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(5,1,'ProspectLost','2018-06-12 18:01:26',0,'2018-06-12 18:01:26',0),(7,1,'Industries','2018-07-24 09:09:29',0,'2018-07-24 09:09:29',0);
/*!40000 ALTER TABLE `StringList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubAR`
--

DROP TABLE IF EXISTS `SubAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubAR` (
  `SARID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ARID` bigint(20) NOT NULL DEFAULT '0',
  `SubARID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SARID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubAR`
--

LOCK TABLES `SubAR` WRITE;
/*!40000 ALTER TABLE `SubAR` DISABLE KEYS */;
INSERT INTO `SubAR` VALUES (1,15,14,1,'2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0),(2,37,36,1,'2017-11-10 23:24:23',0,'2017-11-10 23:24:23',0);
/*!40000 ALTER TABLE `SubAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBind`
--

DROP TABLE IF EXISTS `TBind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBind` (
  `TBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `SourceElemType` bigint(20) NOT NULL DEFAULT '0',
  `SourceElemID` bigint(20) NOT NULL DEFAULT '0',
  `AssocElemType` bigint(20) NOT NULL DEFAULT '0',
  `AssocElemID` bigint(20) NOT NULL DEFAULT '0',
  `DtStart` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtStop` datetime NOT NULL DEFAULT '2066-01-01 00:00:00',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBind`
--

LOCK TABLES `TBind` WRITE;
/*!40000 ALTER TABLE `TBind` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TWS`
--

DROP TABLE IF EXISTS `TWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TWS` (
  `TWSID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Owner` varchar(256) NOT NULL DEFAULT '',
  `OwnerData` varchar(256) NOT NULL DEFAULT '',
  `WorkerName` varchar(256) NOT NULL DEFAULT '',
  `ActivateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Node` varchar(256) NOT NULL DEFAULT '',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `DtActivated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DtCompleted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DtCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DtLastUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TWSID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TWS`
--

LOCK TABLES `TWS` WRITE;
/*!40000 ALTER TABLE `TWS` DISABLE KEYS */;
INSERT INTO `TWS` VALUES (1,'CreateAssessmentInstances','','CreateAssessmentInstances','2018-02-25 00:00:00','Steves-MacBook-Pro-2.local',4,'2018-02-24 01:19:54','2018-02-24 01:19:54','2017-11-10 15:24:21','2018-02-23 17:19:53'),(2,'CleanRARBalanceCache','','CleanRARBalanceCache','2018-02-24 05:09:45','Steves-MacBook-Pro-2.local',4,'2018-02-24 05:04:45','2018-02-24 05:04:45','2018-02-23 17:19:43','2018-02-23 21:04:45'),(3,'CleanSecDepBalanceCache','','CleanSecDepBalanceCache','2018-02-24 05:09:45','Steves-MacBook-Pro-2.local',4,'2018-02-24 05:04:45','2018-02-24 05:04:45','2018-02-23 17:19:43','2018-02-23 21:04:45'),(4,'CleanAcctSliceCache','','CleanAcctSliceCache','2018-02-24 05:09:45','Steves-MacBook-Pro-2.local',4,'2018-02-24 05:04:45','2018-02-24 05:04:45','2018-02-23 17:19:43','2018-02-23 21:04:45'),(5,'CleanARSliceCache','','CleanARSliceCache','2018-02-24 05:09:45','Steves-MacBook-Pro-2.local',4,'2018-02-24 05:04:45','2018-02-24 05:04:45','2018-02-23 17:19:43','2018-02-23 21:04:45'),(6,'RARBcacheBot','','RARBcacheBot','2018-07-23 16:17:39','Steves-MacBook-Pro-2.local',4,'2018-07-23 16:12:39','2018-07-23 16:12:39','2018-06-02 13:09:58','2018-07-23 09:12:38'),(7,'ARSliceCacheBot','','ARSliceCacheBot','2018-07-23 16:17:39','Steves-MacBook-Pro-2.local',4,'2018-07-23 16:12:39','2018-07-23 16:12:39','2018-06-02 13:09:58','2018-07-23 09:12:38'),(8,'TLReportBot','','TLReportBot','2018-07-23 16:18:59','Steves-MacBook-Pro-2.local',4,'2018-07-23 16:16:59','2018-07-23 16:16:59','2018-06-02 13:09:58','2018-07-23 09:16:58'),(9,'ManualTaskBot','','ManualTaskBot','2018-07-24 16:12:39','Steves-MacBook-Pro-2.local',4,'2018-07-23 16:12:39','2018-07-23 16:12:39','2018-06-02 13:09:58','2018-07-23 09:12:38'),(10,'AssessmentBot','','AssessmentBot','2018-07-24 16:12:39','Steves-MacBook-Pro-2.local',4,'2018-07-23 16:12:39','2018-07-23 16:12:39','2018-06-02 13:09:58','2018-07-23 09:12:38'),(11,'SecDepCacheBot','','SecDepCacheBot','2018-07-23 16:17:39','Steves-MacBook-Pro-2.local',4,'2018-07-23 16:12:39','2018-07-23 16:12:39','2018-06-02 13:09:58','2018-07-23 09:12:38'),(12,'AcctSliceCacheBot','','AcctSliceCacheBot','2018-07-23 16:17:39','Steves-MacBook-Pro-2.local',4,'2018-07-23 16:12:39','2018-07-23 16:12:39','2018-06-02 13:09:58','2018-07-23 09:12:38'),(13,'TLInstanceBot','','TLInstanceBot','2018-07-24 16:12:39','Steves-MacBook-Pro-2.local',4,'2018-07-23 16:12:39','2018-07-23 16:12:39','2018-06-02 13:09:58','2018-07-23 09:12:38');
/*!40000 ALTER TABLE `TWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Task`
--

DROP TABLE IF EXISTS `Task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Task` (
  `TID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `TLID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(256) NOT NULL DEFAULT '',
  `Worker` varchar(80) NOT NULL DEFAULT '',
  `DtDue` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtPreDue` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtDone` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtPreDone` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `DoneUID` bigint(20) NOT NULL DEFAULT '0',
  `PreDoneUID` bigint(20) NOT NULL DEFAULT '0',
  `Comment` varchar(2048) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Task`
--

LOCK TABLES `Task` WRITE;
/*!40000 ALTER TABLE `Task` DISABLE KEYS */;
INSERT INTO `Task` VALUES (1,1,1,'Tie closing SECDEP balance to bank SECDEP balance','ManualTaskBot','2018-02-28 20:00:00','2018-02-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(2,1,1,'Review all receivables for accuracy','ManualTaskBot','2018-02-28 20:00:00','2018-02-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(3,1,1,'Compare total cash deposits to bank statement','ManualTaskBot','2018-02-28 20:00:00','2018-02-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(4,1,1,'Confirm all Lease Concessions are document in resident\'s lease','ManualTaskBot','2018-02-28 07:00:00','2018-02-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(5,1,1,'Tie all Bar/Spa/F&B deposits in POS Lavu to Rent Roll Deposits','ManualTaskBot','2018-02-28 07:00:00','2018-02-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(6,1,1,'Make certain that all suspense accounts have been closed out','ManualTaskBot','2018-02-28 07:00:00','2018-02-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(7,1,1,'Compile all workpapers for the foregoing confirmations, and file as YYYY-MM-DD [3-letter property] Rent Roll Work Papers','ManualTaskBot','2018-02-28 07:00:00','2018-02-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(8,1,1,'Print Rent Roll Activity Report','ManualTaskBot','2018-02-28 07:00:00','2018-02-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(9,1,1,'Print Rent Roll Report','ManualTaskBot','2018-02-28 07:00:00','2018-02-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(10,1,1,'File PDFs for the reports as YYY-MM-DD [3-letter-property] Rent Roll','ManualTaskBot','2018-02-28 07:00:00','2018-02-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(11,1,2,'Tie closing SECDEP balance to bank SECDEP balance','ManualTaskBot','2018-03-31 20:00:00','2018-03-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(12,1,2,'Review all receivables for accuracy','ManualTaskBot','2018-03-31 20:00:00','2018-03-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(13,1,2,'Compare total cash deposits to bank statement','ManualTaskBot','2018-03-31 20:00:00','2018-03-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(14,1,2,'Confirm all Lease Concessions are document in resident\'s lease','ManualTaskBot','2018-03-31 07:00:00','2018-03-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(15,1,2,'Tie all Bar/Spa/F&B deposits in POS Lavu to Rent Roll Deposits','ManualTaskBot','2018-03-31 07:00:00','2018-03-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(16,1,2,'Make certain that all suspense accounts have been closed out','ManualTaskBot','2018-03-31 07:00:00','2018-03-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(17,1,2,'Compile all workpapers for the foregoing confirmations, and file as YYYY-MM-DD [3-letter property] Rent Roll Work Papers','ManualTaskBot','2018-03-31 07:00:00','2018-03-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(18,1,2,'Print Rent Roll Activity Report','ManualTaskBot','2018-03-31 07:00:00','2018-03-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(19,1,2,'Print Rent Roll Report','ManualTaskBot','2018-03-31 07:00:00','2018-03-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(20,1,2,'File PDFs for the reports as YYY-MM-DD [3-letter-property] Rent Roll','ManualTaskBot','2018-03-31 07:00:00','2018-03-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(21,1,3,'Tie closing SECDEP balance to bank SECDEP balance','ManualTaskBot','2018-04-30 20:00:00','2018-04-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(22,1,3,'Review all receivables for accuracy','ManualTaskBot','2018-04-30 20:00:00','2018-04-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(23,1,3,'Compare total cash deposits to bank statement','ManualTaskBot','2018-04-30 20:00:00','2018-04-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(24,1,3,'Confirm all Lease Concessions are document in resident\'s lease','ManualTaskBot','2018-04-30 07:00:00','2018-04-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(25,1,3,'Tie all Bar/Spa/F&B deposits in POS Lavu to Rent Roll Deposits','ManualTaskBot','2018-04-30 07:00:00','2018-04-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(26,1,3,'Make certain that all suspense accounts have been closed out','ManualTaskBot','2018-04-30 07:00:00','2018-04-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(27,1,3,'Compile all workpapers for the foregoing confirmations, and file as YYYY-MM-DD [3-letter property] Rent Roll Work Papers','ManualTaskBot','2018-04-30 07:00:00','2018-04-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(28,1,3,'Print Rent Roll Activity Report','ManualTaskBot','2018-04-30 07:00:00','2018-04-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(29,1,3,'Print Rent Roll Report','ManualTaskBot','2018-04-30 07:00:00','2018-04-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(30,1,3,'File PDFs for the reports as YYY-MM-DD [3-letter-property] Rent Roll','ManualTaskBot','2018-04-30 07:00:00','2018-04-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(31,1,4,'Tie closing SECDEP balance to bank SECDEP balance','ManualTaskBot','2018-05-31 20:00:00','2018-05-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(32,1,4,'Review all receivables for accuracy','ManualTaskBot','2018-05-31 20:00:00','2018-05-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(33,1,4,'Compare total cash deposits to bank statement','ManualTaskBot','2018-05-31 20:00:00','2018-05-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(34,1,4,'Confirm all Lease Concessions are document in resident\'s lease','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(35,1,4,'Tie all Bar/Spa/F&B deposits in POS Lavu to Rent Roll Deposits','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(36,1,4,'Make certain that all suspense accounts have been closed out','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(37,1,4,'Compile all workpapers for the foregoing confirmations, and file as YYYY-MM-DD [3-letter property] Rent Roll Work Papers','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(38,1,4,'Print Rent Roll Activity Report','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(39,1,4,'Print Rent Roll Report','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(40,1,4,'File PDFs for the reports as YYY-MM-DD [3-letter-property] Rent Roll','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(41,1,5,'Tie closing SECDEP balance to bank SECDEP balance','ManualTaskBot','2018-06-30 20:00:00','2018-06-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(42,1,5,'Review all receivables for accuracy','ManualTaskBot','2018-06-30 20:00:00','2018-06-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(43,1,5,'Compare total cash deposits to bank statement','ManualTaskBot','2018-06-30 20:00:00','2018-06-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(44,1,5,'Confirm all Lease Concessions are document in resident\'s lease','ManualTaskBot','2018-06-30 07:00:00','2018-06-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(45,1,5,'Tie all Bar/Spa/F&B deposits in POS Lavu to Rent Roll Deposits','ManualTaskBot','2018-06-30 07:00:00','2018-06-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(46,1,5,'Make certain that all suspense accounts have been closed out','ManualTaskBot','2018-06-30 07:00:00','2018-06-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(47,1,5,'Compile all workpapers for the foregoing confirmations, and file as YYYY-MM-DD [3-letter property] Rent Roll Work Papers','ManualTaskBot','2018-06-30 07:00:00','2018-06-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(48,1,5,'Print Rent Roll Activity Report','ManualTaskBot','2018-06-30 07:00:00','2018-06-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(49,1,5,'Print Rent Roll Report','ManualTaskBot','2018-06-30 07:00:00','2018-06-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(50,1,5,'File PDFs for the reports as YYY-MM-DD [3-letter-property] Rent Roll','ManualTaskBot','2018-06-30 07:00:00','2018-06-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(51,1,6,'Tie closing SECDEP balance to bank SECDEP balance','ManualTaskBot','2018-07-31 20:00:00','2018-07-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(52,1,6,'Review all receivables for accuracy','ManualTaskBot','2018-07-31 20:00:00','2018-07-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(53,1,6,'Compare total cash deposits to bank statement','ManualTaskBot','2018-07-31 20:00:00','2018-07-20 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(54,1,6,'Confirm all Lease Concessions are document in resident\'s lease','ManualTaskBot','2018-07-31 07:00:00','2018-07-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(55,1,6,'Tie all Bar/Spa/F&B deposits in POS Lavu to Rent Roll Deposits','ManualTaskBot','2018-07-31 07:00:00','2018-07-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(56,1,6,'Make certain that all suspense accounts have been closed out','ManualTaskBot','2018-07-31 07:00:00','2018-07-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(57,1,6,'Compile all workpapers for the foregoing confirmations, and file as YYYY-MM-DD [3-letter property] Rent Roll Work Papers','ManualTaskBot','2018-07-31 07:00:00','2018-07-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(58,1,6,'Print Rent Roll Activity Report','ManualTaskBot','2018-07-31 07:00:00','2018-07-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(59,1,6,'Print Rent Roll Report','ManualTaskBot','2018-07-31 07:00:00','2018-07-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(60,1,6,'File PDFs for the reports as YYY-MM-DD [3-letter-property] Rent Roll','ManualTaskBot','2018-07-31 07:00:00','2018-07-20 07:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0);
/*!40000 ALTER TABLE `Task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskDescriptor`
--

DROP TABLE IF EXISTS `TaskDescriptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskDescriptor` (
  `TDID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `TLDID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(256) NOT NULL DEFAULT '',
  `Worker` varchar(80) NOT NULL DEFAULT '',
  `EpochDue` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `EpochPreDue` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Comment` varchar(2048) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TDID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskDescriptor`
--

LOCK TABLES `TaskDescriptor` WRITE;
/*!40000 ALTER TABLE `TaskDescriptor` DISABLE KEYS */;
INSERT INTO `TaskDescriptor` VALUES (1,1,1,'Tie closing SECDEP balance to bank SECDEP balance','ManualTaskBot','2018-01-31 20:00:00','2018-01-20 20:00:00',0,'','2018-07-06 17:19:04',211,'2018-03-14 19:50:32',0),(2,1,1,'Review all receivables for accuracy','ManualTaskBot','2018-01-31 20:00:00','2018-01-20 20:00:00',0,'(provide comment for any receivables more than 30 days old','2018-05-29 18:22:57',211,'2018-03-14 19:50:32',0),(3,1,1,'Compare total cash deposits to bank statement','ManualTaskBot','2018-01-31 20:00:00','2018-01-20 20:00:00',0,'','2018-05-29 18:23:38',211,'2018-03-14 19:50:32',0),(5,1,1,'Confirm all Lease Concessions are document in resident\'s lease','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00',0,' or make certain that you have a Report for any After-Lease Concessions occurring during the month','2018-05-29 18:24:26',0,'2018-05-29 18:24:26',211),(6,1,1,'Tie all Bar/Spa/F&B deposits in POS Lavu to Rent Roll Deposits','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00',0,'','2018-05-29 18:25:05',0,'2018-05-29 18:25:05',211),(7,1,1,'Make certain that all suspense accounts have been closed out','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00',0,'','2018-05-29 18:25:30',0,'2018-05-29 18:25:30',211),(8,1,1,'Compile all workpapers for the foregoing confirmations, and file as YYYY-MM-DD [3-letter property] Rent Roll Work Papers','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00',0,'','2018-05-29 18:25:57',0,'2018-05-29 18:25:57',211),(9,1,1,'Print Rent Roll Activity Report','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00',0,'','2018-05-29 18:30:54',0,'2018-05-29 18:30:54',211),(10,1,1,'Print Rent Roll Report','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00',0,'','2018-05-29 18:31:18',0,'2018-05-29 18:31:18',211),(11,1,1,'File PDFs for the reports as YYY-MM-DD [3-letter-property] Rent Roll','ManualTaskBot','2018-05-31 07:00:00','2018-05-20 07:00:00',0,'','2018-05-29 18:32:06',0,'2018-05-29 18:32:06',211);
/*!40000 ALTER TABLE `TaskDescriptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskList`
--

DROP TABLE IF EXISTS `TaskList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskList` (
  `TLID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `PTLID` bigint(20) NOT NULL DEFAULT '0',
  `TLDID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(256) NOT NULL DEFAULT '',
  `Cycle` bigint(20) NOT NULL DEFAULT '0',
  `DtDue` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtPreDue` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtDone` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DtPreDone` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `DoneUID` bigint(20) NOT NULL DEFAULT '0',
  `PreDoneUID` bigint(20) NOT NULL DEFAULT '0',
  `EmailList` varchar(2048) NOT NULL DEFAULT '',
  `DtLastNotify` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `DurWait` bigint(20) NOT NULL DEFAULT '86400000000000',
  `Comment` varchar(2048) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TLID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskList`
--

LOCK TABLES `TaskList` WRITE;
/*!40000 ALTER TABLE `TaskList` DISABLE KEYS */;
INSERT INTO `TaskList` VALUES (1,1,0,1,'Monthly Close',6,'2018-02-28 17:00:00','2018-02-20 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',6,0,0,'','0000-00-00 00:00:00',86400000000000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(2,1,1,1,'Monthly Close',6,'2018-03-31 17:00:00','2018-03-20 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',6,0,0,'','0000-00-00 00:00:00',86400000000000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(3,1,1,1,'Monthly Close',6,'2018-04-30 17:00:00','2018-04-20 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',6,0,0,'','0000-00-00 00:00:00',86400000000000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(4,1,1,1,'Monthly Close',6,'2018-05-31 17:00:00','2018-05-20 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',6,0,0,'','0000-00-00 00:00:00',86400000000000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(5,1,1,1,'Monthly Close',6,'2018-06-30 17:00:00','2018-06-20 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',6,0,0,'','0000-00-00 00:00:00',86400000000000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0),(6,1,1,1,'Monthly Close',6,'2018-07-31 17:00:00','2018-07-20 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',6,0,0,'','0000-00-00 00:00:00',86400000000000,'','2018-07-27 06:49:31',0,'2018-07-27 06:49:31',0);
/*!40000 ALTER TABLE `TaskList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskListDefinition`
--

DROP TABLE IF EXISTS `TaskListDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskListDefinition` (
  `TLDID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(256) NOT NULL DEFAULT '',
  `Cycle` bigint(20) NOT NULL DEFAULT '0',
  `Epoch` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `EpochDue` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `EpochPreDue` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `EmailList` varchar(2048) NOT NULL DEFAULT '',
  `DurWait` bigint(20) NOT NULL DEFAULT '86400000000000',
  `Comment` varchar(2048) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TLDID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskListDefinition`
--

LOCK TABLES `TaskListDefinition` WRITE;
/*!40000 ALTER TABLE `TaskListDefinition` DISABLE KEYS */;
INSERT INTO `TaskListDefinition` VALUES (1,1,'Monthly Close',6,'2018-01-01 00:00:00','2018-01-31 17:00:00','2018-01-20 17:00:00',6,'',86400000000000,'','2018-05-29 18:39:32',211,'2018-03-14 19:50:32',0),(2,1,'Tucasa Apts Period Close',6,'2018-01-01 00:00:00','2018-01-31 00:00:00','2018-01-20 00:00:00',7,'bounce@simulator.amazonses.com',86400000000000,'','2018-05-29 18:15:32',0,'2018-05-29 18:15:32',0);
/*!40000 ALTER TABLE `TaskListDefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tax`
--

DROP TABLE IF EXISTS `Tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tax` (
  `TAXID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `TaxingAuthority` varchar(100) DEFAULT NULL,
  `TaxingAuthorityAddress` varchar(256) DEFAULT NULL,
  `FilingDate` date NOT NULL DEFAULT '1970-01-01',
  `FilingCycle` bigint(20) NOT NULL DEFAULT '0',
  `Instructions` varchar(1024) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TAXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tax`
--

LOCK TABLES `Tax` WRITE;
/*!40000 ALTER TABLE `Tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaxRate`
--

DROP TABLE IF EXISTS `TaxRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaxRate` (
  `TAXID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `DtStart` date NOT NULL DEFAULT '1970-01-01',
  `DtStop` date NOT NULL DEFAULT '1970-01-01',
  `Rate` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `Fee` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `Formula` varchar(256) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaxRate`
--

LOCK TABLES `TaxRate` WRITE;
/*!40000 ALTER TABLE `TaxRate` DISABLE KEYS */;
/*!40000 ALTER TABLE `TaxRate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactant`
--

DROP TABLE IF EXISTS `Transactant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transactant` (
  `TCID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `NLID` bigint(20) NOT NULL DEFAULT '0',
  `FirstName` varchar(100) NOT NULL DEFAULT '',
  `MiddleName` varchar(100) NOT NULL DEFAULT '',
  `LastName` varchar(100) NOT NULL DEFAULT '',
  `PreferredName` varchar(100) NOT NULL DEFAULT '',
  `CompanyName` varchar(100) NOT NULL DEFAULT '',
  `IsCompany` tinyint(1) NOT NULL DEFAULT '0',
  `PrimaryEmail` varchar(100) NOT NULL DEFAULT '',
  `SecondaryEmail` varchar(100) NOT NULL DEFAULT '',
  `WorkPhone` varchar(100) NOT NULL DEFAULT '',
  `CellPhone` varchar(100) NOT NULL DEFAULT '',
  `Address` varchar(100) NOT NULL DEFAULT '',
  `Address2` varchar(100) NOT NULL DEFAULT '',
  `City` varchar(100) NOT NULL DEFAULT '',
  `State` char(25) NOT NULL DEFAULT '',
  `PostalCode` varchar(100) NOT NULL DEFAULT '',
  `Country` varchar(100) NOT NULL DEFAULT '',
  `Website` varchar(100) NOT NULL DEFAULT '',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Comment` varchar(2048) NOT NULL DEFAULT '',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TCID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactant`
--

LOCK TABLES `Transactant` WRITE;
/*!40000 ALTER TABLE `Transactant` DISABLE KEYS */;
INSERT INTO `Transactant` VALUES (1,1,0,'Susannah','Kacey','Powell','Janie','Temple-Inland Inc',0,'SusannahP2629@bdiddy.com','SusannahP5584@bdiddy.com','(781) 885-7154','(136) 363-9853','11527 Spruce','','Waterbury','MO','98081','USA','',0,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,0,'Hang','Elin','Jenkins','Porter','Terex Corp',0,'HJenkins1955@gmail.com','HangJenkins531@bdiddy.com','(775) 685-5495','(937) 799-6156','71665 Pleasant','','South Lyon','AZ','54425','USA','',0,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,1,0,'Karl','Cassondra','Terrell','Verda','Dollar General Corporation',0,'KarlT4001@yahoo.com','KTerrell6295@bdiddy.com','(385) 325-6088','(730) 955-3976','23133 Delaware','','Panama City','MO','28162','USA','',0,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,1,0,'Chery','Dario','Mccray','Vernon','AMR Corporation',0,'CMccray5195@yahoo.com','CheryM9539@bdiddy.com','(507) 305-9107','(711) 982-0588','17861 Ridge','','Thousand Oaks','MN','23237','USA','',0,'','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `Transactant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `TCID` bigint(20) NOT NULL,
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `Points` bigint(20) NOT NULL DEFAULT '0',
  `DateofBirth` date NOT NULL DEFAULT '1970-01-01',
  `EmergencyContactName` varchar(100) NOT NULL DEFAULT '',
  `EmergencyContactAddress` varchar(100) NOT NULL DEFAULT '',
  `EmergencyContactTelephone` varchar(100) NOT NULL DEFAULT '',
  `EmergencyContactEmail` varchar(100) NOT NULL DEFAULT '',
  `AlternateEmailAddress` varchar(100) NOT NULL DEFAULT '',
  `EligibleFutureUser` tinyint(1) NOT NULL DEFAULT '1',
  `FLAGS` bigint(20) NOT NULL DEFAULT '0',
  `Industry` bigint(20) NOT NULL DEFAULT '0',
  `SourceSLSID` bigint(20) NOT NULL DEFAULT '0',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,1,0,'1965-08-10','Lamonica Vinson','41918 N 400,Fitchburg,SC 27887','(184) 105-6773','LamonicaV9839@comcast.net','9047 Cottonwood,Daly City,NH 31847',0,0,191,42,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,1,0,'1959-03-13','Yahaira Mcclain','7030 Broadway,Ocala,PA 22540','(834) 677-4293','YahairaMcclain720@abiz.com','84922 Quail,New York City,NM 40456',1,0,298,11,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,1,0,'1961-07-14','Earleen Chaney','27733 Redwood,Winston,OK 55089','(688) 823-8846','EarleenC3329@hotmail.com','17429 Williams,Monterey,IA 24728',1,0,222,22,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,1,0,'1967-07-03','Alta Noel','95683 Narragansett,Flint,HI 39106','(457) 417-9489','AltaN6685@yahoo.com','51413 Sunset,Spokane,MS 40495',0,0,181,29,'2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehicle` (
  `VID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TCID` bigint(20) NOT NULL DEFAULT '0',
  `BID` bigint(20) NOT NULL DEFAULT '0',
  `VehicleType` varchar(80) NOT NULL DEFAULT '',
  `VehicleMake` varchar(80) NOT NULL DEFAULT '',
  `VehicleModel` varchar(80) NOT NULL DEFAULT '',
  `VehicleColor` varchar(80) NOT NULL DEFAULT '',
  `VehicleYear` bigint(20) NOT NULL DEFAULT '0',
  `VIN` varchar(20) NOT NULL DEFAULT '',
  `LicensePlateState` varchar(80) NOT NULL DEFAULT '',
  `LicensePlateNumber` varchar(80) NOT NULL DEFAULT '',
  `ParkingPermitNumber` varchar(80) NOT NULL DEFAULT '',
  `DtStart` date NOT NULL DEFAULT '1970-01-01',
  `DtStop` date NOT NULL DEFAULT '1970-01-01',
  `LastModTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModBy` bigint(20) NOT NULL DEFAULT '0',
  `CreateTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`VID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES (1,1,1,'car','Jaguar','XJ Series','Maroon',2003,'2FULYEUHJ0RPW2AW','IN','2US2D42','6824100','2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(2,2,1,'car','Mitsubishi','Mighty Max','Gold',1994,'XTT1LMVFQ31VLR45','IN','P8V6M65','1683142','2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(3,3,1,'car','Mercedes-Benz','500E','Purple',1992,'2B79PE5JDW860DAY','NM','2OO18X0','2802534','2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0),(4,4,1,'car','Mitsubishi','Outlander','Black',2007,'2C3XA2D8KW19D2J2','ND','PME4605','0617263','2018-02-13','2020-03-01','2018-07-27 06:49:30',0,'2018-07-27 06:49:30',0);
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-21 20:29:39
