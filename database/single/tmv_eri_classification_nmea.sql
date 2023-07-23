-- `tmv_eri_classification_nmea`;

-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Server version 10.0.38-MariaDB-0+deb8u1

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