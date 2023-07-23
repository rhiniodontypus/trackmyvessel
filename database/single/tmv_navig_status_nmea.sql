-- `tmv_navig_status_nmea`

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
-- Table structure for table `tmv_navig_status_nmea`
--

DROP TABLE IF EXISTS `tmv_navig_status_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_navig_status_nmea` (
  `id_navstat_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_navstat_nmea` tinyint(2) unsigned NOT NULL,
  `desc_eng_navstat_nmea` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_de_navstat_nmea` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_navstat_nmea`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmv_navig_status_nmea`
--

LOCK TABLES `tmv_navig_status_nmea` WRITE;
/*!40000 ALTER TABLE `tmv_navig_status_nmea` DISABLE KEYS */;
INSERT INTO `tmv_navig_status_nmea` VALUES (1,0,'Under way using engine',NULL),(2,1,'At anchor',NULL),(3,2,'Not under command',NULL),(4,3,'Restricted manoeuverability',NULL),(5,4,'Constrained by her draught',NULL),(6,5,'Moored',NULL),(7,6,'Aground',NULL),(8,7,'Engaged in Fishing',NULL),(9,8,'Under way sailing',NULL),(10,9,'Reserved for future amendment of Navigational Status for HSC',NULL),(11,10,'Reserved for future amendment of Navigational Status for WIG',NULL),(12,11,'Reserved for future use',NULL),(13,12,'Reserved for future use',NULL),(14,13,'Reserved for future use',NULL),(15,14,'AIS-SART is active',NULL),(16,15,'Not defined (default)',NULL);
/*!40000 ALTER TABLE `tmv_navig_status_nmea` ENABLE KEYS */;
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

