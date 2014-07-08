-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: sentis
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.14.04.1

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
-- Table structure for table `feelings`
--

DROP TABLE IF EXISTS `feelings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feelings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` blob NOT NULL,
  `order` int(11) DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feelings`
--

LOCK TABLES `feelings` WRITE;
/*!40000 ALTER TABLE `feelings` DISABLE KEYS */;
INSERT INTO `feelings` VALUES (1,'HAPPYNESS','',NULL,'Hoje eu estou feliz... Esse sentimento simboliza toda a paz interior que os seres humanos cultivam apos fumar uma tronca.'),(2,'ANGRY','',NULL,NULL),(3,'FURIOUS','',NULL,NULL),(4,'HELPFUL','',NULL,NULL),(5,'HOPEFUL','',NULL,NULL),(6,'HUMBLE','',NULL,NULL),(7,'INDEPENDENT','',NULL,NULL),(8,'INTEGRATED','',NULL,NULL),(9,'JOYFUL','',NULL,NULL),(10,'JOVIAL','',NULL,NULL),(11,'JAZZED','',NULL,NULL),(12,'KIND','',NULL,NULL),(13,'LIGHTHEARTED','',NULL,NULL),(14,'MERRY','',NULL,NULL),(15,'MIRTHFUL','',NULL,NULL),(16,'NUTTY','',NULL,NULL),(17,'OPTIMISTIC','',NULL,NULL),(18,'OPEN','',NULL,NULL),(19,'PROSPEROUS','',NULL,NULL),(20,'PEACEFUL','',NULL,NULL),(21,'PLAYFUL','',NULL,NULL),(22,'PLEASANT','',NULL,NULL),(23,'PERKY','',NULL,NULL),(24,'PLEASED','',NULL,NULL);
/*!40000 ALTER TABLE `feelings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias`
--

DROP TABLE IF EXISTS `medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias`
--

LOCK TABLES `medias` WRITE;
/*!40000 ALTER TABLE `medias` DISABLE KEYS */;
INSERT INTO `medias` VALUES (1,'image');
/*!40000 ALTER TABLE `medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_05_23_204408_initial_database',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_contents`
--

DROP TABLE IF EXISTS `post_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_contents` (
  `post_id` int(10) unsigned NOT NULL,
  `main_post_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `source_url` varchar(250) DEFAULT NULL,
  `media_id` int(11) unsigned DEFAULT NULL,
  `media_url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_post_content_main_post_idx` (`main_post_id`),
  KEY `fk_post_content_media_idx` (`media_id`),
  CONSTRAINT `fk_post_content_main_post` FOREIGN KEY (`main_post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_content_media` FOREIGN KEY (`media_id`) REFERENCES `medias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_content_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_contents`
--

LOCK TABLES `post_contents` WRITE;
/*!40000 ALTER TABLE `post_contents` DISABLE KEYS */;
INSERT INTO `post_contents` VALUES (71,NULL,'New post','','',NULL,NULL),(72,NULL,'second post','','',NULL,NULL),(73,NULL,'Eu vou para goiania','','',NULL,NULL),(74,NULL,'Vini rj','','',NULL,NULL);
/*!40000 ALTER TABLE `post_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `privacy_id` int(10) unsigned NOT NULL,
  `anonymous` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_geolocation` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_geolocation` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_privacy_id_foreign` (`privacy_id`),
  CONSTRAINT `posts_privacy_id_foreign` FOREIGN KEY (`privacy_id`) REFERENCES `privacies` (`id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (71,75,1,0,'2014-07-01 02:34:05','2014-07-01 02:34:05',NULL,NULL,'127.0.0.1',1),(72,75,1,0,'2014-07-01 02:35:26','2014-07-04 11:52:29',NULL,NULL,'127.0.0.1',0),(73,75,1,0,'2014-07-01 02:49:52','2014-07-01 02:53:46',NULL,NULL,'127.0.0.1',0),(74,75,1,0,'2014-07-04 12:12:46','2014-07-04 12:12:46',NULL,NULL,'127.0.0.1',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_tags` (
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `fk_posts_tags_tag_id` (`tag_id`),
  CONSTRAINT `fk_posts_tags_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES (71,44),(72,44),(73,45),(74,45);
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privacies`
--

DROP TABLE IF EXISTS `privacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privacies`
--

LOCK TABLES `privacies` WRITE;
/*!40000 ALTER TABLE `privacies` DISABLE KEYS */;
INSERT INTO `privacies` VALUES (1,'Public'),(2,'Protected'),(3,'Private');
/*!40000 ALTER TABLE `privacies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SUS'),(2,'SME'),(3,'ADM');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sentis`
--

DROP TABLE IF EXISTS `sentis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sentis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `user_ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_sentis_post_id` (`post_id`),
  KEY `fk_sentis_user_id` (`user_id`),
  CONSTRAINT `fk_sentis_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_sentis_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sentis`
--

LOCK TABLES `sentis` WRITE;
/*!40000 ALTER TABLE `sentis` DISABLE KEYS */;
INSERT INTO `sentis` VALUES (22,NULL,71,'127.0.0.1','2014-07-03 03:18:21','2014-07-03 03:18:21'),(23,NULL,71,'127.0.0.1','2014-07-03 06:50:08','2014-07-03 06:50:08'),(24,NULL,71,'127.0.0.1','2014-07-03 06:59:54','2014-07-03 06:59:54'),(25,75,71,'127.0.0.1','2014-07-03 07:13:38','2014-07-03 07:13:38'),(26,NULL,71,'127.0.0.1','2014-07-04 00:57:23','2014-07-04 00:57:23'),(27,NULL,71,'127.0.0.1','2014-07-04 01:03:26','2014-07-04 01:03:26'),(28,NULL,71,'127.0.0.1','2014-07-04 01:06:47','2014-07-04 01:06:47'),(29,NULL,71,'127.0.0.1','2014-07-04 01:12:16','2014-07-04 01:12:16'),(30,NULL,71,'127.0.0.1','2014-07-04 01:12:31','2014-07-04 01:12:31'),(31,NULL,71,'127.0.0.1','2014-07-04 06:57:55','2014-07-04 06:57:55'),(32,NULL,72,'127.0.0.1','2014-07-04 07:00:50','2014-07-04 07:00:50'),(33,NULL,71,'127.0.0.1','2014-07-04 10:46:43','2014-07-04 10:46:43'),(34,75,74,'127.0.0.1','2014-07-04 12:13:03','2014-07-04 12:13:03');
/*!40000 ALTER TABLE `sentis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sentis_feelings`
--

DROP TABLE IF EXISTS `sentis_feelings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sentis_feelings` (
  `sentis_id` int(10) NOT NULL,
  `feeling_id` int(10) NOT NULL,
  `value` int(11) NOT NULL,
  KEY `fk_sentis_feelings_feeling_id_idx` (`feeling_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sentis_feelings`
--

LOCK TABLES `sentis_feelings` WRITE;
/*!40000 ALTER TABLE `sentis_feelings` DISABLE KEYS */;
INSERT INTO `sentis_feelings` VALUES (22,1,1),(23,10,2),(23,14,5),(23,18,1),(24,1,5),(25,1,3),(26,1,3),(27,1,3),(29,3,1),(30,1,1),(31,2,1),(32,1,4),(32,4,1),(32,8,5),(33,1,1),(34,3,5);
/*!40000 ALTER TABLE `sentis_feelings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (44,'Dilma VTNC',NULL),(45,'Goiania',NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password_temp` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signed_up_by_form` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (75,'salloszrajbman@hotmail.com','saleco','$2y$10$A4PKeSTEKk1GDqbib8VE5.xv4E4p90UQHSVDTHiM3uNap3ZRMpIUO',NULL,NULL,1,'2014-06-20 10:33:52','2014-07-04 13:00:00','puoYxOgiFXBDpblfzC9OIslfHMKdre5YPgJatasBopM99vNCFeIa9HqvbsER','http://localhost:8000/uploads/450ddec8dd206c2e2ab1aeeaa90e85e51753b8b7/1377598_722095094471788_318749236_n.jpg','878025048878791',1),(76,'salonpas69@gmail.com','saleco69','$2y$10$bcE.62QygY51nvnXLJJM4.TCJ2LnAB2CzlvSUP5HNeGM.V9QlhvYO',NULL,'',1,'2014-06-24 02:29:20','2014-06-24 09:02:29','XBr6HD4gHY5CW39asv2QffSixpIUjAq2n3lD8bUViZOm7xTJLXFcDx7yxtgD','http://localhost:8000/uploads/default-avatar.png',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_users_roles_role_id_idx` (`role_id`),
  CONSTRAINT `fk_users_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_roles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (75,1),(76,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-06 22:26:35
