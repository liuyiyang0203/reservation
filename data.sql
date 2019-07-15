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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add notice',6,'add_notice'),(22,'Can change notice',6,'change_notice'),(23,'Can delete notice',6,'delete_notice'),(24,'Can view notice',6,'view_notice'),(25,'Can add user',7,'add_ruser'),(26,'Can change user',7,'change_ruser'),(27,'Can delete user',7,'delete_ruser'),(28,'Can view user',7,'view_ruser'),(29,'Can add instrument',8,'add_instrument'),(30,'Can change instrument',8,'change_instrument'),(31,'Can delete instrument',8,'delete_instrument'),(32,'Can view instrument',8,'view_instrument'),(33,'Can add place',9,'add_place'),(34,'Can change place',9,'change_place'),(35,'Can delete place',9,'delete_place'),(36,'Can view place',9,'view_place');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-07-15 01:36:53.201278','34','Notice object (34)',2,'[]',6,3),(2,'2019-07-15 01:36:59.648240','34','Notice object (34)',2,'[]',6,3),(3,'2019-07-15 01:37:08.543016','53','Notice object (53)',2,'[]',6,3),(4,'2019-07-15 02:11:10.740048','53','Notice object (53)',2,'[]',6,3),(5,'2019-07-15 02:11:21.232019','53','Notice object (53)',3,'',6,3),(6,'2019-07-15 03:16:18.718108','6','Place object (6)',1,'[{\"added\": {}}]',9,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'reservationapp','instrument'),(6,'reservationapp','notice'),(9,'reservationapp','place'),(7,'reservationapp','ruser'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-07-13 11:29:03.693671'),(2,'contenttypes','0002_remove_content_type_name','2019-07-13 11:29:05.010150'),(3,'auth','0001_initial','2019-07-13 11:29:06.063324'),(4,'auth','0002_alter_permission_name_max_length','2019-07-13 11:29:10.477551'),(5,'auth','0003_alter_user_email_max_length','2019-07-13 11:29:10.546380'),(6,'auth','0004_alter_user_username_opts','2019-07-13 11:29:10.622184'),(7,'auth','0005_alter_user_last_login_null','2019-07-13 11:29:10.799708'),(8,'auth','0006_require_contenttypes_0002','2019-07-13 11:29:10.864493'),(9,'auth','0007_alter_validators_add_error_messages','2019-07-13 11:29:10.950262'),(10,'auth','0008_alter_user_username_max_length','2019-07-13 11:29:11.014115'),(11,'auth','0009_alter_user_last_name_max_length','2019-07-13 11:29:11.099861'),(12,'auth','0010_alter_group_name_max_length','2019-07-13 11:29:11.949590'),(13,'auth','0011_update_proxy_permissions','2019-07-13 11:29:12.035359'),(14,'reservationapp','0001_initial','2019-07-13 11:29:13.459551'),(15,'admin','0001_initial','2019-07-13 11:29:18.206874'),(16,'admin','0002_logentry_remove_auto_add','2019-07-13 11:29:20.370076'),(17,'admin','0003_logentry_add_action_flag_choices','2019-07-13 11:29:20.441898'),(18,'sessions','0001_initial','2019-07-13 11:29:20.834824'),(19,'reservationapp','0002_auto_20190715_1051','2019-07-15 02:51:14.165240');
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
INSERT INTO `django_session` VALUES ('0mnby70g5mua5ovq3jt5qsnw2uir4ohi','OWY5ZDBlNzYzNjQ0N2FlM2IxMDM3MjAyOTgxNzQyMGM3ODNmM2M3ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZDc1ODNmMTAyNGZjNjk0ZWFkYmQ5Y2U1ZTMwNjg1ODBkMjI5MDI3In0=','2019-07-29 00:23:27.945298'),('4q1f89o8yk10ar50sqhvlfvzf5e4u5p9','ZmIxNWMwY2I1NjhjMGRmM2EyMmIyODM1YWE2OTgzNjUzM2U5NTJhODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMmZkOTJhNGJhMzY2MjJkYzc2MzVhMmUwNzgwYWRiZTgxZjEwN2I0In0=','2019-07-29 03:33:42.307692'),('catbl1vp3o8mb3lircwf4eg5miuhrsdi','ZmIxNWMwY2I1NjhjMGRmM2EyMmIyODM1YWE2OTgzNjUzM2U5NTJhODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMmZkOTJhNGJhMzY2MjJkYzc2MzVhMmUwNzgwYWRiZTgxZjEwN2I0In0=','2019-07-29 06:50:47.009810'),('g3nlcpdhn5gad5kmtzswonf28zxmvmjg','ZmIxNWMwY2I1NjhjMGRmM2EyMmIyODM1YWE2OTgzNjUzM2U5NTJhODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMmZkOTJhNGJhMzY2MjJkYzc2MzVhMmUwNzgwYWRiZTgxZjEwN2I0In0=','2019-07-29 01:02:27.707367'),('jcvavagnsr83sgi3mej24mtep51jwmk9','OWY5ZDBlNzYzNjQ0N2FlM2IxMDM3MjAyOTgxNzQyMGM3ODNmM2M3ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZDc1ODNmMTAyNGZjNjk0ZWFkYmQ5Y2U1ZTMwNjg1ODBkMjI5MDI3In0=','2019-07-29 00:49:28.895295'),('plqpag0bb8xljao6647k0fsaulodp358','OWY5ZDBlNzYzNjQ0N2FlM2IxMDM3MjAyOTgxNzQyMGM3ODNmM2M3ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZDc1ODNmMTAyNGZjNjk0ZWFkYmQ5Y2U1ZTMwNjg1ODBkMjI5MDI3In0=','2019-07-29 06:49:50.548962');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
-- Table structure for table `reservationapp_notice`
--

DROP TABLE IF EXISTS `reservationapp_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservationapp_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `people` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationapp_notice`
--

LOCK TABLES `reservationapp_notice` WRITE;
/*!40000 ALTER TABLE `reservationapp_notice` DISABLE KEYS */;
INSERT INTO `reservationapp_notice` VALUES (21,'生化楼前2楼会议室','刘毅杨','2019-07-14','8:00-9:00','17754017759',''),(22,'生化楼前2楼会议室','刘毅杨','2019-07-14','9:00-10:00','17754017759',''),(23,'生化楼前2楼会议室','刘毅杨','2019-07-14','18:00-19:00','17754017759',''),(24,'生化楼后2楼会议室','刘','2019-07-15','14:00-15:00','42753753',''),(25,'生化楼后2楼会议室','刘','2019-07-15','11:00-12:00','4241',''),(26,'生化楼1楼阅览室','李','2019-07-18','14:00-15:00','13956935439',''),(27,'生化楼1楼阅览室','李','2019-07-16','16:00-17:00','13956935439',''),(28,'生化楼1楼阅览室','李','2019-07-16','18:00-19:00','1111111',''),(29,'生化楼前5楼会议室','李','2019-07-15','13:00-14:00','sd',''),(30,'荧光定量PCR仪','刘毅杨','2019-07-14','14:00-15:00','17754017759',''),(31,'荧光定量PCR仪','刘毅杨','2019-07-14','8:00-9:00','17754017759',''),(32,'荧光定量PCR仪','刘毅杨','2019-07-14','19:00-20:00','17754017759',''),(33,'高效液相色谱仪','刘毅杨','2019-07-19','9:00-10:00','17754017759',''),(34,'高效液相色谱仪','李','2019-07-16','16:00-17:00','42753753',''),(35,'高效液相色谱仪','王','2019-07-16','12:00-13:00','17754017759',''),(36,'高效液相色谱仪','王','2019-07-18','18:00-19:00','s\'d',''),(37,'激光共聚焦显微镜','s\'d','2019-07-16','13:00-14:00','4241',''),(38,'正置荧光显微镜','李','2019-07-24','16:00-17:00','4241',''),(39,'正置荧光显微镜','赵','2019-07-14','9:00-10:00','13956935439',''),(40,'正置荧光显微镜','赵','2019-07-20','14:00-15:00','124',''),(41,'流式细胞仪','呵呵','2019-07-29','18:00-19:00','42753753',''),(42,'正置荧光显微镜','刘','2019-07-16','9:00-10:00','4241',''),(43,'流式细胞仪','李','2019-07-31','14:00-15:00','4241',''),(44,'流式细胞仪','李','2019-07-31','8:00-9:00','s\'d',''),(45,'流式细胞仪','李','2019-08-02','10:00-11:00','17754017759',''),(46,'生化楼后2楼会议室','张','2019-07-31','9:00-10:00','11111111111111',''),(47,'生化楼后2楼会议室','张','2019-07-31','12:00-13:00','11111111111',''),(48,'生化楼1楼阅览室','张','2019-07-31','19:00-20:00','2222222222222222',''),(49,'生化楼前5楼会议室','张','2019-07-31','8:00-9:00','32534',''),(50,'生化楼1楼阅览室','李','2019-07-25','10:00-11:00','3333',''),(51,'生化楼前2楼会议室','王','2019-08-02','9:00-10:00','2222',''),(52,'生化楼前2楼会议室','王','2019-07-31','17:00-18:00','5555','');
/*!40000 ALTER TABLE `reservationapp_notice` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationapp_place`
--

LOCK TABLES `reservationapp_place` WRITE;
/*!40000 ALTER TABLE `reservationapp_place` DISABLE KEYS */;
INSERT INTO `reservationapp_place` VALUES (1,'生化楼前2楼会议室'),(2,'生化楼后2楼会议室'),(3,'生化楼1楼阅览室'),(4,'生化楼前5楼会议室');
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
INSERT INTO `reservationapp_ruser` VALUES (1,'pbkdf2_sha256$150000$alQFVOWLm3g3$nhcxBdf8SYSsX0yipp03HVj0j9/HDmEXiv3Pee6t60w=','2019-07-15 06:49:50.474126',0,'shengkeyuan','','','1@1.com',0,1,'2019-07-13 11:31:19.617981'),(3,'pbkdf2_sha256$150000$YdggBVdicuGA$5LMgT7zy7He+xCQpnfRQ67D1H37Efa2bSpu5GtjbC0w=','2019-07-15 06:50:46.935021',1,'admin','','','1@1.com',1,1,'2019-07-15 01:02:09.736994');
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

-- Dump completed on 2019-07-15 16:09:11
