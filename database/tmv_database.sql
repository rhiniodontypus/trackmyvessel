--
-- Create DB
--
CREATE DATABASE IF NOT EXISTS trackmyvessel;
USE trackmyvessel;

--
-- Create USER
--
DROP USER IF EXISTS 'vesseltracker@localhost';
-- Here you can change the password:
CREATE USER 'vesseltracker'@'localhost' IDENTIFIED BY 'password';
GRANT USAGE ON *.* to 'vesseltracker'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON trackmyvessel.* TO 'vesseltracker'@'localhost';
FLUSH PRIVILEGES;


--
-- Importing table structures and data
--



-- `tmv_area_nmea`

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
-- Table structure for table `tmv_area_nmea`
--

DROP TABLE IF EXISTS `tmv_area_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_area_nmea` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `area_range` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `area_lat1` decimal(9,6) NOT NULL,
  `area_lon1` decimal(9,6) NOT NULL,
  `area_lat2` decimal(9,6) NOT NULL,
  `area_lon2` decimal(9,6) NOT NULL,
  `area_lat3` decimal(9,6) NOT NULL,
  `area_lon3` decimal(9,6) NOT NULL,
  `area_lat4` decimal(9,6) NOT NULL,
  `area_lon4` decimal(9,6) NOT NULL,
  `area_lat5` decimal(9,6) NOT NULL,
  `area_lon5` decimal(9,6) NOT NULL,
  `area_lat6` decimal(9,6) NOT NULL,
  `area_lon6` decimal(9,6) NOT NULL,
  `last_update_area` date NOT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmv_area_nmea`
--

LOCK TABLES `tmv_area_nmea` WRITE;
/*!40000 ALTER TABLE `tmv_area_nmea` DISABLE KEYS */;
INSERT INTO `tmv_area_nmea` VALUES (1,'Nord-Ostsee-Kanal','Kiel Holtenau Gr. Schleuse (N)',54.366723,10.139185,54.366342,10.141977,54.365883,10.144965,54.365433,10.144793,54.365854,10.141941,54.366254,10.139084,'2016-11-02'),(2,'Nord-Ostsee-Kanal','Kiel Holtenau Gr. Schleuse (S)',54.366168,10.139061,54.365780,10.141654,54.365336,10.144755,54.364867,10.144594,54.365317,10.141568,54.365705,10.138875,'2016-11-02'),(3,'Nord-Ostsee-Kanal','Brunsbuettel Große Schleuse (N)',53.895139,9.146280,53.894333,9.144779,53.893178,9.142574,53.892856,9.143037,53.893893,9.144975,53.894848,9.146795,'2016-11-02'),(4,'Nord-Ostsee-Kanal','Brunsbuettel Große Schleuse (S)',53.894740,9.146902,53.893826,9.145170,53.892767,9.143208,53.892466,9.143693,53.893459,9.145561,53.894407,9.147359,'2016-11-02'),(5,'Nord-Ostsee-Kanal','NOK',53.895879,9.145847,54.405048,9.418841,54.368846,10.140407,54.365605,10.139231,54.146575,9.715830,53.891818,9.150341,'2016-11-02'),(6,'Elbe','Hamburger Hafengebiet',53.556030,9.778629,53.565120,9.804535,53.541798,10.122986,53.428344,9.991039,53.499366,9.869484,53.536683,9.767545,'2016-11-02'),(7,'Elbe','Elbmuendung',53.891887,8.683877,53.829406,8.825575,53.836794,9.005055,53.898478,8.994211,53.893822,8.859226,53.932539,8.756864,'2016-11-02'),(8,'Elbe','Unterelbe',53.565120,9.804535,53.536683,9.767545,53.642049,9.137029,53.836794,9.005055,53.898478,8.994211,53.894479,9.654549,'2016-11-09');
/*!40000 ALTER TABLE `tmv_area_nmea` ENABLE KEYS */;
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

-- `tmv_company`

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
-- Table structure for table `tmv_company`
--

DROP TABLE IF EXISTS `tmv_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_company` (
  `id_company` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_company`)
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

-- `tmv_eri_classification_nmea`;

-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
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
-- Table structure for table `tmv_eri_classification_nmea`
--

DROP TABLE IF EXISTS `tmv_eri_classification_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_eri_classification_nmea` (
  `id_eri_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_eri_nmea` smallint(4) unsigned NOT NULL,
  `solas_eri_nmea` tinyint(2) unsigned NOT NULL,
  `desc_eri_nmea` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_eri_nmea`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmv_eri_classification_nmea`
--

LOCK TABLES `tmv_eri_classification_nmea` WRITE;
/*!40000 ALTER TABLE `tmv_eri_classification_nmea` DISABLE KEYS */;
INSERT INTO `tmv_eri_classification_nmea` VALUES (1,8000,99,'VESSEL, TYPE UNKNOWN'),(2,8010,79,'MOTOR FREIGHTER'),(3,8020,89,'MOTOR TANKER'),(4,8021,80,'MOTOR TANKER, LIQUID CARGO, TYPE N'),(5,8022,80,'MOTOR TANKER, LIQUID CARGO, TYPE C'),(6,8023,89,'MOTOR TANKER, DRY CARGO AS IF LIQUID (E.G. CEMENT)'),(7,8030,79,'CONTAINER VESSEL'),(8,8040,80,'GAS TANKER'),(9,8050,79,'MOTOR FREIGHTER, TUG'),(10,8060,89,'MOTOR TANKER, TUG'),(11,8070,79,'MOTOR FREIGHTER WITH ONE OR MORE SHIPS ALONGSIDE'),(12,8080,89,'MOTOR FREIGHTER WITH TANKER'),(13,8090,79,'MOTOR FREIGHTER PUSHING ONE OR MORE FREIGHTERS'),(14,8100,89,'MOTOR FREIGHTER PUSHING AT LEAST ONE TANK-SHIP'),(15,8110,79,'TUG, FREIGHTER'),(16,8120,89,'TUG, TANKER'),(17,8130,31,'TUG, FREIGHTER, COUPLED'),(18,8140,31,'TUG, FREIGHTER/TANKER, COUPLED'),(19,8150,99,'FREIGHTBARGE'),(20,8160,99,'TANKBARGE'),(21,8161,90,'TANKBARGE, LIQUID CARGO, TYPE N'),(22,8162,90,'TANKBARGE, LIQUID CARGO, TYPE C'),(23,8163,99,'TANKBARGE, DRY CARGO AS IF LIQUID (E.G. CEMENT)'),(24,8170,89,'FREIGHTBARGE WITH CONTAINERS'),(25,8180,90,'TANKBARGE, GAS'),(26,8210,79,'PUSHTOW, ONE CARGO BARGE'),(27,8220,79,'PUSHTOW, TWO CARGO BARGES'),(28,8230,79,'PUSHTOW, THREE CARGO BARGES'),(29,8240,79,'PUSHTOW, FOUR CARGO BARGES'),(30,8250,79,'PUSHTOW, FIVE CARGO BARGES'),(31,8260,79,'PUSHTOW, SIX CARGO BARGES'),(32,8270,79,'PUSHTOW, SEVEN CARGO BARGES'),(33,8280,79,'PUSHTOW, EIGTH CARGO BARGES'),(34,8290,79,'PUSHTOW, NINE OR MORE BARGES'),(35,8310,80,'PUSHTOW, ONE TANK/GAS BARGE'),(36,8320,80,'PUSHTOW, 2 BARGES AT LEAST ONE TANKER/GAS BARGE'),(37,8330,80,'PUSHTOW, 3 BARGES AT LEAST ONE TANKER/GAS BARGE'),(38,8340,80,'PUSHTOW, 4 BARGES AT LEAST ONE TANKER/GAS BARGE'),(39,8350,80,'PUSHTOW, 5 BARGES AT LEAST ONE TANKER/GAS BARGE'),(40,8360,80,'PUSHTOW, 6 BARGES AT LEAST ONE TANKER/GAS BARGE'),(41,8370,80,'PUSHTOW, 7 BARGES AT LEAST ONE TANKER/GAS BARGE'),(42,8380,80,'PUSHTOW, 8 BARGES AT LEAST ONE TANKER/GAS BARGE'),(43,8390,80,'PUSHTOW, 9 OR MORE BARGES AT LEAST ONE TANKER/GAS BARGE'),(44,8400,52,'TUG, SINGLE'),(45,8410,31,'TUG, ONE OR MORE TOWS'),(46,8420,31,'TUG, ASSISTING A VESSEL OR LINKED COMBINATION'),(47,8430,99,'PUSHBOAT, SINGLE'),(48,8440,69,'PASSENGER SHIP, FERRY, CRUISE SHIP, RED CROSS SHIP'),(49,8441,69,'FERRY'),(50,8442,58,'RED CROSS SHIP'),(51,8443,69,'CRUISE SHIP'),(52,8444,69,'PASSENGER SHIP WITHOUT ACCOMODATION'),(53,8450,99,'SERVICE VESSEL, POLICE PATROL, PORT SERVICE'),(54,8460,33,'VESSEL, WORK MAINTAINANCE CRAFT, FLOATING DERRICK, CABLE SHIP, BUOY SHIP, DREDGE '),(55,8470,99,'OBJECT, TOWED, NOT OTHERWISE SPECIFIED'),(56,8480,30,'FISHING BOAT'),(57,8490,99,'BUNKERSHIP'),(58,8500,80,'BARGE, TANKER, CHEMICAL'),(59,8510,99,'OBJECT, NOT OTHERWISE SPECIFIED'),(60,1500,79,'GENERAL CARGO VESSEL MARITIME'),(61,1510,79,'UNIT CARRIER MARITIME'),(62,1520,79,'BULK CARRIER MARITIME'),(63,1530,80,'TANKER'),(64,1540,80,'LIQUIFIED GAS TANKER'),(65,1850,37,'PLEASURE CRAFT, LONGER THAN 20 METRES'),(66,1900,49,'FAST SHIP'),(67,1910,49,'HYDROFOIL');
/*!40000 ALTER TABLE `tmv_eri_classification_nmea` ENABLE KEYS */;
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

-- `tmv_loadstatus_nmea`

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
-- Table structure for table `tmv_loadstatus_nmea`
--

DROP TABLE IF EXISTS `tmv_loadstatus_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_loadstatus_nmea` (
  `id_loadstatus_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_loadstatus_nmea` tinyint(2) unsigned NOT NULL,
  `desc_loadstatus_nmea` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_loadstatus_nmea`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmv_loadstatus_nmea`
--

LOCK TABLES `tmv_loadstatus_nmea` WRITE;
/*!40000 ALTER TABLE `tmv_loadstatus_nmea` DISABLE KEYS */;
INSERT INTO `tmv_loadstatus_nmea` VALUES (1,0,'N/A (default)'),(2,1,'Unloaded'),(3,2,'Loaded');
/*!40000 ALTER TABLE `tmv_loadstatus_nmea` ENABLE KEYS */;
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

-- `tmv_midflagcodes_nmea`

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
-- Table structure for table `tmv_midflagcodes_nmea`
--

DROP TABLE IF EXISTS `tmv_midflagcodes_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_midflagcodes_nmea` (
  `id_midflagcodes_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country_midflagcodes_nmea` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alpha2_midflagcode_nmea` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alpha3_midflagcode_nmea` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mid_midflagcode_nmea` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_midflagcodes_nmea`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmv_midflagcodes_nmea`
--

LOCK TABLES `tmv_midflagcodes_nmea` WRITE;
/*!40000 ALTER TABLE `tmv_midflagcodes_nmea` DISABLE KEYS */;
INSERT INTO `tmv_midflagcodes_nmea` VALUES (1,'Albania','AL','ALB',201),(2,'Andorra','AD','AND',202),(3,'Austria','AT','AUT',203),(4,'Azores','PT','PRT',204),(5,'Belgium','BE','BEL',205),(6,'Belarus','BY','BLR',206),(7,'Bulgaria','BG','BGR',207),(8,'Vatican City State','VA','VAT',208),(9,'Cyprus','CY','CYP',209),(10,'Cyprus','CY','CYP',210),(11,'Germany','DE','DEU',211),(12,'Cyprus','CY','CYP',212),(13,'Georgia','GE','GEO',213),(14,'Moldova','MD','MDA',214),(15,'Malta','MT','MLT',215),(16,'Armenia','AM','ARM',216),(17,'Germany','DE','DEU',218),(18,'Denmark','DK','DNK',219),(19,'Denmark','DK','DNK',220),(20,'Spain','ES','ESP',224),(21,'Spain','ES','ESP',225),(22,'France','FR','FRA',226),(23,'France','FR','FRA',227),(24,'France','FR','FRA',228),(25,'Malta','MT','MLT',229),(26,'Finland','FI','FIN',230),(27,'Faroe Islands','FO','FRO',231),(28,'United Kingdom','GB','GBR',232),(29,'United Kingdom','GB','GBR',233),(30,'United Kingdom','GB','GBR',234),(31,'United Kingdom','GB','GBR',235),(32,'Gibraltar','GI','GIB',236),(33,'Greece','GR','GRC',237),(34,'Croatia','HR','HRV',238),(35,'Greece','GR','GRC',239),(36,'Greece','GR','GRC',240),(37,'Greece','GR','GRC',241),(38,'Morocco','MA','MAR',242),(39,'Hungary','HU','HUN',243),(40,'Netherlands','NL','NLD',244),(41,'Netherlands','NL','NLD',245),(42,'Netherlands','NL','NLD',246),(43,'Italy','IT','ITA',247),(44,'Malta','MT','MLT',248),(45,'Malta','MT','MLT',249),(46,'Ireland','IE','IRL',250),(47,'Iceland','IS','ISL',251),(48,'Liechtenstein','LI','LIE',252),(49,'Luxembourg','LU','LUX',253),(50,'Monaco','MC','MCO',254),(51,'Madeira','PT','PRT',255),(52,'Malta','MT','MLT',256),(53,'Norway','NO','NOR',257),(54,'Norway','NO','NOR',258),(55,'Norway','NO','NOR',259),(56,'Poland','PL','POL',261),(57,'Montenegro','ME','MNE',262),(58,'Portugal','PT','PRT',263),(59,'Romania','RO','ROU',264),(60,'Sweden','SE','SWE',265),(61,'Sweden','SE','SWE',266),(62,'Slovak Republic','SK','SVK',267),(63,'San Marino','SM','SMR',268),(64,'Switzerland','CH','CHE',269),(65,'Czech Republic','CZ','CZE',270),(66,'Turkey','TR','TUR',271),(67,'Ukraine','UA','UKR',272),(68,'Russia','RU','RUS',273),(69,'Macedonia','MK','MKD',274),(70,'Latvia','LV','LVA',275),(71,'Estonia','EE','EST',276),(72,'Lithuania','LT','LTU',277),(73,'Slovenia','SI','SVN',278),(74,'Serbia','RS','SRB',279),(75,'Anguilla','AI','AIA',301),(76,'Alaska','US','USA',303),(77,'Antigua and Barbuda','AG','ATG',304),(78,'Antigua and Barbuda','AG','ATG',305),(79,'Antilles','CW','CUW',306),(80,'Aruba','AW','ABW',307),(81,'Bahamas','BS','BHS',308),(82,'Bahamas','BS','BHS',309),(83,'Bermuda','BM','BMU',310),(84,'Bahamas','BS','BMU',311),(85,'Belize','BZ','BLZ',312),(86,'Barbados','BB','BRB',314),(87,'Canada','CA','CAN',316),(88,'Cayman Islands','KY','CYM',319),(89,'Costa Rica','CR','CRI',321),(90,'Cuba','CU','CUB',323),(91,'Dominica','DM','DMA',325),(92,'Dominican Republic','DO','DOM',327),(93,'Guadeloupe','GP','GLP',329),(94,'Grenada','GD','GRD',330),(95,'Greenland','GL','GRL',331),(96,'Guatemala','GT','GTM',332),(97,'Honduras','HN','HND',335),(98,'Haiti','HT','HTI',336),(99,'United States of America','US','USA',338),(100,'Jamaica','JM','JAM',339),(101,'Saint Kitts and Nevis','KN','KNA',341),(102,'Saint Lucia','LC','LCA',343),(103,'Mexico','MX','MEX',345),(104,'Martinique','MQ','MTQ',347),(105,'Montserrat','MS','MSR',348),(106,'Nicaragua','NI','NIC',350),(107,'Panama','PA','PAN',351),(108,'Panama','PA','PAN',352),(109,'Panama','PA','PAN',353),(110,'Panama','PA','PAN',354),(111,'Panama','PA','PAN',355),(112,'Panama','PA','PAN',356),(113,'Panama','PA','PAN',357),(114,'Puerto Rico','PR','PRI',358),(115,'El Salvador','SV','SLV',359),(116,'Saint Pierre and Miquelon','PM','SPM',361),(117,'Trinidad and Tobago','TT','TTO',362),(118,'Turks and Caicos Islands','TC','TCA',364),(119,'United States of America','US','USA',366),(120,'United States of America','US','USA',367),(121,'United States of America','US','USA',368),(122,'United States of America','US','USA',369),(123,'Panama','PA','PAN',370),(124,'Panama','PA','PAN',371),(125,'Panama','PA','PAN',372),(126,'Panama','PA','PAN',373),(127,'Panama','PA','PAN',374),(128,'Saint Vincent and the Grenadines','VC','VCT',375),(129,'Saint Vincent and the Grenadines','VC','VCT',376),(130,'Saint Vincent and the Grenadines','VC','VCT',377),(131,'British Virgin Islands','VG','VGB',378),(132,'United States Virgin Islands','VI','VIR',379),(133,'Afghanistan','AF','AFG',401),(134,'Saudi Arabia','SA','SAU',403),(135,'Bangladesh','BD','BGD',405),(136,'Bahrain','BH','BHR',408),(137,'Bhutan','BT','BTN',410),(138,'China','CN','CHN',412),(139,'China','CN','CHN',413),(140,'China','CN','CHN',414),(141,'Taiwan','TW','TWN',416),(142,'Sri Lanka','LK','LKA',417),(143,'India','IN','IND',419),(144,'Iran','IR','IRN',422),(145,'Azerbaijan','AZ','AZE',423),(146,'Iraq','IQ','IRQ',425),(147,'Israel','IL','ISR',428),(148,'Japan','JP','JPN',431),(149,'Japan','JP','JPN',432),(150,'Turkmenistan','TM','TKM',434),(151,'Kazakhstan','KZ','KAZ',436),(152,'Uzbekistan','UZ','UZB',437),(153,'Jordan','JO','JOR',438),(154,'Korea','KR','KOR',440),(155,'Korea','KR','KOR',441),(156,'State of Palestine','PS','PSE',443),(157,'Democratic People\'s Republic of Korea','KP','PRK',445),(158,'Kuwait','KW','KWT',447),(159,'Lebanon','LB','LBN',450),(160,'Kyrgyz Republic','KG','KGZ',451),(161,'Macao','MO','MAC',453),(162,'Maldives','MV','MDV',455),(163,'Mongolia','MN','MNG',457),(164,'Nepal','NP','NPL',459),(165,'Oman','OM','OMN',461),(166,'Pakistan','PK','PAK',463),(167,'Qatar (State of)','QA','QAT',466),(168,'Syrian Arab Republic','SY','SYR',468),(169,'United Arab Emirates','AE','ARE',470),(170,'Tajikistan','TJ','TJK',472),(171,'Yemen','YE','YEM',473),(172,'Yemen','YE','YEM',475),(173,'Hong Kong','HK','HKG',477),(174,'Bosnia and Herzegovina','BA','BIH',478),(175,'Adelie Land','FR','FRA',501),(176,'Australia','AU','AUS',503),(177,'Myanmar','MM','MMR',506),(178,'Brunei Darussalam','BN','BRN',508),(179,'Micronesia','FM','FSM',510),(180,'Palau','PW','PLW',511),(181,'New Zealand','NZ','NZL',512),(182,'Cambodia','KH','KHM',514),(183,'Cambodia','KH','KHM',515),(184,'Christmas Island','CX','CXR',516),(185,'Cook Islands','CK','COK',518),(186,'Fiji','FJ','FJI',520),(187,'Cocos (Keeling) Islands','CC','CCK',523),(188,'Indonesia','ID','IDN',525),(189,'Kiribati','KI','KIR',529),(190,'Lao People\'s Democratic Republic','LA','LAO',531),(191,'Malaysia','MY','MYS',533),(192,'Northern Mariana Islands','MP','MNP',536),(193,'Marshall Islands','MH','MHL',538),(194,'New Caledonia','NC','NCL',540),(195,'Niue','NU','NIU',542),(196,'Nauru','NR','NRU',544),(197,'French Polynesia','PF','PYF',546),(198,'Philippines','PH','PHL',548),(199,'Papua New Guinea','PG','PNG',553),(200,'Pitcairn Island','PN','PCN',555),(201,'Solomon Islands','SB','SLB',557),(202,'American Samoa','AS','ASM',559),(203,'Samoa','WS','WSM',561),(204,'Singapore','SG','SGP',563),(205,'Singapore','SG','SGP',564),(206,'Singapore','SG','SGP',565),(207,'Singapore','SG','SGP',566),(208,'Thailand','TH','THA',567),(209,'Tonga','TO','TON',570),(210,'Tuvalu','TV','TUV',572),(211,'Viet Nam','VN','VNM',574),(212,'Vanuatu','VU','VUT',576),(213,'Vanuatu','VU','VUT',577),(214,'Wallis and Futuna Islands','WF','WLF',578),(215,'South Africa','ZA','ZAF',601),(216,'Angola','AO','AGO',603),(217,'Algeria','DZ','DZA',605),(218,'Saint Paul and Amsterdam Islands','FR','FRA',607),(219,'Ascension Island','GB','GBR',608),(220,'Burundi','BI','BDI',609),(221,'Benin','BJ','BEN',610),(222,'Botswana','BW','BWA',611),(223,'Central African Republic','CF','CAF',612),(224,'Cameroon','CM','CMR',613),(225,'Congo','CG','COG',615),(226,'Comoros','KM','COM',616),(227,'Cabo Verde','CV','CPV',617),(228,'Crozet Archipelago','FR','FRA',618),(229,'Ivory Coast','CI','CIV',619),(230,'Comoros','KM','COM',620),(231,'Djibouti','DJ','DJI',621),(232,'Egypt','EG','EGY',622),(233,'Ethiopia','ET','ETH',624),(234,'Eritrea','ER','ERI',625),(235,'Gabonese Republic','GA','GAB',626),(236,'Ghana','GH','GHA',627),(237,'Gambia','GM','GMB',629),(238,'Guinea-Bissau','GW','GNB',630),(239,'Equatorial Guinea','GQ','GNQ',631),(240,'Guinea','GN','GIN',632),(241,'Burkina Faso','BF','BFA',633),(242,'Kenya','KE','KEN',634),(243,'Kerguelen Islands','FR','FRA',635),(244,'Liberia','LR','LBR',636),(245,'Liberia','LR','LBR',637),(246,'South Sudan','SS','SSD',638),(247,'Libya','LY','LBY',642),(248,'Lesotho','LS','LSO',644),(249,'Mauritius','MU','MUS',645),(250,'Madagascar','MG','MDG',647),(251,'Mali','ML','MLI',649),(252,'Mozambique','MZ','MOZ',650),(253,'Mauritania','MR','MRT',654),(254,'Malawi','MW','MWI',655),(255,'Niger','NE','NER',656),(256,'Nigeria','NG','NGA',657),(257,'Namibia','NA','NAM',659),(258,'Reunion','RE','REU',660),(259,'Rwanda','RW','RWA',661),(260,'Sudan','SD','SDN',662),(261,'Senegal','SN','SEN',663),(262,'Seychelles','SC','SYC',664),(263,'Saint Helena','SH','SHN',665),(264,'Somali Democratic Republic','SO','SOM',666),(265,'Sierra Leone','SL','SLE',667),(266,'Sao Tome and Principe','ST','STP',668),(267,'Swaziland','SZ','SWZ',669),(268,'Chad','TD','TCD',670),(269,'Togolese Republic','TG','TGO',671),(270,'Tunisian Republic','TN','TUN',672),(271,'Tanzania','TZ','TZA',674),(272,'Uganda','UG','UGA',675),(273,'Democratic Republic of the Congo','CD','COD',676),(274,'Tanzania','TZ','TZA',677),(275,'Zambia','ZM','ZMB',678),(276,'Zimbabwe','ZW','ZWE',679),(277,'Argentine Republic','AR','ARG',701),(278,'Brazil','BR','BRA',710),(279,'Bolivia','BO','BOL',720),(280,'Chile','CL','CHL',725),(281,'Colombia','CO','COL',730),(282,'Ecuador','EC','ECU',735),(283,'Falkland Islands','FK','FLK',740),(284,'Guiana','GF','GUF',745),(285,'Guyana','GY','GUY',750),(286,'Paraguay','PY','PRY',755),(287,'Peru','PE','PER',760),(288,'Suriname','SR','SUR',765),(289,'Uruguay','UY','URY',770),(290,'Venezuela','VE','VEN',775);
/*!40000 ALTER TABLE `tmv_midflagcodes_nmea` ENABLE KEYS */;
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

-- `tmv_myvessel_tracking`

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
-- Table structure for table `tmv_myvessel_tracking`
--

DROP TABLE IF EXISTS `tmv_myvessel_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_myvessel_tracking` (
  `id_myvessel_tracking` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mmsi_myvessel_tracking` bigint(10) unsigned NOT NULL,
  `imo_myvessel_tracking` bigint(7) unsigned DEFAULT NULL,
  `navig_status_myvessel_tracking` tinyint(2) unsigned NOT NULL,
  `lon_myvessel_tracking` decimal(11,8) NOT NULL,
  `lat_myvessel_tracking` decimal(11,8) NOT NULL,
  `movement_myvessel_tracking` bigint(10) unsigned DEFAULT NULL,
  `sog_myvessel_tracking` decimal(5,1) unsigned NOT NULL,
  `cog_myvessel_tracking` decimal(4,1) unsigned NOT NULL,
  `rot_myvessel_tracking` decimal(7,4) NOT NULL,
  `th_myvessel_tracking` smallint(3) unsigned NOT NULL,
  `id_tmv_myvessel_tracking` smallint(3) unsigned NOT NULL,
  `id_area_myvessel_tracking` smallint(2) unsigned DEFAULT NULL,
  # eintragen, wenn nicht älter als 24 Stunden
  `id_terminal_myvessel_tracking` smallint(2) unsigned DEFAULT NULL,
  `eta_ts_myvessel_tracking` datetime DEFAULT NULL,
  `draught_myvessel_tracking` decimal(3,1) unsigned DEFAULT NULL,
  `ship_cargo_type_myvessel_tracking` tinyint(2) unsigned DEFAULT NULL,
  `destination_myvessel_tracking` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_update_myvessel_tracking` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_myvessel_tracking`)
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

-- --
-- -- Table structure for table `tmv_position_report_wo_increment_nmea`
-- --

-- DROP TABLE IF EXISTS `tmv_position_report_wo_increment_nmea`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
-- CREATE TABLE `tmv_position_report_wo_increment_nmea` (
--   `id_nmea` int(11) unsigned NOT NULL,
--   `message_type_nmea` tinyint(2) unsigned NOT NULL,
--   `mmsi_nmea` bigint(10) unsigned NOT NULL,
--   `flag_nmea` smallint(3) unsigned NOT NULL,
--   `navig_status_nmea` tinyint(2) NOT NULL,
--   `rate_of_turn_nmea` decimal(7,4) NOT NULL,
--   `speed_over_ground_nmea` decimal(5,1) unsigned NOT NULL,
--   `longitude_nmea` decimal(11,8) NOT NULL,
--   `latitude_nmea` decimal(11,8) NOT NULL,
--   `course_over_ground_nmea` decimal(4,1) unsigned NOT NULL,
--   `true_heading_nmea` smallint(3) unsigned NOT NULL,
--   `regional_res_nmea` tinyint(1) unsigned NOT NULL,
--   `aivdm_message_nmea` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
--   `last_update_nmea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   PRIMARY KEY (`mmsi_nmea`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;
-- /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
-- /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- -- Dump completed--

-- Table structure for table `tmv_position_report_wo_increment_nmea`
--

DROP TABLE IF EXISTS `tmv_position_report_wo_increment_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_position_report_wo_increment_nmea` (
  `id_nmea` int(11) unsigned NOT NULL DEFAULT 0,
  `message_type_nmea` tinyint(2) unsigned NULL DEFAULT 0,
  `mmsi_nmea` bigint(10) unsigned NOT NULL,
  `flag_nmea` smallint(3) unsigned NOT NULL DEFAULT 0,
  `navig_status_nmea` tinyint(2) NOT NULL DEFAULT 0,
  `rate_of_turn_nmea` decimal(7,4) NOT NULL DEFAULT 0,
  `speed_over_ground_nmea` decimal(5,1) unsigned NOT NULL DEFAULT 0,
  `longitude_nmea` decimal(11,8) NOT NULL DEFAULT 0,
  `latitude_nmea` decimal(11,8) NOT NULL DEFAULT 0,
  `course_over_ground_nmea` decimal(4,1) unsigned NOT NULL DEFAULT 0,
  `true_heading_nmea` smallint(3) unsigned NOT NULL DEFAULT 0,
  `regional_res_nmea` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `aivdm_message_nmea` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT "0",
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

-- `tmv_static_nmea`

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
-- Table structure for table `tmv_static_nmea`
--

DROP TABLE IF EXISTS `tmv_static_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_static_nmea` (
  `id_static_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mmsi_static_nmea` bigint(10) unsigned NOT NULL,
  `callsign_static_nmea` varchar(7) COLLATE utf8_unicode_ci,
  `imo_static_nmea` bigint(7) unsigned,
  `name_static_nmea` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `bow_static_nmea` smallint(3) unsigned NOT NULL,
  `stern_static_nmea` smallint(3) unsigned NOT NULL,
  `port_static_nmea` tinyint(2) unsigned NOT NULL,
  `starboard_static_nmea` tinyint(2) unsigned NOT NULL,
  `epfd_static_nmea` tinyint(2) unsigned NOT NULL,
  `message_type_static_nmea` tinyint(2) unsigned NOT NULL,
  `message1_nmea` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message2_nmea` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `last_update_static_nmea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_static_nmea`)
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

-- `tmv_terminal`

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
-- Table structure for table `tmv_terminal`
--

DROP TABLE IF EXISTS `tmv_terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_terminal` (
  `terminal_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `terminal_name_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `terminal_anleger` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `terminal_betreiber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `terminal_lat1` decimal(9,6) NOT NULL,
  `terminal_lon1` decimal(9,6) NOT NULL,
  `terminal_lat2` decimal(9,6) NOT NULL,
  `terminal_lon2` decimal(9,6) NOT NULL,
  `terminal_lat3` decimal(9,6) NOT NULL,
  `terminal_lon3` decimal(9,6) NOT NULL,
  `terminal_lat4` decimal(9,6) NOT NULL,
  `terminal_lon4` decimal(9,6) NOT NULL,
  `terminal_genehmigung` date DEFAULT NULL,
  `terminal_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`terminal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmv_terminal`
--

LOCK TABLES `tmv_terminal` WRITE;
/*!40000 ALTER TABLE `tmv_terminal` DISABLE KEYS */;
INSERT INTO `tmv_terminal` VALUES (1,'Burchardkai','CTB','Athabaskakai','HHLA',53.539494,9.905200,53.539499,9.921442,53.540295,9.920998,53.540435,9.905117,NULL,'2016-11-12 19:00:00'),(2,'Burchardkai','CTB','Parkhafen','HHLA',53.539245,9.905022,53.535300,9.908605,53.535305,9.910167,53.539237,9.910518,NULL,'2016-11-12 19:00:00'),(3,'Burchardkai','CTB','Waltershofer Hafen','HHLA',53.534696,9.907335,53.525480,9.928840,53.526732,9.930323,53.535299,9.911367,NULL,'2016-11-12 19:00:00'),(5,'Sued-West-Terminal','','Suedwesthafen','C. Steinweg',53.536401,9.988501,53.531223,9.987812,53.531217,9.988439,53.536235,9.989169,NULL,'2016-11-12 19:00:00'),(6,'Sued-West-Terminal','','Steinwerder Hafen','C. Steinweg',53.535365,9.985182,53.535244,9.986105,53.537078,9.987398,53.537269,9.986272,NULL,'2016-11-12 19:00:00'),(7,'O\'Swaldkai (Unikai)','','Hansahafen','UNIKAI/HHLA',53.534489,9.992422,53.524690,10.007999,53.526889,10.009992,53.535150,9.993686,NULL,'2016-11-12 19:00:00'),(8,'Kalikai','','Kailikai (Rethehoeft)','K+S Transport GmbH',53.504691,9.954522,53.502913,9.965890,53.503436,9.965804,53.505334,9.954978,NULL,'2016-11-12 19:00:00'),(9,'Kuhwerder Hafen','','Kuhwerder Hafen Nord','Blohm + Voss',53.538590,9.952047,53.538918,9.952695,53.537264,9.957136,53.536880,9.956712,NULL,'2016-11-12 19:00:00'),(10,'Kuhwerder Hafen','','Kuhwerder Hafen Sued','Blohm + Voss',53.534792,9.962283,53.532671,9.967742,53.533220,9.968253,53.535198,9.962712,NULL,'2016-11-12 19:00:00'),(11,'Altenwerder','CTA','Altenwerder','HHLA',53.511544,9.936341,53.511614,9.938076,53.497317,9.940161,53.497675,9.937682,NULL,'2016-11-12 19:00:00'),(12,'Kraftwerk Moorburg','','Kraftwerk Moorburg','Vattenfall',53.492664,9.950708,53.492861,9.951318,53.487397,9.955656,53.487245,9.955005,NULL,'2017-07-05 15:43:59'),(13,'HaBeMa','','Reiherstieg','HaBeMa Futtermittel',53.487260,9.983480,53.487240,9.982691,53.483692,9.983173,53.483750,9.984070,NULL,'2017-09-12 12:46:57'),(14,'Hansaport','','Sandauhafen Nord','Hansaport GmbH',53.512914,9.930292,53.513262,9.929529,53.519003,9.935904,53.518659,9.936751,NULL,'2016-12-02 17:00:50'),(15,'Hansaport','','Sandauhafen Sued','Hansaport GmbH',53.514603,9.934563,53.514788,9.934133,53.512585,9.931363,53.512406,9.931816,NULL,'2017-07-05 15:52:26'),(16,'ADM','','Koehlbrand','ADM AG',53.521103,9.940994,53.521088,9.940379,53.519992,9.940451,53.519999,9.941061,NULL,'2017-07-05 15:58:41'),(17,'ADM','','Neuhoefer Pier','ADM AG',53.519992,9.940451,53.519022,9.944468,53.518362,9.944207,53.518850,9.940475,NULL,'2016-11-12 19:00:00'),(18,'ADM','','Oelmuehle','ADM AG',53.519009,9.944449,53.518409,9.944187,53.517447,9.949846,53.517878,9.950021,NULL,'2016-11-12 19:00:00'),(19,'Tollerort','CTT','Vorhafen Nord','HHLA',53.539681,9.946272,53.539955,9.947400,53.535231,9.951176,53.534978,9.949997,NULL,'2017-01-08 13:21:17'),(20,'Tollerort','CTT','Vorhafen Sued','HHLA',53.534966,9.950057,53.535255,9.951416,53.528535,9.954619,53.528369,9.953415,NULL,'2016-11-12 19:00:00'),(21,'Werfthafen','','Werfthafen Nord','Blohm + Voss',53.540629,9.951228,53.540130,9.957390,53.539525,9.957201,53.540288,9.951269,NULL,'2017-07-16 19:57:49'),(22,'Werfthafen','','Werfthafen Sued','Blohm + Voss',53.538938,9.952626,53.538428,9.956690,53.538943,9.956929,53.539463,9.952826,NULL,'2016-11-12 19:00:00'),(23,'Dock 5','','Kuhwerder Hafen','Blohm + Voss',53.537106,9.957360,53.536818,9.957062,53.535936,9.959458,53.536218,9.959767,NULL,'2016-11-12 19:00:00'),(24,'Dock 12','','Kuhwerder Hafen','Blohm + Voss',53.535848,9.959772,53.536105,9.960085,53.535360,9.962190,53.535033,9.961830,NULL,'2017-07-05 16:57:27'),(25,'Dock 11','','Elbe','Blohm + Voss',53.542266,9.953361,53.541727,9.953636,53.542528,9.958124,53.543053,9.957742,NULL,'2016-11-12 19:00:00'),(26,'Dock 10','','Elbe','Blohm + Voss',53.543136,9.958509,53.542691,9.958582,53.542941,9.962813,53.543389,9.962701,NULL,'2016-11-12 19:00:00'),(27,'Dock Elbe 17','','Elbe','Blohm + Voss',53.542941,9.964547,53.542565,9.965400,53.540387,9.961264,53.540788,9.960672,NULL,'2016-11-12 19:00:00'),(28,'Dock 16','','Werfthafen','Blohm + Voss',53.539972,9.953620,53.539643,9.953443,53.539131,9.956109,53.539433,9.956259,NULL,'2016-11-12 19:00:00'),(29,'Ueberseebruecke','','Elbe','HPA',53.543686,9.973663,53.543451,9.973407,53.541861,9.978393,53.542130,9.978643,NULL,'2016-11-12 19:00:00'),(30,'EUROGATE Container Terminal Hamburg','','Waltershofer Hafen Nordwest','Eurogate',53.534939,9.900353,53.535763,9.901452,53.529967,9.915666,53.529029,9.914551,NULL,'2016-11-25 15:00:00'),(31,'EUROGATE Container Terminal Hamburg','','Waltershofer Hafen Suedost','Eurogate',53.525312,9.927595,53.524432,9.926522,53.529250,9.914866,53.530142,9.915938,NULL,'2016-11-25 15:00:00');
/*!40000 ALTER TABLE `tmv_terminal` ENABLE KEYS */;
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

-- `tmv_type8_nmea`

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
-- Table structure for table `tmv_type8_nmea`
--

DROP TABLE IF EXISTS `tmv_type8_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_type8_nmea` (
  `id_type8_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_type8_nmea` tinyint(2) unsigned NOT NULL,
  `mmsi_type8_nmea` bigint(10) unsigned NOT NULL,
  `ev_id_type8_nmea` varchar(8) NULL,
  `dim_length_type8_nmea` decimal(4,1) unsigned NULL,
  `dim_beam_type8_nmea` decimal(3,1) unsigned NULL,
  `ship_type_type8_nmea` smallint(4) unsigned NULL,
  `dim_draught_type8_nmea` decimal(4,2) unsigned NULL,
  `haz_cargo_type8_nmea` tinyint(2) unsigned NULL,
  `load_status_type8_nmea` tinyint(2) unsigned NULL,
  `last_update_type8_nmea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_type8_nmea`)
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

-- `tmv_voyage_nmea`

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
-- Table structure for table `tmv_voyage_nmea`
--

DROP TABLE IF EXISTS `tmv_voyage_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_voyage_nmea` (
  `id_voyage_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_type_voyage_nmea` tinyint(2) unsigned NOT NULL,
  `mmsi_voyage_nmea` bigint(10) unsigned NOT NULL,
  `imo_voyage_nmea` bigint(7) unsigned NOT NULL,
  `eta_mon_voyage_nmea` tinyint(2) unsigned NULL,
  `eta_d_voyage_nmea` tinyint(2) unsigned NULL,
  `eta_h_voyage_nmea` tinyint(2) unsigned NULL,
  `eta_min_voyage_nmea` tinyint(2) unsigned NULL,
  `eta_ts_voyage_nmea` datetime NULL,
  `draught_voyage_nmea` decimal(3,1) unsigned NULL,
  `ship_cargo_type_voyage_nmea` tinyint(2) unsigned NOT NULL,
  `destination_voyage_nmea` varchar(20) COLLATE utf8_unicode_ci NULL,
  `last_update_voyage_nmea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_voyage_nmea`)
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

-- `tmv_voyage_ts_gap_nmea`

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
-- Table structure for table `tmv_voyage_ts_gap_nmea`
--

DROP TABLE IF EXISTS `tmv_voyage_ts_gap_nmea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmv_voyage_ts_gap_nmea` (
  `id_voyage_nmea` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_type_voyage_nmea` tinyint(2) unsigned NOT NULL,
  `mmsi_voyage_nmea` bigint(10) unsigned NOT NULL,
  `imo_voyage_nmea` bigint(7) unsigned NOT NULL,
  `eta_mon_voyage_nmea` tinyint(2) unsigned NULL,
  `eta_d_voyage_nmea` tinyint(2) unsigned NULL,
  `eta_h_voyage_nmea` tinyint(2) unsigned NULL,
  `eta_min_voyage_nmea` tinyint(2) unsigned NULL,
  `eta_ts_voyage_nmea` datetime NULL,
  `draught_voyage_nmea` decimal(3,1) unsigned NULL,
  `ship_cargo_type_voyage_nmea` tinyint(2) unsigned NOT NULL,
  `destination_voyage_nmea` varchar(20) COLLATE utf8_unicode_ci NULL,
  `last_update_voyage_ts_gap` datetime DEFAULT NULL,
  `last_update_voyage_nmea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_voyage_nmea`)
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
