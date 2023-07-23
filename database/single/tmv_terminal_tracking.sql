-- `tmv_terminal_tracking`

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
-- Table structure for table `tmv_terminal_tracking`
--

DROP TABLE IF EXISTS `tmv_terminal_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_terminal_tracking` (
  `id_terminal_tracking` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mmsi_terminal_tracking` bigint(10) unsigned NOT NULL,
  `imo_terminal_tracking` bigint(7) unsigned DEFAULT NULL,
  `terminal_id_terminal_tracking` smallint(2) unsigned NULL,
  `navig_status_terminal_tracking` tinyint(2) unsigned NOT NULL,
  `lat_terminal_tracking` decimal(11,8) NOT NULL,
  `lon_terminal_tracking` decimal(11,8) NOT NULL,
  `movement_terminal_tracking` bigint(10) unsigned DEFAULT NULL,
  `sog_terminal_tracking` decimal(5,1) unsigned DEFAULT NULL,
  `cog_terminal_tracking` decimal(4,1) unsigned DEFAULT NULL,
  `rot_terminal_tracking` decimal(7,4) DEFAULT NULL,
  `th_terminal_tracking` smallint(3) unsigned DEFAULT NULL,
  `eta_ts_terminal_tracking` datetime DEFAULT NULL,
  `draught_terminal_tracking` decimal(3,1) unsigned DEFAULT NULL,
  `ship_cargo_type_terminal_tracking` tinyint(2) unsigned DEFAULT NULL,
  `destination_terminal_tracking` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ts_voyage_terminal_tracking` datetime DEFAULT NULL,
  `last_update_terminal_tracking` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_terminal_tracking`)
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

