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
-- Current Database: `Answer_Book_problem_ru`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Answer_Book_problem_ru` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Answer_Book_problem_ru`;

--
-- Table structure for table `Архив`
--

DROP TABLE IF EXISTS `Архив`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Архив` (
  `Индекс` int NOT NULL AUTO_INCREMENT,
  `Мастер` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Неизвестный',
  `Проблема_Индекс` int NOT NULL,
  `ПК_Индекс` int NOT NULL,
  `Статус` enum('Решено','Решается','Вычисляется','Не решено') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Не решено',
  `Решение_и_инфо` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Индекс`),
  KEY `Проблема_Индекс` (`Проблема_Индекс`),
  KEY `ПК_Индекс` (`ПК_Индекс`),
  CONSTRAINT `архив_ibfk_1` FOREIGN KEY (`Проблема_Индекс`) REFERENCES `Проблема` (`Индекс`),
  CONSTRAINT `архив_ibfk_2` FOREIGN KEY (`ПК_Индекс`) REFERENCES `ПК` (`Индекс`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Архив`
--

LOCK TABLES `Архив` WRITE;
/*!40000 ALTER TABLE `Архив` DISABLE KEYS */;
/*!40000 ALTER TABLE `Архив` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Кабинет`
--

DROP TABLE IF EXISTS `Кабинет`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Кабинет` (
  `Индекс` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Этаж` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Индекс`),
  UNIQUE KEY `Уникальный_кабинет` (`Этаж`,`Название`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Кабинет`
--

LOCK TABLES `Кабинет` WRITE;
/*!40000 ALTER TABLE `Кабинет` DISABLE KEYS */;
/*!40000 ALTER TABLE `Кабинет` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ПК`
--

DROP TABLE IF EXISTS `ПК`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ПК` (
  `Индекс` int NOT NULL AUTO_INCREMENT,
  `Кабинет_Индекс` int DEFAULT NULL,
  `Номер_ПК` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IP` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Индекс`),
  UNIQUE KEY `Уникальный_ПК_в_кабинете` (`Кабинет_Индекс`,`Номер_ПК`),
  UNIQUE KEY `IP` (`IP`),
  CONSTRAINT `пк_ibfk_1` FOREIGN KEY (`Кабинет_Индекс`) REFERENCES `Кабинет` (`Индекс`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ПК`
--

LOCK TABLES `ПК` WRITE;
/*!40000 ALTER TABLE `ПК` DISABLE KEYS */;
/*!40000 ALTER TABLE `ПК` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Пользователь`
--

DROP TABLE IF EXISTS `Пользователь`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Пользователь` (
  `Индекс` int NOT NULL AUTO_INCREMENT,
  `Роль` enum('Главный_Админ','Админ','Менеджер','Пользователь') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Пользователь',
  `ФИО` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Логин` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Пароль` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Привязанный_Кабинет_Индекс` int DEFAULT NULL,
  PRIMARY KEY (`Индекс`),
  UNIQUE KEY `Логин` (`Логин`),
  KEY `Привязанный_Кабинет_Индекс` (`Привязанный_Кабинет_Индекс`),
  CONSTRAINT `пользователь_ibfk_1` FOREIGN KEY (`Привязанный_Кабинет_Индекс`) REFERENCES `Кабинет` (`Индекс`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Пользователь`
--

LOCK TABLES `Пользователь` WRITE;
/*!40000 ALTER TABLE `Пользователь` DISABLE KEYS */;
/*!40000 ALTER TABLE `Пользователь` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Проблема`
--

DROP TABLE IF EXISTS `Проблема`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Проблема` (
  `Индекс` int NOT NULL AUTO_INCREMENT,
  `Тип` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Код` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Приоритет` int NOT NULL,
  PRIMARY KEY (`Индекс`),
  UNIQUE KEY `Тип` (`Тип`,`Код`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Проблема`
--

LOCK TABLES `Проблема` WRITE;
/*!40000 ALTER TABLE `Проблема` DISABLE KEYS */;
/*!40000 ALTER TABLE `Проблема` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Тикеты`
--

DROP TABLE IF EXISTS `Тикеты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Тикеты` (
  `Индекс` int NOT NULL AUTO_INCREMENT,
  `Пользователь_Индекс` int DEFAULT NULL,
  `Пользователь_Индекс_Мастер` int DEFAULT NULL,
  `Проблема_Индекс` int NOT NULL,
  `ПК_Индекс` int NOT NULL,
  `Статус` enum('Решено','Решается','Вычисляется','Не решено') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Не решено',
  PRIMARY KEY (`Индекс`),
  KEY `Пользователь_Индекс` (`Пользователь_Индекс`),
  KEY `Пользователь_Индекс_Мастер` (`Пользователь_Индекс_Мастер`),
  KEY `Проблема_Индекс` (`Проблема_Индекс`),
  KEY `ПК_Индекс` (`ПК_Индекс`),
  CONSTRAINT `тикеты_ibfk_1` FOREIGN KEY (`Пользователь_Индекс`) REFERENCES `Пользователь` (`Индекс`),
  CONSTRAINT `тикеты_ibfk_2` FOREIGN KEY (`Пользователь_Индекс_Мастер`) REFERENCES `Пользователь` (`Индекс`),
  CONSTRAINT `тикеты_ibfk_3` FOREIGN KEY (`Проблема_Индекс`) REFERENCES `Проблема` (`Индекс`),
  CONSTRAINT `тикеты_ibfk_4` FOREIGN KEY (`ПК_Индекс`) REFERENCES `ПК` (`Индекс`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Тикеты`
--

LOCK TABLES `Тикеты` WRITE;
/*!40000 ALTER TABLE `Тикеты` DISABLE KEYS */;
/*!40000 ALTER TABLE `Тикеты` ENABLE KEYS */;
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
