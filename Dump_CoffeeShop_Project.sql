-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: paousmandb.cm5nvnysb5xs.us-east-1.rds.amazonaws.com    Database: ShurisCoffeeShop
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `Advertisement`
--

DROP TABLE IF EXISTS `Advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Advertisement` (
  `AdvertisementID` int(11) NOT NULL AUTO_INCREMENT,
  `AdvertisementDate` date DEFAULT NULL,
  `CoffeeShopID` int(11) NOT NULL,
  `AdvertisementAmount` int(11) DEFAULT NULL,
  `AdvertiserDescriptionID` int(11) NOT NULL,
  `AdvertisementTypeID` int(11) NOT NULL,
  PRIMARY KEY (`AdvertisementID`,`CoffeeShopID`),
  KEY `fk_Advertisement_CoffeeShop1_idx` (`CoffeeShopID`),
  KEY `fk_Advertisement_AdvertisersDescription1_idx` (`AdvertiserDescriptionID`),
  KEY `fk_Advertisement_AdvertisementType1_idx` (`AdvertisementTypeID`),
  CONSTRAINT `fk_Advertisement_AdvertisementType1` FOREIGN KEY (`AdvertisementTypeID`) REFERENCES `AdvertisementType` (`AdvertisementTypeID`),
  CONSTRAINT `fk_Advertisement_AdvertisersDescription1` FOREIGN KEY (`AdvertiserDescriptionID`) REFERENCES `AdvertisersDescription` (`AdvertiserDescriptionID`),
  CONSTRAINT `fk_Advertisement_CoffeeShop1` FOREIGN KEY (`CoffeeShopID`) REFERENCES `CoffeeShop` (`CoffeeShopID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advertisement`
--

LOCK TABLES `Advertisement` WRITE;
/*!40000 ALTER TABLE `Advertisement` DISABLE KEYS */;
INSERT INTO `Advertisement` VALUES (1,'2019-02-17',5910,466,1,1),(2,'2019-09-09',5910,946,2,2),(3,'2019-08-08',5910,136,1,1),(4,'2019-02-19',5910,239,1,1),(5,'2019-05-06',5910,140,4,4),(6,'2019-10-13',5910,767,1,1),(7,'2019-04-26',5910,819,1,1),(8,'2019-12-11',5910,867,3,3),(9,'2019-08-02',5910,252,1,1),(10,'2019-02-14',5910,360,1,1),(11,'2019-02-11',5910,387,3,3),(12,'2019-01-07',5910,761,2,2),(13,'2019-01-06',5910,823,2,2),(14,'2019-05-27',5910,237,2,2),(15,'2019-04-18',5910,475,1,1),(16,'2020-02-07',5910,927,3,3),(17,'2019-05-10',5910,287,2,2),(18,'2019-04-21',5910,502,4,4),(19,'2019-08-06',5910,595,3,3),(20,'2019-03-01',5910,654,4,4);
/*!40000 ALTER TABLE `Advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvertisementType`
--

DROP TABLE IF EXISTS `AdvertisementType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdvertisementType` (
  `AdvertisementTypeID` int(11) NOT NULL,
  `AdvertisementTypeDescription` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`AdvertisementTypeID`),
  UNIQUE KEY `AdvertisementTypeID_UNIQUE` (`AdvertisementTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvertisementType`
--

LOCK TABLES `AdvertisementType` WRITE;
/*!40000 ALTER TABLE `AdvertisementType` DISABLE KEYS */;
INSERT INTO `AdvertisementType` VALUES (1,'Newspaper'),(2,'TV'),(3,'Social Media'),(4,'Radio');
/*!40000 ALTER TABLE `AdvertisementType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvertisersDescription`
--

DROP TABLE IF EXISTS `AdvertisersDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdvertisersDescription` (
  `AdvertiserDescriptionID` int(11) NOT NULL,
  `AdvertiserDescription` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`AdvertiserDescriptionID`),
  UNIQUE KEY `AdvertiserID_UNIQUE` (`AdvertiserDescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvertisersDescription`
--

LOCK TABLES `AdvertisersDescription` WRITE;
/*!40000 ALTER TABLE `AdvertisersDescription` DISABLE KEYS */;
INSERT INTO `AdvertisersDescription` VALUES (1,'Seattle Times'),(2,'King 5'),(3,'Facebook Ads'),(4,'KXSU');
/*!40000 ALTER TABLE `AdvertisersDescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoffeeShop`
--

DROP TABLE IF EXISTS `CoffeeShop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CoffeeShop` (
  `CoffeeShopID` int(11) NOT NULL AUTO_INCREMENT,
  `CoffeeShopName` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CoffeeShopCity` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CoffeeShopZip` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `CoffeeShopPhoneNumber` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CoffeeShopID`)
) ENGINE=InnoDB AUTO_INCREMENT=5911 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoffeeShop`
--

LOCK TABLES `CoffeeShop` WRITE;
/*!40000 ALTER TABLE `CoffeeShop` DISABLE KEYS */;
INSERT INTO `CoffeeShop` VALUES (5910,'Shuri\'s','Seattle','98122','210-762-6845');
/*!40000 ALTER TABLE `CoffeeShop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerFName` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CustomerLName` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CustomerEmailAddress` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CustomerPhoneNumber` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=97174 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (14677,'Valera','Label','vlabeld@i2i.jp','(773) 9547764'),(30800,'Valencia','Bogays','vbogayse@furl.net','(961) 1894191'),(34297,'Corly','Mounsie','cmounsieb@amazon.co.jp','(764) 8443606'),(34814,'Gypsy','Buckner','gbuckner0@sitemeter.com','(771) 3463009'),(39649,'Anett','Beesley','abeesley1@twitpic.com','(708) 4099585'),(39683,'Virgina','Dudgeon','vdudgeon5@aboutads.info','(894) 6121509'),(42835,'Ree','Patullo','rpatullo4@g.co','(635) 8361606'),(45511,'Mel','Marcu','mmarcuc@github.io','(982) 3871176'),(47965,'Brady','Mallabar','bmallabar2@unc.edu','(383) 9924509'),(48016,'Stanly','Cartan','scartan6@tripod.com','(547) 2421544'),(56887,'Mahmud','Delacroix','mdelacroixa@chron.com','(480) 4274948'),(60037,'Vergil','Gherardesci','vgherardescif@amazon.co.uk','(207) 6543910'),(61402,'Lyssa','Clayworth','lclayworthi@theglobeandmail.com','(355) 3181846'),(69554,'Effie','Croxton','ecroxton9@linkedin.com','(825) 1828102'),(71324,'Rustin','Jesper','rjesperj@twitter.com','(888) 9561902'),(71429,'Van','Lovejoy','vlovejoy3@sohu.com','(721) 7031753'),(85869,'Garrot','Ohm','gohm8@t-online.de','(944) 3001893'),(90550,'Kara-lynn','Blaszczynski','kblaszczynskih@senate.gov','(382) 6763862'),(96034,'Bank','Peppin','bpeppin7@seattletimes.com','(313) 9698461'),(97173,'Bary','Lewson','blewsong@ebay.co.uk','(108) 6323006');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeePosition` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `EmployeeWage` decimal(5,2) DEFAULT NULL,
  `EmployeeFName` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `EmployeeLName` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `EmployeePhoneNumber` int(11) DEFAULT NULL,
  `EmployeeZip` int(11) DEFAULT NULL,
  `EmployeeEmail` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CoffeeShopID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`CoffeeShopID`),
  KEY `fk_Employee_CoffeeShop1_idx` (`CoffeeShopID`),
  CONSTRAINT `fk_Employee_CoffeeShop1` FOREIGN KEY (`CoffeeShopID`) REFERENCES `CoffeeShop` (`CoffeeShopID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70778 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (10034,'Barista',17.75,'Tom','Gorman',2064053334,98107,'TGCoffee@gmail.com',5910),(10235,'Store Manager',51.25,'John','Brown',2061992303,98101,'Jb@gmail.com',5910),(10998,'Barista',16.25,'Greg ','Valentine',2068789989,98194,'GregV@msn.com',5910),(11123,'Accountant',40.55,'Omid','Kordestani',2068889866,98131,'OmidK@yahoo.com',5910),(12001,'Barista',17.75,'Victoria','Chang',2065409991,98111,'vict@gmail.com',5910),(12311,'Barista',16.25,'Alenxander','Wong',2060908812,98199,'Wong@yahoo.com',5910),(19403,'Barista',20.25,'Bill','Gates',2063340012,98154,'msbill@msn.com',5910),(20345,'Barista',17.75,'James','Franco',2063113123,98144,'franco@gmail.com',5910),(70777,'Barista',17.75,'Salma','Aratsu',2067709077,98122,'salove@gmail.com',5910);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemType` int(11) DEFAULT NULL COMMENT 'ItemType Values:\n1. Kitchen appliances\n2. Coffee appliances\n3. Coffee beans\n4. Syrups\n5. Bakes\n6. Disposable supplies\n7. Utensils',
  `ItemQuantity` int(11) DEFAULT NULL,
  `ItemPrice` decimal(10,0) DEFAULT NULL,
  `ItemName` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CoffeeShopID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  PRIMARY KEY (`ItemID`,`CoffeeShopID`,`SupplierID`),
  KEY `fk_Item_CoffeeShop1_idx` (`CoffeeShopID`),
  KEY `fk_Item_Supplier1_idx` (`SupplierID`),
  CONSTRAINT `fk_Item_CoffeeShop1` FOREIGN KEY (`CoffeeShopID`) REFERENCES `CoffeeShop` (`CoffeeShopID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Item_Supplier1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9056 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (777,1,1,1495,'Ice Machine',5910,8876),(1017,3,39,45,'Tango Blend',5910,6653),(1021,3,47,45,'Cafeto House Blend',5910,6653),(1032,3,43,45,'Glenwood Blend',5910,6653),(1076,3,55,35,'Organic Daybreak Espresso',5910,3034),(1099,3,60,40,'Organic 5 Bean Espresso Roast',5910,3034),(2054,4,34,10,'Sugar Substitute Packet 2000',5910,1875),(2056,4,24,5,'Crème de Banana Syrup',5910,7071),(2066,4,21,39,'Golden Barrel Cane Sugar 50 lb.',5910,1875),(2072,4,25,5,'Brown Sugar Cinnamon Syrup',5910,2456),(2099,4,31,5,'Maple Syrup',5910,2456),(2221,4,17,34,'Honey Bears 12',5910,1875),(2232,4,39,19,'Coffee Creamer 288',5910,1123),(2785,4,19,24,'Silk Almond Milk',5910,1123),(3333,5,22,0,'White Dinner Roll',5910,3337),(3441,5,33,2,'Deluxe Croissant',5910,3337),(3451,5,22,0,'Sugar Cookie',5910,3337),(3777,5,24,1,'Chocolate Chunk Cookie',5910,3337),(3995,5,23,2,'Long John Donut',5910,3337),(4331,1,2,546,'Countertop Bakery Display',5910,1123),(4390,2,1,1295,'Espresson Grinder',5910,1276),(4542,1,2,1296,'Refrigerator',5910,8876),(4677,2,1,5000,'Espresson Machine',5910,1276),(5409,1,2,795,'Glass Door Freezer',5910,1123),(6133,6,20,65,'Paper Straw 4800',5910,7071),(6243,6,75,50,'White CPLA Plastic Fork 1000',5910,9867),(6279,6,88,18,'Paper Cup Travel Lid 1000',5910,9867),(6553,6,77,34,'Dispenser Napkin 8000',5910,9123),(6788,6,30,48,'Coffee Cup Sleeve 1200',5910,7071),(6911,6,53,37,'Paper Hot Cup 1000',5910,9123),(7567,7,3,225,'Nuova Simonelli Starter Kit',5910,5534),(7670,7,10,4,'Atglen Spoon',5910,3434),(7754,7,10,9,'Edgewood Dinner Fork 12',5910,3434),(9055,1,3,149,'Bakery Display Case',5910,1123);
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ItemLow`
--

DROP TABLE IF EXISTS `ItemLow`;
/*!50001 DROP VIEW IF EXISTS `ItemLow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ItemLow` AS SELECT 
 1 AS `ItemID`,
 1 AS `ItemType`,
 1 AS `ItemQuantity`,
 1 AS `ItemPrice`,
 1 AS `ItemName`,
 1 AS `CoffeeShopID`,
 1 AS `SupplierID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ItemSpend1000`
--

DROP TABLE IF EXISTS `ItemSpend1000`;
/*!50001 DROP VIEW IF EXISTS `ItemSpend1000`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ItemSpend1000` AS SELECT 
 1 AS `ItemID`,
 1 AS `ItemType`,
 1 AS `ItemQuantity`,
 1 AS `ItemPrice`,
 1 AS `ItemName`,
 1 AS `CoffeeShopID`,
 1 AS `SupplierID`,
 1 AS `total expense`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `MenuID` varchar(45) COLLATE utf8_bin NOT NULL,
  `MenuPrice` decimal(5,2) DEFAULT NULL,
  `MenuDescription` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES ('CS1',4.15,'Caffe Latte'),('CS10',3.45,'Ham & Cheese Savory Foldover'),('CS11',2.75,'Chocolate Croissant'),('CS12',2.45,'Blueberry Scone'),('CS13',2.35,'Double Chocolate Chunk Brownie'),('CS14',2.95,'Washington Apple Pound Cake'),('CS15',3.45,'Sausage & Cheddar Breakfast Sandwich'),('CS16',3.75,'Bacon & Gouda Breakfast Sandwich'),('CS17',3.45,'Hearty Blueberry Oatmeal'),('CS18',3.95,'Iced Black Tea Lemonade'),('CS19',4.95,'Strawberries & Creme Frappuccino'),('CS2',4.65,'Caffe Mocha'),('CS20',4.95,'Salted Caramel Mocha Frappuccino'),('CS3',4.75,'White Chocolate Mocha'),('CS4',4.75,'Cinnamon Dolce Latte'),('CS5',4.75,'Caramel Flan Latte'),('CS6',4.95,'Mocha Frappuccino'),('CS7',4.45,'Vanilla Bean Crme Frappuccino'),('CS8',4.45,'Coffee Frappuccino'),('CS9',4.95,'Iced Caramel Macchiato');
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderDate` date DEFAULT NULL,
  `OrderDetail` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CoffeeShopID` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `MenuID` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`OrderID`,`CoffeeShopID`,`CustomerID`,`PaymentID`,`MenuID`),
  KEY `fk_Order_CoffeeShop_idx` (`CoffeeShopID`),
  KEY `fk_Order_Payment1_idx` (`PaymentID`),
  KEY `fk_Order_Customer1_idx` (`CustomerID`),
  KEY `fk_Order_Menu1_idx` (`MenuID`),
  CONSTRAINT `fk_Order_CoffeeShop` FOREIGN KEY (`CoffeeShopID`) REFERENCES `CoffeeShop` (`CoffeeShopID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Menu1` FOREIGN KEY (`MenuID`) REFERENCES `Menu` (`MenuID`),
  CONSTRAINT `fk_Order_Payment1` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=886599 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (104121,'2019-07-10','Bacon & Gouda Breakfast Sandwich',5910,16,60037,'CS16'),(106408,'2019-08-20','Chocolate Croissant',5910,11,56887,'CS11'),(148043,'2020-02-09','Caffe Latte',5910,5,42835,'CS1'),(148043,'2019-11-23','Caffe Latte',5910,5,42835,'CS5'),(235919,'2019-09-02','Sausage & Cheddar Breakfast Sandwich',5910,15,30800,'CS15'),(300586,'2020-01-01','Chocolate Croissant',5910,4,71429,'CS11'),(300586,'2019-01-01','Chocolate Croissant',5910,4,71429,'CS4'),(363173,'2020-02-09','Caffe Latte',5910,9,85869,'CS1'),(363173,'2020-02-08','Caffe Latte',5910,9,85869,'CS9'),(420585,'2019-08-06','Caffe Latte',5910,1,34814,'CS1'),(454776,'2020-02-08','Caffe Latte',5910,7,48016,'CS1'),(454776,'2020-02-08','Caffe Latte',5910,7,48016,'CS7'),(454776,'2019-12-23','Coffee Frappuccino',5910,8,96034,'CS8'),(492867,'2019-05-16','Double Chocolate Chunk Brownie',5910,13,45511,'CS13'),(493332,'2019-09-18','Chocolate Croissant',5910,17,97173,'CS11'),(493332,'2019-09-18','Chocolate Croissant',5910,17,97173,'CS17'),(570145,'2020-02-08','Bacon & Gouda Breakfast Sandwich',5910,10,69554,'CS10'),(570145,'2020-02-08','Bacon & Gouda Breakfast Sandwich',5910,10,69554,'CS16'),(571367,'2019-05-15','Iced Black Tea Lemonade',5910,18,90550,'CS18'),(726106,'2019-08-01','Washington Apple Pound Cake',5910,14,14677,'CS14'),(778160,'2019-12-24','Caffe Latte',5910,20,71324,'CS1'),(778160,'2019-12-24','Caffe Latte',5910,20,71324,'CS20'),(806430,'2019-03-17','Strawberries & Creme Frappuccino',5910,19,61402,'CS19'),(828285,'2020-02-08','Caffe Latte',5910,3,47965,'CS1'),(828285,'2020-02-07','Caffe Latte',5910,3,47965,'CS3'),(841102,'2019-03-29','Mocha Frappuccino',5910,6,39683,'CS6'),(859015,'2019-11-20','Blueberry Scone',5910,12,34297,'CS12'),(886598,'2019-05-22','Caffe Mocha',5910,2,39649,'CS2');
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentAmount` decimal(5,2) DEFAULT NULL,
  `CreditCardNumber` int(11) DEFAULT NULL,
  `PaymentTypeID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_Payment_PaymentType1_idx` (`PaymentTypeID`),
  CONSTRAINT `fk_Payment_PaymentType1` FOREIGN KEY (`PaymentTypeID`) REFERENCES `PaymentType` (`PaymentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,4.15,123456780,2),(2,4.65,987654321,3),(3,4.15,674535359,5),(4,2.75,874786453,1),(5,4.15,134335353,4),(6,4.95,646547575,2),(7,4.15,554679798,5),(8,4.45,323132556,2),(9,4.15,232323455,5),(10,3.75,423323242,1),(11,2.75,654357547,1),(12,2.45,164374625,1),(13,2.35,465658970,2),(14,2.95,654644875,3),(15,3.45,787434934,1),(16,3.75,876986576,3),(17,2.75,533524278,2),(18,3.95,787867564,5),(19,4.95,121214254,2),(20,4.15,446568707,1);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentType`
--

DROP TABLE IF EXISTS `PaymentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentType` (
  `PaymentTypeID` int(11) NOT NULL,
  `PaymentTypeDescription` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`PaymentTypeID`),
  UNIQUE KEY `Payment_UNIQUE` (`PaymentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentType`
--

LOCK TABLES `PaymentType` WRITE;
/*!40000 ALTER TABLE `PaymentType` DISABLE KEYS */;
INSERT INTO `PaymentType` VALUES (1,'Cash'),(2,'Check'),(3,'Debit Card'),(4,'Credit Card'),(5,'Coupon');
/*!40000 ALTER TABLE `PaymentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `SupplierLocation` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `SupplierNumber` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `SupplierEmail` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1123,'Black & Decker','New York','2127559855','BnD@gmail.com'),(1276,'OXO','Portland','5038779008','OXO@gamil.com'),(1301,'Espresso Outliet','Boston','6173323299','EssoOutlet@msn.com'),(1875,'Lucca','San Diego','7605567790','Lucca@hotmail.com'),(2456,'Elektra','Seattle','2067773456','Elek@yahoo.com'),(3034,'Bearded Man','Seattle','2066671231','BeardedM@hotmail.com'),(3337,'85C Bakery','Everrett','2068809890','85C@gmail.com'),(3434,'JES','Denver','3039980034','JES@gmail.com'),(5534,'McDonald Paper','Boston','6175385388','McDonaldP@gmail.com'),(6653,'coffeePM','Seattle','2065557877','coffeePM@yahoo.com'),(7071,'Wholesale','New York','3150996631','Whole@yahoo.com'),(8876,'Magister','Portland','5032230192','Magi@yahoo.com'),(9123,'ULINE','Chicago','8470079233','Uline@hotmail.com'),(9867,'Cecil Ware','San Francisco','4152336557','CecilW@gmail.com');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_Sales`
--

DROP TABLE IF EXISTS `fact_Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_Sales` (
  `TID` int(11) NOT NULL,
  `AmountSold` decimal(5,2) DEFAULT NULL,
  `DollarsSold` decimal(5,2) DEFAULT NULL,
  `CusomterKey` int(11) NOT NULL,
  `OrderKey` int(11) NOT NULL,
  `PaymentKey` int(11) NOT NULL,
  PRIMARY KEY (`TID`),
  KEY `fk_fact_Sales_Customer2_idx` (`CusomterKey`),
  KEY `fk_fact_Sales_Order1_idx` (`OrderKey`),
  KEY `fk_fact_Sales_Payment1_idx` (`PaymentKey`),
  CONSTRAINT `fk_fact_Sales_Customer2` FOREIGN KEY (`CusomterKey`) REFERENCES `Customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_Sales_Order1` FOREIGN KEY (`OrderKey`) REFERENCES `Order` (`OrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_Sales_Payment1` FOREIGN KEY (`PaymentKey`) REFERENCES `Payment` (`PaymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_Sales`
--

LOCK TABLES `fact_Sales` WRITE;
/*!40000 ALTER TABLE `fact_Sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ShurisCoffeeShop'
--

--
-- Dumping routines for database 'ShurisCoffeeShop'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetBestSellers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GetBestSellers`()
BEGIN
SELECT m.MenuPrice, COUNT(o.MenuID), m.MenuDescription
FROM mm_cpsc5910team07.Order o
INNER JOIN Menu m
ON m.MenuID = o.MenuID
WHERE o.OrderDate >= '2020/01/01'
GROUP BY o.MenuID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LowInventoryLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `LowInventoryLevel`()
BEGIN
select * from Item
where itemquantity < 10 AND not Itemtype = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TotalExpense` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `TotalExpense`()
BEGIN
select *, itemprice * itemquantity as 'total expense'
from Item;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ItemLow`
--

/*!50001 DROP VIEW IF EXISTS `ItemLow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ItemLow` AS select 1 AS `ItemID`,1 AS `ItemType`,1 AS `ItemQuantity`,1 AS `ItemPrice`,1 AS `ItemName`,1 AS `CoffeeShopID`,1 AS `SupplierID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ItemSpend1000`
--

/*!50001 DROP VIEW IF EXISTS `ItemSpend1000`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ItemSpend1000` AS select 1 AS `ItemID`,1 AS `ItemType`,1 AS `ItemQuantity`,1 AS `ItemPrice`,1 AS `ItemName`,1 AS `CoffeeShopID`,1 AS `SupplierID`,1 AS `total expense` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-15 22:24:17
