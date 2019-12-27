-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: lyonabeauty
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理者ID',
  `name` varchar(40) NOT NULL COMMENT '管理者名',
  `email` varchar(40) NOT NULL COMMENT 'forLoginID',
  `password` varchar(255) NOT NULL COMMENT 'パスワード',
  `admin_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:culator,1:admin',
  `disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `created` int(11) DEFAULT NULL COMMENT '作成日',
  `updated` int(11) DEFAULT NULL COMMENT '更新日',
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`email`,`password`,`disable`),
  KEY `admin_type` (`id`,`admin_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Admins master';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Admin','admin@conlatatca.info','12ncv_zdI0B5zqWb18bPmVeWXzHvSQ8uFUS7eLyIzzdTRzNnMVJfS0dRTTlMM0NSOXNpWTF6N2g3RnFJWTkxd1JwZm45cG5zdUFz',1,0,1520407450,1520410149,'http://img.lyonabeauty.localhost/2019/04/23/108156cc4c30086a36af3db81c983259.png');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticates`
--

DROP TABLE IF EXISTS `authenticates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticates` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '`user_id/admin_id base on type',
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT 'トークン',
  `expire_date` int(11) NOT NULL DEFAULT '0' COMMENT 'トークンの期限',
  `regist_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'user/admin',
  `created` int(11) DEFAULT NULL COMMENT '作成日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticates`
--

LOCK TABLES `authenticates` WRITE;
/*!40000 ALTER TABLE `authenticates` DISABLE KEYS */;
INSERT INTO `authenticates` VALUES (1,1,'7aad20077498eacaf4e0e18c4c02dd8e7374ec5d619885cabc4657be50aaa8fa4da43f1759830efbb3be4970f6fbb830c244790ad62a77b0ec63aa3a729f1ac6',1566195281,'admin',1520410702);
/*!40000 ALTER TABLE `authenticates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `disable` tinyint(1) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'sl 1','http://img.lyonabeauty.localhost/2019/04/25/aaedf544611e1a581cda95f560c53c6a.png','sa',NULL,1,NULL,NULL),(2,'sl 2','http://img.lyonabeauty.localhost/2019/04/25/575f93bb98e798e01519f6995f19f8e6.png','sadsad',NULL,1,NULL,NULL),(3,'sl3','http://img.lyonabeauty.localhost/2019/04/25/fe13fdc8ef50bf6643d900e3e1b44787.png','sadas',1,1,1556185822,1556185822),(4,'asdasd','http://img.lyonabeauty.localhost/2019/04/27/6ad73d8bfe0c25e2b04e693e4a893307.jpg',NULL,1,0,1556351618,1556351618),(5,'sasf1','http://img.lyonabeauty.localhost/2019/04/27/63a8d72ed8547b727692822ee8a97733.jpg',NULL,2,1,1556351631,1556351631);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cates`
--

DROP TABLE IF EXISTS `cates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `position` int(11) DEFAULT '0',
  `is_homepage` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '1',
  `disable` tinyint(1) DEFAULT '0',
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_order` (`position`),
  KEY `cate_url` (`url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cates`
--

LOCK TABLES `cates` WRITE;
/*!40000 ALTER TABLE `cates` DISABLE KEYS */;
INSERT INTO `cates` VALUES (12,'Duong da','duong-da',NULL,1,1,1,0,1556351784,1556351784),(13,'Lam sach','lam-sach',NULL,2,1,1,0,1556351807,1556351807),(14,'Trang diem nen','trang-diem-nen',NULL,3,1,1,0,1556351818,1556351818),(15,'Cham soc co the','cham-soc-co-the',NULL,4,1,1,0,1556351841,1556351841),(16,'San pham khac','san-pham-khac',NULL,5,1,1,0,1556351859,1556351859),(20,'Kem tay trang','kem-tay-trang',14,2,1,1,0,1556351959,1556354526),(21,'Kem lot','kem-lot',16,1,1,1,1,1556351989,1556437992),(22,'Kem tao hieu ung','kem-tao-hieu-ung',13,2,1,1,1,1556352002,1556354497),(23,'Bi quyet chong nong bao ve da','bi-quyet-chong-nong-bao-ve-da',NULL,1,NULL,2,0,1556438750,1556438750),(24,'Cach cham soc da','cach-cham-soc-da',NULL,2,NULL,2,0,1556438766,1556438766),(25,'Goc lam dep','goc-lam-dep',NULL,3,NULL,2,0,1556438774,1556438774);
/*!40000 ALTER TABLE `cates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zalo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  `script_header` text COLLATE utf8_unicode_ci,
  `script_body` text COLLATE utf8_unicode_ci,
  `script_footer` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Lyona Beauty','http://img.lyonabeauty.localhost/2018/08/29/8e8b7dd8fed464bc67ba6ae1fc1b4cca.png','http://img.lyonabeauty.localhost/2018/08/29/6ee7b1e00c4e64b4f798368abad16398.jpg','Lyona Beauty','lyona beauty, my pham cao cap, ban my pham, kem trang da','mhanhqb1@gmail.com','0968677633','Le Thuy - Quang Binh, Tang Nhon Phu B','https://www.facebook.com/mai.hoanganh.16','youtube.com','instagram.com','sadasd','google.com.vn','twitter.com',NULL,NULL,'sad','asd','asd');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Hoàng Anh Mai','1649681802','mhanhqb1@gmail.com','sadsadas',1557304853);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `disable` tinyint(1) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','21321331321',NULL,NULL,'mhanhqb1@gmail.com','sasd',0,1556267988,1556268238);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_qty` int(11) DEFAULT '0',
  `detail` text COLLATE utf8_unicode_ci,
  `note` varchar(450) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_price` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `discount` int(11) DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0',
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,0,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',3,'[{\"id\":\"2\",\"url\":\"san-pham-2\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/26\\/11c4c69616e88c82df0441925fd4f8a9.png\",\"name\":\"san pham 2\",\"price\":203,\"qty\":\"3\"}]','sadada',609,0,0,0,1557242553,1557242553),(2,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',33,'[{\"id\":\"4\",\"url\":\"sua-duong-the-lam-sang-da-grapefruits-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/89ecc0c9b1a5d0c78d204d24ef422b5e.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 L\\u00e0m S\\u00e1ng Da GRAPEFRUITS BODY LOTION\",\"price\":23123000,\"qty\":\"10\"},{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"11\"},{\"id\":\"2\",\"url\":\"san-pham-2\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/26\\/11c4c69616e88c82df0441925fd4f8a9.png\",\"name\":\"san pham 2\",\"price\":203,\"qty\":\"12\"}]','sadsadsa',234136436,NULL,NULL,0,1557242712,1557242712),(3,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',1,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"1\"}]','sasd',264000,NULL,NULL,0,1557243363,1557243363),(4,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',7,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"4\"},{\"id\":\"2\",\"url\":\"san-pham-2\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/26\\/11c4c69616e88c82df0441925fd4f8a9.png\",\"name\":\"san pham 2\",\"price\":203,\"qty\":\"3\"}]','aaaaa',1056609,NULL,NULL,0,1557243412,1557243412),(5,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',3,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":2},{\"id\":\"4\",\"url\":\"sua-duong-the-lam-sang-da-grapefruits-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/89ecc0c9b1a5d0c78d204d24ef422b5e.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 L\\u00e0m S\\u00e1ng Da GRAPEFRUITS BODY LOTION\",\"price\":23123000,\"qty\":\"1\"}]','sda',23651000,NULL,NULL,1,1557243560,1557243560),(6,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',1,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"1\"}]',NULL,264000,NULL,NULL,0,1557754570,1557754570),(7,NULL,NULL,NULL,NULL,NULL,1,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"1\"}]',NULL,264000,NULL,NULL,0,1557754575,1557754575),(8,NULL,NULL,NULL,NULL,NULL,1,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"1\"}]',NULL,264000,NULL,NULL,0,1557754615,1557754615),(9,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',1,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"1\"}]',NULL,264000,NULL,NULL,0,1557755095,1557755095),(10,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',2,'[{\"id\":\"4\",\"url\":\"sua-duong-the-lam-sang-da-grapefruits-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/89ecc0c9b1a5d0c78d204d24ef422b5e.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 L\\u00e0m S\\u00e1ng Da GRAPEFRUITS BODY LOTION\",\"price\":23123000,\"qty\":\"1\"},{\"id\":\"1\",\"url\":\"product-1\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/26\\/7d6922ed95c877e99dce13ab685ff177.png\",\"name\":\"product 1\",\"price\":\"1321312\",\"qty\":\"1\"}]',NULL,24444312,NULL,NULL,0,1557756830,1557756830),(11,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',2,'[{\"id\":\"4\",\"url\":\"sua-duong-the-lam-sang-da-grapefruits-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/89ecc0c9b1a5d0c78d204d24ef422b5e.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 L\\u00e0m S\\u00e1ng Da GRAPEFRUITS BODY LOTION\",\"price\":23123000,\"qty\":\"1\"},{\"id\":\"1\",\"url\":\"product-1\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/26\\/7d6922ed95c877e99dce13ab685ff177.png\",\"name\":\"product 1\",\"price\":\"1321312\",\"qty\":\"1\"}]',NULL,24444312,NULL,NULL,0,1557757324,1557757324),(12,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',2,'[{\"id\":\"4\",\"url\":\"sua-duong-the-lam-sang-da-grapefruits-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/89ecc0c9b1a5d0c78d204d24ef422b5e.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 L\\u00e0m S\\u00e1ng Da GRAPEFRUITS BODY LOTION\",\"price\":23123000,\"qty\":\"1\"},{\"id\":\"1\",\"url\":\"product-1\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/26\\/7d6922ed95c877e99dce13ab685ff177.png\",\"name\":\"product 1\",\"price\":\"1321312\",\"qty\":\"1\"}]',NULL,24444312,NULL,NULL,0,1557757649,1557757649),(13,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',2,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"1\"},{\"id\":\"2\",\"url\":\"san-pham-2\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/26\\/11c4c69616e88c82df0441925fd4f8a9.png\",\"name\":\"san pham 2\",\"price\":203,\"qty\":\"1\"}]',NULL,264203,NULL,NULL,0,1557757768,1557757768),(14,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',1,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"1\"}]','sadsad',264000,NULL,NULL,0,1557805968,1557805968),(15,NULL,'Hoàng Anh Mai','Le Thuy - Quang Binh, Tang Nhon Phu B','1649681802','mhanhqb1@gmail.com',3,'[{\"id\":\"3\",\"url\":\"sua-duong-the-chong-lao-hoa-raspberry-body-lotion\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/28\\/7a2c1159fb960f1b6419163e57218878.jpg\",\"name\":\"S\\u1eefa D\\u01b0\\u1ee1ng Th\\u1ec3 Ch\\u1ed1ng L\\u00e3o H\\u00f3a RASPBERRY BODY LOTION\",\"price\":264000,\"qty\":\"2\"},{\"id\":\"2\",\"url\":\"san-pham-2\",\"image\":\"http:\\/\\/img.lyonabeauty.localhost\\/2019\\/04\\/26\\/11c4c69616e88c82df0441925fd4f8a9.png\",\"name\":\"san pham 2\",\"price\":203,\"qty\":\"1\"}]','ssadas',528203,NULL,NULL,0,1563603265,1563603265);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `seo_keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disable` tinyint(1) DEFAULT '0',
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_url` (`url`) USING BTREE,
  KEY `cate_id_idx` (`cate_id`),
  CONSTRAINT `cate_id` FOREIGN KEY (`cate_id`) REFERENCES `cates` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (18,23,'bai viet 1','bai-viet-1','http://img.lyonabeauty.localhost/2019/04/26/0fc77a42cdbcc3f2c76831de8a297fcd.png','sadsa',NULL,'sad','sadsadsa',0,NULL,1556591309),(19,24,'saada','saada','http://img.lyonabeauty.localhost/2019/04/26/9e5c672ce18fb13cc252134b1ee0e374.png','sadasd','<h2 data-mce-style=\"text-align: justify;\"><strong>Cushion &ndash; Sản phẩm trang điểm kh&ocirc;ng thể thiếu của mọi c&ocirc; g&aacute;i&nbsp;</strong></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p data-mce-style=\"text-align: justify; line-height: 150%;\">C&oacute; thể n&oacute;i đ&acirc;y l&agrave; sản phẩm makeup quen thuộc nếu ai muốn sở hữu một lớp nền căng b&oacute;ng như sao H&agrave;n. Một điểm nổi trội kh&ocirc;ng thể bỏ qua của cushion l&agrave; kh&ocirc;ng chỉ che khuyết điểm m&agrave; c&ograve;n gi&uacute;p nu&ocirc;i dưỡng v&agrave; bảo vệ da.</p>\r\n\r\n<p data-mce-style=\"text-align: justify; line-height: 150%;\">Điển h&igrave;nh ch&iacute;nh l&agrave; d&ograve;ng cushion từ thương hiệu THEFACESHOP đ&igrave;nh đ&aacute;m của H&agrave;n Quốc. Cho ra đời rất nhiều d&ograve;ng phấn nước đa dạng, ph&ugrave; hợp mọi loại da v&agrave; lu&ocirc;n ch&uacute; trọng đến sức khỏe l&agrave;n da. Mang theo ti&ecirc;u ch&iacute; gi&uacute;p ph&aacute;i đẹp c&oacute; được l&agrave;n da trang điểm đẹp tự nhi&ecirc;n v&agrave; an to&agrave;n. L&agrave; thương hiệu của thi&ecirc;n nhi&ecirc;n n&ecirc;n trong c&aacute;c d&ograve;ng sản phẩm cushion của THEFACESHOP đều chiết xuất tự nhi&ecirc;n. T&iacute;ch hợp nhiều dưỡng chất cần thiết bổ sung chăm s&oacute;c, gi&uacute;p l&agrave;n da trắng mịn, khỏe khắn hơn mỗi ng&agrave;y. Đồng thời, chỉ số chống nắng SPF bảo vệ da l&agrave; kh&ocirc;ng thể thiếu. Giảm bớt lo ngại da bị xấu di khi trang điểm thường xuy&ecirc;n.</p>\r\n\r\n<h2 data-mce-style=\"text-align: justify;\"><strong>TOP CUSHION TRANG ĐIỂM B&Aacute;N CHẠY TẠI THEFACESHOP</strong></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>1.Phấn Nước Kiểm So&aacute;t Dầu OIL CONTROL WATER CUSHION&nbsp;</strong>COCA COLA</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img data-mce-src=\"//file.hstatic.net/1000036599/file/cocacola.jpg\" src=\"https://file.hstatic.net/1000036599/file/cocacola.jpg\" /></p>\r\n\r\n<p><a data-mce-href=\"https://thefaceshop.com.vn/products/phan-nuoc-kiem-soat-dau-oil-control-water-cushion-v203-phien-ban-gioi-han-coca-cola\" href=\"https://thefaceshop.com.vn/products/phan-nuoc-kiem-soat-dau-oil-control-water-cushion-v203-phien-ban-gioi-han-coca-cola\" rel=\"noopener noreferrer\" target=\"_blank\"><img data-mce-src=\"//file.hstatic.net/1000036599/file/xem_grande.gif\" data-mce-style=\"display: block; margin-left: auto; margin-right: auto;\" height=\"133\" src=\"https://file.hstatic.net/1000036599/file/xem_grande.gif\" width=\"222\" /></a></p>\r\n\r\n<p data-mce-style=\"text-align: justify; line-height: 150%;\">THEFACESHOP l&agrave; thương hiệu đầu ti&ecirc;n Coca-Cola kết hợp.Mang đến sự trải nghiệm với bộ sưu tập mới nhất d&agrave;nh cho fan h&acirc;m mộ Coca-Cola. M&agrave;u sắc sống động &ldquo;Coke Red&rdquo;, thiết kế đặc biệt sử dụng c&aacute;c bản vẽ nghệ thuật pop, giấy t&aacute;i chế, c&ugrave;ng với hương thơm đặc trưng của Coca-Cola trong sản phẩm mang đến trải nghiệm tuyệt vời cho người sử dụng.</p>\r\n\r\n<p data-mce-style=\"text-align: justify; line-height: 150%;\"><strong>C&ocirc;ng dụng:&nbsp;</strong></p>\r\n\r\n<p data-mce-style=\"text-align: justify; line-height: 150%;\">Mềm mịn với những hạt phấn nước si&ecirc;u mịn theo miếng m&uacute;t như tưới m&aacute;t l&agrave;n da mỗi khi sử dụng. Đ&oacute; ch&iacute;nh l&agrave; ma thuật điểm trang -&nbsp;MIRACLE FINISH OIL CONTROL WATER CUSHION.&nbsp;Phấn nước c&oacute; khả năng chống tr&ocirc;i khi tiếp x&uacute;c với nước rất cao. Giữ ẩm rất tốt v&agrave; khả năng kiềm dầu tối ưu. H&uacute;t lượng dầu thừa tr&ecirc;n bề mặt da, ngăn chặn t&igrave;nh trạng b&oacute;ng dầu l&ecirc;n đến 8h.</p>\r\n\r\n<p data-mce-style=\"text-align: justify; line-height: 150%;\">Khả năng chống tr&ocirc;i khi tiếp x&uacute;c với nước rất cao. Chỉ số chống nắng SPF50+ PA+++ bảo vệ l&agrave;n da an to&agrave;n dưới t&aacute;c hại của tia UV.</p>\r\n\r\n<p data-mce-style=\"text-align: justify; line-height: 150%;\"><strong>Sản phẩm c&oacute; hai m&agrave;u ch&iacute;nh l&agrave; V201 (tone trắng s&aacute;ng) v&agrave; V203 (tone tự nhi&ecirc;n).</strong></p>\r\n\r\n<p data-mce-style=\"text-align: justify;\"><img data-mce-src=\"//file.hstatic.net/1000036599/file/coca.jpg\" src=\"https://file.hstatic.net/1000036599/file/coca.jpg\" /></p>\r\n\r\n<p data-mce-style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p data-mce-style=\"text-align: justify;\"><strong>2.Phấn Nước L&acirc;u Tr&ocirc;i MIRACLE FINISH CC LONG-LASTING CUSHION SPF50+ PA+++</strong></p>\r\n\r\n<p>C&ocirc;ng thức chứa c&aacute;c hạt phấn nước si&ecirc;u mịn theo c&ocirc;ng nghệ Microform mới gi&uacute;p giữ lớp make up lu&ocirc;n tươi tắn v&agrave; khỏe khoắn. D&ugrave; bạn c&oacute; dặm phấn nhiều lần lớp nền cũng kh&ocirc;ng d&agrave;y v&agrave; g&acirc;y b&iacute; da. Gi&uacute;p da lu&ocirc;n ở trạng th&aacute;i c&acirc;n bằng, m&aacute;t da, mềm mịn m&agrave; lại tho&aacute;ng m&aacute;t. V&agrave; ưu điểm phải kể đến của&nbsp;Phấn Nước MIRACLE FINISH CC LONG-LASTING CUSHION SPF50+ PA+++&nbsp;&nbsp;ch&iacute;nh l&agrave; độ che phủ. Chỉ với một lớp mỏng sẽ gi&uacute;p che phủ mọi khuyết điểm, mang đến l&agrave;n da mịn nhẹ đều m&agrave;u tự nhi&ecirc;n. Phấn nước c&oacute; khả năng chống tr&ocirc;i khi tiếp x&uacute;c với nước rất cao.</p>\r\n\r\n<p><img data-mce-src=\"//file.hstatic.net/1000036599/file/cc_long_last.jpg\" src=\"https://file.hstatic.net/1000036599/file/cc_long_last.jpg\" /></p>\r\n\r\n<p><a data-mce-href=\"https://thefaceshop.com.vn/products/phan-nuoc-da-nang-miracle-finish-cc-long-lasting-cushion-spf50-pa-v201\" href=\"https://thefaceshop.com.vn/products/phan-nuoc-da-nang-miracle-finish-cc-long-lasting-cushion-spf50-pa-v201\" rel=\"noopener noreferrer\" target=\"_blank\"><img data-mce-src=\"//file.hstatic.net/1000036599/file/xem_grande.gif\" data-mce-style=\"display: block; margin-left: auto; margin-right: auto;\" height=\"139\" src=\"https://file.hstatic.net/1000036599/file/xem_grande.gif\" width=\"232\" /></a></p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, sản phẩm sẽ gi&uacute;p hiệu chỉnh sắc da, tăng khả năng b&aacute;m phấn, hạn chế tr&ocirc;i phấn. Đặc biệt, h&agrave;m lượng dưỡng chất trong sản phẩm sẽ gi&uacute;p chống oxy h&oacute;a, mang đến l&agrave;n da lu&ocirc;n trẻ khỏe v&agrave; tươi s&aacute;ng.&nbsp;Lớp nền của bạn sẽ tỏa s&aacute;ng lung linh cả ng&agrave;y.</p>\r\n\r\n<h3 data-mce-style=\"text-align: justify;\"><strong>3. Phấn nước Chống Thấm Nước TFS Waterproof Cushion</strong></h3>\r\n\r\n<p><img data-mce-src=\"//file.hstatic.net/1000036599/file/ph_n_n__c_tfs_waterproof_cushion.jpg\" src=\"https://file.hstatic.net/1000036599/file/ph_n_n__c_tfs_waterproof_cushion.jpg\" /></p>\r\n\r\n<p><a data-mce-href=\"https://thefaceshop.com.vn/products/phan-nuoc-trang-diem-da-nang-tfs-waterproof-cushion-v203\" href=\"https://thefaceshop.com.vn/products/phan-nuoc-trang-diem-da-nang-tfs-waterproof-cushion-v203\" rel=\"noopener noreferrer\" target=\"_blank\"><img data-mce-src=\"//file.hstatic.net/1000036599/file/xem_grande.gif\" data-mce-style=\"display: block; margin-left: auto; margin-right: auto;\" height=\"147\" src=\"https://file.hstatic.net/1000036599/file/xem_grande.gif\" width=\"246\" /></a></p>\r\n\r\n<p data-mce-style=\"text-align: justify; line-height: 150%;\">Khi đi nắng hay hoạt động nhiều sẽ g&acirc;y đổ mồ h&ocirc;i, v&agrave; n&oacute; sẽ l&agrave;m tr&ocirc;i đi lớp nền mất đi vẻ thẩm mỹ khi make up. Lớp trang điểm sẽ c&oacute; dấu hiệu nhem nhuốc khiến diện mạo của bạn trở k&eacute;m xinh tươi.&nbsp;Phấn nước&nbsp;TFS Waterproof Cushion&nbsp;gi&uacute;p duy tr&igrave; lớp nền trang điểm tươi s&aacute;ng tự nhi&ecirc;n suốt cả ng&agrave;y.&nbsp;Một giải ph&aacute;p trang điểm kh&ocirc;ng thể tuyệt vời hơn cho bạn g&aacute;i hiện đại.&nbsp;</p>\r\n\r\n<p data-mce-style=\"text-align: justify; line-height: 150%;\">C&ocirc;ng thức chống tr&ocirc;i trong nước v&agrave; b&atilde; nhờn gi&uacute;p kiểm so&aacute;t tốt t&igrave;nh trạng dầu thừa, chống xỉn m&agrave;u v&agrave; duy tr&igrave; lớp nền tươi s&aacute;ng l&acirc;u d&agrave;i. &nbsp;Cấu tạo c&aacute;c hạt mịn si&ecirc;u nhỏ b&aacute;m d&iacute;nh v&agrave; thẩm thấu tốt.&nbsp;Độ che phủ khuyết điểm tối ưu với hiệu ứng mờ nhờ những hạt phấn si&ecirc;u mịn cho nền da mỏng mịn tự nhi&ecirc;n.&nbsp;Che mọi khuyết điểm tr&ecirc;n da ho&agrave;n hảo, đem lại một l&agrave;n da rạng ngời tự nhi&ecirc;n nhất.&nbsp;</p>\r\n\r\n<p data-mce-style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<h3 data-mce-style=\"text-align: justify;\"><strong>4.Phấn Nước Kiểm So&aacute;t Dầu MIRACLE FINISH OIL CONTROL WATER CUSHION SPF50+ PA+++</strong></h3>\r\n\r\n<p><img data-mce-src=\"//file.hstatic.net/1000036599/file/oil-control-water_a15d397284ae44d19bebb9cf38c8bb71.jpg\" src=\"https://file.hstatic.net/1000036599/file/oil-control-water_a15d397284ae44d19bebb9cf38c8bb71.jpg\" /></p>\r\n\r\n<p>Phấn nước sẽ gi&uacute;p giữ vững lớp trang điểm lu&ocirc;n tươi mới. Mang lại l&agrave;n da kh&ocirc;ng b&oacute;ng dầu trong suốt Mềm mịn với những hạt phấn nước si&ecirc;u mịn theo miếng m&uacute;t như tưới m&aacute;t l&agrave;n da mỗi khi sử dụng. Đ&oacute; ch&iacute;nh l&agrave; ma thuật điểm trang - MIRACLE FINISH OIL CONTROL WATER CUSHION.- Giữ ẩm rất tốt v&agrave; khả năng kiềm dầu tối ưu. Sau nhiều giờ l&agrave;m việc trong m&ocirc;i trường điều ho&agrave;, l&agrave;n da của bạn cũng kh&ocirc;ng hề thấy kh&ocirc;, v&agrave; đặc biệt tiết rất &iacute;t dầu. V&agrave; bạn cũng kh&ocirc;ng lo ngại đi dưới nắng n&oacute;ng v&igrave; cushion t&iacute;ch hợp chỉ số SPF50+ PA+++ bảo vệ da vượt trội khỏi t&aacute;c hại của tia UV</p>\r\n\r\n<p><a data-mce-href=\"https://thefaceshop.com.vn/products/phan-nuoc-kiem-soat-dau-miracle-finish-oil-control-water-cushion-spf50-pa-v201\" href=\"https://thefaceshop.com.vn/products/phan-nuoc-kiem-soat-dau-miracle-finish-oil-control-water-cushion-spf50-pa-v201\" rel=\"noopener noreferrer\" target=\"_blank\"><img data-mce-src=\"//file.hstatic.net/1000036599/file/xem_grande.gif\" data-mce-style=\"display: block; margin-left: auto; margin-right: auto;\" height=\"128\" src=\"https://file.hstatic.net/1000036599/file/xem_grande.gif\" width=\"214\" /></a></p>\r\n\r\n<p data-mce-style=\"text-align: justify;\">Cushion l&agrave; t&iacute;ch hợp c&ocirc;ng dụng 3 in 1. Chỉ trong 1 bước trang điểm bằng phấn nước Cushion, bạn đ&atilde; c&oacute; thể thực hiện được 3 bước trang điểm th&ocirc;ng thường: kem nền, kem che khuyết điểm v&agrave; chống nắng cho da. Vừa makeup nhanh, tự nhi&ecirc;n kh&ocirc;ng sợ b&iacute; da, vừa kiểm so&aacute;t nhờn bảo vệ được cho l&agrave;n da d&ugrave; c&oacute; trang điểm mỗi ng&agrave;y. Vậy c&ograve;n chờ g&igrave; m&agrave; bạn kh&ocirc;ng trang bị cho m&igrave;nh một sản phẩm cushion chống nắng từ THEFACESHOP ngay đi n&agrave;o ! Thỏa sức vui h&egrave; kh&ocirc;ng lo da xấu!</p>\r\n\r\n<p data-mce-style=\"text-align: center;\"><strong>ĐẶT MUA CUSHION THEFACESHOP VỚI GI&Aacute; ƯU Đ&Atilde;I TẠI Đ&Acirc;Y</strong></p>\r\n\r\n<p><a data-mce-href=\"https://thefaceshop.com.vn/collections/cushion\" href=\"https://thefaceshop.com.vn/collections/cushion\" rel=\"noopener noreferrer\" target=\"_blank\"><img data-mce-src=\"//file.hstatic.net/1000036599/file/870x700-cusion.jpg\" src=\"https://file.hstatic.net/1000036599/file/870x700-cusion.jpg\" /></a></p>','sadas','asdasd',1,1556263910,1556594550);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `discount_price` int(11) DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb_image` text COLLATE utf8_unicode_ci,
  `cate_id` int(11) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `detail` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8_unicode_ci,
  `seo_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disable` tinyint(1) DEFAULT '0',
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cate_id_idx` (`cate_id`),
  KEY `product_cate_id_idx` (`cate_id`),
  CONSTRAINT `product_cate_id` FOREIGN KEY (`cate_id`) REFERENCES `cates` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'product 1',1321312,0,'product-1','http://img.lyonabeauty.localhost/2019/04/26/7d6922ed95c877e99dce13ab685ff177.png',NULL,NULL,'asdas','sadasdsa',NULL,'sadasd','23',NULL,0,NULL,1556444076,1),(2,'san pham 2',213,10,'san-pham-2','http://img.lyonabeauty.localhost/2019/04/26/11c4c69616e88c82df0441925fd4f8a9.png',NULL,NULL,'asdasd','sadas',NULL,'asdad','21',NULL,0,1556262833,1556445785,1),(3,'Sữa Dưỡng Thể Chống Lão Hóa RASPBERRY BODY LOTION',274000,10000,'sua-duong-the-chong-lao-hoa-raspberry-body-lotion','http://img.lyonabeauty.localhost/2019/04/28/7a2c1159fb960f1b6419163e57218878.jpg',NULL,NULL,'Sữa dưỡng thể RASPBERRY BODY LOTION với kết cấu mỏng nhẹ, thẩm thấu sâu vào da mang đến cho bạn một làn da khô ráo nhưng vẫn đầy đủ độ ẩm, tránh tình trạng khô da hay bong tróc.','<strong>C&ocirc;ng dụng</strong><br />\r\n<br />\r\nSữa dưỡng thể RASPBERRY BODY LOTION với kết cấu mỏng nhẹ, thẩm thấu s&acirc;u v&agrave;o da mang đến cho bạn một l&agrave;n da kh&ocirc; r&aacute;o nhưng vẫn đầy đủ độ ẩm, tr&aacute;nh t&igrave;nh trạng kh&ocirc; da hay bong tr&oacute;c.&nbsp;<br />\r\n<br />\r\nHương thơm tự nhi&ecirc;n gi&uacute;p mang đến cảm gi&aacute;c dễ chịu khi sử dụng.<br />\r\n<br />\r\n<strong>Th&agrave;nh phần</strong><br />\r\n<br />\r\nChiết xuất từ quả m&acirc;m x&ocirc;i gi&agrave;u chất chống oxi h&oacute;a v&agrave; C gi&uacute;p chăm s&oacute;c cho l&agrave;n da l&atilde;o h&oacute;a v&agrave; bổ sung vitamin cho l&agrave;n da s&aacute;ng khỏe, mịn m&agrave;ng.<br />\r\n<br />\r\n<strong>Hướng dẫn sử dụng</strong><br />\r\n<br />\r\nThoa đ&ecirc;̀u l&ecirc;n da cơ th&ecirc;̉ sau khi tắm hoặc bất cứ l&uacute;c n&agrave;o thấy da kh&ocirc;, thiếu ẩm. Tập trung ở những v&ugrave;ng da kh&ocirc; r&aacute;p, thiếu ẩm.',NULL,NULL,NULL,NULL,0,1556445524,1556445524,1),(4,'Sữa Dưỡng Thể Làm Sáng Da GRAPEFRUITS BODY LOTION',23123123,123,'sua-duong-the-lam-sang-da-grapefruits-body-lotion','http://img.lyonabeauty.localhost/2019/04/28/89ecc0c9b1a5d0c78d204d24ef422b5e.jpg',NULL,NULL,'sadsa','<p><img data-mce-src=\"https://file.hstatic.net/1000036599/file/bo_tinh_chat_duong_sang_min_da_yehwadam_revitalizing_serum_special_gift_set_2ea_new_2019_5_4055504e87124332b612f826c6a0fe08.png\" src=\"https://file.hstatic.net/1000036599/file/bo_tinh_chat_duong_sang_min_da_yehwadam_revitalizing_serum_special_gift_set_2ea_new_2019_5_4055504e87124332b612f826c6a0fe08.png\" /></p>\r\n\r\n<p><strong>Th&agrave;nh phần ch&iacute;nh</strong></p>\r\n\r\n<p>Vẫn chiết xuất từ thảo mộc cao qu&yacute; nhưng c&ocirc;ng thức được cải tiến vượt bậc, tăng t&iacute;nh hiệu quả của sự kết hợp giữa c&aacute;c th&agrave;nh phần thảo mộc lại với nhau: th&agrave;nh phần gồm c&aacute;c loại hạt giống, rễ c&acirc;y, hoa v&agrave; c&aacute;c loại tr&aacute;i c&acirc;y thi&ecirc;n nhi&ecirc;n tại H&agrave;n Quốc, dồi d&agrave;o dưỡng chất gi&uacute;p nu&ocirc;i dưỡng s&acirc;u, cải thiện nếp nhăn v&agrave; c&aacute;c dấu hiệu l&atilde;o ho&aacute;, mang lại l&agrave;n da khoẻ mạnh v&agrave; tươi trẻ.</p>\r\n\r\n<p><img data-mce-src=\"//file.hstatic.net/1000036599/file/yehwadam_20hong.jpg\" src=\"https://file.hstatic.net/1000036599/file/yehwadam_20hong.jpg\" /></p>\r\n\r\n<p><b>EHWADAM REVITALIZING&nbsp;</b>l&agrave; sự kết hợp giữa tinh chất Nh&acirc;n s&acirc;m tự nhi&ecirc;n tại tỉnh Gyeongbuk truyền thống gi&uacute;p t&aacute;i sinh, duy tr&igrave; n&eacute;t tươi trẻ cho l&agrave;n da; kết hợp c&ugrave;ng Hoa Rum sinh trưởng tại n&uacute;i Jiri gi&uacute;p cải thiện l&agrave;n da, ngăn ngừa dấu hiệu l&atilde;o h&oacute;a từ s&acirc;u b&ecirc;n trong, v&agrave; Goji berry được trồng ở Chungnam l&agrave;m s&aacute;ng da, kiểm so&aacute;t qu&aacute; tr&igrave;nh l&atilde;o h&oacute;a tế b&agrave;o da.</p>\r\n\r\n<p><b>YEHWADAM REVITALIZING&nbsp;</b>l&agrave; m&oacute;n qu&agrave; THE<strong>FACE</strong>SHOP d&agrave;nh cho c&aacute;c c&ocirc; g&aacute;i y&ecirc;u th&iacute;ch sử dụng sản phẩm chiết xuất từ Đ&ocirc;ng Y v&agrave; phong c&aacute;ch dưỡng da truyền thống.&nbsp;<b>YEHWADAM REVITALIZING&nbsp;</b>sẽ mang đến hiệu quả cực cao về việc cải thiện nếp nhăn cũng như nu&ocirc;i dưỡng l&agrave;n da, gi&uacute;p l&agrave;n da thiếu độ ẩm v&agrave; l&atilde;o h&oacute;a sớm trở n&ecirc;n căng mướt, tươi s&aacute;ng hơn mỗi ng&agrave;y.</p>\r\n\r\n<p><img data-mce-src=\"//file.hstatic.net/1000036599/file/yehwadam_20hong_206.jpg\" src=\"https://file.hstatic.net/1000036599/file/yehwadam_20hong_206.jpg\" /></p>\r\n\r\n<p><strong>Bộ sản phẩm bao gồm:&nbsp;</strong></p>\r\n1 Tinh chất dưỡng s&aacute;ng hồng da Yehwadam Revitalizing Serum 75ml&nbsp;<br />\r\n1 Sữa rửa mặt Yehwadam Cleansing Foam 50ml&nbsp;<br />\r\n1 Nước c&acirc;n bằng Yehwadam Revitalizing Toner 32ml&nbsp;<br />\r\n1 Sữa dưỡng da Yehwadam Revitalizing Emulsion 32ml&nbsp;<br />\r\n1 Kem dưỡng s&aacute;ng hồng da Yehwadam Revitalizing Cream 10ml&nbsp;<br />\r\n<br />\r\n<br />\r\n<strong>C&ocirc;ng dụng ch&iacute;nh của sản phẩm:&nbsp;</strong><br />\r\n<br />\r\n<br />\r\n<strong>Tinh chất dưỡng s&aacute;ng hồng da Yehwadam Revitalizing Serum 75ml&nbsp;</strong>\r\n\r\n<p><img data-mce-src=\"https://file.hstatic.net/1000036599/file/bo_tinh_chat_duong_sang_min_da_yehwadam_revitalizing_serum_special_gift_set_2ea_new_2019_4_e7a58a74b0f8448cb82717a607891563.png\" src=\"https://file.hstatic.net/1000036599/file/bo_tinh_chat_duong_sang_min_da_yehwadam_revitalizing_serum_special_gift_set_2ea_new_2019_4_e7a58a74b0f8448cb82717a607891563.png\" /></p>\r\n\r\n<p>Tinh chất YEHWADAM REVITALIZING SERUM l&agrave; bước chăm s&oacute;c chuy&ecirc;n s&acirc;u gi&uacute;p cải thiện v&agrave; phục hồi hiệu quả c&aacute;c vấn đề của l&agrave;n da. Đặc biệt với khả năng phục hồi sinh kh&iacute; v&agrave; tăng cường sức đề kh&aacute;ng cho l&agrave;n da, gi&uacute;p l&agrave;n da khỏe hơn, tươi trẻ hơn.</p>\r\n\r\n<p>Sắc da bạn sẽ trở n&ecirc;n hồng h&agrave;o, tươi trẻ nhờ v&agrave;o hiệu quả dưỡng s&aacute;ng mịn da tuyệt vời. Kết cấu tinh chất c&ocirc; đặc nhưng cực nhẹ, thẩm thấu rất nhanh v&agrave;o da, nu&ocirc;i dưỡng s&acirc;u từ b&ecirc;n trong l&agrave;n da ngăn chặn những dấu hiệu l&atilde;o h&oacute;a xuất hiện như kh&ocirc;, nhăn, thiếu mịn m&agrave;ng.</p>\r\n\r\n<p>Đ&acirc;y thật sự l&agrave; một sản phẩm kh&ocirc;ng thể thiếu nếu bạn muốn cải thiện cấu tr&uacute;c da v&agrave; duy tr&igrave; n&eacute;t tươi trẻ cho l&agrave;n da của m&igrave;nh.</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng</strong></p>\r\n\r\n<p>Sử dụng sau bước nước c&acirc;n bằng. Dùng lượng vừa đủ và thoa đ&ecirc;̀u khắp bề mặt da.</p>\r\n\r\n<p><strong>2.&nbsp;Sữa Rửa Mặt YEHWADAM DEEP MOISTURIZING FOAMING CLEANSER</strong></p>\r\n\r\n<p data-mce-style=\"text-align: justify;\">Sữa rửa mặt c&oacute; t&aacute;c dụng l&agrave;m sạch s&acirc;u cho l&agrave;n da, gi&uacute;p loại bỏ c&aacute;c b&atilde; nhờn trong lỗ ch&acirc;n l&ocirc;ng v&agrave; gi&uacute;p cho da bạn sạch sẽ, th&ocirc;ng tho&aacute;ng sau 1 ng&agrave;y d&agrave;i tiếp x&uacute;c với kh&oacute;i bụi. Sữa Rửa Mặt YEHWADAM DEEP MOISTURIZING FOAMING CLEANSER với c&aacute;c th&agrave;nh phần đ&ocirc;ng y qu&yacute; gi&aacute;, dịu nhẹ cho da kh&ocirc;ng g&acirc;y n&ecirc;n sự k&iacute;ch ứng, tấy đỏ khi sử dụng.</p>\r\n\r\n<p><img data-mce-src=\"//file.hstatic.net/1000036599/file/_a-r_a-m_t-d__ng-_m-yehwadam-deep-moisturizing-foaming-cleanser-1.jpg\" src=\"https://file.hstatic.net/1000036599/file/_a-r_a-m_t-d__ng-_m-yehwadam-deep-moisturizing-foaming-cleanser-1.jpg\" /></p>\r\n\r\n<p data-mce-style=\"text-align: justify;\">Sản phẩm đem đến cho bạn l&agrave;n da sạch s&acirc;u nhưng lại kh&ocirc;ng l&agrave;m mất nước trong qu&aacute; tr&igrave;nh rửa mặt, gi&uacute;p da lu&ocirc;n mềm mượt v&agrave; căng tr&agrave;n sức sống để bắt đầu c&aacute;c bước dưỡng da tiếp theo. Sử dụng thường xuy&ecirc;n c&ograve;n gi&uacute;p cải thiện dần kết cấu da, k&iacute;ch th&iacute;ch gia tăng Collagen cho da đầy đặn, săn chắc, căng mịn, t&aacute;i sinh l&agrave;n da trắng hồng, se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng, ngăn ngừa v&agrave; đẩy l&ugrave;i dấu hiệu l&atilde;o h&oacute;a da.</p>\r\n\r\n<p><strong>Set qu&agrave; tặng bao gồm:</strong></p>\r\n\r\n<p><strong>YEHWADAM REVITALIZING TONER (32ml)</strong>&nbsp;- Nước c&acirc;n bằng gi&uacute;p săn mịn lỗ ch&acirc;n l&ocirc;ng, tăng khả năng hấp thụ sản phẩm dưỡng s&acirc;u hơn v&agrave;o da..<br />\r\n<br />\r\n<strong>YEHWADAM REVITALIZING EMULSION</strong>&nbsp;<strong>(32ml)</strong>- Sữa dưỡng gi&uacute;p c&acirc;n bằng ẩm v&agrave; l&agrave;m mềm mịn da..<br />\r\n<br />\r\n<strong>YEHWADAM REVITALIZING CREAM</strong>&nbsp;<strong>(10ml)</strong>- Kem dưỡng cung cấp ẩm, tạo lớp m&agrave;ng bảo vệ v&agrave; kh&oacute;a dưỡng chất cho l&agrave;n da.&nbsp;<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng trọn bộ:&nbsp;</strong></p>\r\n\r\n<p><img data-mce-src=\"https://file.hstatic.net/1000036599/file/untitled_4_recovered_4961aef2079e4f1f80b8c4002390179d.png\" src=\"https://file.hstatic.net/1000036599/file/untitled_4_recovered_4961aef2079e4f1f80b8c4002390179d.png\" /></p>',NULL,'seo description','seo keywords',NULL,0,1556445602,1556584305,1),(5,'CC Cushion Lro\'Cre Forever Perfection SPF 50/PA++',21321312,21,'cc-cushion-lrocre-forever-perfection-spf-50-pa','http://img.lyonabeauty.localhost/2019/05/11/3260e6dddcb0d6060adb011af0ec33a2.jpg',NULL,20,'asd','sadsadas',NULL,NULL,NULL,NULL,0,1557547540,1557547734,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-02 19:18:10
