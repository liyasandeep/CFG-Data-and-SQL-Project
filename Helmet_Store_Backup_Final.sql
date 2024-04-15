-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: localhost    Database: helmet_store_backup_new
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `address_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `house_no` varchar(25) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK_Address_customerId` (`customer_id`),
  CONSTRAINT `FK_Address_customerId` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,1,'7','Buckingam Rise','Rugby','CV21 1AA','United Kingdom'),(2,2,'15','Maple Lane','Manchester','M14 5AA','United Kingdom'),(3,3,'23','Oak Street','London','SW1A 1AA','United Kingdom'),(4,4,'10','Chestnut Avenue','Birmingham','B1 1AA','United Kingdom'),(5,5,'5','Pine Road','Edinburgh','EH1 1AA','United Kingdom'),(6,6,'12','Willow Crescent','Glasgow','G1 1AA','United Kingdom'),(7,7,'9','Anderson Avenue','Rugby','CV22 1AA','United Kingdom');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brand` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(25) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand`
--

LOCK TABLES `Brand` WRITE;
/*!40000 ALTER TABLE `Brand` DISABLE KEYS */;
INSERT INTO `Brand` VALUES (1,'LS2'),(2,'Shoei'),(3,'Arai'),(4,'AGV'),(5,'Bell'),(6,'HJC'),(7,'Scorpion'),(8,'Shark'),(9,'Nolan'),(10,'Icon');
/*!40000 ALTER TABLE `Brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colour`
--

DROP TABLE IF EXISTS `Colour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colour` (
  `colour_id` int NOT NULL,
  `colour_name` varchar(50) NOT NULL,
  PRIMARY KEY (`colour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colour`
--

LOCK TABLES `Colour` WRITE;
/*!40000 ALTER TABLE `Colour` DISABLE KEYS */;
INSERT INTO `Colour` VALUES (1,'Gloss White'),(2,'Nardo Grey'),(3,'Midnight Black'),(4,'Ruby Red'),(5,'Ocean Blue');
/*!40000 ALTER TABLE `Colour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customerorderview`
--

DROP TABLE IF EXISTS `customerorderview`;
/*!50001 DROP VIEW IF EXISTS `customerorderview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerorderview` AS SELECT 
 1 AS `customer_id`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `order_id`,
 1 AS `orderDate`,
 1 AS `totalAmount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `customer_id` int NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phNo` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Liya','Thomas','liya@gmail.com','1234','11112222333','2023-01-10 13:06:12',NULL),(2,'John','Doe','john.doe@example.com','password123','44445555666','2023-01-11 08:45:30',NULL),(3,'Emma','Smith','emma.smith@example.com','securepass','77778888999','2023-01-12 15:20:42',NULL),(4,'Alex','Johnson','alex.johnson@example.com','pass123','10111222333','2023-01-13 12:10:18',NULL),(5,'Sophia','Brown','sophia.brown@example.com','userpass','12121234567','2023-01-14 09:05:25',NULL),(6,'Daniel','Williams','daniel.williams@example.com','danielpass','13141516171','2023-01-15 16:30:55',NULL),(7,'John','Smith','john@gmail.com','12340','33332222333','2022-12-11 13:06:12',NULL);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `helmetinformation`
--

DROP TABLE IF EXISTS `helmetinformation`;
/*!50001 DROP VIEW IF EXISTS `helmetinformation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `helmetinformation` AS SELECT 
 1 AS `helmet_id`,
 1 AS `model_name`,
 1 AS `brand_name`,
 1 AS `price`,
 1 AS `stockQuantity`,
 1 AS `size_name`,
 1 AS `colour_name`,
 1 AS `type_name`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Helmets`
--

DROP TABLE IF EXISTS `Helmets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Helmets` (
  `helmet_id` int NOT NULL,
  `model_id` int NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `stockQuantity` int NOT NULL,
  `size_id` int NOT NULL,
  `colour_id` int NOT NULL,
  `type_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`helmet_id`),
  KEY `FK_HelmetModel` (`model_id`),
  KEY `FK_HelmetSize` (`size_id`),
  KEY `FK_HelmetColour` (`colour_id`),
  KEY `FK_HelmetType` (`type_id`),
  CONSTRAINT `FK_HelmetColour` FOREIGN KEY (`colour_id`) REFERENCES `Colour` (`colour_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_HelmetModel` FOREIGN KEY (`model_id`) REFERENCES `Model` (`model_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_HelmetSize` FOREIGN KEY (`size_id`) REFERENCES `Size` (`size_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_HelmetType` FOREIGN KEY (`type_id`) REFERENCES `HelmetType` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Helmets`
--

LOCK TABLES `Helmets` WRITE;
/*!40000 ALTER TABLE `Helmets` DISABLE KEYS */;
INSERT INTO `Helmets` VALUES (1,1,300.00,1,3,1,1,'2022-12-12 12:06:01','2023-12-17 19:41:20'),(2,2,305.00,2,4,2,2,'2022-12-13 10:00:09','2023-12-17 19:42:12'),(3,3,280.00,5,2,3,1,'2022-12-14 15:30:45',NULL),(4,1,320.00,1,4,4,2,'2022-12-15 09:45:22','2023-12-16 00:18:56'),(5,2,299.99,3,3,1,3,'2022-12-16 14:20:18',NULL),(6,3,315.00,4,2,2,1,'2022-12-17 11:10:36',NULL),(7,1,289.50,2,1,4,2,'2022-12-18 08:05:49',NULL),(8,2,299.00,3,3,2,3,'2022-12-19 16:40:15',NULL),(9,3,310.50,4,4,3,1,'2022-12-20 13:25:08',NULL);
/*!40000 ALTER TABLE `Helmets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateModifiedAt` BEFORE UPDATE ON `helmets` FOR EACH ROW BEGIN
SET NEW.modified_at = NOW();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `helmetsale`
--

DROP TABLE IF EXISTS `helmetsale`;
/*!50001 DROP VIEW IF EXISTS `helmetsale`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `helmetsale` AS SELECT 
 1 AS `ModelName`,
 1 AS `Total_Sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `HelmetType`
--

DROP TABLE IF EXISTS `HelmetType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HelmetType` (
  `type_id` int NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HelmetType`
--

LOCK TABLES `HelmetType` WRITE;
/*!40000 ALTER TABLE `HelmetType` DISABLE KEYS */;
INSERT INTO `HelmetType` VALUES (1,'Open Face'),(2,'Full Face'),(3,'Modular'),(4,'Half Face'),(5,'Off-Road');
/*!40000 ALTER TABLE `HelmetType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Model`
--

DROP TABLE IF EXISTS `Model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Model` (
  `model_id` int NOT NULL,
  `model_name` varchar(25) NOT NULL,
  `brand_id` int NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`model_id`),
  KEY `FK_ModelBrand` (`brand_id`),
  CONSTRAINT `FK_ModelBrand` FOREIGN KEY (`brand_id`) REFERENCES `Brand` (`brand_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Model`
--

LOCK TABLES `Model` WRITE;
/*!40000 ALTER TABLE `Model` DISABLE KEYS */;
INSERT INTO `Model` VALUES (1,'Shoei RF-1200',2,'The Shoei RF-1200 Helmet was designed to be an industry leader in comfort, performance and protection.'),(2,'AGV Pista GP RR',4,'Pista GP RR is an exact replica of the AGV helmet used in races by world champions.'),(3,'HJC RPHA 11',6,'The HJC RPHA-11 is the flagship of the HJC range, a full face motorcycle helmet that provides extreme performance for high speed riding!'),(4,'Bell Qualifier  DLX',5,'Lightweight Polycarbonate/ABS Shell Construction '),(5,'Scorpion EXO-R420',7,'he EXO-R420 redefines what you can expect in a sub-$200 full face helmet with state-of-the-art materials, performance features'),(6,'Shark Spartan',8,'The Spartan GT, Shark\'s latest fibre composite full-face helmet'),(7,'Nolan N87',9,' latest and most exclusive version of Nolan’s top-of-the-range road full face helmet.'),(8,'LS2 Valiant',1,'a Full face and a Open Face helmet.'),(9,'Icon Airflite',10,'an urban streetfighter helmet with MIPS system, drop-down sun visor, and superlative ventilation.'),(10,'AGV K6-S',4,'Suitable for every type of riding and all road surfaces'),(11,'AGV K3',4,' K3 is AGV’s full-face road helmet that takes all the characteristics of a versatile, safe helmet'),(12,'Arai Concept-XE',3,'The Concept-XE has a clean, minimalist shape with handsome contours in place to hide clever, multi-stage air channels'),(13,'Bell Race Star - Flex DLX',5,'The Race Star DLX version now comes supplied with a PROTINT Panovison Visor'),(14,'Bell Moto-9S Flex',5,'Designed with the racer in mind and the podium in sight, the Moto-9S Flex provides race-ready protection.'),(15,'HJC RPHA-12',6,' Premium Integrated Matrix / P.I.M. EVO: Reinforcement materials including Carbon-Aramid hybrid and natural fibre'),(16,'Nolan X-552 U.C',9,'This high-carbon content helmet is designed for thrilling off-road journeys. Get ready for unrivaled performance and protection on your next adventure.'),(17,'Nolan N100-6',9,'The N100-6 sets new standards for a high-end polycarbonate flip-up helmet, developing the popular technical features of the predecessor N100-5'),(18,'Shoei NXR2',2,'Lightweight Compact DesignLightest SHOEI ECE22/06 standard certified product.'),(19,'Shark Skwal i3',8,'The world’s first helmet with integrated brake lights!'),(20,'LS2 Advant X',1,'Convertible helmet to enjoy all seasons of the year thanks to its 180º rotating chin guard. Perfect for any type of riding and for all weather conditions.'),(21,'LS2 Advant X Carbon',1,'The LS2 FF901 Advant X Carbon - Future is the most advanced convertible helmet on the market.  Made of 100% Carbon fiber.');
/*!40000 ALTER TABLE `Model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthlySalesCount`
--

DROP TABLE IF EXISTS `monthlySalesCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthlySalesCount` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `NoOfOrders` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthlySalesCount`
--

LOCK TABLES `monthlySalesCount` WRITE;
/*!40000 ALTER TABLE `monthlySalesCount` DISABLE KEYS */;
INSERT INTO `monthlySalesCount` VALUES (1,'2023-12-15 14:01:10',1),(2,'2023-12-15 14:02:10',1),(3,'2023-12-15 14:03:10',1),(4,'2023-12-15 14:03:39',1),(5,'2023-12-15 14:04:39',1),(6,'2023-12-15 14:05:39',1),(7,'2023-12-15 14:06:39',1),(8,'2023-12-15 14:37:51',1),(9,'2023-12-15 14:38:51',1),(10,'2023-12-15 14:39:51',1),(11,'2023-12-15 14:40:51',1),(12,'2023-12-17 19:43:22',2),(13,'2023-12-17 19:44:22',2),(14,'2023-12-17 19:45:22',2),(15,'2023-12-17 19:46:22',2);
/*!40000 ALTER TABLE `monthlySalesCount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetails`
--

DROP TABLE IF EXISTS `OrderDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDetails` (
  `orderDetail_id` int NOT NULL,
  `order_id` int NOT NULL,
  `helmet_id` int NOT NULL,
  `quantity_ordered` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `size` varchar(25) NOT NULL,
  `color` varchar(100) NOT NULL,
  PRIMARY KEY (`orderDetail_id`),
  KEY `FK_OrderDetail_orderId` (`order_id`),
  KEY `FK_OrderDetail_HelmetId` (`helmet_id`),
  CONSTRAINT `FK_OrderDetail_HelmetId` FOREIGN KEY (`helmet_id`) REFERENCES `Helmets` (`helmet_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_OrderDetail_orderId` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetails`
--

LOCK TABLES `OrderDetails` WRITE;
/*!40000 ALTER TABLE `OrderDetails` DISABLE KEYS */;
INSERT INTO `OrderDetails` VALUES (1,1,1,1,300.00,'M','Gloss White'),(2,1,2,1,305.00,'L','Nardo Grey'),(3,2,1,1,300.00,'M','Gloss White'),(4,3,2,1,305.00,'L','Nardo Grey'),(5,4,3,2,560.00,'S','Midnight Black'),(6,5,1,1,300.00,'M','Gloss White'),(7,5,5,1,299.99,'M','Gloss White'),(8,5,7,1,289.50,'XS','Ruby Red'),(9,6,8,1,299.99,'M','Nardo Grey'),(10,7,9,1,310.50,'L','Midnight Black'),(11,8,2,1,305.00,'L','Nardo Grey'),(12,8,4,1,320.00,'L','Ruby Red'),(13,9,1,1,300.00,'M','Gloss White'),(14,10,2,1,305.00,'L','Nardo Grey');
/*!40000 ALTER TABLE `OrderDetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`liya`@`localhost`*/ /*!50003 TRIGGER `before_orderDetailsInsert` BEFORE INSERT ON `orderdetails` FOR EACH ROW begin
	declare stockAvailable int;
    select stockQuantity into stockAvailable from Helmets where helmet_id = new.helmet_id ;
    
    if new.quantity_ordered > stockAvailable then
    	
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Sorry the ordered quantity is not in stock';
		end if;
	
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`liya`@`localhost`*/ /*!50003 TRIGGER `after_orderDetailsInsert` AFTER INSERT ON `orderdetails` FOR EACH ROW BEGIN
	UPDATE Helmets 
    
	SET stockQuantity = stockQuantity - NEW.quantity_ordered WHERE helmet_id = NEW.helmet_id AND stockQuantity > 0; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `orderDate` date NOT NULL,
  `totalAmount` decimal(10,2) NOT NULL,
  `orderStatus` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `FK_OrderCustomer` (`customer_id`),
  CONSTRAINT `FK_OrderCustomer` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,'2023-08-11',605.00,'Delivered','2023-08-11 12:07:20'),(2,1,'2023-10-11',300.00,'Paid','2023-10-11 12:07:20'),(3,2,'2023-08-15',305.00,'Shipped','2023-08-15 09:30:45'),(4,3,'2023-09-05',560.00,'Pending','2023-09-05 14:20:18'),(5,4,'2023-09-20',889.49,'Delivered','2023-09-20 11:10:36'),(6,5,'2023-10-02',299.00,'Paid','2023-10-02 08:05:49'),(7,7,'2022-12-20',310.50,'Delivered','2022-12-20 15:07:20'),(8,7,'2022-12-15',625.00,'Delivered','2022-12-15 11:09:20'),(9,6,'2023-12-15',300.00,'Paid','2023-12-15 11:09:20'),(10,7,'2023-12-15',305.00,'Paid','2023-12-15 12:09:20');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `review_id` int NOT NULL,
  `helmet_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `FK_Reviews_helmetId` (`helmet_id`),
  KEY `FK_Review_CustomerId` (`customer_id`),
  CONSTRAINT `FK_Review_CustomerId` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reviews_helmetId` FOREIGN KEY (`helmet_id`) REFERENCES `Helmets` (`helmet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,1,1,4,'So Comfortable','2023-09-12 11:07:00'),(2,2,2,4,'Stylish design, comfortable fit. The only downside is it\'s a bit heavy.','2023-02-05 00:00:00'),(3,1,4,5,'Excellent quality! Fast shipping and fantastic customer service.','2023-02-15 00:00:00'),(4,3,3,3,'Decent helmet, but the sizing is a bit off. Had to exchange for a larger one.','2023-03-01 00:00:00'),(5,1,4,4,'So comfortable! Great for long rides without any discomfort.','2023-09-12 11:07:00'),(6,2,2,5,'Amazing helmet, and the customer service was top-notch!','2023-09-20 15:30:00');
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShippingInfo`
--

DROP TABLE IF EXISTS `ShippingInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShippingInfo` (
  `shipment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `shipping_date` date NOT NULL,
  `courier_company` varchar(50) NOT NULL,
  `tracking_no` varchar(50) NOT NULL,
  `shippingStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `FK_Shipments_orderId` (`order_id`),
  CONSTRAINT `FK_Shipments_orderId` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShippingInfo`
--

LOCK TABLES `ShippingInfo` WRITE;
/*!40000 ALTER TABLE `ShippingInfo` DISABLE KEYS */;
INSERT INTO `ShippingInfo` VALUES (2,2,'2023-10-11','DPD','198765487','Pending'),(3,3,'2023-08-20','UPS','987654321','Shipped'),(4,4,'2023-09-08','FedEx','567890123','Delivered'),(5,5,'2023-10-05','DHL','345678901','In Transit'),(6,6,'2023-10-18','Royal Mail','234567890','Pending');
/*!40000 ALTER TABLE `ShippingInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Size`
--

DROP TABLE IF EXISTS `Size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Size` (
  `size_id` int NOT NULL,
  `size_name` varchar(25) NOT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Size`
--

LOCK TABLES `Size` WRITE;
/*!40000 ALTER TABLE `Size` DISABLE KEYS */;
INSERT INTO `Size` VALUES (1,'XS'),(2,'S'),(3,'M'),(4,'L'),(5,'XL'),(6,'2XL'),(7,'3XL');
/*!40000 ALTER TABLE `Size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'helmet_store_backup_new'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `MonthlyShippmentTableUpdate_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`liya`@`localhost`*/ /*!50106 EVENT `MonthlyShippmentTableUpdate_event` ON SCHEDULE EVERY 1 MONTH STARTS '2023-12-16 00:24:15' ENDS '2024-03-16 00:24:15' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN	
	DELETE FROM ShippingInfo where shippingStatus = 'Delivered' and shipping_date < DATE_ADD(date(now()), INTERVAL -120 DAY); 
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'helmet_store_backup_new'
--
/*!50003 DROP FUNCTION IF EXISTS `countOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`liya`@`localhost` FUNCTION `countOrders`(end_date DATE) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE count INT;
    DECLARE start_date DATE;
    SET start_date = DATE_ADD(end_date, INTERVAL -30 DAY); -- DATE_SUB(end_date, INTERVAL 150 DAY); actually -30 to be done
	SELECT COUNT(order_id) INTO count FROM Orders WHERE orderDate <= end_date AND orderDate >=  start_date;
    return count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `to_restock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`liya`@`localhost` FUNCTION `to_restock`(stockAvailable INT) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE restock VARCHAR(10);
    IF stockAvailable > 2 THEN
		SET restock = 'NO';  
	ELSE
		SET restock ='YES';
	END IF;
	RETURN restock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateOrderTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateOrderTotal`(IN orderID INT)
BEGIN
    DECLARE total DECIMAL(10,2);

    
    SELECT SUM(subtotal) INTO total
    FROM OrderDetails
    WHERE order_id = orderID;

    
    SELECT CONCAT('Total amount for Order ID ', orderID, ' is $', total) AS Result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomerInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`liya`@`localhost` PROCEDURE `getCustomerInfo`(IN  city VARCHAR(25))
BEGIN
	SELECT CONCAT_WS(' ',c.firstName,c.lastName) AS Name,
		   c.email AS Email,
           CONCAT_WS(', ', a.house_no, a.street, a.city, a.post_code, a.country ) as Address 
    FROM Customers c INNER JOIN Address a on c.customer_id = a.customer_id 
    WHERE a.city = city;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customerorderview`
--

/*!50001 DROP VIEW IF EXISTS `customerorderview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerorderview` AS select `customers`.`customer_id` AS `customer_id`,`customers`.`firstName` AS `firstName`,`customers`.`lastName` AS `lastName`,`orders`.`order_id` AS `order_id`,`orders`.`orderDate` AS `orderDate`,`orders`.`totalAmount` AS `totalAmount` from (`customers` join `orders` on((`customers`.`customer_id` = `orders`.`customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `helmetinformation`
--

/*!50001 DROP VIEW IF EXISTS `helmetinformation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `helmetinformation` AS select `h`.`helmet_id` AS `helmet_id`,`m`.`model_name` AS `model_name`,`b`.`brand_name` AS `brand_name`,`h`.`price` AS `price`,`h`.`stockQuantity` AS `stockQuantity`,`s`.`size_name` AS `size_name`,`c`.`colour_name` AS `colour_name`,`ht`.`type_name` AS `type_name`,`h`.`created_at` AS `created_at` from (((((`helmets` `h` join `model` `m` on((`h`.`model_id` = `m`.`model_id`))) join `brand` `b` on((`m`.`brand_id` = `b`.`brand_id`))) join `size` `s` on((`h`.`size_id` = `s`.`size_id`))) join `colour` `c` on((`h`.`colour_id` = `c`.`colour_id`))) join `helmettype` `ht` on((`h`.`type_id` = `ht`.`type_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `helmetsale`
--

/*!50001 DROP VIEW IF EXISTS `helmetsale`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`liya`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `helmetsale` AS select `m`.`model_name` AS `ModelName`,sum(`od`.`subtotal`) AS `Total_Sales` from ((`helmets` `h` join `model` `m` on((`h`.`model_id` = `m`.`model_id`))) join `orderdetails` `od` on((`h`.`helmet_id` = `od`.`helmet_id`))) group by `m`.`model_name` */;
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

-- Dump completed on 2023-12-17 20:19:25
