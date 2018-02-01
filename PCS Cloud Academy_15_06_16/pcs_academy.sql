CREATE DATABASE  IF NOT EXISTS `pcs_academy` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pcs_academy`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: pcsglobaldev.csbsh8qbhh6s.eu-west-1.rds.amazonaws.com    Database: pcs_academy
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `admindetails`
--

DROP TABLE IF EXISTS `admindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admindetails` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_login_id` varchar(50) DEFAULT NULL,
  `admin_password` varchar(50) DEFAULT NULL,
  `desig_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `desig_code` (`desig_code`),
  CONSTRAINT `admindetails_ibfk_1` FOREIGN KEY (`desig_code`) REFERENCES `designation` (`desig_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admindetails`
--

LOCK TABLES `admindetails` WRITE;
/*!40000 ALTER TABLE `admindetails` DISABLE KEYS */;
INSERT INTO `admindetails` VALUES (1,'palash','palash',1),(2,'palash','palash',1);
/*!40000 ALTER TABLE `admindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchdetails`
--

DROP TABLE IF EXISTS `batchdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchdetails` (
  `batchId` int(11) NOT NULL AUTO_INCREMENT,
  `training_category_id` int(11) DEFAULT NULL,
  `training_course_id` int(11) DEFAULT NULL,
  `facultyId` int(11) DEFAULT NULL,
  `dateSchedule` varchar(100) DEFAULT NULL,
  `batchStartTime` varchar(50) DEFAULT NULL,
  `batchStartTimeFormat` varchar(30) DEFAULT NULL,
  `batchEndTime` varchar(50) DEFAULT NULL,
  `batchEndTimeFormat` varchar(30) DEFAULT NULL,
  `roomNo` varchar(50) DEFAULT NULL,
  `batchCreationYear` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`batchId`),
  KEY `training_category_id` (`training_category_id`),
  KEY `training_course_id` (`training_course_id`),
  KEY `facultyId` (`facultyId`),
  CONSTRAINT `batchdetails_ibfk_1` FOREIGN KEY (`training_category_id`) REFERENCES `training_category` (`training_category_id`),
  CONSTRAINT `batchdetails_ibfk_2` FOREIGN KEY (`training_course_id`) REFERENCES `training_course` (`training_course_id`),
  CONSTRAINT `batchdetails_ibfk_3` FOREIGN KEY (`facultyId`) REFERENCES `facultydetails` (`facultyId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchdetails`
--

LOCK TABLES `batchdetails` WRITE;
/*!40000 ALTER TABLE `batchdetails` DISABLE KEYS */;
INSERT INTO `batchdetails` VALUES (1,1,1,1,'Tuesday,Thursday,Friday','10:30','AM','12:30','AM','3','2014');
/*!40000 ALTER TABLE `batchdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designation` (
  `desig_code` int(11) NOT NULL AUTO_INCREMENT,
  `desig_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`desig_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,'HR'),(2,'Help Desk'),(3,'HR'),(4,'Faculty');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultydetails`
--

DROP TABLE IF EXISTS `facultydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultydetails` (
  `facultyId` int(11) NOT NULL AUTO_INCREMENT,
  `facultyTechnology` varchar(50) DEFAULT NULL,
  `facultyName` varchar(50) DEFAULT NULL,
  `facultyEmail` varchar(50) DEFAULT NULL,
  `facultyMobile` varchar(50) DEFAULT NULL,
  `facultyMobileAlt` varchar(50) DEFAULT NULL,
  `facultyAddress` varchar(200) DEFAULT NULL,
  `facultyPassword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`facultyId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultydetails`
--

LOCK TABLES `facultydetails` WRITE;
/*!40000 ALTER TABLE `facultydetails` DISABLE KEYS */;
INSERT INTO `facultydetails` VALUES (1,'PHP/MySQL','Suvankar Das','sd@gmail.com','9900887754','','Chakdah...','12345'),(2,'Java/J2EE','Deeptarup','deeptarup.roy@gmail.com','9900887766','8907334422','Medinipur...','12345');
/*!40000 ALTER TABLE `facultydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_contact_msg`
--

DROP TABLE IF EXISTS `student_contact_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_contact_msg` (
  `scm_id` int(11) NOT NULL AUTO_INCREMENT,
  `scm_name` varchar(50) DEFAULT NULL,
  `scm_email` varchar(50) DEFAULT NULL,
  `scm_phone` varchar(50) DEFAULT NULL,
  `scm_message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`scm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_contact_msg`
--

LOCK TABLES `student_contact_msg` WRITE;
/*!40000 ALTER TABLE `student_contact_msg` DISABLE KEYS */;
INSERT INTO `student_contact_msg` VALUES (1,'Bodhi','bod@rediff.com','8899005543','Want to know about Java...');
/*!40000 ALTER TABLE `student_contact_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_details`
--

DROP TABLE IF EXISTS `student_course_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course_details` (
  `enrollment_no` varchar(50) NOT NULL DEFAULT '',
  `student_regn_id` int(11) DEFAULT NULL,
  `training_category_id` int(11) DEFAULT NULL,
  `training_course_id` int(11) DEFAULT NULL,
  `batchId` int(11) DEFAULT NULL,
  `enrollment_status` varchar(50) DEFAULT NULL,
  `enrollment_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  KEY `student_regn_id` (`student_regn_id`),
  KEY `training_category_id` (`training_category_id`),
  KEY `training_course_id` (`training_course_id`),
  KEY `batchId` (`batchId`),
  CONSTRAINT `student_course_details_ibfk_1` FOREIGN KEY (`student_regn_id`) REFERENCES `student_regn_details` (`student_regn_id`),
  CONSTRAINT `student_course_details_ibfk_2` FOREIGN KEY (`training_category_id`) REFERENCES `training_category` (`training_category_id`),
  CONSTRAINT `student_course_details_ibfk_3` FOREIGN KEY (`training_course_id`) REFERENCES `training_course` (`training_course_id`),
  CONSTRAINT `student_course_details_ibfk_4` FOREIGN KEY (`batchId`) REFERENCES `batchdetails` (`batchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_details`
--

LOCK TABLES `student_course_details` WRITE;
/*!40000 ALTER TABLE `student_course_details` DISABLE KEYS */;
INSERT INTO `student_course_details` VALUES ('PCSR-1',1,1,1,NULL,'Not Enrolled','17/08/2014'),('PCSR-10',22,1,8,NULL,'Not Enrolled','01/06/2016'),('PCSR-2',2,1,2,NULL,'Not Enrolled','17/08/2014'),('PCSR-3',3,1,1,1,'Enrolled','28/08/2014'),('PCSR-4',4,1,1,NULL,'Not Enrolled','07/05/2016'),('PCSR-5',5,1,1,NULL,'Not Enrolled','18/05/2016'),('PCSR-6',6,2,3,NULL,'Not Enrolled','31/05/2016'),('PCSR-7',7,1,1,NULL,'Not Enrolled','31/05/2016'),('PCSR-8',8,2,3,NULL,'Not Enrolled','31/05/2016'),('PCSR-9',9,1,1,NULL,'Not Enrolled','31/05/2016');
/*!40000 ALTER TABLE `student_course_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_login_details`
--

DROP TABLE IF EXISTS `student_login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_login_details` (
  `student_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_regn_id` int(11) DEFAULT NULL,
  `student_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_login_id`),
  KEY `student_regn_id` (`student_regn_id`),
  CONSTRAINT `student_login_details_ibfk_1` FOREIGN KEY (`student_regn_id`) REFERENCES `student_regn_details` (`student_regn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_login_details`
--

LOCK TABLES `student_login_details` WRITE;
/*!40000 ALTER TABLE `student_login_details` DISABLE KEYS */;
INSERT INTO `student_login_details` VALUES (1,1,'12345'),(2,2,'12345'),(3,3,'12345'),(4,4,'Kolkata@123'),(5,5,'aaaaaa'),(6,6,'123456'),(7,7,'123456'),(8,8,'123456'),(9,9,'12345'),(22,22,'123654');
/*!40000 ALTER TABLE `student_login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_payment_details`
--

DROP TABLE IF EXISTS `student_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_payment_details` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_no` varchar(50) DEFAULT NULL,
  `total_payable_amount` varchar(50) DEFAULT NULL,
  `paid_amount` varchar(50) DEFAULT NULL,
  `check_no` varchar(50) DEFAULT NULL,
  `card_no` varchar(50) DEFAULT NULL,
  `card_type` varchar(50) DEFAULT NULL,
  `expiry_date` varchar(50) DEFAULT NULL,
  `cvv` varchar(50) DEFAULT NULL,
  `pay_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `enrollment_no` (`enrollment_no`),
  CONSTRAINT `student_payment_details_ibfk_1` FOREIGN KEY (`enrollment_no`) REFERENCES `student_course_details` (`enrollment_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_payment_details`
--

LOCK TABLES `student_payment_details` WRITE;
/*!40000 ALTER TABLE `student_payment_details` DISABLE KEYS */;
INSERT INTO `student_payment_details` VALUES (1,'PCSR-3','3000','1500','90J5643MD1','','','','','28/08/2014');
/*!40000 ALTER TABLE `student_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_regn_details`
--

DROP TABLE IF EXISTS `student_regn_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_regn_details` (
  `student_regn_id` int(11) NOT NULL AUTO_INCREMENT,
  `salutation` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `college_name` varchar(50) DEFAULT NULL,
  `college_state` varchar(50) DEFAULT NULL,
  `college_city` varchar(50) DEFAULT NULL,
  `university` varchar(50) DEFAULT NULL,
  `stream` varchar(50) DEFAULT NULL,
  `persuing_qualification` varchar(50) DEFAULT NULL,
  `passing_year` varchar(50) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `how_find_us` varchar(50) DEFAULT NULL,
  `regn_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_regn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_regn_details`
--

LOCK TABLES `student_regn_details` WRITE;
/*!40000 ALTER TABLE `student_regn_details` DISABLE KEYS */;
INSERT INTO `student_regn_details` VALUES (1,'Mr.','Bodhi','Majumder','08/15/1989','West Bengal','Kolkata','bod@gmail.com','9988776655','Techno India','West Bengal','Kolkata','WBUT','CSE','MCA','2014','6th','Facebook','17/08/2014'),(2,NULL,'Saikat',NULL,NULL,NULL,NULL,'s@yahoo.com','7700998842',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Miss','Anamika','Singh','06/13/1990','Bihar','Kolkata','ans@yahoo.co.in','9900778866','Techno India','','','WBUT','CSE','MCA','2015','8th',NULL,'28/08/2014'),(4,'Mrs.','Shilpi','Chakraborty','05/28/1987','West Bengal','Kolkata','shilpi.pcs@gmail.com','8697741615','South calcutta girls college','West Bengal','Kolkata','abcd','Kolkata','abcd','2015','7th','fd','07/05/2016'),(5,NULL,'aas',NULL,NULL,NULL,NULL,'xwww@ggjgbj.com','444l',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18/05/2016'),(6,'Miss','ghjhjhjh','kkjhh','05/12/2016','we','kol','aq@gmail.com','1234567890','wbu','we','kol','wbu','wbu','bt','2016','8','hjjkjkk','31/05/2016'),(7,NULL,'ssxxs',NULL,NULL,NULL,NULL,'a@gmail.com','1234567890',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'31/05/2016'),(8,'Mrs.','Sana','Roy','05/04/2016','West Bengal','Kolkata','a@gmail.com','8697741613','wb','West Bengal','Kolkata','wb','b','bt','2018','7','asd','31/05/2016'),(9,'Mr.','Abdus','rrrrrrrr','05/02/2016','west','kol','a@gmail.com','2345678912','wbut','west','kol','wbut','ece','btech','2018','8','fdd','31/05/2016'),(22,'Mr.','das','prakash','05/03/2016','west','kol','a@gmail.com','2345678912','wbut','west','kol','wbut','ece','btech','2018','8','hello','01/06/2016');
/*!40000 ALTER TABLE `student_regn_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_category`
--

DROP TABLE IF EXISTS `training_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_category` (
  `training_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `training_category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`training_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_category`
--

LOCK TABLES `training_category` WRITE;
/*!40000 ALTER TABLE `training_category` DISABLE KEYS */;
INSERT INTO `training_category` VALUES (1,'Summer Training'),(2,'Onjob Guidance'),(3,'Free Internship'),(4,'Live Project Training'),(5,'Winter Training'),(6,'Spring Training');
/*!40000 ALTER TABLE `training_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_course`
--

DROP TABLE IF EXISTS `training_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_course` (
  `training_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `training_category_id` int(11) DEFAULT NULL,
  `training_course_name` varchar(50) DEFAULT NULL,
  `training_course_content` varchar(200) DEFAULT NULL,
  `training_course_duration` varchar(50) DEFAULT NULL,
  `training_course_fees` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`training_course_id`),
  KEY `training_category_id` (`training_category_id`),
  CONSTRAINT `training_course_ibfk_1` FOREIGN KEY (`training_category_id`) REFERENCES `training_category` (`training_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_course`
--

LOCK TABLES `training_course` WRITE;
/*!40000 ALTER TABLE `training_course` DISABLE KEYS */;
INSERT INTO `training_course` VALUES (1,1,'Java/J2EE','Core Java,JSP,Servlet...','1month','3000'),(2,1,'PHP/MySQL','Basic PHP,MySQL Database...','1month','2000'),(3,2,'Java/J2EE','Core & Advanced Java, Struts1.3...','8months','20000'),(4,3,'Core Java','Basic Core Java \r\nCollection Framework','1month','0'),(5,4,'Java/J2EE','You can apply this J2EE knowledge in live project','1 month','2500'),(6,5,'Java/J2EE','Core Java,JSP,Servlet...','1 month',NULL),(7,6,'Java/J2EE','This Spring training knowlwdge will be helpful... ','1 month','0'),(8,1,'Android',NULL,NULL,NULL);
/*!40000 ALTER TABLE `training_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-01 15:29:26
