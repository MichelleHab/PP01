-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: Answer_Book_problem_ru
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Answer_Book_problem_en`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Answer_Book_problem_en` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Answer_Book_problem_en`;

--
-- Table structure for table `Archive`
--

DROP TABLE IF EXISTS `Archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Archive` (
  `Index` int NOT NULL AUTO_INCREMENT,
  `Master` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unknown',
  `Problem_Index` int NOT NULL,
  `PC_Index` int NOT NULL,
  `Status` enum('Resolved','In_progress','Computing','Not_resolved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not_resolved',
  `Solution_and_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Index`),
  KEY `Problem_Index` (`Problem_Index`),
  KEY `PC_Index` (`PC_Index`),
  CONSTRAINT `archive_ibfk_1` FOREIGN KEY (`Problem_Index`) REFERENCES `Problem` (`Index`),
  CONSTRAINT `archive_ibfk_2` FOREIGN KEY (`PC_Index`) REFERENCES `PC` (`Index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Archive`
--

LOCK TABLES `Archive` WRITE;
/*!40000 ALTER TABLE `Archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `Archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cabinet`
--

DROP TABLE IF EXISTS `Cabinet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cabinet` (
  `Index` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Floor` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Index`),
  UNIQUE KEY `Unique_cabinet` (`Floor`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cabinet`
--

LOCK TABLES `Cabinet` WRITE;
/*!40000 ALTER TABLE `Cabinet` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cabinet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PC`
--

DROP TABLE IF EXISTS `PC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PC` (
  `Index` int NOT NULL AUTO_INCREMENT,
  `Cabinet_Index` int DEFAULT NULL,
  `PC_Number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IP` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Index`),
  UNIQUE KEY `Unique_PC_in_cabinet` (`Cabinet_Index`,`PC_Number`),
  UNIQUE KEY `IP` (`IP`),
  CONSTRAINT `pc_ibfk_1` FOREIGN KEY (`Cabinet_Index`) REFERENCES `Cabinet` (`Index`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PC`
--

LOCK TABLES `PC` WRITE;
/*!40000 ALTER TABLE `PC` DISABLE KEYS */;
/*!40000 ALTER TABLE `PC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `Index` int NOT NULL AUTO_INCREMENT,
  `Role` enum('Main_Admin','Admin','Manager','User') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `FullName` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Login` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Linked_Cabinet_Index` int DEFAULT NULL,
  PRIMARY KEY (`Index`),
  UNIQUE KEY `Login` (`Login`),
  KEY `Linked_Cabinet_Index` (`Linked_Cabinet_Index`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Linked_Cabinet_Index`) REFERENCES `Cabinet` (`Index`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Problem`
--

DROP TABLE IF EXISTS `Problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Problem` (
  `Index` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Priority` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Index`),
  UNIQUE KEY `Type` (`Type`,`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Problem`
--

LOCK TABLES `Problem` WRITE;
/*!40000 ALTER TABLE `Problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `Problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `Index` int NOT NULL AUTO_INCREMENT,
  `User_Index` int DEFAULT NULL,
  `Master_User_Index` int DEFAULT NULL,
  `Problem_Index` int NOT NULL,
  `PC_Index` int NOT NULL,
  `Status` enum('Resolved','In_progress','Computing','Not_resolved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not_resolved',
  PRIMARY KEY (`Index`),
  KEY `User_Index` (`User_Index`),
  KEY `Master_User_Index` (`Master_User_Index`),
  KEY `Problem_Index` (`Problem_Index`),
  KEY `PC_Index` (`PC_Index`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`User_Index`) REFERENCES `User` (`Index`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`Master_User_Index`) REFERENCES `User` (`Index`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`Problem_Index`) REFERENCES `Problem` (`Index`),
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`PC_Index`) REFERENCES `PC` (`Index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-19 12:10:09