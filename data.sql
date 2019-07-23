-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 预约仪器种类',6,'add_instrument'),(22,'Can change 预约仪器种类',6,'change_instrument'),(23,'Can delete 预约仪器种类',6,'delete_instrument'),(24,'Can view 预约仪器种类',6,'view_instrument'),(25,'Can add 预约仪器详情',7,'add_notice_instrument'),(26,'Can change 预约仪器详情',7,'change_notice_instrument'),(27,'Can delete 预约仪器详情',7,'delete_notice_instrument'),(28,'Can view 预约仪器详情',7,'view_notice_instrument'),(29,'Can add 预约场地详情',8,'add_notice_place'),(30,'Can change 预约场地详情',8,'change_notice_place'),(31,'Can delete 预约场地详情',8,'delete_notice_place'),(32,'Can view 预约场地详情',8,'view_notice_place'),(33,'Can add 预约场地种类',9,'add_place'),(34,'Can change 预约场地种类',9,'change_place'),(35,'Can delete 预约场地种类',9,'delete_place'),(36,'Can view 预约场地种类',9,'view_place'),(37,'Can add user',10,'add_ruser'),(38,'Can change user',10,'change_ruser'),(39,'Can delete user',10,'delete_ruser'),(40,'Can view user',10,'view_ruser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_reservationapp_ruser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_reservationapp_ruser_id` FOREIGN KEY (`user_id`) REFERENCES `reservationapp_ruser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-07-23 07:27:32.348853','3','Notice_place object (3)',3,'',8,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'reservationapp','instrument'),(7,'reservationapp','notice_instrument'),(8,'reservationapp','notice_place'),(9,'reservationapp','place'),(10,'reservationapp','ruser'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-07-23 02:45:02.903596'),(2,'contenttypes','0002_remove_content_type_name','2019-07-23 02:45:04.296844'),(3,'auth','0001_initial','2019-07-23 02:45:05.442813'),(4,'auth','0002_alter_permission_name_max_length','2019-07-23 02:45:10.132274'),(5,'auth','0003_alter_user_email_max_length','2019-07-23 02:45:10.196093'),(6,'auth','0004_alter_user_username_opts','2019-07-23 02:45:10.276850'),(7,'auth','0005_alter_user_last_login_null','2019-07-23 02:45:10.348697'),(8,'auth','0006_require_contenttypes_0002','2019-07-23 02:45:10.409530'),(9,'auth','0007_alter_validators_add_error_messages','2019-07-23 02:45:10.496304'),(10,'auth','0008_alter_user_username_max_length','2019-07-23 02:45:10.571058'),(11,'auth','0009_alter_user_last_name_max_length','2019-07-23 02:45:10.644866'),(12,'auth','0010_alter_group_name_max_length','2019-07-23 02:45:11.653206'),(13,'auth','0011_update_proxy_permissions','2019-07-23 02:45:11.726008'),(14,'reservationapp','0001_initial','2019-07-23 02:45:14.381875'),(15,'admin','0001_initial','2019-07-23 02:45:18.927746'),(16,'admin','0002_logentry_remove_auto_add','2019-07-23 02:45:21.024139'),(17,'admin','0003_logentry_add_action_flag_choices','2019-07-23 02:45:21.105920'),(18,'sessions','0001_initial','2019-07-23 02:45:21.498872');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('rb2m9brka1ei4ue5j3ehpsewlgi1r97y','ZTM0NTQ2ZmRiYWJmMmUwMDdlMmYwZGFkMTE2YTIwYjI5MzA1NjA1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOGI5ODM2NDM4OWY1Y2MwNmY4NjA0ZGRmYWFiZTNjMTE2YzVhOGU1In0=','2019-08-06 03:06:06.637177'),('tjm87httpgu0hlmwu15fjzsc02k9p8jv','ZTM0NTQ2ZmRiYWJmMmUwMDdlMmYwZGFkMTE2YTIwYjI5MzA1NjA1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOGI5ODM2NDM4OWY1Y2MwNmY4NjA0ZGRmYWFiZTNjMTE2YzVhOGU1In0=','2019-08-06 03:05:18.191059');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationapp_instrument`
--

DROP TABLE IF EXISTS `reservationapp_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservationapp_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationapp_instrument`
--

LOCK TABLES `reservationapp_instrument` WRITE;
/*!40000 ALTER TABLE `reservationapp_instrument` DISABLE KEYS */;
INSERT INTO `reservationapp_instrument` VALUES (1,'荧光定量PCR仪'),(2,'高效液相色谱仪'),(3,'激光共聚焦显微镜'),(4,'正置荧光显微镜'),(5,'流式细胞仪');
/*!40000 ALTER TABLE `reservationapp_instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationapp_notice_instrument`
--

DROP TABLE IF EXISTS `reservationapp_notice_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservationapp_notice_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `people` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time_begin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time_end` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationapp_notice_instrument`
--

LOCK TABLES `reservationapp_notice_instrument` WRITE;
/*!40000 ALTER TABLE `reservationapp_notice_instrument` DISABLE KEYS */;
INSERT INTO `reservationapp_notice_instrument` VALUES (1,'高效液相色谱仪','张','2019-07-23','8','9','17754017759',''),(2,'高效液相色谱仪','刘毅杨','2019-07-23','9','10','17754017759',''),(3,'荧光定量PCR仪','刘毅杨','2019-07-23','8','11','17754017759',''),(4,'流式细胞仪','刘毅杨','2019-07-24','8','11','17754017759',''),(5,'流式细胞仪','刘毅杨','2019-07-24','11','12','17754017759','');
/*!40000 ALTER TABLE `reservationapp_notice_instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationapp_notice_place`
--

DROP TABLE IF EXISTS `reservationapp_notice_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservationapp_notice_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `people` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time_begin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time_end` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationapp_notice_place`
--

LOCK TABLES `reservationapp_notice_place` WRITE;
/*!40000 ALTER TABLE `reservationapp_notice_place` DISABLE KEYS */;
INSERT INTO `reservationapp_notice_place` VALUES (1,'生化楼前2楼会议室','刘毅杨','2019-07-15','8','9','42753753',''),(2,'生化楼1楼阅览室','刘毅杨','2019-07-23','8','9','17754017759',''),(4,'生化楼前2楼会议室','刘毅杨','2019-07-23','11','12','17754017759',''),(5,'生化楼后2楼会议室','刘毅杨','2019-07-23','8','9','17754017759',''),(6,'生化楼前2楼会议室','刘毅杨','2019-07-23','10','11','17754017759',''),(7,'生化楼1楼阅览室','刘毅杨','2019-07-24','8','11','17754017759',''),(8,'生化楼前5楼会议室','刘毅杨','2019-07-24','8','9','17754017759',''),(9,'生化楼前2楼会议室','刘毅杨','2019-07-24','10','12','17754017759',''),(10,'生化楼前5楼会议室','李','2019-07-25','10','10','17754017759',''),(11,'生化楼1楼阅览室','liu','2019-07-25','18','19','17754017759',''),(12,'生化楼1楼阅览室','刘毅杨','2019-07-23','17','20','42753753',''),(13,'生化楼后2楼会议室','刘毅杨','2019-07-24','21','22','17754017759','');
/*!40000 ALTER TABLE `reservationapp_notice_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationapp_place`
--

DROP TABLE IF EXISTS `reservationapp_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservationapp_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationapp_place`
--

LOCK TABLES `reservationapp_place` WRITE;
/*!40000 ALTER TABLE `reservationapp_place` DISABLE KEYS */;
INSERT INTO `reservationapp_place` VALUES (2,'生化楼前2楼会议室'),(3,'生化楼后2楼会议室'),(4,'生化楼1楼阅览室'),(5,'生化楼前5楼会议室');
/*!40000 ALTER TABLE `reservationapp_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationapp_ruser`
--

DROP TABLE IF EXISTS `reservationapp_ruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservationapp_ruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationapp_ruser`
--

LOCK TABLES `reservationapp_ruser` WRITE;
/*!40000 ALTER TABLE `reservationapp_ruser` DISABLE KEYS */;
INSERT INTO `reservationapp_ruser` VALUES (1,'pbkdf2_sha256$150000$VDB3kEdkXNcf$CE3RgdHzjBwmJu9Gpce0WHQwWuNbXdMJQmdG5nFH8sc=','2019-07-23 09:35:02.193984',0,'sky','','','1@1.com',0,1,'2019-07-23 02:47:16.760554'),(3,'pbkdf2_sha256$150000$dleniXBI1LsF$0yE2uyJm2EKHpkw7f+ZTJ9EBLYtrXHt8r4h/pVhdoWc=','2019-07-23 02:54:59.623260',1,'skygl','','','1@1.com',1,1,'2019-07-23 02:54:33.851185');
/*!40000 ALTER TABLE `reservationapp_ruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationapp_ruser_groups`
--

DROP TABLE IF EXISTS `reservationapp_ruser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservationapp_ruser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reservationapp_ruser_groups_ruser_id_group_id_b4e30922_uniq` (`ruser_id`,`group_id`),
  KEY `reservationapp_ruser_groups_group_id_9ba4ec6d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `reservationapp_ruser_groups_group_id_9ba4ec6d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `reservationapp_ruser_ruser_id_2ee73a22_fk_reservati` FOREIGN KEY (`ruser_id`) REFERENCES `reservationapp_ruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationapp_ruser_groups`
--

LOCK TABLES `reservationapp_ruser_groups` WRITE;
/*!40000 ALTER TABLE `reservationapp_ruser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservationapp_ruser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationapp_ruser_user_permissions`
--

DROP TABLE IF EXISTS `reservationapp_ruser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservationapp_ruser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reservationapp_ruser_use_ruser_id_permission_id_50303df9_uniq` (`ruser_id`,`permission_id`),
  KEY `reservationapp_ruser_permission_id_9fc013da_fk_auth_perm` (`permission_id`),
  CONSTRAINT `reservationapp_ruser_permission_id_9fc013da_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `reservationapp_ruser_ruser_id_40559863_fk_reservati` FOREIGN KEY (`ruser_id`) REFERENCES `reservationapp_ruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationapp_ruser_user_permissions`
--

LOCK TABLES `reservationapp_ruser_user_permissions` WRITE;
/*!40000 ALTER TABLE `reservationapp_ruser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservationapp_ruser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-23 19:21:30
