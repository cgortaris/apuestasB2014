-- MySQL dump 10.13  Distrib 5.5.35, for Linux (x86_64)
--
-- Host: localhost    Database: apuestas
-- ------------------------------------------------------
-- Server version	5.5.35

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
-- Table structure for table `apuesta`
--

DROP TABLE IF EXISTS `apuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duelo_usuario_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `goles` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `duelo_usuario_id` (`duelo_usuario_id`),
  KEY `match_id` (`match_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `apuesta_ibfk_1` FOREIGN KEY (`duelo_usuario_id`) REFERENCES `duelo_usuario` (`id`),
  CONSTRAINT `apuesta_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `apuesta_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apuesta`
--

LOCK TABLES `apuesta` WRITE;
/*!40000 ALTER TABLE `apuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `apuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Belo Horizonte'),(2,'Brasilia'),(3,'Cuiaba'),(4,'Curitiba'),(5,'Fortaleza'),(6,'Manaus'),(7,'Natal'),(8,'Porto Alegre'),(9,'Recife'),(10,'Rio de Janeiro'),(11,'Salvador'),(12,'Sao Paulo');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duelo`
--

DROP TABLE IF EXISTS `duelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duelo`
--

LOCK TABLES `duelo` WRITE;
/*!40000 ALTER TABLE `duelo` DISABLE KEYS */;
INSERT INTO `duelo` VALUES (2,'a'),(3,'el b'),(4,'polla');
/*!40000 ALTER TABLE `duelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duelo_usuario`
--

DROP TABLE IF EXISTS `duelo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duelo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duelo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `duelo_id` (`duelo_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `duelo_usuario_ibfk_1` FOREIGN KEY (`duelo_id`) REFERENCES `duelo` (`id`),
  CONSTRAINT `duelo_usuario_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duelo_usuario`
--

LOCK TABLES `duelo_usuario` WRITE;
/*!40000 ALTER TABLE `duelo_usuario` DISABLE KEYS */;
INSERT INTO `duelo_usuario` VALUES (1,2,1),(2,3,2),(3,3,3),(4,3,4),(5,4,5),(6,4,6);
/*!40000 ALTER TABLE `duelo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_position`
--

DROP TABLE IF EXISTS `field_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_position`
--

LOCK TABLES `field_position` WRITE;
/*!40000 ALTER TABLE `field_position` DISABLE KEYS */;
INSERT INTO `field_position` VALUES (1,'Goalkeeper'),(2,'Defender'),(3,'Midfielder'),(4,'Forward'),(5,'Coach');
/*!40000 ALTER TABLE `field_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(7) NOT NULL,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `team_id1` int(11) NOT NULL,
  `team_id2` int(11) NOT NULL,
  `stadium_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id1` (`team_id1`),
  KEY `team_id2` (`team_id2`),
  KEY `stadium_id` (`stadium_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`team_id1`) REFERENCES `team` (`id`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`team_id2`) REFERENCES `team` (`id`),
  CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'BRA-CRO','2014-06-12 21:00:00',1,2,12),(2,'MEX-CMR','2014-06-13 17:00:00',3,4,7),(3,'ESP-NED','2014-06-13 20:00:00',5,6,11),(4,'CHI-AUS','2014-06-13 22:00:00',7,8,3),(5,'COL-GRE','2014-06-14 17:00:00',9,10,1),(6,'CIV-JPN','2014-06-15 02:00:00',11,12,9),(7,'URU-CRC','2014-06-14 20:00:00',13,14,5),(8,'ENG-ITA','2014-06-14 22:00:00',15,16,6),(9,'SUI-ECU','2014-06-15 17:00:00',17,18,2),(10,'FRA-HON','2014-06-15 20:00:00',19,20,8),(11,'ARG-BIH','2014-06-15 23:00:00',21,22,10),(12,'IRN-NGA','2014-06-16 20:00:00',23,24,4),(13,'GER-POR','2014-06-16 17:00:00',25,26,11),(14,'GHA-USA','2014-06-16 23:00:00',27,28,7),(15,'BEL-ALG','2014-06-17 17:00:00',29,30,1),(16,'RUS-KOR','2014-06-17 17:00:00',31,32,3),(17,'BRA-MEX','2014-06-17 20:00:00',1,3,5),(18,'CMR-CRO','2014-06-18 22:00:00',4,2,6),(19,'ESP-CHI','2014-06-18 20:00:00',5,7,10),(20,'AUS-NED','2014-06-18 17:00:00',8,6,8),(21,'COL-CIV','2014-06-19 17:00:00',9,11,2),(22,'JPN-GRE','2014-06-19 23:00:00',12,10,7),(23,'URU-ENG','2014-06-19 20:00:00',13,15,12),(24,'ITA-CRC','2014-06-20 17:00:00',16,14,9),(25,'SUI-FRA','2014-06-20 20:00:00',17,19,11),(26,'HON-ECU','2014-06-20 23:00:00',20,18,4),(27,'ARG-IRN','2014-06-21 17:00:00',21,23,1),(28,'NGA-BIH','2014-06-21 22:00:00',24,22,3),(29,'GER-GHA','2014-06-21 20:00:00',25,27,5),(30,'USA-POR','2014-06-22 22:00:00',28,26,6),(31,'BEL-RUS','2014-06-22 17:00:00',29,31,10),(32,'KOR-ALG','2014-06-22 20:00:00',32,30,8),(33,'CMR-BRA','2014-06-23 21:00:00',4,1,2),(34,'CRO-MEX','2014-06-23 21:00:00',2,3,9),(35,'AUS-ESP','2014-06-23 17:00:00',8,5,4),(36,'NED-CHI','2014-06-23 17:00:00',6,7,12),(37,'JPN-COL','2014-06-24 20:00:00',12,9,3),(38,'GRE-CIV','2014-06-24 21:00:00',10,11,5),(39,'ITA-URU','2014-06-24 17:00:00',16,13,7),(40,'CRC-ENG','2014-06-24 17:00:00',14,15,1),(41,'HON-SUI','2014-06-25 20:00:00',20,17,6),(42,'ECU-FRA','2014-06-25 21:00:00',18,19,10),(43,'NGA-ARG','2014-06-25 17:00:00',24,21,8),(44,'BIH-IRN','2014-06-25 17:00:00',22,23,11),(45,'USA-GER','2014-06-26 17:00:00',28,25,9),(46,'POR-GHA','2014-06-26 17:00:00',26,27,2),(47,'KOR-BEL','2014-06-26 21:00:00',32,29,12),(48,'ALG-RUS','2014-06-26 21:00:00',30,31,4);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `field_position_id` int(11) NOT NULL,
  `club` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `field_position_id` (`field_position_id`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`field_position_id`) REFERENCES `field_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,7,'Claudio BRAVO',1,'Real Sociedad (ESP)'),(2,7,'Eugenio MENA',2,'Santos FC (BRA)'),(3,7,'Miiko ALBORNOZ',2,'Malmo FF (SWE)'),(4,7,'Mauricio ISLA',2,'Juventus FC (ITA)'),(5,7,'Francisco SILVA',3,'CA Osasuna (ESP)'),(6,7,'Carlos CARMONA',3,'Atalanta Bergamo (ITA)'),(7,7,'Alexis SANCHEZ',4,'FC Barcelona (ESP)'),(8,7,'Arturo VIDAL',3,'Juventus FC (ITA)'),(9,7,'Mauricio PINILLA',4,'Cagliari Calcio (ITA)'),(10,7,'Jorge VALDIVIA',3,'Palmeiras (BRA)'),(11,7,'Eduardo VARGAS',4,'Valencia CF (ESP)'),(12,7,'Cristopher TOSELLI',1,'CD Universidad Catolica (CHI)'),(13,7,'Jose ROJAS',2,'Club Universidad de Chile (CHI)'),(14,7,'Fabian ORELLANA',4,'Celta Vigo (ESP)'),(15,7,'Jean BEAUSEJOUR',3,'Wigan Athletic FC (ENG)'),(16,7,'Felipe GUTIERREZ',3,'FC Twente (NED)'),(17,7,'Gary MEDEL',2,'Cardiff City FC (WAL)'),(18,7,'Gonzalo JARA',2,'Nottingham Forest FC (ENG)'),(19,7,'Jose FUENZALIDA',3,'CSD Colo-Colo (CHI)'),(20,7,'Charles ARANGUIZ',3,'SC Internacional (BRA)'),(21,7,'Marcelo DIAZ',3,'FC Basel (SUI)'),(22,7,'Esteban PAREDES',4,'CSD Colo-Colo (CHI)'),(23,7,'Johnny HERRERA',1,'Club Universidad de Chile (CHI)'),(24,3,'Jose CORONA',1,'Cruz Azul FC (MEX)'),(25,3,'Francisco RODRIGUEZ',2,'Club America (MEX)'),(26,3,'Carlos SALCIDO',2,'Tigres UANL (MEX)'),(27,3,'Rafael MARQUEZ',2,'Club Leon (MEX)'),(28,3,'Diego REYES',2,'FC Porto (POR)'),(29,3,'Hector HERRERA',3,'FC Porto (POR)'),(30,3,'Miguel LAYUN',2,'Club America (MEX)'),(31,3,'Marco FABIAN',3,'Cruz Azul FC (MEX)'),(32,3,'Raul JIMENEZ',4,'Club America (MEX)'),(33,3,'Giovani DOS SANTOS',4,'Villarreal CF (ESP)'),(34,3,'Alan PULIDO',4,'Tigres UANL (MEX)'),(35,3,'Alfredo TALAVERA',1,'Deportivo Toluca FC (MEX)'),(36,3,'Guillermo OCHOA',1,'AC Ajaccio (FRA)'),(37,3,'Javier HERNANDEZ',4,'Manchester United FC (ENG)'),(38,3,'Hector MORENO',2,'RCD Espanyol (ESP)'),(39,3,'Miguel PONCE',2,'Deportivo Toluca FC (MEX)'),(40,3,'Isaac BRIZUELA',3,'Deportivo Toluca FC (MEX)'),(41,3,'Andres GUARDADO',2,'Bayer 04 Leverkusen (GER)'),(42,3,'Oribe PERALTA',4,'Club Santos Laguna (MEX)'),(43,3,'Javier AQUINO',3,'Villarreal CF (ESP)'),(44,3,'Carlos PENA',3,'Club Leon (MEX)'),(45,3,'Paul AGUILAR',2,'Club America (MEX)'),(46,3,'Jose VAZQUEZ',3,'Club Leon (MEX)'),(47,20,'Luis LOPEZ',1,'Real Espana (HON)'),(48,20,'Osman CHAVEZ',2,'Qingdao Jonoon FC (CHN)'),(49,20,'Maynor FIGUEROA',2,'Hull City FC (ENG)'),(50,20,'Juan MONTES',2,'CD Motagua (HON)'),(51,20,'Victor BERNARDEZ',2,'San Jose Earthquakes (USA)'),(52,20,'Juan Carlos GARCIA',2,'Wigan Athletic FC (ENG)'),(53,20,'Emilio IZAGUIRRE',3,'Celtic FC (SCO)'),(54,20,'Wilson PALACIOS',3,'Stoke City FC (ENG)'),(55,20,'Jerry PALACIOS',3,'LD Alajuelense (CRC)'),(56,20,'Marvin CHAVEZ',3,'CD Chivas USA (USA)'),(57,20,'Jerry BENGTSON',4,'New England Revolution (USA)'),(58,20,'Edder DELGADO',3,'Real Espana (HON)'),(59,20,'Carlo COSTLY',4,'Real Espana (HON)'),(60,20,'Boniek GARCIA',3,'Houston Dynamo (USA)'),(61,20,'Roger ESPINOZA',3,'Wigan Athletic FC (ENG)'),(62,20,'Rony MARTINEZ',4,'CD Real Sociedad (HON)'),(63,20,'Andy NAJAR',3,'RSC Anderlecht (BEL)'),(64,20,'Noel VALLADARES',1,'CD Olimpia (HON)'),(65,20,'Luis GARRIDO',3,'CD Olimpia (HON)'),(66,20,'Jorge CLAROS',3,'CD Motagua (HON)'),(67,20,'Brayan BECKELES',2,'CD Olimpia (HON)'),(68,20,'Donis ESCOBER',1,'CD Olimpia (HON)'),(69,20,'Mario MARTINEZ',3,'Real Espana (HON)'),(70,14,'Keylor NAVAS',1,'Levante UD (ESP)'),(71,14,'Johnny ACOSTA',2,'LD Alajuelense (CRC)'),(72,14,'Giancarlo GONZALEZ',2,'Columbus Crew (USA)'),(73,14,'Michael UMANA',2,'Deportivo Saprissa (CRC)'),(74,14,'Celso BORGES',3,'AIK Solna (SWE)'),(75,14,'Oscar DUARTE',2,'Club Brugge KV (BEL)'),(76,14,'Christian BOLANOS',3,'FC Kobenhavn (DEN)'),(77,14,'Heiner MORA',2,'Deportivo Saprissa (CRC)'),(78,14,'Joel CAMPBELL',4,'Olympiacos Piraeus FC (GRE)'),(79,14,'Bryan RUIZ',4,'PSV Eindhoven (NED)'),(80,14,'Michael BARRANTES',3,'Aalesunds FK (NOR)'),(81,14,'Waylon FRANCIS',2,'Columbus Crew (USA)'),(82,14,'Oscar GRANADOS',3,'CS Herediano (CRC)'),(83,14,'Randall BRENES',4,'CSD Cartagines (CRC)'),(84,14,'Junior DIAZ',2,'FSV Mainz 05 (GER)'),(85,14,'Cristian GAMBOA',2,'Rosenborg BK (NOR)'),(86,14,'Yeltsin TEJEDA',3,'Deportivo Saprissa (CRC)'),(87,14,'Patrick PEMBERTON',1,'LD Alajuelense (CRC)'),(88,14,'Roy MILLER',2,'New York Red Bulls (USA)'),(89,14,'Diego CALVO',3,'Valerenga IF (NOR)'),(90,14,'Marcos URENA',4,'Kuban Krasnodar (RUS)'),(91,14,'Jose CUBERO',3,'CS Herediano (CRC)'),(92,14,'Daniel CAMBRONERO',1,'CS Herediano (CRC)'),(93,18,'Maximo BANGUERA',1,'Barcelona SC (ECU)'),(94,18,'Jorge GUAGUA',2,'CS Emelec (ECU)'),(95,18,'Frickson ERAZO',2,'CR Flamengo (BRA)'),(96,18,'Juan PAREDES',2,'Barcelona SC (ECU)'),(97,18,'Alex IBARRA',3,'Vitesse Arnheim (NED)'),(98,18,'Cristhian NOBOA',3,'FC Dynamo Moscow (RUS)'),(99,18,'Jefferson MONTERO',3,'CA Monarcas Morelia (MEX)'),(100,18,'Edison MENDEZ',3,'Independiente Santa Fe (COL)'),(101,18,'Joao ROJAS',4,'Cruz Azul FC (MEX)'),(102,18,'Walter AYOVI',3,'CF Pachuca (MEX)'),(103,18,'Felipe CAICEDO',4,'Al Jazira SCC (UAE)'),(104,18,'Adrian BONE',1,'CD El Nacional (ECU)'),(105,18,'Enner VALENCIA',4,'CF Pachuca (MEX)'),(106,18,'Segundo CASTILLO',3,'Al Hilal FC (KSA)'),(107,18,'Michael ARROYO',3,'Atlante FC (MEX)'),(108,18,'Antonio VALENCIA',3,'Manchester United FC (ENG)'),(109,18,'Jaimen AYOVI',4,'Club Tijuana (MEX)'),(110,18,'Oscar BAGUI',2,'CS Emelec (ECU)'),(111,18,'Luis SARITAMA',3,'Barcelona SC (ECU)'),(112,18,'Fidel MARTINEZ',3,'Club Tijuana (MEX)'),(113,18,'Gabriel ACHILIER',2,'CS Emelec (ECU)'),(114,18,'Alexander DOMINGUEZ',1,'LDU Quito (ECU)'),(115,18,'Carlos GRUEZO',3,'VfB Stuttgart (GER)'),(116,1,'JEFFERSON',1,'Botafogo FR (BRA)'),(117,1,'DANI ALVES',2,'FC Barcelona (ESP)'),(118,1,'THIAGO SILVA',2,'Paris Saint-Germain FC (FRA)'),(119,1,'DAVID LUIZ',2,'Chelsea FC (ENG)'),(120,1,'FERNANDINHO',3,'Manchester City FC (ENG)'),(121,1,'MARCELO',2,'Real Madrid CF (ESP)'),(122,1,'HULK',4,'FC Zenit St. Petersburg (RUS)'),(123,1,'PAULINHO',3,'Tottenham Hotspur FC (ENG)'),(124,1,'FRED',4,'Fluminense FC (BRA)'),(125,1,'NEYMAR',4,'FC Barcelona (ESP)'),(126,1,'OSCAR',3,'Chelsea FC (ENG)'),(127,1,'JULIO CESAR',1,'Toronto FC (CAN)'),(128,1,'DANTE',2,'FC Bayern Muenchen (GER)'),(129,1,'MAXWELL',2,'Paris Saint-Germain FC (FRA)'),(130,1,'HENRIQUE',2,'SSC Napoli (ITA)'),(131,1,'RAMIRES',3,'Chelsea FC (ENG)'),(132,1,'LUIZ GUSTAVO',3,'VfL Wolfsburg (GER)'),(133,1,'HERNANES',3,'FC Internazionale (ITA)'),(134,1,'WILLIAN',3,'Chelsea FC (ENG)'),(135,1,'BERNARD',4,'Shakhtar Donetsk (UKR)'),(136,1,'JO',4,'Atletico Mineiro (BRA)'),(137,1,'VICTOR',1,'Atletico Mineiro (BRA)'),(138,1,'MAICON',2,'AS Roma (ITA)'),(139,21,'Sergio ROMERO',1,'AS Monaco (FRA)'),(140,21,'Ezequiel GARAY',2,'SL Benfica (POR)'),(141,21,'Hugo CAMPAGNARO',2,'FC Internazionale (ITA)'),(142,21,'Pablo ZABALETA',2,'Manchester City FC (ENG)'),(143,21,'Fernando GAGO',3,'CA Boca Juniors (ARG)'),(144,21,'Lucas BIGLIA',3,'SS Lazio (ITA)'),(145,21,'Angel DI MARIA',3,'Real Madrid CF (ESP)'),(146,21,'Enzo PEREZ',3,'SL Benfica (POR)'),(147,21,'Gonzalo HIGUAIN',4,'SSC Napoli (ITA)'),(148,21,'Lionel MESSI',4,'FC Barcelona (ESP)'),(149,21,'Maxi RODRIGUEZ',3,'CA Newells Old Boys (ARG)'),(150,21,'Agustin ORION',1,'CA Boca Juniors (ARG)'),(151,21,'Augusto FERNANDEZ',3,'Celta Vigo (ESP)'),(152,21,'Javier MASCHERANO',3,'FC Barcelona (ESP)'),(153,21,'Martin DEMICHELIS',2,'Manchester City FC (ENG)'),(154,21,'Marcos ROJO',2,'Sporting CP (POR)'),(155,21,'Federico FERNANDEZ',2,'SSC Napoli (ITA)'),(156,21,'Rodrigo PALACIO',4,'FC Internazionale (ITA)'),(157,21,'Ricardo ALVAREZ',3,'FC Internazionale (ITA)'),(158,21,'Sergio AGUERO',4,'Manchester City FC (ENG)'),(159,21,'Mariano ANDUJAR',1,'Calcio Catania (ITA)'),(160,21,'Ezequiel LAVEZZI',4,'Paris Saint-Germain FC (FRA)'),(161,21,'Jose Maria BASANTA',2,'CF Monterrey (MEX)'),(162,15,'Joe HART',1,'Manchester City FC (ENG)'),(163,15,'Glen JOHNSON',2,'Liverpool FC (ENG)'),(164,15,'Leighton BAINES',2,'Everton FC (ENG)'),(165,15,'Steven GERRARD',3,'Liverpool FC (ENG)'),(166,15,'Gary CAHILL',2,'Chelsea FC (ENG)'),(167,15,'Phil JAGIELKA',2,'Everton FC (ENG)'),(168,15,'Jack WILSHERE',3,'Arsenal FC (ENG)'),(169,15,'Frank LAMPARD',3,'Chelsea FC (ENG)'),(170,15,'Daniel STURRIDGE',4,'Liverpool FC (ENG)'),(171,15,'Wayne ROONEY',4,'Manchester United FC (ENG)'),(172,15,'Danny WELBECK',4,'Manchester United FC (ENG)'),(173,15,'Chris SMALLING',2,'Manchester United FC (ENG)'),(174,15,'Ben FOSTER',1,'West Bromwich Albion FC (ENG)'),(175,15,'Jordan HENDERSON',3,'Liverpool FC (ENG)'),(176,15,'Alex OXLADE CHAMBERLAIN',3,'Arsenal FC (ENG)'),(177,15,'Phil JONES',2,'Manchester United FC (ENG)'),(178,15,'James MILNER',3,'Manchester City FC (ENG)'),(179,15,'Rickie LAMBERT',4,'Southampton FC (ENG)'),(180,15,'Raheem STERLING',3,'Liverpool FC (ENG)'),(181,15,'Adam LALLANA',3,'Southampton FC (ENG)'),(182,15,'Ross BARKLEY',3,'Everton FC (ENG)'),(183,15,'Fraser FORSTER',1,'Celtic FC (SCO)'),(184,15,'Luke SHAW',2,'Southampton FC (ENG)'),(185,29,'Thibaut COURTOIS',1,'Atletico Madrid (ESP)'),(186,29,'Toby ALDERWEIRELD',2,'Atletico Madrid (ESP)'),(187,29,'Thomas VERMAELEN',2,'Arsenal FC (ENG)'),(188,29,'Vincent KOMPANY',2,'Manchester City FC (ENG)'),(189,29,'Jan VERTONGHEN',2,'Tottenham Hotspur FC (ENG)'),(190,29,'Axel WITSEL',3,'FC Zenit St. Petersburg (RUS)'),(191,29,'Kevin DE BRUYNE',3,'VfL Wolfsburg (GER)'),(192,29,'Marouane FELLAINI',3,'Manchester United FC (ENG)'),(193,29,'Romelu LUKAKU',4,'Everton FC (ENG)'),(194,29,'Eden HAZARD',3,'Chelsea FC (ENG)'),(195,29,'Kevin MIRALLAS',4,'Everton FC (ENG)'),(196,29,'Simon MIGNOLET',1,'Liverpool FC (ENG)'),(197,29,'Sammy BOSSUT',1,'SV Zulte Waregem (BEL)'),(198,29,'Dries MERTENS',3,'SSC Napoli (ITA)'),(199,29,'Daniel VAN BUYTEN',2,'FC Bayern Muenchen (GER)'),(200,29,'Steven DEFOUR',3,'FC Porto (POR)'),(201,29,'Divock ORIGI',4,'Lille OSC (FRA)'),(202,29,'Nicolas LOMBAERTS',2,'FC Zenit St. Petersburg (RUS)'),(203,29,'Moussa DEMBELE',3,'Tottenham Hotspur FC (ENG)'),(204,29,'Adnan JANUZAJ',3,'Manchester United FC (ENG)'),(205,29,'Anthony VANDEN BORRE',2,'RSC Anderlecht (BEL)'),(206,29,'Nacer CHADLI',3,'Tottenham Hotspur FC (ENG)'),(207,29,'Laurent CIMAN',2,'Standard Liege (BEL)'),(208,25,'Manuel NEUER',1,'FC Bayern Muenchen (GER)'),(209,25,'Kevin GROSSKREUTZ',2,'Borussia Dortmund (GER)'),(210,25,'Matthias GINTER',2,'SC Freiburg (GER)'),(211,25,'Benedikt HOEWEDES',2,'FC Schalke 04 (GER)'),(212,25,'Mats HUMMELS',2,'Borussia Dortmund (GER)'),(213,25,'Sami KHEDIRA',3,'Real Madrid CF (ESP)'),(214,25,'Bastian SCHWEINSTEIGER',3,'FC Bayern Muenchen (GER)'),(215,25,'Mesut OEZIL',3,'Arsenal FC (ENG)'),(216,25,'Andre SCHUERRLE',4,'Chelsea FC (ENG)'),(217,25,'Lukas PODOLSKI',4,'Arsenal FC (ENG)'),(218,25,'Miroslav KLOSE',4,'SS Lazio (ITA)'),(219,25,'Ron-Robert ZIELER',1,'Hannover 96 (GER)'),(220,25,'Thomas MUELLER',4,'FC Bayern Muenchen (GER)'),(221,25,'Julian DRAXLER',3,'FC Schalke 04 (GER)'),(222,25,'Erik DURM',2,'Borussia Dortmund (GER)'),(223,25,'Philipp LAHM',3,'FC Bayern Muenchen (GER)'),(224,25,'Per MERTESACKER',2,'Arsenal FC (ENG)'),(225,25,'Toni KROOS',3,'FC Bayern Muenchen (GER)'),(226,25,'Mario GOETZE',4,'FC Bayern Muenchen (GER)'),(227,25,'Jerome BOATENG',2,'FC Bayern Muenchen (GER)'),(228,25,'Marco REUS',4,'Borussia Dortmund (GER)'),(229,25,'Roman WEIDENFELLER',1,'Borussia Dortmund (GER)'),(230,25,'Christoph KRAMER',3,'Borussia Moenchengladbach (GER)'),(231,19,'Hugo LLORIS',1,'Tottenham Hotspur FC (ENG)'),(232,19,'Mathieu DEBUCHY',2,'Newcastle United FC (ENG)'),(233,19,'Patrice EVRA',2,'Manchester United FC (ENG)'),(234,19,'Raphael VARANE',2,'Real Madrid CF (ESP)'),(235,19,'Mamadou SAKHO',2,'Liverpool FC (ENG)'),(236,19,'Yohan CABAYE',3,'Paris Saint-Germain FC (FRA)'),(237,19,'Franck RIBERY',4,'FC Bayern Muenchen (GER)'),(238,19,'Mathieu VALBUENA',3,'Olympique Marseille (FRA)'),(239,19,'Olivier GIROUD',4,'Arsenal FC (ENG)'),(240,19,'Karim BENZEMA',4,'Real Madrid CF (ESP)'),(241,19,'Antoine GRIEZMANN',4,'Real Sociedad (ESP)'),(242,19,'Rio MAVUBA',3,'Lille OSC (FRA)'),(243,19,'Eliaquim MANGALA',2,'FC Porto (POR)'),(244,19,'Blaise MATUIDI',3,'Paris Saint-Germain FC (FRA)'),(245,19,'Bacary SAGNA',2,'Arsenal FC (ENG)'),(246,19,'Stephane RUFFIER',1,'AS Saint-Etienne (FRA)'),(247,19,'Lucas DIGNE',2,'Paris Saint-Germain FC (FRA)'),(248,19,'Moussa SISSOKO',3,'Newcastle United FC (ENG)'),(249,19,'Paul POGBA',3,'Juventus FC (ITA)'),(250,19,'Loic REMY',4,'Newcastle United FC (ENG)'),(251,19,'Laurent KOSCIELNY',2,'Arsenal FC (ENG)'),(252,19,'Clement GRENIER',3,'Olympique Lyonnais (FRA)'),(253,19,'Mickael LANDREAU',1,'SC Bastia (FRA)'),(254,17,'Diego BENAGLIO',1,'VfL Wolfsburg (GER)'),(255,17,'Stephan LICHTSTEINER',2,'Juventus FC (ITA)'),(256,17,'Reto ZIEGLER',2,'US Sassuolo (ITA)'),(257,17,'Philippe SENDEROS',2,'Valencia CF (ESP)'),(258,17,'Steve VON BERGEN',2,'BSC Young Boys (SUI)'),(259,17,'Michael LANG',2,'Grasshopper Club (SUI)'),(260,17,'Tranquillo BARNETTA',3,'Eintracht Frankfurt (GER)'),(261,17,'Gokhan INLER',3,'SSC Napoli (ITA)'),(262,17,'Haris SEFEROVIC',4,'Real Sociedad (ESP)'),(263,17,'Granit XHAKA',3,'Borussia Moenchengladbach (GER)'),(264,17,'Valon BEHRAMI',3,'SSC Napoli (ITA)'),(265,17,'Yann SOMMER',1,'FC Basel (SUI)'),(266,17,'Ricardo RODRIGUEZ',2,'VfL Wolfsburg (GER)'),(267,17,'Valentin STOCKER',3,'FC Basel (SUI)'),(268,17,'Blerim DZEMAILI',3,'SSC Napoli (ITA)'),(269,17,'Gelson FERNANDES',3,'SC Freiburg (GER)'),(270,17,'Mario GAVRANOVIC',4,'FC Zuerich (SUI)'),(271,17,'Admir MEHMEDI',4,'SC Freiburg (GER)'),(272,17,'Josip DRMIC',4,'1. FC Nuernberg (GER)'),(273,17,'Johan DJOUROU',2,'Hamburger SV (GER)'),(274,17,'Roman BUERKI',1,'Grasshopper Club (SUI)'),(275,17,'Fabian SCHAER',2,'FC Basel (SUI)'),(276,17,'Xherdan SHAQIRI',3,'FC Bayern Muenchen (GER)'),(277,2,'Stipe PLETIKOSA',1,'FC Rostov (RUS)'),(278,2,'Sime VRSALJKO',2,'Genoa CFC (ITA)'),(279,2,'Danijel PRANJIC',2,'Panathinaikos FC (GRE)'),(280,2,'Ivan PERISIC',3,'VfL Wolfsburg (GER)'),(281,2,'Vedran CORLUKA',2,'FC Lokomotiv Moscow (RUS)'),(282,2,'Dejan LOVREN',2,'Southampton FC (ENG)'),(283,2,'Ivan RAKITIC',3,'Sevilla FC (ESP)'),(284,2,'Ognjen VUKOJEVIC',3,'FC Dynamo Kyiv (UKR)'),(285,2,'Nikica JELAVIC',4,'Hull City FC (ENG)'),(286,2,'Luka MODRIC',3,'Real Madrid CF (ESP)'),(287,2,'Darijo SRNA',2,'Shakhtar Donetsk (UKR)'),(288,2,'Oliver ZELENIKA',1,'NK Lokomotiva Zagreb (CRO)'),(289,2,'Gordon SCHILDENFELD',2,'Panathinaikos FC (GRE)'),(290,2,'Marcelo BROZOVIC',3,'GNK Dinamo Zagreb (CRO)'),(291,2,'Ivan MOCINIC',3,'HNK Rijeka (CRO)'),(292,2,'Ante REBIC',4,'ACF Fiorentina (ITA)'),(293,2,'Mario MANDZUKIC',4,'FC Bayern Muenchen (GER)'),(294,2,'Ivica OLIC',4,'VfL Wolfsburg (GER)'),(295,2,'SAMMIR',3,'Getafe CF (ESP)'),(296,2,'Mateo KOVACIC',3,'FC Internazionale (ITA)'),(297,2,'Domagoj VIDA',2,'FC Dynamo Kyiv (UKR)'),(298,2,'EDUARDO',4,'Shakhtar Donetsk (UKR)'),(299,2,'Danijel SUBASIC',1,'AS Monaco (FRA)'),(300,22,'Asmir BEGOVIC',1,'Stoke City FC (ENG)'),(301,22,'Avdija VRSAJEVIC',3,'HNK Hajduk Split (CRO)'),(302,22,'Ermin BICAKCIC',2,'Eintracht Braunschweig (GER)'),(303,22,'Emir SPAHIC',2,'Bayer 04 Leverkusen (GER)'),(304,22,'Sead KOLASINAC',2,'FC Schalke 04 (GER)'),(305,22,'Ognjen VRANJES',2,'Elazigspor (TUR)'),(306,22,'Muhamed BESIC',3,'Ferencvarosi TC (HUN)'),(307,22,'Miralem PJANIC',3,'AS Roma (ITA)'),(308,22,'Vedad IBISEVIC',4,'VfB Stuttgart (GER)'),(309,22,'Zvjezdan MISIMOVIC',3,'Guizhou Renhe FC (CHN)'),(310,22,'Edin DZEKO',4,'Manchester City FC (ENG)'),(311,22,'Jasmin FEJZIC',1,'VfR Aalen (GER)'),(312,22,'Mensur MUJDZA',3,'SC Freiburg (GER)'),(313,22,'Tino Sven SUSIC',3,'HNK Hajduk Split (CRO)'),(314,22,'Toni SUNJIC',2,'FC Zorya Lugansk (UKR)'),(315,22,'Senad LULIC',3,'SS Lazio (ITA)'),(316,22,'Senijad IBRICIC',3,'Kayseri Erciyesspor (TUR)'),(317,22,'Haris MEDUNJANIN',3,'Gaziantepspor (TUR)'),(318,22,'Edin VISCA',4,'Istanbul BBSK (TUR)'),(319,22,'Izet HAJROVIC',3,'Galatasaray SK (TUR)'),(320,22,'Anel HADZIC',3,'SK Sturm Graz (AUT)'),(321,22,'Asmir AVDUKIC',1,'FK Borac Banja Luka (BIH)'),(322,22,'Sejad SALIHOVIC',3,'TSG 1899 Hoffenheim (GER)'),(323,16,'Gianluigi BUFFON',1,'Juventus FC (ITA)'),(324,16,'Mattia DE SCIGLIO',2,'AC Milan (ITA)'),(325,16,'Giorgio CHIELLINI',2,'Juventus FC (ITA)'),(326,16,'Matteo DARMIAN',2,'Torino FC (ITA)'),(327,16,'THIAGO MOTTA',3,'Paris Saint-Germain FC (FRA)'),(328,16,'Antonio CANDREVA',3,'SS Lazio (ITA)'),(329,16,'Ignazio ABATE',2,'AC Milan (ITA)'),(330,16,'Claudio MARCHISIO',3,'Juventus FC (ITA)'),(331,16,'Mario BALOTELLI',4,'AC Milan (ITA)'),(332,16,'Antonio CASSANO',4,'Parma FC (ITA)'),(333,16,'Alessio CERCI',4,'Torino FC (ITA)'),(334,16,'Salvatore SIRIGU',1,'Paris Saint-Germain FC (FRA)'),(335,16,'Mattia PERIN',1,'Genoa CFC (ITA)'),(336,16,'Alberto AQUILANI',3,'ACF Fiorentina (ITA)'),(337,16,'Andrea BARZAGLI',2,'Juventus FC (ITA)'),(338,16,'Daniele DE ROSSI',3,'AS Roma (ITA)'),(339,16,'Ciro IMMOBILE',4,'Torino FC (ITA)'),(340,16,'Marco PAROLO',3,'Parma FC (ITA)'),(341,16,'Leonardo BONUCCI',2,'Juventus FC (ITA)'),(342,16,'Gabriel PALETTA',2,'Parma FC (ITA)'),(343,16,'Andrea PIRLO',3,'Juventus FC (ITA)'),(344,16,'Lorenzo INSIGNE',4,'SSC Napoli (ITA)'),(345,16,'Marco VERRATTI',3,'Paris Saint-Germain FC (FRA)'),(346,5,'Iker CASILLAS',1,'Real Madrid CF (ESP)'),(347,5,'Raul ALBIOL',2,'SSC Napoli (ITA)'),(348,5,'Gerard PIQUE',2,'FC Barcelona (ESP)'),(349,5,'Javi MARTINEZ',3,'FC Bayern Muenchen (GER)'),(350,5,'JUANFRAN',2,'Atletico Madrid (ESP)'),(351,5,'Andres INIESTA',3,'FC Barcelona (ESP)'),(352,5,'David VILLA',4,'Atletico Madrid (ESP)'),(353,5,'Xavi HERNANDEZ',3,'FC Barcelona (ESP)'),(354,5,'Fernando TORRES',4,'Chelsea FC (ENG)'),(355,5,'Cesc FABREGAS',3,'FC Barcelona (ESP)'),(356,5,'Pedro RODRIGUEZ',4,'FC Barcelona (ESP)'),(357,5,'David DE GEA',1,'Manchester United FC (ENG)'),(358,5,'Juan MATA',4,'Manchester United FC (ENG)'),(359,5,'Xabi ALONSO',3,'Real Madrid CF (ESP)'),(360,5,'Sergio RAMOS',2,'Real Madrid CF (ESP)'),(361,5,'Sergio BUSQUETS',3,'FC Barcelona (ESP)'),(362,5,'KOKE',3,'Atletico Madrid (ESP)'),(363,5,'Jordi ALBA',2,'FC Barcelona (ESP)'),(364,5,'Diego COSTA',4,'Atletico Madrid (ESP)'),(365,5,'Santi CAZORLA',3,'Arsenal FC (ENG)'),(366,5,'David SILVA',3,'Manchester City FC (ENG)'),(367,5,'Cesar AZPILICUETA',3,'Chelsea FC (ENG)'),(368,5,'Pepe REINA',1,'SSC Napoli (ITA)'),(369,26,'EDUARDO',1,'Sporting Braga (POR)'),(370,26,'BRUNO ALVES',2,'Fenerbahce SK (TUR)'),(371,26,'PEPE',2,'Real Madrid CF (ESP)'),(372,26,'MIGUEL VELOSO',3,'FC Dynamo Kyiv (UKR)'),(373,26,'FABIO COENTRAO',2,'Real Madrid CF (ESP)'),(374,26,'WILLIAM',3,'Sporting CP (POR)'),(375,26,'CRISTIANO RONALDO',4,'Real Madrid CF (ESP)'),(376,26,'JOAO MOUTINHO',3,'AS Monaco (FRA)'),(377,26,'HUGO ALMEIDA',4,'Besiktas JK (TUR)'),(378,26,'VIEIRINHA',4,'VfL Wolfsburg (GER)'),(379,26,'EDER',4,'Sporting Braga (POR)'),(380,26,'RUI PATRICIO',1,'Sporting CP (POR)'),(381,26,'RICARDO COSTA',2,'Valencia CF (ESP)'),(382,26,'LUIS NETO',2,'FC Zenit St. Petersburg (RUS)'),(383,26,'RAFA',4,'Sporting Braga (POR)'),(384,26,'RAUL MEIRELES',3,'Fenerbahce SK (TUR)'),(385,26,'NANI',4,'Manchester United FC (ENG)'),(386,26,'VARELA',4,'FC Porto (POR)'),(387,26,'ANDRE ALMEIDA',2,'SL Benfica (POR)'),(388,26,'RUBEN AMORIM',3,'SL Benfica (POR)'),(389,26,'JOAO PEREIRA',2,'Valencia CF (ESP)'),(390,26,'BETO',1,'Sevilla FC (ESP)'),(391,26,'HELDER POSTIGA',4,'SS Lazio (ITA)'),(392,26,'PAULO BENTO',5,'(POR)'),(393,10,'Orestis KARNEZIS',1,'Granada CF (ESP)'),(394,10,'Ioannis MANIATIS',3,'Olympiacos Piraeus FC (GRE)'),(395,10,'Georgios TZAVELAS',2,'PAOK FC (GRE)'),(396,10,'Konstantinos MANOLAS',2,'Olympiacos Piraeus FC (GRE)'),(397,10,'Vangelis MORAS',2,'Hellas Verona FC (ITA)'),(398,10,'Alexandros TZIOLIS',3,'Kayserispor (TUR)'),(399,10,'Georgios SAMARAS',4,'Celtic FC (SCO)'),(400,10,'Panagiotis KONE',3,'Bologna FC (ITA)'),(401,10,'Konstantinos MITROGLOU',4,'Fulham FC (ENG)'),(402,10,'Georgios KARAGOUNIS',3,'Fulham FC (ENG)'),(403,10,'Loukas VYNTRA',2,'Levante UD (ESP)'),(404,10,'Panagiotis GLYKOS',1,'PAOK FC (GRE)'),(405,10,'Stefanos KAPINO',1,'Panathinaikos FC (GRE)'),(406,10,'Dimitrios SALPINGIDIS',4,'PAOK FC (GRE)'),(407,10,'Vasileios TOROSIDIS',2,'AS Roma (ITA)'),(408,10,'Lazaros CHRISTODOULOPOULOS',3,'Bologna FC (ITA)'),(409,10,'Theofanis GEKAS',4,'Konyaspor (TUR)'),(410,10,'Ioannis FETFATZIDIS',4,'Genoa CFC (ITA)'),(411,10,'Sokratis PAPASTATHOPOULOS',2,'Borussia Dortmund (GER)'),(412,10,'Jose CHOLEVAS',2,'Olympiacos Piraeus FC (GRE)'),(413,10,'Konstantinos KATSOURANIS',3,'PAOK FC (GRE)'),(414,10,'Andreas SAMARIS',3,'Olympiacos Piraeus FC (GRE)'),(415,10,'Panagiotis TACHTSIDIS',3,'Torino FC (ITA)'),(416,30,'Cedric SI MOHAMMED',1,'CS Constantine (ALG)'),(417,30,'Madjid BOUGUERRA',2,'Lekhwiya SC (QAT)'),(418,30,'Faouzi GHOULAM',2,'SSC Napoli (ITA)'),(419,30,'Esseid BELKALEM',2,'Watford FC (ENG)'),(420,30,'Rafik HALLICHE',2,'Academica Coimbra (POR)'),(421,30,'Djamel MESBAH',2,'AS Livorno (ITA)'),(422,30,'Hassan YEBDA',3,'Udinese Calcio (ITA)'),(423,30,'Medhi LACEN',3,'Getafe CF (ESP)'),(424,30,'Nabil GHILAS',4,'FC Porto (POR)'),(425,30,'Sofiane FEGHOULI',4,'Valencia CF (ESP)'),(426,30,'Yacine BRAHIMI',3,'Granada CF (ESP)'),(427,30,'Carl MEDJANI',2,'Valenciennes FC (FRA)'),(428,30,'Islam SLIMANI',4,'Sporting CP (POR)'),(429,30,'Nabil BENTALEB',3,'Tottenham Hotspur FC (ENG)'),(430,30,'El Arabi SOUDANI',4,'GNK Dinamo Zagreb (CRO)'),(431,30,'Mohamed ZEMMAMOUCHE',1,'USM Alger (ALG)'),(432,30,'Liassine CADAMURO',2,'RCD Mallorca (ESP)'),(433,30,'Abdelmoumene DJABOU',4,'Club Africain (TUN)'),(434,30,'Saphir TAIDER',3,'FC Internazionale (ITA)'),(435,30,'Aissa MANDI',2,'Stade de Reims (FRA)'),(436,30,'Riyad MAHREZ',4,'Leicester City FC (ENG)'),(437,30,'Mehdi MOSTEFA',3,'AC Ajaccio (FRA)'),(438,30,'Rais MBOLHI',1,'CSKA Sofia (BUL)'),(439,23,'Rahman AHMADI',1,'Sepahan FC (IRN)'),(440,23,'Khosro HEYDARI',4,'Esteghlal Tehran FC (IRN)'),(441,23,'Ehsan HAJI SAFI',3,'Sepahan FC (IRN)'),(442,23,'Jalal HOSSEINI',2,'Perspolis FC (IRN)'),(443,23,'Amirhossein SADEGHI',2,'Esteghlal Tehran FC (IRN)'),(444,23,'Javad NEKOUNAM',3,'Kuwait SC (KUW)'),(445,23,'Masoud SHOJAEI',4,'UD Las Palmas (ESP)'),(446,23,'Reza HAGHIGHI',3,'Perspolis FC (IRN)'),(447,23,'Alireza JAHAN BAKHSH',4,'NEC Nijmegen (NED)'),(448,23,'Karim ANSARI FARD',4,'Tractor Sazi Tabriz FC (IRN)'),(449,23,'Ghasem HADADIFAR',3,'Zob Ahan Isfahan FC (IRN)'),(450,23,'Alireza HAGHIGHI',1,'Sporting Covilha (POR)'),(451,23,'Hossein MAHINI',2,'Perspolis FC (IRN)'),(452,23,'Andranik TIMOTIAN',3,'Esteghlal Tehran FC (IRN)'),(453,23,'Pejman MONTAZERI',2,'Umm Salal SC (QAT)'),(454,23,'Reza GHOOCHANNEJAD',4,'Charlton Athletic FC (ENG)'),(455,23,'Ahmad ALNAMEH',2,'Naft Tehran FC (IRN)'),(456,23,'Bakhtiar RAHMANI',3,'Foolad Khuzestan FC (IRN)'),(457,23,'Hashem BEIKZADEH',3,'Esteghlal Tehran FC (IRN)'),(458,23,'Steven BEITASHOUR',2,'Vancouver Whitecaps FC (CAN)'),(459,23,'Ashkan DEJAGAH',4,'Fulham FC (ENG)'),(460,23,'Daniel DAVARI',1,'Eintracht Braunschweig (GER)'),(461,23,'Mehrdad POOLADI',2,'Perspolis FC (IRN)'),(462,27,'Stephen ADAMS',1,'Aduana Stars (GHA)'),(463,27,'Samuel INKOOM',2,'FC Platanias (GRE)'),(464,27,'Asamoah GYAN',4,'Al Ain FC (UAE)'),(465,27,'Daniel OPARE',2,'Standard Liege (BEL)'),(466,27,'Michael ESSIEN',3,'AC Milan (ITA)'),(467,27,'Acquah AFRIYIE',3,'Parma FC (ITA)'),(468,27,'Christian ATSU',3,'Vitesse Arnheim (NED)'),(469,27,'Emmanuel AGYEMANG BADU',3,'Udinese Calcio (ITA)'),(470,27,'Kevin Prince BOATENG',4,'FC Schalke 04 (GER)'),(471,27,'Andre AYEW',3,'Olympique Marseille (FRA)'),(472,27,'Sulley MUNTARI',3,'AC Milan (ITA)'),(473,27,'Adam KWARASEY',1,'Stromsgodset IF (NOR)'),(474,27,'Jordan AYEW',4,'FC Sochaux-MontbÃ©liard (FRA)'),(475,27,'Albert ADOMAH',3,'Middlesbrough FC (ENG)'),(476,27,'Rashid SUMAILA',2,'Mamelodi Sundowns FC (RSA)'),(477,27,'Fatawu DAUDA',1,'Orlando Pirates (RSA)'),(478,27,'Mohammed RABIU',3,'Kuban Krasnodar (RUS)'),(479,27,'Majeed WARIS',4,'Valenciennes FC (FRA)'),(480,27,'Jonathan MENSAH',2,'Evian TG FC (FRA)'),(481,27,'Kwadwo ASAMOAH',3,'Juventus FC (ITA)'),(482,27,'John BOYE',2,'Stade Rennais FC (FRA)'),(483,27,'Mubarak WAKASO',3,'FC Rubin Kazan (RUS)'),(484,27,'Harrison AFFUL',2,'Esperance Sportive de Tunis (TUN)'),(485,24,'Vincent ENYEAMA',1,'Lille OSC (FRA)'),(486,24,'Joseph YOBO',2,'Norwich City FC (ENG)'),(487,24,'Uwa ECHIEJILE',2,'AS Monaco (FRA)'),(488,24,'Ruben GABRIEL',3,'KV Waasland-Beveren (BEL)'),(489,24,'Efe AMBROSE',2,'Celtic FC (SCO)'),(490,24,'Azubuike EGWUEKWE',2,'Warri Wolves FC (NGA)'),(491,24,'Ahmed MUSA',4,'CSKA Moscow (RUS)'),(492,10,'Fernando SANTOS',5,'(POR)'),(493,24,'Peter ODEMWINGIE',4,'Stoke City FC (ENG)'),(494,24,'Emmanuel EMENIKE',4,'Fenerbahce SK (TUR)'),(495,24,'John Obi MIKEL',3,'Chelsea FC (ENG)'),(496,24,'Victor MOSES',4,'Liverpool FC (ENG)'),(497,24,'Ebenezer ODUNLAMI',2,'Sunshine Stars FC (NGA)'),(498,24,'Juwon OSHANIWA',2,'FC Ashdod (ISR)'),(499,24,'Godfrey OBOABONA',2,'Caykur Rizespor (TUR)'),(500,24,'Ramon AZEEZ',3,'UD Almeria (ESP)'),(501,24,'Austine EJIDE',1,'Hapoel Be\'er Sheva FC (ISR)'),(502,24,'Ogenyi ONAZI',3,'SS Lazio (ITA)'),(503,24,'Michael BABATUNDE',4,'FC Volyn Lutsk (UKR)'),(504,24,'Uche NWOFOR',4,'SC Heerenveen (NED)'),(505,24,'Okechukwu UCHEBO',4,'Cercle Brugge (BEL)'),(506,24,'Chigozie AGBIM',1,'Enugu Rangers FC (NGA)'),(507,24,'Kenneth OMERUO',2,'Middlesbrough FC (ENG)'),(508,24,'Shola AMEOBI',4,'Newcastle United FC (ENG)'),(509,4,'Loic FEUDJOU',1,'Coton Sport FC (CMR)'),(510,4,'Benoit ASSOU EKOTTO',2,'Queens Park Rangers FC (ENG)'),(511,4,'Nicolas NKOULOU',2,'Olympique Marseille (FRA)'),(512,4,'Cedric DJEUGOUE',2,'Coton Sport FC (CMR)'),(513,4,'Dany NOUNKEU',2,'Besiktas JK (TUR)'),(514,4,'Alexandre SONG',3,'FC Barcelona (ESP)'),(515,4,'Landry NGUEMO',3,'FC Girondins Bordeaux (FRA)'),(516,4,'Benjamin MOUKANDJO',4,'AS Nancy (FRA)'),(517,4,'Samuel ETOO',4,'Chelsea FC (ENG)'),(518,4,'Vincent ABOUBAKAR',4,'FC Lorient (FRA)'),(519,4,'Jean MAKOUN',3,'Stade Rennais FC (FRA)'),(520,4,'Henri BEDIMO',2,'Olympique Lyonnais (FRA)'),(521,4,'Eric CHOUPO MOTING',4,'FSV Mainz 05 (GER)'),(522,4,'Aurelien CHEDJOU',2,'Galatasaray SK (TUR)'),(523,4,'Pierre WEBO',4,'Fenerbahce SK (TUR)'),(524,4,'Charles ITANDJE',1,'Konyaspor (TUR)'),(525,4,'Stephane MBIA',3,'Sevilla FC (ESP)'),(526,4,'Enoh EYONG',3,'Antalyaspor AS (TUR)'),(527,4,'Fabrice OLINGA',4,'SV Zulte Waregem (BEL)'),(528,4,'Edgar SALLI',3,'RC Lens (FRA)'),(529,4,'Joel MATIP',3,'FC Schalke 04 (GER)'),(530,4,'Allan NYOM',2,'Granada CF (ESP)'),(531,4,'Sammy NDJOCK',1,'Fethiyespor (TUR)'),(532,12,'Eiji KAWASHIMA',1,'Standard Liege (BEL)'),(533,12,'Atsuto UCHIDA',2,'FC Schalke 04 (GER)'),(534,12,'Gotoku SAKAI',2,'VfB Stuttgart (GER)'),(535,12,'Keisuke HONDA',4,'AC Milan (ITA)'),(536,12,'Yuto NAGATOMO',2,'FC Internazionale (ITA)'),(537,12,'Masato MORISHIGE',2,'FC Tokyo (JPN)'),(538,12,'Yasuhito ENDO',3,'Gamba Osaka (JPN)'),(539,12,'Hiroshi KIYOTAKE',4,'1. FC Nuernberg (GER)'),(540,12,'Shinji OKAZAKI',4,'FSV Mainz 05 (GER)'),(541,12,'Shinji KAGAWA',4,'Manchester United FC (ENG)'),(542,12,'Yoichiro KAKITANI',4,'Cerezo Osaka (JPN)'),(543,12,'Shusaku NISHIKAWA',1,'Urawa Red Diamonds (JPN)'),(544,12,'Yoshito OKUBO',4,'Kawasaki Frontale (JPN)'),(545,12,'Toshihiro AOYAMA',3,'Sanfrecce Hiroshima (JPN)'),(546,12,'Yasuyuki KONNO',2,'Gamba Osaka (JPN)'),(547,12,'Hotaru YAMAGUCHI',3,'Cerezo Osaka (JPN)'),(548,12,'Makoto HASEBE',3,'1. FC Nuernberg (GER)'),(549,12,'Yuya OSAKO',4,'TSV 1860 Muenchen (GER)'),(550,12,'Masahiko INOHA',2,'Jubilo Iwata (JPN)'),(551,12,'Manabu SAITO',4,'Yokohama F-Marinos (JPN)'),(552,12,'Hiroki SAKAI',2,'Hannover 96 (GER)'),(553,12,'Maya YOSHIDA',2,'Southampton FC (ENG)'),(554,12,'Shuichi GONDA',1,'FC Tokyo (JPN)'),(555,32,'JUNG Sungryong',1,'Suwon Bluewings FC (KOR)'),(556,32,'KIM Changsoo',2,'Kashiwa Reysol (JPN)'),(557,32,'YUN Sukyoung',2,'Queens Park Rangers FC (ENG)'),(558,32,'KWAK Taehwi',2,'Al Hilal FC (KSA)'),(559,32,'KIM Younggwon',2,'Guangzhou Evergrande FC (CHN)'),(560,32,'HWANG Seokho',2,'Sanfrecce Hiroshima (JPN)'),(561,32,'KIM Bokyung',3,'Cardiff City FC (WAL)'),(562,32,'HA Daesung',3,'Beijing Guoan (CHN)'),(563,32,'SON Heungmin',3,'Bayer 04 Leverkusen (GER)'),(564,32,'PARK Chuyoung',4,'Watford FC (ENG)'),(565,32,'LEE Keunho',4,'Sangju Sangmu FC (KOR)'),(566,32,'LEE Yong',2,'Ulsan Hyundai FC (KOR)'),(567,32,'KOO Jacheol',4,'FSV Mainz 05 (GER)'),(568,32,'HAN Kookyoung',3,'Kashiwa Reysol (JPN)'),(569,32,'PARK Jongwoo',3,'Guangzhou R&F FC (CHN)'),(570,32,'KI Sungyueng',3,'Sunderland AFC (ENG)'),(571,32,'LEE Chungyong',3,'Bolton Wanderers FC (ENG)'),(572,32,'KIM Shinwook',4,'Ulsan Hyundai FC (KOR)'),(573,32,'JI Dongwon',3,'FC Augsburg (GER)'),(574,32,'HONG Jeongho',2,'FC Augsburg (GER)'),(575,32,'KIM Seunggyu',1,'Ulsan Hyundai FC (KOR)'),(576,32,'PARK Jooho',2,'FSV Mainz 05 (GER)'),(577,32,'LEE Bumyoung',1,'Busan IPark FC (KOR)'),(578,31,'Igor AKINFEEV',1,'CSKA Moscow (RUS)'),(579,31,'Aleksei KOZLOV',2,'FC Dynamo Moscow (RUS)'),(580,31,'Georgy SHCHENNIKOV',2,'CSKA Moscow (RUS)'),(581,31,'Sergey IGNASHEVICH',2,'CSKA Moscow (RUS)'),(582,31,'Andrey SEMENOV',2,'FC Terek Grozny (RUS)'),(583,31,'Maksim KANUNNIKOV',4,'FK Amkar Perm (RUS)'),(584,31,'Igor DENISOV',3,'FC Dynamo Moscow (RUS)'),(585,31,'Denis GLUSHAKOV',3,'FC Spartak Moscow (RUS)'),(586,31,'Alexander KOKORIN',4,'FC Dynamo Moscow (RUS)'),(587,31,'Alan DZAGOEV',3,'CSKA Moscow (RUS)'),(588,31,'Aleksandr KERZHAKOV',4,'FC Zenit St. Petersburg (RUS)'),(589,31,'Yury LODYGIN',1,'FC Zenit St. Petersburg (RUS)'),(590,31,'Vladimir GRANAT',2,'FC Dynamo Moscow (RUS)'),(591,31,'Vasily BEREZUTSKIY',2,'CSKA Moscow (RUS)'),(592,31,'Roman SHIROKOV',3,'FC Krasnodar (RUS)'),(593,31,'Sergey RYZHIKOV',1,'FC Rubin Kazan (RUS)'),(594,31,'Oleg SHATOV',3,'FC Zenit St. Petersburg (RUS)'),(595,31,'Yury ZHIRKOV',4,'FC Dynamo Moscow (RUS)'),(596,31,'Alexander SAMEDOV',4,'FC Lokomotiv Moscow (RUS)'),(597,31,'Victor FAYZULIN',3,'FC Zenit St. Petersburg (RUS)'),(598,31,'Alexey IONOV',4,'FC Dynamo Moscow (RUS)'),(599,31,'Andrey ESHCHENKO',2,'FC Anzhi Makhachkala (RUS)'),(600,31,'Dmitry KOMBAROV',2,'FC Spartak Moscow (RUS)'),(601,28,'Tim HOWARD',1,'Everton FC (ENG)'),(602,28,'DeAndre YEDLIN',2,'Seattle Sounders FC (USA)'),(603,28,'Omar GONZALEZ',2,'Los Angeles Galaxy (USA)'),(604,28,'Michael BRADLEY',3,'Toronto FC (CAN)'),(605,28,'Matt BESLER',2,'Sporting Kansas City (USA)'),(606,28,'John BROOKS',2,'Hertha BSC (GER)'),(607,28,'DaMarcus BEASLEY',2,'Puebla FC (MEX)'),(608,28,'Clint DEMPSEY',4,'Seattle Sounders FC (USA)'),(609,28,'Aron JOHANNSSON',4,'AZ Alkmaar (NED)'),(610,28,'Mix DISKERUD',3,'Rosenborg BK (NOR)'),(611,28,'Alejandro BEDOYA',3,'FC Nantes (FRA)'),(612,28,'Brad GUZAN',1,'Aston Villa FC (ENG)'),(613,28,'Jermaine JONES',3,'Besiktas JK (TUR)'),(614,28,'Brad DAVIS',3,'Houston Dynamo (USA)'),(615,28,'Kyle BECKERMAN',3,'Real Salt Lake (USA)'),(616,28,'Julian GREEN',3,'FC Bayern Muenchen (GER)'),(617,28,'Jozy ALTIDORE',4,'Sunderland AFC (ENG)'),(618,28,'Chris WONDOLOWSKI',4,'San Jose Earthquakes (USA)'),(619,28,'Graham ZUSI',3,'Sporting Kansas City (USA)'),(620,28,'Geoff CAMERON',2,'Stoke City FC (ENG)'),(621,28,'Timmy CHANDLER',2,'1. FC Nuernberg (GER)'),(622,28,'Nick RIMANDO',1,'Real Salt Lake (USA)'),(623,28,'Fabian JOHNSON',2,'TSG 1899 Hoffenheim (GER)'),(624,9,'David OSPINA',1,'OGC Nice (FRA)'),(625,9,'Cristian ZAPATA',2,'AC Milan (ITA)'),(626,9,'Mario YEPES',2,'Atalanta Bergamo (ITA)'),(627,9,'Santiago ARIAS',2,'PSV Eindhoven (NED)'),(628,9,'Aldo RAMIREZ',3,'CA Monarcas Morelia (MEX)'),(629,9,'Carlos SANCHEZ',3,'Elche CF (ESP)'),(630,9,'Pablo ARMERO',2,'West Ham United FC (ENG)'),(631,9,'Abel AGUILAR',3,'Toulouse FC (FRA)'),(632,9,'Teofilo GUTIERREZ',4,'CA River Plate (ARG)'),(633,9,'James RODRIGUEZ',3,'AS Monaco (FRA)'),(634,9,'Juan CUADRADO',3,'ACF Fiorentina (ITA)'),(635,9,'Camilo VARGAS',1,'Independiente Santa Fe (COL)'),(636,9,'Fredy GUARIN',3,'FC Internazionale (ITA)'),(637,9,'Victor IBARBO',4,'Cagliari Calcio (ITA)'),(638,9,'Alexander MEJIA',3,'Atletico Nacional (COL)'),(639,9,'Eder BALANTA',2,'CA River Plate (ARG)'),(640,9,'Carlos BACCA',4,'Sevilla FC (ESP)'),(641,9,'Juan ZUNIGA',2,'SSC Napoli (ITA)'),(642,9,'Adrian RAMOS',4,'Hertha BSC (GER)'),(643,9,'Juan QUINTERO',3,'FC Porto (POR)'),(644,9,'Jackson MARTINEZ',4,'FC Porto (POR)'),(645,9,'Faryd MONDRAGON',1,'Deportivo Cali (COL)'),(646,9,'Carlos VALDES',2,'CA San Lorenzo de Almagro (ARG)'),(647,13,'Fernando MUSLERA',1,'Galatasaray SK (TUR)'),(648,13,'Diego LUGANO',2,'West Bromwich Albion FC (ENG)'),(649,13,'Diego GODIN',2,'Atletico Madrid (ESP)'),(650,13,'Jorge FUCILE',2,'FC Porto (POR)'),(651,13,'Walter GARGANO',3,'Parma FC (ITA)'),(652,13,'Alvaro PEREIRA',3,'Sao Paulo FC (BRA)'),(653,13,'Cristian RODRIGUEZ',3,'Atletico Madrid (ESP)'),(654,13,'Abel HERNANDEZ',4,'US Citta di Palermo (ITA)'),(655,13,'Luis SUAREZ',4,'Liverpool FC (ENG)'),(656,13,'Diego FORLAN',4,'Cerezo Osaka (JPN)'),(657,13,'Cristhian STUANI',4,'RCD Espanyol (ESP)'),(658,13,'Rodrigo MUNOZ',1,'Club Libertad (PAR)'),(659,13,'Jose GIMENEZ',2,'Atletico Madrid (ESP)'),(660,13,'Nicolas LODEIRO',3,'Botafogo FR (BRA)'),(661,13,'Diego PEREZ',3,'Bologna FC (ITA)'),(662,13,'Maximiliano PEREIRA',2,'SL Benfica (POR)'),(663,13,'Egidio AREVALO',3,'CA Monarcas Morelia (MEX)'),(664,13,'Gaston RAMIREZ',3,'Southampton FC (ENG)'),(665,13,'Sebastian COATES',2,'Club Nacional de Football (URU)'),(666,13,'Alvaro GONZALEZ',3,'SS Lazio (ITA)'),(667,13,'Edinson CAVANI',4,'Paris Saint-Germain FC (FRA)'),(668,13,'Martin CACERES',2,'Juventus FC (ITA)'),(669,13,'Martin SILVA',1,'CR Vasco da Gama (BRA)'),(670,6,'Jasper CILLESSEN',1,'AFC Ajax (NED)'),(671,6,'Ron VLAAR',2,'Aston Villa FC (ENG)'),(672,6,'Stefan DE VRIJ',2,'Feyenoord Rotterdam (NED)'),(673,6,'Bruno MARTINS INDI',2,'Feyenoord Rotterdam (NED)'),(674,6,'Daley BLIND',2,'AFC Ajax (NED)'),(675,6,'Nigel DE JONG',3,'AC Milan (ITA)'),(676,6,'Daryl JANMAAT',2,'Feyenoord Rotterdam (NED)'),(677,6,'Jonathan DE GUZMAN',3,'Swansea City AFC (WAL)'),(678,6,'Robin VAN PERSIE',4,'Manchester United FC (ENG)'),(679,6,'Wesley SNEIJDER',3,'Galatasaray SK (TUR)'),(680,6,'Arjen ROBBEN',4,'FC Bayern Muenchen (GER)'),(681,6,'Paul VERHAEGH',2,'FC Augsburg (GER)'),(682,6,'Joel VELTMAN',2,'AFC Ajax (NED)'),(683,6,'Terence KONGOLO',2,'Feyenoord Rotterdam (NED)'),(684,6,'Dirk KUYT',4,'Fenerbahce SK (TUR)'),(685,6,'Jordy CLASIE',3,'Feyenoord Rotterdam (NED)'),(686,6,'Jeremain LENS',4,'FC Dynamo Kyiv (UKR)'),(687,6,'Leroy FER',3,'Norwich City FC (ENG)'),(688,6,'Klaas Jan HUNTELAAR',4,'FC Schalke 04 (GER)'),(689,6,'Georginio WIJNALDUM',3,'PSV Eindhoven (NED)'),(690,6,'Memphis DEPAY',4,'PSV Eindhoven (NED)'),(691,6,'Michel VORM',1,'Swansea City AFC (WAL)'),(692,6,'Tim KRUL',1,'Newcastle United FC (ENG)'),(693,11,'Boubacar BARRY',1,'KSC Lokeren (BEL)'),(694,11,'Ousmane DIARRASSOUBA',2,'Caykur Rizespor (TUR)'),(695,11,'Arthur BOKA',2,'VfB Stuttgart (GER)'),(696,11,'Kolo TOURE',2,'Liverpool FC (ENG)'),(697,11,'Didier ZOKORA',2,'Trabzonspor (TUR)'),(698,11,'Mathis BOLLY',3,'Fortuna Duesseldorf (GER)'),(699,11,'Jean Daniel AKPA',2,'Toulouse FC (FRA)'),(700,11,'Salomon KALOU',4,'Lille OSC (FRA)'),(701,11,'Ismael TIOTE',3,'Newcastle United FC (ENG)'),(702,11,'GERVINHO',4,'AS Roma (ITA)'),(703,11,'Didier DROGBA',4,'Galatasaray SK (TUR)'),(704,11,'Wilfried BONY',4,'Swansea City AFC (WAL)'),(705,11,'Konan YA',3,'Hannover 96 (GER)'),(706,11,'Ismael DIOMANDE',3,'AS Saint-Etienne (FRA)'),(707,11,'Max GRADEL',3,'AS Saint-Etienne (FRA)'),(708,11,'Sylvain GBOHOUO',1,'Sewe Sport (CIV)'),(709,11,'Serge AURIER',2,'Toulouse FC (FRA)'),(710,11,'Constant DJAKPA',2,'Eintracht Frankfurt (GER)'),(711,11,'Yaya TOURE',3,'Manchester City FC (ENG)'),(712,11,'Die SEREY',3,'FC Basel (SUI)'),(713,11,'Giovanni SIO',4,'FC Basel (SUI)'),(714,11,'Souleymane BAMBA',2,'Trabzonspor (TUR)'),(715,11,'Sayouba MANDE',1,'Stabaek IF (NOR)'),(716,8,'Maty RYAN',1,'Club Brugge KV (BEL)'),(717,8,'Ivan FRANJIC',2,'Brisbane Roar FC (AUS)'),(718,8,'Jason DAVIDSON',2,'SC Heracles Almelo (NED)'),(719,8,'Tim CAHILL',4,'New York Red Bulls (USA)'),(720,8,'Mark MILLIGAN',3,'Melbourne Victory FC (AUS)'),(721,8,'Matthew SPIRANOVIC',2,'Western Sydney Wanderers FC (AUS)'),(722,8,'Mathew LECKIE',4,'FSV Frankfurt (GER)'),(723,8,'Bailey WRIGHT',2,'Preston North End FC (ENG)'),(724,8,'Adam TAGGART',4,'Newcastle United Jets FC (AUS)'),(725,8,'Ben HALLORAN',4,'Fortuna Duesseldorf (GER)'),(726,8,'Tommy OAR',3,'FC Utrecht (NED)'),(727,8,'Mitch LANGERAK',1,'Borussia Dortmund (GER)'),(728,8,'Oliver BOZANIC',3,'FC Luzern (SUI)'),(729,8,'James TROISI',3,'Melbourne Victory FC (AUS)'),(730,8,'Mile JEDINAK',3,'Crystal Palace FC (ENG)'),(731,8,'James HOLLAND',3,'FK Austria Wien (AUT)'),(732,8,'Matt McKAY',3,'Brisbane Roar FC (AUS)'),(733,8,'Eugen GALEKOVIC',1,'Adelaide United FC (AUS)'),(734,8,'Ryan McGOWAN',2,'Shandong Luneng Taishan FC (CHN)'),(735,8,'Dario VIDOSIC',3,'FC Sion (SUI)'),(736,8,'Massimo LUONGO',3,'Swindon Town FC (ENG)'),(737,8,'Alex WILKINSON',2,'Jeonbuk Hyundai Motors FC (KOR)'),(738,8,'Mark BRESCIANO',3,'Al Gharafa SC (QAT)'),(739,7,'Jorge SAMPAOLI',5,'(ARG)'),(740,3,'Miguel HERRERA',5,'(MEX)'),(741,20,'Luis SUAREZ',5,'(COL)'),(742,14,'Jorge Luis PINTO',5,'(COL)'),(743,18,'Reinaldo RUEDA',5,'(COL)'),(744,1,'Luiz Felipe SCOLARI',5,'(BRA)'),(745,21,'Alejandro SABELLA',5,'(ARG)'),(746,15,'Roy HODGSON',5,'(ENG)'),(747,29,'Marc WILMOTS',5,'(BEL)'),(748,25,'Joachim LOEW',5,'(GER)'),(749,19,'Didier DESCHAMPS',5,'(FRA)'),(750,17,'Ottmar HITZFELD',5,'(GER)'),(751,2,'Niko KOVAC',5,'(CRO)'),(752,22,'Safet SUSIC',5,'(BIH)'),(753,16,'Cesare PRANDELLI',5,'(ITA)'),(754,5,'Vicente DEL BOSQUE',5,'(ESP)'),(755,30,'Vahid HALILHODZIC',5,'(BIH)'),(756,23,'Carlos QUEIROZ',5,'(POR)'),(757,27,'Akwasi APPIAH',5,'(GHA)'),(758,24,'Stephen KESHI',5,'(NGA)'),(759,4,'Volker FINKE',5,'(GER)'),(760,12,'Alberto ZACCHERONI',5,'(ITA)'),(761,32,'Myungbo HONG',5,'(KOR)'),(762,31,'Fabio CAPELLO',5,'(ITA)'),(763,28,'Juergen KLINSMANN',5,'(GER)'),(764,9,'Jose PEKERMAN',5,'(ARG)'),(765,13,'Oscar TABAREZ',5,'(URU)'),(766,6,'Louis VAN GAAL',5,'(NED)'),(767,11,'Sabri LAMOUCHI',5,'(FRA)'),(768,8,'Ange POSTECOGLOU',5,'(AUS)');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `stadium_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES (1,'Estadio Mineirao',1),(2,'Estadio Nacional',2),(3,'Arena Pantanal',3),(4,'Arena da Baixada',4),(5,'Estadio Castelao',5),(6,'Arena Amazonia',6),(7,'Estadio das Dunas',7),(8,'Estadio Beira-Rio',8),(9,'Arena Pernambuco',9),(10,'Estadio do Maracana',10),(11,'Arena Fonte Nova',11),(12,'Arena de Sao Paulo',12);
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` char(3) NOT NULL,
  `team_group_id` int(11) NOT NULL,
  `name_es` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `team_group_id` (`team_group_id`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`team_group_id`) REFERENCES `team_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Brazil','BRA',1,'Brasil'),(2,'Croatia','CRO',1,'Croacia'),(3,'Mexico','MEX',1,'Mexico'),(4,'Cameroon','CMR',1,'Camerun'),(5,'Spain','ESP',2,'Espana'),(6,'Netherlands','NED',2,'Holanda'),(7,'Chile','CHI',2,'Chile'),(8,'Australia','AUS',2,'Australia'),(9,'Colombia','COL',3,'Colombia'),(10,'Greece','GRE',3,'Grecia'),(11,'Côte d\'Ivoire','CIV',3,'Costa De Marfil'),(12,'Japan','JPN',3,'Japon'),(13,'Uruguay','URU',4,'Uruguay'),(14,'Costa Rica','CRC',4,'Costa Rica'),(15,'England','ENG',4,'Inglaterra'),(16,'Italy','ITA',4,'Italia'),(17,'Switzerland','SUI',5,'Suiza'),(18,'Ecuador','ECU',5,'Ecuador'),(19,'France','FRA',5,'Francia'),(20,'Honduras','HON',5,'Honduras'),(21,'Argentina','ARG',6,'Argentina'),(22,'Bosnia-Herzegovina','BIH',6,'Bosnia-Herzegovina'),(23,'Iran','IRN',6,'Iran'),(24,'Nigeria','NGA',6,'Nigeria'),(25,'Germany','GER',7,'Alemania'),(26,'Portugal','POR',7,'Portugal'),(27,'Ghana','GHA',7,'Ghana'),(28,'USA','USA',7,'Estados Unidos'),(29,'Belgium','BEL',8,'Belgica'),(30,'Algeria','ALG',8,'Algeria'),(31,'Russia','RUS',8,'Rusia'),(32,'Korea Republic','KOR',8,'Republica de Korea');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_group`
--

DROP TABLE IF EXISTS `team_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_group`
--

LOCK TABLES `team_group` WRITE;
/*!40000 ALTER TABLE `team_group` DISABLE KEYS */;
INSERT INTO `team_group` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F'),(7,'G'),(8,'H');
/*!40000 ALTER TABLE `team_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(500) DEFAULT NULL,
  `akey` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `akey` (`akey`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'a@b.cl','f2edf1fa590a9cc83c2dad1f2598ace0'),(2,'a@b.co','ce8dc5f90aa1c8d861cc3bde67311f31'),(3,'carlosgortaris@imek.cl','65d91aee8abae2c7fbf10fa3c3c77658'),(4,'carlos@buenavistacapital.com','2a69e9fd936f9cf6189dd5cd9db43f3f'),(5,'a@b.ci','1b14e0416c330d718db6ef25bf8e245b'),(6,'a@dkjfdf.sl','be5644e567c0dd4f05bb43567cd09fab');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-12  8:20:48
