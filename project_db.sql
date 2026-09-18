-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: estateadvance
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `assignmentbuilding`
--

DROP TABLE IF EXISTS `assignmentbuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentbuilding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `buildingid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_building` (`staffid`),
  KEY `fk_building_user` (`buildingid`),
  CONSTRAINT `fk_building_user` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_user_building` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentbuilding`
--

LOCK TABLES `assignmentbuilding` WRITE;
/*!40000 ALTER TABLE `assignmentbuilding` DISABLE KEYS */;
INSERT INTO `assignmentbuilding` VALUES (11,3,2,NULL,NULL,NULL,NULL),(12,4,2,NULL,NULL,NULL,NULL),(22,4,4,'2026-09-09 20:50:53','2026-09-09 20:50:53','nguyenvana','nguyenvana'),(23,2,63,'2026-09-09 20:51:01','2026-09-09 20:51:01','nguyenvana','nguyenvana'),(24,3,63,'2026-09-09 20:51:01','2026-09-09 20:51:01','nguyenvana','nguyenvana'),(25,2,64,'2026-09-09 20:51:05','2026-09-09 20:51:05','nguyenvana','nguyenvana'),(26,4,64,'2026-09-09 20:51:06','2026-09-09 20:51:06','nguyenvana','nguyenvana'),(27,2,65,'2026-09-09 20:51:09','2026-09-09 20:51:09','nguyenvana','nguyenvana'),(28,2,61,'2026-09-17 21:37:45','2026-09-17 21:37:45','nguyenvana','nguyenvana'),(29,3,61,'2026-09-17 21:37:45','2026-09-17 21:37:45','nguyenvana','nguyenvana'),(30,4,61,'2026-09-17 21:37:45','2026-09-17 21:37:45','nguyenvana','nguyenvana'),(31,3,1,'2026-09-18 21:23:03','2026-09-18 21:23:03','nguyenvana','nguyenvana'),(32,15,1,'2026-09-18 21:23:03','2026-09-18 21:23:03','nguyenvana','nguyenvana'),(33,2,62,'2026-09-18 21:23:18','2026-09-18 21:23:18','nguyenvana','nguyenvana'),(34,15,62,'2026-09-18 21:23:19','2026-09-18 21:23:19','nguyenvana','nguyenvana'),(35,3,75,'2026-09-18 21:23:30','2026-09-18 21:23:30','nguyenvana','nguyenvana'),(36,4,76,'2026-09-18 21:23:37','2026-09-18 21:23:37','nguyenvana','nguyenvana'),(37,15,76,'2026-09-18 21:23:37','2026-09-18 21:23:37','nguyenvana','nguyenvana'),(38,2,77,'2026-09-18 21:23:43','2026-09-18 21:23:43','nguyenvana','nguyenvana'),(39,4,77,'2026-09-18 21:23:43','2026-09-18 21:23:43','nguyenvana','nguyenvana'),(40,15,78,'2026-09-18 21:23:48','2026-09-18 21:23:48','nguyenvana','nguyenvana'),(41,4,79,'2026-09-18 21:23:52','2026-09-18 21:23:52','nguyenvana','nguyenvana');
/*!40000 ALTER TABLE `assignmentbuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentcustomer`
--

DROP TABLE IF EXISTS `assignmentcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentcustomer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_customer` (`staffid`),
  KEY `fk_customer_user` (`customerid`),
  CONSTRAINT `fk_customer_user` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcustomer`
--

LOCK TABLES `assignmentcustomer` WRITE;
/*!40000 ALTER TABLE `assignmentcustomer` DISABLE KEYS */;
INSERT INTO `assignmentcustomer` VALUES (1,2,1,NULL,NULL,NULL,NULL),(2,2,3,NULL,NULL,NULL,NULL),(3,3,1,NULL,NULL,NULL,NULL),(4,3,3,NULL,NULL,NULL,NULL),(5,4,2,'2026-08-24 21:51:05','2026-08-24 21:51:05','nguyenvana','nguyenvana'),(12,4,23,'2026-09-09 21:49:01','2026-09-09 21:49:01','nguyenvana','nguyenvana'),(13,3,14,'2026-09-09 21:53:02','2026-09-09 21:53:02','nguyenvana','nguyenvana'),(14,2,1,'2026-09-09 22:16:18',NULL,'admin',NULL),(15,3,1,'2026-09-09 22:16:18',NULL,'admin',NULL),(16,2,2,'2026-09-09 22:16:18',NULL,'admin',NULL),(17,3,3,'2026-09-09 22:16:18',NULL,'admin',NULL),(18,2,24,'2026-09-09 22:18:04','2026-09-09 22:18:04','nguyenvana','nguyenvana'),(19,3,25,'2026-09-09 22:19:38','2026-09-09 22:19:38','nguyenvana','nguyenvana'),(20,4,25,'2026-09-09 22:19:38','2026-09-09 22:19:38','nguyenvana','nguyenvana'),(21,4,26,'2026-09-09 22:20:43','2026-09-09 22:20:43','nguyenvana','nguyenvana'),(24,2,27,'2026-09-17 22:46:19','2026-09-17 22:46:19','nguyenvana','nguyenvana'),(25,4,27,'2026-09-17 22:46:22','2026-09-17 22:46:22','nguyenvana','nguyenvana'),(26,15,27,'2026-09-17 22:46:22','2026-09-17 22:46:22','nguyenvana','nguyenvana'),(27,4,10,'2026-09-17 22:59:58','2026-09-17 22:59:58','nguyenvana','nguyenvana'),(28,2,37,'2026-09-18 21:28:15','2026-09-18 21:28:15','nguyenvana','nguyenvana'),(29,4,37,'2026-09-18 21:28:15','2026-09-18 21:28:15','nguyenvana','nguyenvana'),(30,3,36,'2026-09-18 21:28:19','2026-09-18 21:28:19','nguyenvana','nguyenvana'),(31,4,34,'2026-09-18 21:28:23','2026-09-18 21:28:23','nguyenvana','nguyenvana'),(32,15,34,'2026-09-18 21:28:23','2026-09-18 21:28:23','nguyenvana','nguyenvana'),(33,2,35,'2026-09-18 21:28:28','2026-09-18 21:28:28','nguyenvana','nguyenvana');
/*!40000 ALTER TABLE `assignmentcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `numberofbasement` int DEFAULT NULL,
  `floorarea` int DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rentprice` int DEFAULT NULL,
  `rentpricedescription` text,
  `servicefee` varchar(255) DEFAULT NULL,
  `carfee` varchar(255) DEFAULT NULL,
  `motofee` varchar(255) DEFAULT NULL,
  `overtimefee` varchar(255) DEFAULT NULL,
  `waterfee` varchar(255) DEFAULT NULL,
  `electricityfee` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `renttime` varchar(255) DEFAULT NULL,
  `decorationtime` varchar(255) DEFAULT NULL,
  `brokeragefee` decimal(13,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `linkofbuilding` varchar(255) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `managername` varchar(255) DEFAULT NULL,
  `managerphone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Nam Giao Building Tower','33 phan xích long','Phường 3','QUAN_3','',2,500,'','',200,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAI,NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Nam-Chị Linh','0915354727',NULL),(2,'ACM Tower','96 cao thắng','Phường 4','QUAN_2',NULL,2,650,NULL,NULL,18,'18 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chú Thuận','0173546263',NULL),(4,'IDD 1 Building','111 Lý Chính Thắng','Phường 7','QUAN_4','',1,200,'','',12,'12 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Long','017345251',NULL),(61,'Sài Gòn Centre Tower 2','67 Lê Lợi','Phường Bến Nghé','QUAN_1','Khung Bê tông cốt thép',6,1200,'Nam','A+',45,'45 USD/m2/tháng','7 USD/m2','3.500.000 VNĐ/xe','350.000 VNĐ/xe','Thỏa thuận','Theo giá kinh doanh','Theo giá nhà nước','3 tháng','Thanh toán 3 tháng/lần','3 năm','45 ngày',1.00,'TANG_TRET,NGUYEN_CAN','Vị trí đắc địa ngay trung tâm Q1','https://saigoncentre.com.vn','10.7725,106.7011',NULL,'2026-09-09 20:27:31',NULL,'admin',NULL,'Chị Hoàng Yến','0909123456','/building/saigon-centre.jpg'),(62,'Viettel Complex Tower','285 Cách Mạng Tháng 8','Phường 12','QUAN_8','Bê tông kính chịu lực',3,900,'Tây Bắc','A',28,'28 USD/m2/tháng','4 USD/m2','2.000.000 VNĐ/xe','200.000 VNĐ/xe','150.000 VNĐ/giờ','Theo đồng hồ','Theo giá nhà nước','3 tháng','Thanh toán theo tháng','2 năm','30 ngày',0.80,'NOI_THAT','Tòa nhà văn phòng hiện đại Quận 10','https://viettelcomplex.com','10.7781,106.6775',NULL,'2026-09-09 20:27:31',NULL,'admin',NULL,'Anh Hoàng','0918234567','/building/viettel-tower.jpg'),(63,'Lim Tower 3','29A Nguyễn Đình Chiểu','Phường Đa Kao','QUAN_1','Khung thép kính',3,750,'Đông','B+',26,'26 USD/m2/tháng','3.5 USD/m2','2.200.000 VNĐ/xe','220.000 VNĐ/xe','Thỏa thuận','Theo giá nhà nước','Theo giá nhà nước','2 tháng','Thanh toán 2 tháng/lần','2 năm','20 ngày',1.00,'TANG_TRET','Khu vực an ninh, gần nhiều đại sứ quán','https://limtower3.com','10.7862,106.6983',NULL,'2026-09-09 20:27:31',NULL,'admin',NULL,'Chú Minh','0937345678','/building/lim-tower-3.jpg'),(64,'Thảo Điền Pearl','12 Quốc Hương','Phường Thảo Điền','QUAN_BINHTHANH','Bê tông cốt thép',2,600,'Đông Nam','B',18,'18 USD/m2/tháng','3 USD/m2','1.500.000 VNĐ/xe','150.000 VNĐ/xe','Miễn phí ngoài giờ','Theo đồng hồ','Theo giá kinh doanh','2 tháng','Thanh toán theo tháng','1 năm','15 ngày',0.50,'NGUYEN_CAN','Thích hợp làm văn phòng đại diện / công ty công nghệ','https://thaodienpearl.vn','10.8042,106.7321',NULL,'2026-09-09 20:27:31',NULL,'admin',NULL,'Cô Thanh','0978456789','/building/thaodien-pearl.jpg'),(65,'Cobi Tower','69 Hoàng Văn Thái','Phường Tân Phú','QUAN_7','Khung Bê tông chịu lực',2,850,'Tây Nam','B+',20,'20 USD/m2/tháng','3 USD/m2','1.600.000 VNĐ/xe','160.000 VNĐ/xe','Thỏa thuận','Theo giá nhà nước','Theo giá nhà nước','3 tháng','Thanh toán theo quý','3 năm','30 ngày',1.00,'NOI_THAT,TANG_TRET','Nằm trong khu đô thị Phú Mỹ Hưng','https://cobitower.com','10.7298,106.7194',NULL,'2026-09-09 20:27:31',NULL,'admin',NULL,'Anh Tuấn','0945567890','/building/cobi-tower.jpg'),(75,'Green Power Tower','Tôn Đức Thắng','Bến Nghé','QUAN_1',NULL,2,600,'Đông-Bắc','B',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Phạm Văn Đạt','0901122334',NULL),(76,'Vietcombank Tower','Công Trường Mê Linh','Bến Nghé','QUAN_1',NULL,4,1200,'Nam','A+',35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hoàng Minh Tuấn','0902233445',NULL),(77,'Centec Tower','Nguyễn Thị Minh Khai','Phường 6','QUAN_3',NULL,2,750,'Tây-Nam','A',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Lan','0903344556',NULL),(78,'Masteri Office','Xa Lộ Hà Nội','An Phú','QUAN_2',NULL,1,450,'Đông','B',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Vũ Hoàng Nam','0904455667',NULL),(79,'Pearl Plaza','Điện Biên Phủ','Phường 25','QUAN_BINHTHANH',NULL,3,900,'Bắc','A',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đỗ Thành Long','0905566778',NULL),(80,'E.Town Building','Trường Chinh','Phường 13','QUAN_THUDUC',NULL,2,1100,'Tây','B+',16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bùi Thị Hoa','0906677889',NULL),(81,'Phúc Thịnh Tower','Lê Văn Sỹ','Phường 14','QUAN_THUDUC',NULL,1,300,'Nam','C',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ngô Văn Hùng','0907788990',NULL);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `demand` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Luc Van Hai','0905671231','hailv@gmail.com',NULL,NULL,NULL,0,NULL,'2026-09-04 21:19:58','anonymousUser','nguyenvana'),(2,'Nguyen Xuan Hong','0205671231','hongxuanng@gmail.com',NULL,NULL,NULL,0,NULL,'2026-09-04 21:19:58','nguyenvanb','nguyenvana'),(3,'Ta Thi Cuc','0912121231','cucthita1@gmail.com',NULL,NULL,NULL,0,NULL,'2026-09-04 21:10:18','anonymousUser','nguyenvana'),(10,'test1','0905671231','','','','DA_XU_LY',0,'2026-08-27 10:07:44','2026-09-18 21:24:42','nguyenvana','nguyenvana'),(14,'Ta Thi Cuc','0912121231','cucthita1@gmail.com','','','DANG_XU_LY',0,'2026-08-27 10:55:11','2026-09-09 22:09:31','nguyenvana','nguyenvana'),(20,'test','0935305123','test@gmail.com',NULL,'Tìm kiếm tòa nhà chọc trời','CHUA_XU_LY',0,'2026-08-28 09:08:52','2026-09-09 21:58:01','anonymousUser','nguyenvana'),(21,'test','02323123123','','','','DANG_XU_LY',0,'2026-09-03 15:49:36','2026-09-09 21:54:39','nguyenvana','nguyenvana'),(22,'Duong','0917444222','danhhkt8@gmail.com',NULL,'','CHUA_XU_LY',0,'2026-09-04 19:55:03','2026-09-09 22:02:43','nguyenvana','nguyenvana'),(23,'test','010101010101','test',NULL,'','CHUA_XU_LY',0,'2026-09-05 14:04:11','2026-09-09 21:48:38','nguyenvana','nguyenvana'),(24,'Nguyễn Văn An','0912345678','nguyenvanan@gmail.com','Công ty TNHH Bất Động Sản An Phát','Cần thuê văn phòng 150m2 tại Quận 1','CHUA_XU_LY',1,'2026-09-09 22:15:06',NULL,'anonymousUser',NULL),(25,'Trần Thị Bích','0987654321','bich.tran@techcorp.vn','Tập đoàn Công nghệ TechCorp','Thuê nguyên căn tòa nhà làm văn phòng chính','DANG_XU_LY',1,'2026-09-09 22:15:06',NULL,'nguyenvanb',NULL),(26,'Lê Hoàng Cường','0933112233','cuong.le@designstudio.com','Studio Thiết kế Cường Lê','Cần thuê diện tích 80m2 - 100m2 có sẵn nội thất','DA_XU_LY',1,'2026-09-09 22:15:06',NULL,'anonymousUser',NULL),(27,'Phạm Minh Đức','0977889900','duc.pham@startup.io','Công ty Cổ phần Startup Việt','Tìm văn phòng giá rẻ khu vực Quận 10 hoặc Tân Bình','CHUA_XU_LY',1,'2026-09-09 22:15:06',NULL,'anonymousUser',NULL),(28,'Danh Duong1','09056712311','danhhkt8@gmail.com1','Nam gia sư1','1','DANG_XU_LY',0,'2026-09-09 22:22:56','2026-09-10 14:56:01','nguyenvana','nguyenvana'),(29,'Danh Duong','0905671231','danhhkt8@gmail.com','Nam gia sư','','CHUA_XU_LY',0,'2026-09-10 14:56:22','2026-09-10 15:03:03','nguyenvana','nguyenvana'),(30,'Danh Duong','0935305399','danhhkt8@gmail.com','Nam gia sư','','DANG_XU_LY',0,'2026-09-10 14:58:04','2026-09-10 15:03:03','nguyenvana','nguyenvana'),(31,'test','0905671231','','','','DANG_XU_LY',0,'2026-09-17 22:45:26','2026-09-17 22:45:43','nguyenvana','nguyenvana'),(32,'test','0905671231','','','','DANG_XU_LY',0,'2026-09-17 22:52:14','2026-09-17 22:53:34','nguyenvana','nguyenvana'),(33,'test','0905671231','',NULL,'','DANG_XU_LY',0,'2026-09-17 22:53:17','2026-09-17 22:53:37','nguyenvanb','nguyenvana'),(34,'Nguyễn Văn An','0912345678','nguyenvanan@gmail.com','Công ty TNHH Bất Động Sản An Phát','Cần thuê văn phòng 150m2 tại Quận 1','CHUA_XU_LY',1,'2026-09-18 21:26:12',NULL,'nguyenvanb',NULL),(35,'Trần Thị Bích','0987654321','bich.tran@techcorp.vn','Tập đoàn Công nghệ TechCorp','Thuê nguyên căn tòa nhà làm văn phòng chính','DANG_XU_LY',1,'2026-09-18 21:26:12',NULL,'nguyenvanc',NULL),(36,'Lê Hoàng Cường','0933112233','cuong.le@designstudio.com','Studio Thiết kế Cường Lê','Cần thuê diện tích 80m2 - 100m2 có sẵn nội thất','DA_XU_LY',1,'2026-09-18 21:26:12',NULL,'nguyenvanc',NULL),(37,'Phạm Minh Đức','0977889900','duc.pham@startup.io','Công ty Cổ phần Startup Việt','Tìm văn phòng giá rẻ khu vực Quận 10 hoặc Tân Bình','CHUA_XU_LY',1,'2026-09-18 21:26:12',NULL,'nguyenvanc',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentarea`
--

DROP TABLE IF EXISTS `rentarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentarea` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `buildingid` bigint DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rentarea_building` (`buildingid`),
  CONSTRAINT `rentarea_building` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentarea`
--

LOCK TABLES `rentarea` WRITE;
/*!40000 ALTER TABLE `rentarea` DISABLE KEYS */;
INSERT INTO `rentarea` VALUES (3,200,2,NULL,NULL,NULL,NULL),(4,300,2,NULL,NULL,NULL,NULL),(5,400,2,NULL,NULL,NULL,NULL),(49,100,4,NULL,NULL,NULL,NULL),(50,400,4,NULL,NULL,NULL,NULL),(51,250,4,NULL,NULL,NULL,NULL),(90,300,1,NULL,NULL,NULL,NULL),(91,200,75,NULL,NULL,NULL,NULL),(92,300,75,NULL,NULL,NULL,NULL),(93,500,76,NULL,NULL,NULL,NULL),(94,800,76,NULL,NULL,NULL,NULL),(95,300,77,NULL,NULL,NULL,NULL),(96,450,77,NULL,NULL,NULL,NULL),(97,250,78,NULL,NULL,NULL,NULL),(98,350,78,NULL,NULL,NULL,NULL),(99,400,79,NULL,NULL,NULL,NULL),(100,600,79,NULL,NULL,NULL,NULL),(101,300,80,NULL,NULL,NULL,NULL),(102,500,80,NULL,NULL,NULL,NULL),(103,700,80,NULL,NULL,NULL,NULL),(104,150,81,NULL,NULL,NULL,NULL),(105,250,81,NULL,NULL,NULL,NULL),(106,300,61,NULL,NULL,NULL,NULL),(107,350,61,NULL,NULL,NULL,NULL),(108,250,64,NULL,NULL,NULL,NULL),(109,350,64,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rentarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Quản lý','MANAGER',NULL,NULL,NULL,NULL),(2,'Nhân viên','STAFF',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `staffid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_transaction` (`customerid`),
  KEY `fk_transaction_user` (`staffid`),
  CONSTRAINT `fk_customer_transaction` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_transaction_user` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'CSKH','Khách hàng yêu cầu tư vấn báo giá thuê mặt bằng',1,'2026-08-31 10:24:12','2026-08-31 10:24:12','nguyenvana','nguyenvana',1),(3,'CSKH','Gửi hợp đồng mẫu và trao đổi qua email',3,'2026-08-31 10:24:12','2026-08-31 10:24:12','danhduong','danhduong',6),(5,'CSKH','Khách gọi điện hỏi về tiến độ bàn giao mặt bằng',1,'2026-08-20 09:15:00','2026-08-20 09:15:00','nguyenvana','nguyenvana',1),(7,'CSKH','Gửi báo giá chi tiết và chính sách ưu đãi qua Zalo',2,'2026-08-21 10:00:00','2026-08-21 10:00:00','nguyenvanc','nguyenvanc',3),(9,'CSKH','Tư vấn phương án chia nhỏ diện tích văn phòng',3,'2026-08-23 11:20:00','2026-08-23 11:20:00','danh','danh',5),(13,'CSKH','Xác nhận thông tin hợp đồng gia hạn thuê',14,'2026-08-27 11:30:00','2026-08-27 11:30:00','nguyenvana','nguyenvana',1),(14,'CSKH','Gửi lại thông tin dự án qua Email do khách báo chưa nhận được',20,'2026-08-29 13:40:00','2026-08-29 13:40:00','danhduong','danhduong',6),(15,'CSKH','Gọi điện tư vấn báo giá và diện tích trống',1,'2026-08-20 09:15:00','2026-08-20 09:15:00','nguyenvana','nguyenvana',1),(16,'CSKH','Gửi báo giá chi tiết và chính sách ưu đãi qua Zalo',2,'2026-08-21 10:00:00','2026-08-21 10:00:00','nguyenvanc','nguyenvanc',3),(17,'CSKH','Tư vấn phương án chia nhỏ diện tích văn phòng',3,'2026-08-23 11:20:00','2026-08-23 11:20:00','danh','danh',5),(18,'CSKH','Tư vấn yêu cầu thuê mặt bằng làm trung tâm gia sư',10,'2026-08-27 11:00:00','2026-09-10 22:42:52','nguyenvana','nguyenvana',1),(19,'CSKH','Gửi lại thông tin dự án qua Email do khách báo chưa nhận được',20,'2026-08-29 13:40:00','2026-08-29 13:40:00','danhduong','danhduong',6),(20,'DDX','Dẫn khách đi xem ô đất số 05 tầng 3',1,'2026-08-22 14:30:00','2026-08-22 14:30:00','nguyenvanb','nguyenvanb',2),(21,'DDX','Khách hàng hẹn khảo sát vị trí đỗ xe của tòa nhà',2,'2026-08-25 16:00:00','2026-08-25 16:00:00','nguyenvand','nguyenvand',4),(22,'DDX','Chốt lịch dẫn đại diện doanh nghiệp xem thực địa',3,'2026-08-26 08:45:00','2026-08-26 08:45:00','danhduong','danhduong',6),(23,'DDX','Dẫn khách đi khảo sát khu vực tòa nhà chọc trời',10,'2026-08-28 15:10:00','2026-08-28 15:10:00','nguyenvanb','nguyenvanb',2),(28,'DDX','testb',1,'2026-09-04 14:04:23','2026-09-04 14:25:09','nguyenvanb','nguyenvanb',2),(29,'CSKH','Đã gọi điện tư vấn nhu cầu thuê tòa nhà Landmark 81, khách cần gửi báo giá qua email',1,'2026-09-09 22:16:40',NULL,'admin',NULL,2),(31,'CSKH','Khách báo giá thuê hơi cao, đang thương lượng giảm 5% phí dịch vụ',2,'2026-09-09 22:16:40',NULL,'admin',NULL,2),(44,'CSKH','Đã trao đổi về các điều kiện nội thất sẵn có theo yêu cầu.',37,'2026-09-18 21:35:17','2026-09-18 21:35:17','nguyenvana','nguyenvana',1),(45,'DDX','Dẫn khách đi xem thực tế mặt bằng Studio thiết kế.',37,'2026-09-18 21:35:27','2026-09-18 21:35:27','nguyenvana','nguyenvana',1),(46,'CSKH','Tư vấn các tòa nhà phân khúc giá rẻ tại khu vực Tân Bình.',37,'2026-09-18 21:35:47','2026-09-18 21:35:47','nguyenvana','nguyenvana',1),(47,'DDX','Khách hàng quay lại tái khảo sát khu vực để chuẩn bị ký kết.',37,'2026-09-18 21:36:19','2026-09-18 21:36:19','nguyenvanb','nguyenvanb',2),(48,'CSKH','Khách hàng gửi yêu cầu chỉnh sửa lại hợp đồng đặt cọc dự kiến.',35,'2026-09-18 21:36:33','2026-09-18 21:36:33','nguyenvanb','nguyenvanb',2),(49,'DDX','Dẫn khách đi xem thực tế mặt bằng Studio thiết kế.',35,'2026-09-18 21:36:39','2026-09-18 21:36:39','nguyenvanb','nguyenvanb',2),(50,'CSKH','Đã trao đổi về các điều kiện nội thất sẵn có theo yêu cầu.',24,'2026-09-18 21:36:54','2026-09-18 21:36:54','nguyenvanb','nguyenvanb',2),(51,'DDX','Dẫn khách đi xem thực tế mặt bằng Studio thiết kế.',27,'2026-09-18 21:37:11','2026-09-18 21:37:11','nguyenvanb','nguyenvanb',2),(52,'DDX','Hẹn lịch đi xem mặt bằng khu vực Quận 10 và Tân Bình vào sáng thứ Bảy.',36,'2026-09-18 21:38:19','2026-09-18 21:38:19','nguyenvana','nguyenvana',1),(53,'CSKH','Liên hệ lại trao đổi về mức phí dịch vụ và diện tích trống.',36,'2026-09-18 21:38:29','2026-09-18 21:38:29','nguyenvana','nguyenvana',1),(54,'CSKH','Đã gọi điện tư vấn nhu cầu thuê văn phòng Quận 1, khách hẹn phản hồi vào tuần tới.',34,'2026-09-18 21:38:45','2026-09-18 21:38:45','nguyenvana','nguyenvana',1),(55,'CSKH','Gửi báo giá chi tiết các tòa nhà hạng A theo yêu cầu qua email.',25,'2026-09-18 21:39:19','2026-09-18 21:39:19','nguyenvana','nguyenvana',1),(56,'CSKH','Liên hệ lại trao đổi về mức phí dịch vụ và diện tích trống.',25,'2026-09-18 21:39:26','2026-09-18 21:39:26','nguyenvana','nguyenvana',1),(57,'DDX','Khách hàng đã đi khảo sát thực tế văn phòng tại Centec Tower.',25,'2026-09-18 21:39:33','2026-09-18 21:39:33','nguyenvana','nguyenvana',1),(58,'DDX','Khách hàng đã đi khảo sát thực tế văn phòng tại Centec Tower.',25,'2026-09-18 21:39:33','2026-09-18 21:39:33','nguyenvana','nguyenvana',1);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van a',NULL,NULL,1,NULL,NULL,NULL,NULL),(2,'nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van b',NULL,NULL,1,NULL,NULL,NULL,NULL),(3,'nguyenvanc','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van c',NULL,NULL,1,NULL,NULL,NULL,NULL),(4,'nguyenvand','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van d',NULL,NULL,1,NULL,NULL,NULL,NULL),(5,'danh','$2a$10$rrJuL6JbTG2IhkfWmDWDHu.k02G508rmzZvuxRwuTWLaxNxv4e/aC','Danh Duong',NULL,NULL,0,NULL,'2026-08-22 21:30:28',NULL,'nguyenvana'),(6,'danhduong','$2a$10$biixzwHp4rnw6My1cWRLQO7mAhc56/ASa/O.HRcL7HO5s0IV4YSqe','Dương Đình Danh',NULL,NULL,0,'2026-08-05 21:27:11','2026-08-20 22:53:54','anonymousUser','nguyenvana'),(11,'test','$2a$10$WX17b9.n7ZsXJuvqWZvvtOTedp4yAFL38Z6UMFJ3WwcKeuCdNZoNO','test',NULL,NULL,0,'2026-09-10 15:37:20','2026-09-10 15:41:28','nguyenvana','nguyenvana'),(12,'chienla','$2a$10$SqisacomiNuT.ZGvfquKaeawW4y6YoypU9c5/rXc6RTPnzEBtfn9O','Anh Nguyen',NULL,NULL,0,'2026-09-10 15:41:04','2026-09-10 15:42:37','nguyenvana','nguyenvana'),(13,'duongdinhdanh','$2a$10$faRCcPXETR9zpcZe.hX6pukD0pEkQ/1ZVulZ14xtBemkh0MTigJea','Dương Đình Danh',NULL,NULL,1,'2026-09-10 21:39:18','2026-09-10 21:39:18','nguyenvana','nguyenvana'),(14,'langocchien','$2a$10$xD3ZThKN4BvhXyru5SirJOyObfv45Nn.HogWP9DjDYWT7ZnYze85O','Lã Ngọc Chiến',NULL,NULL,0,'2026-09-10 21:52:45','2026-09-11 08:57:18','nguyenvana','nguyenvana'),(15,'vuthihue','$2a$10$4ox0uJug8F2DaHu3ooe6rOFt6g.SlO4plov8NpNCTjuWbcUmEUkKm','Vũ Thị Huệ',NULL,NULL,1,'2026-09-10 21:53:23','2026-09-10 21:53:23','nguyenvana','nguyenvana');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`user_id`),
  KEY `fk_role_user` (`role_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL,NULL),(3,2,3,NULL,NULL,NULL,NULL),(4,2,4,NULL,NULL,NULL,NULL),(6,2,6,NULL,NULL,NULL,NULL),(9,1,5,NULL,NULL,NULL,NULL),(10,2,11,NULL,NULL,NULL,NULL),(12,1,12,NULL,NULL,NULL,NULL),(13,1,13,NULL,NULL,NULL,NULL),(14,2,14,NULL,NULL,NULL,NULL),(15,2,15,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-18 21:46:14
