CREATE DATABASE  IF NOT EXISTS `adelaide_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adelaide_dev`;
-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: adelaide_dev
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `stream_id` int NOT NULL DEFAULT '0',
  `course_code` varchar(5) NOT NULL DEFAULT '0000',
  `course_name` varchar(255) DEFAULT NULL,
  `courselink_href` varchar(255) DEFAULT NULL,
  `units` varchar(45) DEFAULT NULL,
  `term` int DEFAULT '1',
  PRIMARY KEY (`course_id`),
  KEY `fk_course_1_idx` (`stream_id`),
  CONSTRAINT `fk_course_1` FOREIGN KEY (`stream_id`) REFERENCES `course_stream` (`stream_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (0,0,'3313','Software Engineering & Project (Distributed Systems & Networking)','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(1,0,'3012','Distributed Systems','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(2,0,'3310','Software Engineering & Project (Artificial Intelligence)','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(3,0,'3312','Software Engineering & Project (Cybersecurity)','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(4,0,'3006','Software Engineering & Project','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',2),(5,0,'2203','Problem Solving & Software Development','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',2),(6,0,'1010','Puzzle Based Learning','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_stream`
--

DROP TABLE IF EXISTS `course_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_stream` (
  `stream_id` int NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stream_id`),
  KEY `stream_name_IDX` (`stream_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_stream`
--

LOCK TABLES `course_stream` WRITE;
/*!40000 ALTER TABLE `course_stream` DISABLE KEYS */;
INSERT INTO `course_stream` VALUES (10,'APP DATA'),(9,'APP MTH'),(5,'COLL'),(0,'COMP SCI'),(2,'ENG'),(3,'ENTREP'),(1,'MATHS'),(7,'PHIL'),(6,'PROJMGNT'),(8,'STATS'),(4,'TECH');
/*!40000 ALTER TABLE `course_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree` (
  `degree_id` int NOT NULL AUTO_INCREMENT,
  `name_suffix` varchar(45) DEFAULT NULL,
  `level` int DEFAULT '0',
  PRIMARY KEY (`degree_id`),
  KEY `fk_degree_1_idx` (`level`),
  CONSTRAINT `fk_degree_1` FOREIGN KEY (`level`) REFERENCES `degree_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES (0,'Computer Science (Advanced)',1),(1,'Information Technology',1),(2,'Technology (Defence Industries)',1),(3,'Artificial Intelligence and Machine Learning',2),(4,'Computer Science',2),(5,'Computing and Innovation',2),(6,'Cyber Security',2),(7,'Data Science',2),(8,'Data Science',0),(9,'Technology (Defence Industries)',0);
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_course`
--

DROP TABLE IF EXISTS `degree_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree_course` (
  `degree_id` int NOT NULL,
  `course_id` int NOT NULL,
  `type` int DEFAULT '0',
  PRIMARY KEY (`degree_id`,`course_id`),
  KEY `fk_degree_course_2_idx` (`course_id`),
  CONSTRAINT `fk_degree_course_1` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`degree_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_degree_course_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_course`
--

LOCK TABLES `degree_course` WRITE;
/*!40000 ALTER TABLE `degree_course` DISABLE KEYS */;
INSERT INTO `degree_course` VALUES (0,2,1);
/*!40000 ALTER TABLE `degree_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_level`
--

DROP TABLE IF EXISTS `degree_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree_level` (
  `level` int NOT NULL,
  `level_type` varchar(45) DEFAULT NULL,
  `level_prefix` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_level`
--

LOCK TABLES `degree_level` WRITE;
/*!40000 ALTER TABLE `degree_level` DISABLE KEYS */;
INSERT INTO `degree_level` VALUES (0,'Undergraduate Certificate','in'),(1,'Bachelor','of'),(2,'Master','of');
/*!40000 ALTER TABLE `degree_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incompatiable`
--

DROP TABLE IF EXISTS `incompatiable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incompatiable` (
  `inc_id` int NOT NULL AUTO_INCREMENT,
  `src_course_id` int DEFAULT '0',
  `target_course_id` int DEFAULT '0',
  PRIMARY KEY (`inc_id`),
  KEY `fk_incompatiable_1_idx` (`src_course_id`),
  KEY `fk_incompatiable_2_idx` (`target_course_id`),
  CONSTRAINT `fk_incompatiable_1` FOREIGN KEY (`src_course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_incompatiable_2` FOREIGN KEY (`target_course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incompatiable`
--

LOCK TABLES `incompatiable` WRITE;
/*!40000 ALTER TABLE `incompatiable` DISABLE KEYS */;
INSERT INTO `incompatiable` VALUES (2,2,4),(4,4,2);
/*!40000 ALTER TABLE `incompatiable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_requisite`
--

DROP TABLE IF EXISTS `pre_requisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_requisite` (
  `pre_req_id` int NOT NULL AUTO_INCREMENT,
  `src_course_id` int DEFAULT '0',
  `target_course_id` int DEFAULT '0',
  PRIMARY KEY (`pre_req_id`),
  KEY `fk_pre_requisite_1_idx` (`src_course_id`),
  KEY `fk_pre_requisite_2_idx` (`target_course_id`),
  CONSTRAINT `fk_pre_requisite_1` FOREIGN KEY (`src_course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pre_requisite_2` FOREIGN KEY (`target_course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_requisite`
--

LOCK TABLES `pre_requisite` WRITE;
/*!40000 ALTER TABLE `pre_requisite` DISABLE KEYS */;
INSERT INTO `pre_requisite` VALUES (1,4,3);
/*!40000 ALTER TABLE `pre_requisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'a1234567@adelaide.edu.au','$2b$10$VOY0wpWif8Yzc5J5tOif8.U.OQp/Sk5SpfM1XOzmzmoxEN8qQhCMC');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-24 10:30:41
