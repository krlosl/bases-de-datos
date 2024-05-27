-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hammerstrength
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `entrenamientos`
--

DROP TABLE IF EXISTS `entrenamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenamientos` (
  `idEntrenamientos` int NOT NULL AUTO_INCREMENT,
  `idusuarios` int DEFAULT NULL,
  `lunes` varchar(999) DEFAULT NULL,
  `martes` varchar(999) DEFAULT NULL,
  `miercoles` varchar(999) DEFAULT NULL,
  `jueves` varchar(999) DEFAULT NULL,
  `viernes` varchar(999) DEFAULT NULL,
  `sabado` varchar(999) DEFAULT NULL,
  `domingo` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`idEntrenamientos`),
  UNIQUE KEY `idEntrenamientos_UNIQUE` (`idEntrenamientos`),
  KEY `fk_idusuarios_idx` (`idusuarios`),
  CONSTRAINT `fk_idusuarios` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenamientos`
--

LOCK TABLES `entrenamientos` WRITE;
/*!40000 ALTER TABLE `entrenamientos` DISABLE KEYS */;
INSERT INTO `entrenamientos` VALUES (7,4,'PECHO','ESPALDA','PIERNA','DESCANSO','PECHO','ESPALDA','PIERNA'),(9,2,'APROBAR A CARLOS','APROBAR A CARLOS','APROBAR A CARLOS','APROBAR A CARLOS','APROBAR A CARLOS','APROBAR A CARLOS','BRAZO'),(11,2,'EJEMPLO','EJEMPLO','EJEMPLO','EJEMPLO','EJEMPLO','EJEMPLO','EJEMPLO'),(14,2,'EJEMPLO2','EJEMPLO2','EJEMPLO2','EJEMPLO2','EJEMPLO2','EJEMPLO2','EJEMPLO2');
/*!40000 ALTER TABLE `entrenamientos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28  0:01:06
