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
-- Table structure for table `rutinas`
--

DROP TABLE IF EXISTS `rutinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutinas` (
  `idRutina` int NOT NULL AUTO_INCREMENT,
  `idusuarios` int DEFAULT NULL,
  `dia1` varchar(999) DEFAULT NULL,
  `dia2` varchar(999) DEFAULT NULL,
  `dia3` varchar(999) DEFAULT NULL,
  `dia4` varchar(999) DEFAULT NULL,
  `dia5` varchar(999) DEFAULT NULL,
  `dia6` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`idRutina`),
  UNIQUE KEY `identrenamiento_UNIQUE` (`idRutina`),
  KEY `fk_idusuariosr_idx` (`idusuarios`),
  CONSTRAINT `fk_idusuariosr` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='							';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutinas`
--

LOCK TABLES `rutinas` WRITE;
/*!40000 ALTER TABLE `rutinas` DISABLE KEYS */;
INSERT INTO `rutinas` VALUES (25,4,'Press banca plano, Press banca inclinado, Aperturas, Declinado, Curl de bíceps con mancuerna, Curl de bíceps con barra z, Curl de bíceps martillo','Jalón al pecho en polea Remo a una mano Peso muerto, Sentadilla Curl de femoral, Sentadilla búlgara, Hip thrust',NULL,NULL,NULL,NULL),(26,4,'Press banca inclinado, plano y declinado','Curl de bíceps con mancuerna, con barra z, Press militar con mancuernas, Elevaciones laterales','Sentadillas búlgaras, Curl de femoral, Extensión de cuádriceps, Peso muerto, Pullover en polea',NULL,NULL,NULL),(27,4,'Press banca inclinado, plano, declinado, aperturas con polea, Extensión de triceps en polea agarre prono con barra v, extensión de triceps en polea con cuerda, agarre prono, extensión de triceps tras nuca, fondos en máquina o en paralelas','Peso muerto, jalón al pecho con barra, remo a una mano en polea, jalón al pecho en máquina, curl de biceps con mancuerna agarre supino, curl de biceps con barra z, curl de biceps en máquina, dominadas de bíceps','Hip thrust, sentadilla, extensión de cuádriceps, curl de femoral en máquina, patada de femoral en polea, abductor, aductor, gemelos','Press militar con mancuernas, elevaciones laterales, tirón a nuca con cuerda en polea, elevaciones laterales en polea',NULL,NULL),(28,2,'Press banca inclinado, press banca plano, press banca declinado, aperturas en polea','Curl de bíceps con mancuerna agarre prono, curl de biceps con barra z, curl de biceps en máquina, Press militar con mancuernas, Elevaciones laterales, pájaro sentado','Sentadilla, hip thrust, extensión de cuádriceps, curl de femoral, aductor, abductor, gemelos','Extensión de triceps en polea con cuerda, con barra v, tras nuca, fondos en paralelas','Peso muerto, jalón al pecho, remo con barra en polea, remo a una mano en máquina, pullover',NULL);
/*!40000 ALTER TABLE `rutinas` ENABLE KEYS */;
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
