-- `tmv_myvessels_nmea`

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
-- Table structure for table `tmv_myvessels_nmea`
--

DROP TABLE IF EXISTS `tmv_myvessels_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_myvessels_nmea` (
  `id_myvessels` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_myvessels` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ex_name_myvessels` varchar(50) COLLATE utf8_unicode_ci NULL,
  `ex_name2_myvessels` varchar(50) COLLATE utf8_unicode_ci NULL,
  `ex_name3_myvessels` varchar(50) COLLATE utf8_unicode_ci NULL,
  `ex_name4_myvessels` varchar(50) COLLATE utf8_unicode_ci NULL,
  `company_myvessels` varchar(50) COLLATE utf8_unicode_ci NULL,
  `vessel_type_myvessels` varchar(50) COLLATE utf8_unicode_ci NULL,
  `ship_cargo_type_type5_nmea` tinyint(2) unsigned NULL,
  `mmsi_myvessels` bigint(10) unsigned NOT NULL,
  `imo_myvessels` mediumint(7) unsigned NOT NULL,
  `callsign_myvessels` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mt_shipid_myvessels` mediumint(6) unsigned NULL,
  `flag_myvessels` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `flag_code_myvessels` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `gross_tonnage_myvessels` mediumint(6) unsigned NULL,
  `net_tonnage_myvessels` mediumint(6) unsigned NULL,
  `deadweight_t_myvessels` mediumint(6) unsigned NULL,
  `length_m_myvessels` decimal(5,2) unsigned DEFAULT NULL,
  `breadth_m_myvessels` decimal(4,2) unsigned DEFAULT NULL,
  `bow_type5_nmea` smallint(3) unsigned NULL,
  `stern_type5_nmea` smallint(3) unsigned NULL,
  `port_type5_nmea` tinyint(2) unsigned NULL,
  `starboard_type5_nmea` tinyint(2) unsigned NULL,
  `year_built_myvessels` year(4) DEFAULT NULL,
  `home_port_myvessels` varchar(50) COLLATE utf8_unicode_ci NULL,
  `testship_myvessels` varchar(3) COLLATE utf8_unicode_ci NULL,
  `status_myvessels` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `last_update_myvessels` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_myvessels`)
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

