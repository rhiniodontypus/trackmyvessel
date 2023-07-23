-- `tmv_hazcode_nmea`

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
-- Table structure for table `tmv_hazcode_nmea`
--

DROP TABLE IF EXISTS `tmv_hazcode_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_hazcode_nmea` (
  `id_hazcode_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_hazcode_nmea` tinyint(2) unsigned NOT NULL,
  `desc_hazcode_nmea` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic_hazcode_nmea` mediumblob,
  PRIMARY KEY (`id_hazcode_nmea`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmv_hazcode_nmea`
--

LOCK TABLES `tmv_hazcode_nmea` WRITE;
/*!40000 ALTER TABLE `tmv_hazcode_nmea` DISABLE KEYS */;
INSERT INTO `tmv_hazcode_nmea` VALUES (1,0,'0 blue cones/lights (No hazardous material)',''),(2,1,'1 blue cone/light (e.g. Flammables)','/home/cattleya/Entwicklung/Rails/tmv_map/graphic/app/assets/images/blau_kegel_1.svg'),(3,2,'2 blue cones/lights (e.g. Toxics, Irritants)','/home/cattleya/Entwicklung/Rails/tmv_map/graphic/app/assets/images/blau_kegel_2.svg'),(4,3,'3 blue cones/lights (e.g. Explosives)','/home/cattleya/Entwicklung/Rails/tmv_map/graphic/app/assets/images/blau_kegel_3.svg'),(5,4,'4 B-Flag',''),(6,5,'Unknown (default)','');
/*!40000 ALTER TABLE `tmv_hazcode_nmea` ENABLE KEYS */;
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

