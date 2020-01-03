-- MySQL dump 10.17  Distrib 10.3.16-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: maclife
-- ------------------------------------------------------
-- Server version	10.3.16-MariaDB

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
  `admin_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:culator,1:admin',
  `disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  `created` int(11) DEFAULT NULL COMMENT '作成日',
  `updated` int(11) DEFAULT NULL COMMENT '更新日',
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`email`,`password`,`disable`),
  KEY `admin_type` (`id`,`admin_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Admins master';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (2,'Admin','admin@cg4vn.net','4aq7ysLqahF9RSRWU9iCI3YsyjKwwc5zM8js1r-zU31Gb09PcTFCOGQyNmR2WU1OY2g4cU9vMC1lanJiWFhaeFpsdnRtbzlLbnVR',0,0,NULL,NULL,'http://img.maclife.localhost/2019/12/28/537eef76e84c2410e97fc61b6cbb5d8f.png');
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
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '`user_id/admin_id base on type',
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT 'トークン',
  `expire_date` int(11) NOT NULL DEFAULT 0 COMMENT 'トークンの期限',
  `regist_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'user/admin',
  `created` int(11) DEFAULT NULL COMMENT '作成日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticates`
--

LOCK TABLES `authenticates` WRITE;
/*!40000 ALTER TABLE `authenticates` DISABLE KEYS */;
INSERT INTO `authenticates` VALUES (2,2,'3ed47f53feb804196bac77c1c29d44ad1a64a16345d8125e27ffd28bd101834b84f298f0be3b13175627e33bef335bed4f8e9e46f0f067fdf191bd33d81526eb',1580091975,'admin',NULL);
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
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `position` int(11) DEFAULT 0,
  `disable` tinyint(1) DEFAULT 0,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_order` (`position`),
  KEY `cate_url` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cates`
--

LOCK TABLES `cates` WRITE;
/*!40000 ALTER TABLE `cates` DISABLE KEYS */;
INSERT INTO `cates` VALUES (26,'Application','application',0,NULL,0,1577493240,1577493240),(28,'tutorial','tutorial',0,NULL,0,1577607307,1577607307),(29,'lifestyle','lifestyle',0,NULL,0,1577607335,1577607335),(30,'app 1','app-1',26,NULL,0,1577607410,1577607410),(31,'app 2','app-2',26,NULL,0,1577607433,1577607433);
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
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script_header` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `script_body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `script_footer` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (2,'Maclife','http://img.maclife.localhost/2019/12/28/bef1d0960b8b404f1dbabf8e7aa9ce96.png','http://img.maclife.localhost/2019/12/28/5c966d961729499d453419eff84fc75f.png','aa','aa','https://www.facebook.com/sexybeautifulgirlcollection/','https://youtube.com','https://twitter.com','','','','http://img.maclife.localhost/2019/12/28/4f35d63b24221cc5c0255d624c0a2fe7.jpeg','Maclife.vn','Từ một người yêu thích các sản phẩm của Apple. Tôi dành tình cảm đặc biệt cho Macbook bởi tính đơn giản, ổn định phù hợp với công việc của mình. Website Maclife.vn ra đời để chia sẻ tất cả những gì mình có.','Maclife.vn là trang chia sẻ miễn phí phần mềm, games, thủ thuật Mac. Chúng tôi cũng cần kinh phí để duy trì hoạt động nên đôi lúc có chèn quảng cáo. Mong được các bạn ủng hộ.',NULL,NULL,'http://img.maclife.localhost/2020/01/02/aebf9b32296b639ddc120b3d54f8b84b.ico');
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
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
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
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (19,22,33),(20,22,34),(21,22,35),(22,22,36),(23,22,37);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
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
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_like` int(11) DEFAULT 0,
  `total_dislike` int(11) DEFAULT 0,
  `total_view` int(11) DEFAULT 0,
  `disable` tinyint(1) DEFAULT 0,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_url` (`slug`) USING BTREE,
  KEY `cate_id_idx` (`cate_id`),
  CONSTRAINT `cate_id` FOREIGN KEY (`cate_id`) REFERENCES `cates` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (20,26,'bài viết 1','bai-viet-1','http://img.maclife.localhost/2019/12/28/bef1d0960b8b404f1dbabf8e7aa9ce96.png','mô tả bài viết 1','Nội dung b&agrave;i viết 1','tu khoa 1, tu khoa 2','Seo description',12,2,5,0,1577493240,1577697816),(21,26,'Artlantis Studio – 3D render cho kiến trúc sư','artlantis-studio-–-3d-render-cho-kien-truc-su','http://img.maclife.localhost/2019/12/30/98d014cee460c43bf59a4dcd7717ab24.jpeg','Artlantis Studio là ứng dụng phần mềm độc đáo được thiết kế chuyên biệt cho các kiến trúc sư và các nhà thiết kế, rất lý tưởng cho việc tạo các bản dựng hình 3 chiều chất lượng cao, các ảnh cuộn QuickTime VR, các đối tượng và hình động nhanh chóng và dễ dàng.','<p>Đi đầu trong c&ocirc;ng nghệ cửa sổ xem trước, Artlantis l&agrave; phần mềm dựng h&igrave;nh được sử dụng bởi hơn 167,000 kiến tr&uacute;c sư, nh&agrave; thiết kế c&ugrave;ng c&aacute;c chuy&ecirc;n gia thiết kế đ&ocirc; thị ở hơn 80 quốc gia.Artlantis l&agrave;m việc trực tiếp với ArchiCAD, VectorWorks, SketchUp Pro, v&agrave; Arc+. Với bổ sung gần đ&acirc;y c&aacute;c định dạng nhập DWF, OBJ v&agrave; FBX c&ugrave;ng cập nhật c&aacute;c plug-in DXF, DWG v&agrave; 3DS, Artlantis tương t&aacute;c chặt chẽ với mọi phần mềm CAD h&agrave;ng đầu, bao gồm Revit Architecture, 3ds Max, Maya, Rhino, CINEMA 4D, LightWave, v&agrave; modo.</p>\r\n\r\n<h4 id=\"whats_new\">What&rsquo;s New</h4>\r\n\r\n<p>Version 6.0.2.1:<strong>Note:</strong>&nbsp;Version 6 is a paid upgrade from previous versions. You can upgrade from version 4 or 5 for &euro;300 (~$318), or from versions 1-3 for &euro;500 (~$530).</p>\r\n\r\n<ul>\r\n	<li><strong>Physical engine</strong>&nbsp;&ndash; To create stunning images, Artlantis 6 now includes its own built-in physical engine, emphasizing physical rendering quality, precision, material accuracy, and energy consumption. Real-time preview &mdash; Artlantis&rsquo;s founding concept &mdash; gives users continuous control of each change in the scene. Artlantis stands out as the only rendering software able to provide a quality / calculation time ratio as relevant in the preview as in the final calculation. Simply put &mdash; all Artlantis developments share the same goal: ease of use, quality and speed.</li>\r\n	<li><strong>Lighting and Neon lighting</strong>&nbsp;&ndash; Artlantis 6 introduces a standard lighting measurement system &mdash; the power units are measured in lumens. By default, Artlantis offers 8 IES pre-set profiles. Artlantis 6 now allows you to import downloaded IES profiles from manufacturers&rsquo; websites. These files are used to simulate realistic illumination of your projects. In addition, neon lights have been completely updated for this version with considerable gains in terms of quality and calculation speed.</li>\r\n	<li><strong>Site insertion</strong>&nbsp;&ndash; When using the site insertion feature, Artlantis 6 offers a new and simple projection process with more accurate calculations. After aligning the XYZ axis in the 2D view and in the preview window, the model is easily positioned on the background image. A revolutionary integrated tool allows you to add transparency to a foreground image directly in Artlantis to enhance the quality of your projects.</li>\r\n	<li><strong>Other exciting new features include:</strong>\r\n	<ul>\r\n		<li>Laser tool &ndash; With a simple click in the preview window on the reference plane, you can define the position and the orientation of a laser beam. A red line appears in the scene that can be used to automatically and accurately snap objects or textures into the project.</li>\r\n		<li>Ambient occlusion &ndash; This new option in Artlantis 6 allows users to display a global ambient occlusion to create virtual shadows in small areas where natural light doesn&rsquo;t go. It brings more depth and relief to both interior and exterior scenes.</li>\r\n		<li>White balance &ndash; White balance allows you to adjust the dominant color of a scene to the ambient lighting. Simply set this new parameter to automatic color mode or select a reference color, which will be recognized as white in the 3D scene.</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n<a data-wpel-link=\"internal\" href=\"https://maclife.vn/simlab-composer-cong-cu-render-3d-chuyen-dung.html\" rel=\"nofollow\" target=\"_blank\">Tham khảo th&ecirc;m&nbsp;&nbsp;SimLab Composer - C&ocirc;ng cụ Render 3D chuy&ecirc;n dụng</a>\r\n\r\n<ul>\r\n	<li>Intel</li>\r\n	<li>OS X 10.8 or later</li>\r\n	<li>QuickTime 10 or later</li>\r\n	<li>256MB OpenGL graphics card</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Artlantis Studio 6.0.2.17</strong></p>\r\n\r\n<p><a data-wpel-link=\"external\" href=\"http://adf.ly/1OWQDg\" rel=\"noopener noreferrer nofollow external\" target=\"_blank\">https://www.fshare.vn/file/3X4J4NPA25BS</a></p>\r\n\r\n<p><strong>Artlantis Studio 6.5.2.12</strong></p>\r\n\r\n<p><a data-wpel-link=\"external\" href=\"http://j.gs/9cta\" rel=\"noopener noreferrer nofollow external\" target=\"_blank\">https://www.fshare.vn/file/X5MG4X133TOL</a></p>\r\n\r\n<p><strong>Artlantis_2019.2.16195</strong></p>\r\n\r\n<p><a data-wpel-link=\"external\" href=\"http://j.gs/C2bK\" rel=\"noopener noreferrer nofollow external\" target=\"_blank\">https://www.fshare.vn/file/3LJNCGY93B5G</a></p>\r\n\r\n<p><strong><i></i>Artlantis_2019.2.21219</strong></p>\r\n\r\n<p><a data-wpel-link=\"external\" href=\"http://j.gs/DWN6\" rel=\"noopener noreferrer nofollow external\" target=\"_blank\">https://www.fshare.vn/file/39PI61ELHD7J</a></p>\r\n\r\n<p><strong><i></i>Artlantis_2020.2_9.0.2.21255</strong></p>\r\n\r\n<p><a data-wpel-link=\"external\" href=\"http://j.gs/DXe5\" rel=\"noopener noreferrer nofollow external\" target=\"_blank\">https://www.fshare.vn/file/Y6QUS8DYESLA</a></p>','tu khoa 1, tu khoa 2','mo ta tu khoa',202,2,33,0,1577698499,1577698499),(22,30,'Hướng dẫn cài Font trên mac với Font Book','huong-dan-cai-font-tren-mac-voi-font-book','http://img.maclife.localhost/2019/12/30/873a8387a24c6b38239620308e157f8b.png','Cài font trên Mac rất đơn giản, tuy nhiên mình thấy vẫn có khá nhiều bạn thắc mắc không biết cài, hôm nay mình sẽ làm bài hướng dẫn chi tiết cách cài font trên Mac thông qua Font Book','<p>Đầu ti&ecirc;n, c&aacute;c bạn nhấn v&agrave;o&nbsp;<strong>Launchpad</strong>&gt;T&igrave;m thư mục&nbsp;<strong>Other</strong>&gt; chọn v&agrave;o&nbsp;<strong>Font Book</strong>&nbsp;(hoặc c&oacute; thể nhấn ph&iacute;m&nbsp;<strong>Command</strong>&nbsp;+&nbsp;<strong>khoảng trắng</strong>&nbsp;v&agrave; g&otilde; v&agrave;o&nbsp;<strong>Spotlight</strong>&nbsp;để t&igrave;m)</p>\r\n\r\n<p><img alt=\"\" height=\"472\" sizes=\"(max-width: 1143px) 100vw, 1143px\" src=\"https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac.png\" srcset=\"https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac.png 1143w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac-300x124.png 300w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac-768x317.png 768w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac-1024x423.png 1024w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac-350x145.png 350w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac-830x343.png 830w\" width=\"1143\" /></p>\r\n\r\n<p>Sau đ&oacute; c&aacute;c bạn mở thư mục chứa c&aacute;c file Font m&agrave; bạn muốn c&agrave;i (m&igrave;nh c&oacute; share bộ Font cơ bản ở cuối b&agrave;i). Sau đ&oacute; nhấn Command + A để chọn hết v&agrave; k&eacute;o c&aacute;c font đ&atilde; chọn v&agrave;o cửa sổ Font Book</p>\r\n\r\n<p><img alt=\"\" height=\"679\" sizes=\"(max-width: 1505px) 100vw, 1505px\" src=\"https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_1.png\" srcset=\"https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_1.png 1505w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_1-300x135.png 300w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_1-768x346.png 768w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_1-1024x462.png 1024w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_1-350x158.png 350w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_1-830x374.png 830w\" width=\"1505\" /></p>\r\n\r\n<p>Bạn n&agrave;o kh&ocirc;ng quen với thao t&aacute;c k&eacute;o thả như h&igrave;nh th&igrave; c&oacute; thể mở&nbsp;<strong>Font Book</strong>&gt; v&agrave;o&nbsp;<strong>File</strong>&gt;&nbsp;<strong>Add Fonts</strong>&gt;chọn tới thư mục chứa Font bạn cần c&agrave;i v&agrave; nhấn<strong>&nbsp;Open</strong></p>\r\n\r\n<p>Đợi 1 l&uacute;c, thường th&igrave; sẽ xuất hiện m&agrave;n h&igrave;nh Font Validation như h&igrave;nh, kiểu như th&ocirc;ng b&aacute;o Font kh&ocirc;ng tương th&iacute;ch với mac, nhưng kh&ocirc;ng sao, c&aacute;c font c&oacute; đu&ocirc;i .ttf b&ecirc;n Windows bạn ho&agrave;n to&agrave;n c&oacute; thể sử dụng tr&ecirc;n Mac. Do đ&oacute; bạn cứ nhấn chọn&nbsp;<strong>Select all font</strong>&nbsp;v&agrave; nhấn&nbsp;<strong>Install Checked</strong></p>\r\n\r\n<p><img alt=\"\" height=\"610\" sizes=\"(max-width: 864px) 100vw, 864px\" src=\"https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_2.png\" srcset=\"https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_2.png 864w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_2-300x212.png 300w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_2-768x542.png 768w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_2-350x247.png 350w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_2-830x586.png 830w\" width=\"864\" /></p>\r\n\r\n<p>Vậy l&agrave; xong, thường th&igrave; sẽ kh&ocirc;ng lỗi g&igrave;, tuy nhi&ecirc;n một số bạn c&agrave;i c&aacute;c bộ Font kh&aacute;c bộ font m&agrave; m&igrave;nh chia sẻ b&ecirc;n dưới, c&oacute; thể bị lỗi hiển thị font sai tr&ecirc;n hệ thống hoặc t&igrave;nh duyệt th&igrave; bạn v&agrave;o lại cửa sổ&nbsp;<strong>Font Book</strong>&gt; chọn<strong>&nbsp;File</strong>&gt;&nbsp;<strong>Restore Standard Fonts</strong>&nbsp;để kh&ocirc;i phục lại Font mặc định của hệ thống</p>\r\n<a data-wpel-link=\"internal\" href=\"https://maclife.vn/best-of-2018-big-font-bundle-bo-suu-tap-font-cua-ka-designs.html\" rel=\"nofollow\" target=\"_blank\">Tham khảo th&ecirc;m&nbsp;&nbsp;Best of 2018 BIG Font Bundle - Bộ sưu tập Font của KA Designs</a>\r\n\r\n<p><img alt=\"\" height=\"406\" sizes=\"(max-width: 574px) 100vw, 574px\" src=\"https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_4.png\" srcset=\"https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_4.png 574w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_4-300x212.png 300w, https://maclife.vn/wp-content/uploads/2019/10/huong-dan-cai-font-tren-mac_4-350x248.png 350w\" width=\"574\" /></p>\r\n\r\n<p>V&agrave; tiện đ&acirc;y m&igrave;nh chia sẻ bộ Font bao gồm c&aacute;c Font cơ bản m&agrave; c&oacute; thể nhiều người hay sử dụng (c&oacute; hỗ trợ g&otilde; tiếng việt). Bao gồm bộ font Vni, UTM, UVF, UVN, SVN, SFU, Vf&hellip; (khoảng hơn 1000 font). Gần như đầy đủ cho qu&aacute; tr&igrave;nh xử dụng th&ocirc;ng thường (thậm ch&iacute; c&oacute; thiết kế kh&ocirc;ng qu&aacute; chuy&ecirc;n nghiệp ^_^)</p>\r\n\r\n<p><strong>Hơn 1000 Font cho mac</strong></p>\r\n\r\n<p><a data-wpel-link=\"external\" href=\"http://j.gs/DLaw\" rel=\"noopener noreferrer nofollow external\" target=\"_blank\">https://www.fshare.vn/file/D6IS665TIQVY</a></p>','tu khoa 2, tuw khoa 3','mo ta 3, mo ta 4',101,3,10,0,1577698633,1577954977);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_post` int(11) DEFAULT 0,
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (33,'tag1','tag1',1,1577897951),(34,'tag2','tag2',1,1577897951),(35,'ta3','ta3',1,1577897951),(36,'tag4','tag4',1,1577898327),(37,'tag 1','tag-1',1,1577954977);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-03 16:46:49
