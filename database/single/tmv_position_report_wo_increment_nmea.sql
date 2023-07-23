-- `tmv_position_report_wo_increment_nmea`

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
-- Table structure for table `tmv_position_report_wo_increment_nmea`
--

DROP TABLE IF EXISTS `tmv_position_report_wo_increment_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_position_report_wo_increment_nmea` (
  `id_nmea` int(11) unsigned NOT NULL,
  `message_type_nmea` tinyint(2) unsigned NOT NULL,
  `mmsi_nmea` bigint(10) unsigned NOT NULL,
  `flag_nmea` smallint(3) unsigned NOT NULL,
  `navig_status_nmea` tinyint(2) NOT NULL,
  `rate_of_turn_nmea` decimal(7,4) NOT NULL,
  `speed_over_ground_nmea` decimal(5,1) unsigned NOT NULL,
  `longitude_nmea` decimal(11,8) NOT NULL,
  `latitude_nmea` decimal(11,8) NOT NULL,
  `course_over_ground_nmea` decimal(4,1) unsigned NOT NULL,
  `true_heading_nmea` smallint(3) unsigned NOT NULL,
  `regional_res_nmea` tinyint(1) unsigned NOT NULL,
  `aivdm_message_nmea` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_update_nmea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mmsi_nmea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed

