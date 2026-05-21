-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: Answer_Book_problem
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
-- Current Database: `Answer_Book_problem`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Answer_Book_problem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Answer_Book_problem`;

--
-- Table structure for table `Archive`
--

DROP TABLE IF EXISTS `Archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Archive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `master` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unknown',
  `problem_id` int NOT NULL,
  `pc_id` int NOT NULL,
  `status` enum('Resolved','In_progress','Computing','Not_resolved') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not_resolved',
  `solution_and_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Problem_Index` (`problem_id`) USING BTREE,
  KEY `PC_Index` (`pc_id`) USING BTREE,
  CONSTRAINT `archive_ibfk_1` FOREIGN KEY (`problem_id`) REFERENCES `Problem` (`id`),
  CONSTRAINT `archive_ibfk_2` FOREIGN KEY (`pc_id`) REFERENCES `PC` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Archive`
--

LOCK TABLES `Archive` WRITE;
/*!40000 ALTER TABLE `Archive` DISABLE KEYS */;
INSERT INTO `Archive` VALUES (1,'Скрыльников Дмитрий Константинович',1,1,'Resolved','Заменён блок питания. Компьютер работает стабильно.'),(2,'Нуралиева Ирина Евгеньевна',2,2,'Resolved','Переустановлен драйвер видеокарты. Проблема устранена.'),(3,'Федусева Элла Юрьевна',4,4,'Resolved','Обновлена операционная система до последней версии.'),(4,'Мартыненко Вадим Алексеевич',7,6,'Resolved','Настроен сетевой адаптер. IP-адрес назначен корректно.'),(5,'Скрыльникова Наталья Владимировн',10,9,'Resolved','Заменён USB-кабель. Принтер снова печатает.'),(6,'Кирюхина Оксана Юрьевна',3,11,'Resolved','Очищен от пыли системный блок. Замена термопасты.'),(7,'Попова Вероника Владимировна',9,13,'Resolved','Переустановлены драйверы сканера. Устройство работает.'),(8,'Оганесян Роза Нахапетовна',12,14,'Resolved','Антивирус обновлён. Заражённые файлы удалены.'),(9,'Попова Мария Дмитриевна',2,8,'Resolved','Прошит BIOS. Проблема с загрузкой устранена.'),(10,'Суяркова Мария Абдулжалиловна',4,4,'Resolved','Установлен пакет обновлений Office. Все функции работают.');
/*!40000 ALTER TABLE `Archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cabinet`
--

DROP TABLE IF EXISTS `Cabinet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cabinet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Unique_cabinet` (`floor`,`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cabinet`
--

LOCK TABLES `Cabinet` WRITE;
/*!40000 ALTER TABLE `Cabinet` DISABLE KEYS */;
INSERT INTO `Cabinet` VALUES (1,'Кабинет 101','1'),(2,'Кабинет 102','1'),(3,'Кабинет 201','2'),(4,'Кабинет 202','2'),(5,'Кабинет 203','2'),(6,'Кабинет 301','3'),(7,'Кабинет 302','3'),(10,'Серверная','3'),(9,'Кабинет 2','4'),(8,'Лаборатория 1','4');
/*!40000 ALTER TABLE `Cabinet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PC`
--

DROP TABLE IF EXISTS `PC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PC` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cabinet_id` int DEFAULT NULL,
  `pc_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IP` (`ip`) USING BTREE,
  UNIQUE KEY `Unique_PC_in_cabinet` (`cabinet_id`,`pc_number`) USING BTREE,
  CONSTRAINT `pc_ibfk_1` FOREIGN KEY (`cabinet_id`) REFERENCES `Cabinet` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PC`
--

LOCK TABLES `PC` WRITE;
/*!40000 ALTER TABLE `PC` DISABLE KEYS */;
INSERT INTO `PC` VALUES (1,1,'PC-01','192.168.1.101'),(2,1,'PC-02','192.168.1.102'),(3,1,'PC-03','192.168.1.103'),(4,2,'PC-01','192.168.1.104'),(5,2,'PC-02','192.168.1.105'),(6,3,'PC-01','192.168.1.106'),(7,3,'PC-02','192.168.1.107'),(8,3,'PC-03','192.168.1.108'),(9,4,'PC-01','192.168.1.109'),(10,5,'PC-01','192.168.1.110'),(11,6,'PC-01','192.168.1.111'),(12,6,'PC-02','192.168.1.112'),(13,7,'PC-01','192.168.1.113'),(14,8,'PC-01','192.168.1.114'),(15,9,'PC-01','192.168.1.115');
/*!40000 ALTER TABLE `PC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Problem`
--

DROP TABLE IF EXISTS `Problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Problem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Type` (`type`,`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Problem`
--

LOCK TABLES `Problem` WRITE;
/*!40000 ALTER TABLE `Problem` DISABLE KEYS */;
INSERT INTO `Problem` VALUES (1,'Аппаратное обеспечение','HW-001',3),(2,'Аппаратное обеспечение','HW-002',2),(3,'Аппаратное обеспечение','HW-003',1),(4,'Программное обеспечение','SW-001',3),(5,'Программное обеспечение','SW-002',2),(6,'Программное обеспечение','SW-003',1),(7,'Сетевое оборудование','NET-001',3),(8,'Сетевое оборудование','NET-002',2),(9,'Периферийные устройства','PER-001',2),(10,'Периферийные устройства','PER-002',1),(11,'Безопасность','SEC-001',3),(12,'Безопасность','SEC-002',2);
/*!40000 ALTER TABLE `Problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `master_user_id` int DEFAULT NULL,
  `problem_id` int NOT NULL,
  `pc_id` int NOT NULL,
  `status` enum('Resolved','In_progress','Computing','Not_resolved') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not_resolved',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `User_Index` (`user_id`) USING BTREE,
  KEY `Problem_Index` (`problem_id`) USING BTREE,
  KEY `Master_User_Index` (`master_user_id`) USING BTREE,
  KEY `PC_Index` (`pc_id`) USING BTREE,
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`master_user_id`) REFERENCES `User` (`id`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`problem_id`) REFERENCES `Problem` (`id`),
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`pc_id`) REFERENCES `PC` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES (1,8,4,1,1,'Resolved'),(2,8,4,2,2,'Resolved'),(3,9,5,4,4,'In_progress'),(4,9,5,5,5,'Not_resolved'),(5,10,6,7,6,'Resolved'),(6,10,6,8,7,'Computing'),(7,11,7,10,9,'Resolved'),(8,11,7,11,10,'In_progress'),(9,12,4,3,11,'Resolved'),(10,12,4,6,12,'Not_resolved'),(11,13,5,9,13,'Resolved'),(12,13,5,12,14,'Resolved'),(13,14,6,4,15,'Computing'),(14,14,6,1,3,'In_progress'),(15,8,4,2,8,'Resolved');
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` enum('Main_Admin','Admin','Manager','User') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `full_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linked_cabinet_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Login` (`login`) USING BTREE,
  KEY `Linked_Cabinet_Index` (`linked_cabinet_id`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`linked_cabinet_id`) REFERENCES `Cabinet` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Main_Admin','Скрыльников Дмитрий Константинович','director.dima','hash_main_admin_1',NULL),(2,'Admin','Нуралиева Ирина Евгеньевна','irina.nuralieva','hash_admin_1',NULL),(3,'Manager','Федусева Элла Юрьевна','ella.feduseva','hash_admin_2',NULL),(4,'Admin','Мартыненко Вадим Алексеевич','vadim.martinenko','hash_manager_1',1),(5,'Manager','Скрыльникова Наталья Владимировна','nataly.scrilnic','hash_manager_2',2),(6,'Manager','Кирюхина Оксана Юрьевна','ocsana.kiruha','hash_manager_3',3),(7,'Manager','Попова Вероника Владимировна','veronika.popova','hash_manager_4',4),(8,'User','Оганесян Роза Нахапетовна','rosa.oganesan','hash_user_1',1),(9,'User','Попова Мария Дмитриевна','maria.popova','hash_user_2',2),(10,'User','Суяркова Мария Абдулжалиловна','maria.syarkova','hash_user_3',3),(11,'User','Беляева Марина Валерьевна','marina.beljeva','hash_user_4',4),(12,'User','Реснянская Анастасия Алексеевна','annastasia.resnan','hash_user_5',5),(13,'User','Николаевский Вячеслав Вячеславович','slava.nicola','hash_user_6',1),(14,'User','Чеботарева Ирина Сергеевна','irina.chebotareva','hash_user_7',2),(15,'User','Алиева Элвида Шахларовна','elvida.alieva','hash_user_8',3);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-21 23:06:17
