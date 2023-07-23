-- `tmv_shiptype_nmea`

-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0+deb8u1

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
-- Table structure for table `tmv_shiptype_nmea`
--

DROP TABLE IF EXISTS `tmv_shiptype_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_shiptype_nmea` (
  `id_shiptype_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_shiptype_nmea` smallint(3) unsigned NOT NULL,
  `desc_eng_shiptype_nmea` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_de_shiptype_nmea` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_shiptype_nmea`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmv_shiptype_nmea`
--

LOCK TABLES `tmv_shiptype_nmea` WRITE;
/*!40000 ALTER TABLE `tmv_shiptype_nmea` DISABLE KEYS */;
INSERT INTO `tmv_shiptype_nmea` VALUES (1,0,'Not available (default)',NULL),(2,1,'Reserved for future use',NULL),(3,2,'Reserved for future use',NULL),(4,3,'Reserved for future use',NULL),(5,4,'Reserved for future use',NULL),(6,5,'Reserved for future use',NULL),(7,6,'Reserved for future use',NULL),(8,7,'Reserved for future use',NULL),(9,8,'Reserved for future use',NULL),(10,9,'Reserved for future use',NULL),(11,10,'Reserved for future use',NULL),(12,11,'Reserved for future use',NULL),(13,12,'Reserved for future use',NULL),(14,13,'Reserved for future use',NULL),(15,14,'Reserved for future use',NULL),(16,15,'Reserved for future use',NULL),(17,16,'Reserved for future use',NULL),(18,17,'Reserved for future use',NULL),(19,18,'Reserved for future use',NULL),(20,19,'Reserved for future use',NULL),(21,20,'Wing in ground (WIG), all ships of this type',NULL),(22,21,'Wing in ground (WIG), Hazardous category A',NULL),(23,22,'Wing in ground (WIG), Hazardous category B',NULL),(24,23,'Wing in ground (WIG), Hazardous category C',NULL),(25,24,'Wing in ground (WIG), Hazardous category D',NULL),(26,25,'Wing in ground (WIG), Reserved for future use',NULL),(27,26,'Wing in ground (WIG), Reserved for future use',NULL),(28,27,'Wing in ground (WIG), Reserved for future use',NULL),(29,28,'Wing in ground (WIG), Reserved for future use',NULL),(30,29,'Wing in ground (WIG), Reserved for future use',NULL),(31,30,'Fishing',NULL),(32,31,'Towing',NULL),(33,32,'Towing: length exceeds 200m or breadth exceeds 25m',NULL),(34,33,'Dredging or underwater ops',NULL),(35,34,'Diving ops',NULL),(36,35,'Military ops',NULL),(37,36,'Sailing',NULL),(38,37,'Pleasure Craft',NULL),(39,38,'Reserved',NULL),(40,39,'Reserved',NULL),(41,40,'High speed craft (HSC), all ships of this type',NULL),(42,41,'High speed craft (HSC), Hazardous category A',NULL),(43,42,'High speed craft (HSC), Hazardous category B',NULL),(44,43,'High speed craft (HSC), Hazardous category C',NULL),(45,44,'High speed craft (HSC), Hazardous category D',NULL),(46,45,'High speed craft (HSC), Reserved for future use',NULL),(47,46,'High speed craft (HSC), Reserved for future use',NULL),(48,47,'High speed craft (HSC), Reserved for future use',NULL),(49,48,'High speed craft (HSC), Reserved for future use',NULL),(50,49,'High speed craft (HSC), No additional information',NULL),(51,50,'Pilot Vessel',NULL),(52,51,'Search and Rescue vessel',NULL),(53,52,'Tug',NULL),(54,53,'Port Tender',NULL),(55,54,'Anti-pollution equipment',NULL),(56,55,'Law Enforcement',NULL),(57,56,'Spare - Local Vessel',NULL),(58,57,'Spare - Local Vessel',NULL),(59,58,'Medical Transport',NULL),(60,59,'Noncombatant ship according to RR Resolution No. 18',NULL),(61,60,'Passenger, all ships of this type',NULL),(62,61,'Passenger, Hazardous category A',NULL),(63,62,'Passenger, Hazardous category B',NULL),(64,63,'Passenger, Hazardous category C',NULL),(65,64,'Passenger, Hazardous category D',NULL),(66,65,'Passenger, Reserved for future use',NULL),(67,66,'Passenger, Reserved for future use',NULL),(68,67,'Passenger, Reserved for future use',NULL),(69,68,'Passenger, Reserved for future use',NULL),(70,69,'Passenger, No additional information',NULL),(71,70,'Cargo, all ships of this type',NULL),(72,71,'Cargo, Hazardous category A',NULL),(73,72,'Cargo, Hazardous category B',NULL),(74,73,'Cargo, Hazardous category C',NULL),(75,74,'Cargo, Hazardous category D',NULL),(76,75,'Cargo, Reserved for future use',NULL),(77,76,'Cargo, Reserved for future use',NULL),(78,77,'Cargo, Reserved for future use',NULL),(79,78,'Cargo, Reserved for future use',NULL),(80,79,'Cargo, No additional information',NULL),(81,80,'Tanker, all ships of this type',NULL),(82,81,'Tanker, Hazardous category A',NULL),(83,82,'Tanker, Hazardous category B',NULL),(84,83,'Tanker, Hazardous category C',NULL),(85,84,'Tanker, Hazardous category D',NULL),(86,85,'Tanker, Reserved for future use',NULL),(87,86,'Tanker, Reserved for future use',NULL),(88,87,'Tanker, Reserved for future use',NULL),(89,88,'Tanker, Reserved for future use',NULL),(90,89,'Tanker, No additional information',NULL),(91,90,'Other Type, all ships of this type',NULL),(92,91,'Other Type, Hazardous category A',NULL),(93,92,'Other Type, Hazardous category B',NULL),(94,93,'Other Type, Hazardous category C',NULL),(95,94,'Other Type, Hazardous category D',NULL),(96,95,'Other Type, Reserved for future use',NULL),(97,96,'Other Type, Reserved for future use',NULL),(98,97,'Other Type, Reserved for future use',NULL),(99,98,'Other Type, Reserved for future use',NULL),(100,99,'Other Type, no additional information',NULL);
/*!40000 ALTER TABLE `tmv_shiptype_nmea` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed

