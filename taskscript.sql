-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: SSI3
-- ------------------------------------------------------
-- Server version	8.3.0

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


DROP DATABASE IF EXISTS ssi3;
CREATE DATABASE ssi3;
a
--
-- Table structure for table `tasks`
--

USE ssi3;

DROP TABLE IF EXISTS `tasks`; 
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `task_title` varchar(100) NOT NULL,
  `task_description` varchar(500) DEFAULT NULL,
  `task_assignees` varchar(30) DEFAULT NULL,
  `task_status` enum('No Status','To Do','Doing','Done') NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-23 21:27:08

-- Row 1
INSERT INTO tasks (task_title, task_description, task_assignees, task_status,created_on, updated_on)
VALUES (
    'TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0',
      'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5',
    'Assignees1Assignees2Assignees3',
    'No Status',
 '2024-04-22 16:00:00+07:00',
 '2024-04-22 16:00:00+07:00'
);

-- Row 2
INSERT INTO tasks (task_title, task_description, task_assignees, task_status,created_on, updated_on)
VALUES (
    'Repository',
    '',
    '',
    'To Do',
 '2024-04-22 16:05:00+07:00',
 '2024-04-22 21:00:00+07:00'
);

-- Row 3
INSERT INTO tasks (task_title, task_description, task_assignees, task_status,created_on, updated_on)
VALUES (
    'ดาต้าเบส',
    'ສ້າງຖານຂໍ້ມູນ',
    'あなた、彼、彼女 (私ではありません)',
    'Doing',
 '2024-04-22 16:10:00+07:00',
 '2024-04-25 07:00:00+07:00'
);

-- Row 4
INSERT INTO tasks (task_title, task_description, task_assignees, task_status,created_on, updated_on)
VALUES (
    '_Infrastructure_',
    '_Setup containers_',
    'ไก่งวง กับ เพนกวิน',
    'Done',
 '2024-04-22 16:15:00+07:00',
 '2024-04-22 17:00:00+07:00'
);
