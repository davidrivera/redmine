-- MySQL dump 10.13  Distrib 5.5.21, for linux2.6 (x86_64)
--
-- Host: localhost    Database: bitnami_redmine
-- ------------------------------------------------------
-- Server version	5.5.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES UTF8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `bitnami_redmine`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bitnami_redmine` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bitnami_redmine`;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `disk_filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(255) DEFAULT '',
  `digest` varchar(40) NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,7,'Issue','pagemovedpermcrawldetails_10_4_2012.csv','121010012827_pagemovedpermcrawldetails_10_4_2012.csv',221907,'application/vnd.ms-excel','0f8328a75575b9b6848fbde4024229c0',0,1,'2012-10-10 01:28:27',''),(2,7,'Issue','crawldetails_10_4_2012.csv','121010012827_crawldetails_10_4_2012.csv',221907,'application/vnd.ms-excel','0f8328a75575b9b6848fbde4024229c0',0,1,'2012-10-10 01:28:27',''),(3,11,'Issue','anniversaryLogo 10y.png','121010013830_35d7fd0304e256b84929eedd509cdc51.png',54324,'image/png','f7c7dfc2fc5ade1b067f44f57c0aab36',0,1,'2012-10-10 01:38:30',''),(4,23,'Issue','Common Computer Errors (1).docx','121010020321_c148414f376ecb009ecc37070c488c19.docx',1545343,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','c7ec0409dfbf3a366e39207b0f098725',0,1,'2012-10-10 02:03:21',''),(5,24,'Issue','Price list (1).xlsx','121010020536_c398443d029cfd318891105bcfe4c708.xlsx',12279,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','3f8832426fff8d98876a8329567a82ec',0,1,'2012-10-10 02:05:36','');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `host` varchar(60) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT '',
  `base_dn` varchar(255) DEFAULT NULL,
  `attr_login` varchar(30) DEFAULT NULL,
  `attr_firstname` varchar(30) DEFAULT NULL,
  `attr_lastname` varchar(30) DEFAULT NULL,
  `attr_mail` varchar(30) DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` varchar(255) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '1',
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) NOT NULL DEFAULT '',
  `path` text NOT NULL,
  `from_path` text,
  `from_revision` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeset_parents`
--

DROP TABLE IF EXISTS `changeset_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeset_parents`
--

LOCK TABLES `changeset_parents` WRITE;
/*!40000 ALTER TABLE `changeset_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeset_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets`
--

DROP TABLE IF EXISTS `changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) NOT NULL,
  `committer` varchar(255) DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` text,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets`
--

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets_issues`
--

DROP TABLE IF EXISTS `changesets_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets_issues`
--

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `field_format` varchar(30) NOT NULL DEFAULT '',
  `possible_values` text,
  `regexp` varchar(255) DEFAULT '',
  `min_length` int(11) NOT NULL DEFAULT '0',
  `max_length` int(11) NOT NULL DEFAULT '0',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,'IssueCustomField','whitehotlogic Engineer Bounty','int','--- \n','',0,0,0,1,0,1,0,'0',1,1,0);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_projects`
--

DROP TABLE IF EXISTS `custom_fields_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_projects`
--

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_trackers`
--

DROP TABLE IF EXISTS `custom_fields_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_trackers`
--

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
INSERT INTO `custom_fields_trackers` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_values`
--

DROP TABLE IF EXISTS `custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_values`
--

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
INSERT INTO `custom_values` VALUES (1,'Issue',67,1,'0'),(3,'Issue',69,1,'0'),(4,'Issue',70,1,'0'),(5,'Issue',71,1,'0'),(6,'Issue',72,1,'0'),(7,'Issue',73,1,'0'),(8,'Issue',74,1,'0'),(9,'Issue',75,1,'0'),(10,'Issue',76,1,'0'),(11,'Issue',77,1,'0'),(12,'Issue',78,1,'0'),(13,'Issue',79,1,'0'),(14,'Issue',80,1,'0'),(15,'Issue',81,1,'0'),(16,'Issue',82,1,'0'),(17,'Issue',83,1,'0'),(18,'Issue',84,1,'0'),(19,'Issue',85,1,'0'),(20,'Issue',86,1,'0'),(21,'Issue',87,1,'0'),(22,'Issue',88,1,'0'),(23,'Issue',89,1,'0'),(24,'Issue',90,1,'0'),(25,'Issue',91,1,'0'),(26,'Issue',92,1,'0'),(27,'Issue',93,1,'0'),(28,'Issue',94,1,'0'),(29,'Issue',95,1,'0'),(30,'Issue',50,1,''),(31,'Issue',96,1,'0'),(32,'Issue',97,1,'0'),(33,'Issue',98,1,'0'),(34,'Issue',99,1,'0'),(35,'Issue',100,1,'0'),(36,'Issue',101,1,'0'),(37,'Issue',102,1,'0'),(38,'Issue',103,1,'0'),(39,'Issue',104,1,'0'),(40,'Issue',105,1,'0'),(41,'Issue',106,1,'0'),(42,'Issue',22,1,''),(43,'Issue',107,1,'0'),(44,'Issue',108,1,'0'),(45,'Issue',109,1,'0');
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `description` text,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'issue_tracking'),(6,1,'wiki'),(11,2,'issue_tracking'),(12,2,'time_tracking'),(13,2,'news'),(14,2,'documents'),(15,2,'files'),(16,2,'wiki'),(17,2,'repository'),(18,2,'boards'),(19,2,'calendar'),(20,2,'gantt'),(21,3,'issue_tracking'),(26,3,'wiki'),(31,4,'issue_tracking'),(41,5,'issue_tracking'),(42,5,'wiki'),(43,6,'issue_tracking'),(44,6,'wiki'),(45,7,'issue_tracking'),(46,7,'wiki'),(48,9,'issue_tracking'),(49,10,'issue_tracking'),(50,11,'issue_tracking'),(51,12,'issue_tracking'),(52,13,'issue_tracking'),(53,14,'issue_tracking');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumerations`
--

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'Low',1,0,'IssuePriority',1,NULL,NULL),(2,'Normal',2,1,'IssuePriority',1,NULL,NULL),(3,'High',3,0,'IssuePriority',1,NULL,NULL),(4,'Urgent',4,0,'IssuePriority',1,NULL,NULL),(5,'Immediate',5,0,'IssuePriority',1,NULL,NULL),(6,'User documentation',1,0,'DocumentCategory',1,NULL,NULL),(7,'Technical documentation',2,0,'DocumentCategory',1,NULL,NULL),(8,'Design',1,0,'TimeEntryActivity',1,NULL,NULL),(9,'Development',2,0,'TimeEntryActivity',1,NULL,NULL);
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_categories`
--

DROP TABLE IF EXISTS `issue_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_categories`
--

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_relations`
--

DROP TABLE IF EXISTS `issue_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_relations`
--

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_statuses`
--

DROP TABLE IF EXISTS `issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `default_done_ratio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`),
  KEY `index_issue_statuses_on_is_default` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_statuses`
--

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'New',0,1,1,NULL),(2,'In Progress',0,0,2,NULL),(3,'Resolved',0,0,3,NULL),(4,'Feedback',0,0,4,NULL),(5,'Closed',1,0,5,NULL),(6,'Rejected',1,0,6,NULL);
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '0',
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL DEFAULT '0',
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,2,1,'Social Network Icons In Header','- need to finish adding linking below:\r\n\r\n----------------------------------------------------------\r\n\r\nFacebook\r\nhttps://www.facebook.com/1ComputerOutlet\r\n \r\n<div id=\"fb-root\"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = \"//connect.facebook.net/en_US/all.js#xfbml=1\";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, \'script\', \'facebook-jssdk\'));</script>\r\n \r\nI don\'t know if the code changes the style for the button. As long as they can sign into facebook and like without taking them away from the webite...\r\n \r\nTwitter\r\nhttps://twitter.com/1computeroutlet\r\n \r\n<a href=https://twitter.com/intent/user?screen_name=1computeroutlet>Follow @1computeroutlet</a>\r\n \r\nmay or may not be correct...\r\n \r\nLinkedin is a little screwy?\r\n \r\nhttp://developer.linkedin.com/documents/authentication\r\n \r\nhttp://www.linkedin.com/in/1computeroutletonline\r\n \r\n \r\nPinterest\r\n<a href=\"http://pinterest.com/1computeroutlet/\"><img src=\"http://passets-lt.pinterest.com/images/about/buttons/follow-me-on-pinterest-button.png\" width=\"169\" height=\"28\" alt=\"Follow Me on Pinterest\" /></a>\r\n \r\nGoogle +\r\n \r\n<!-- Place this tag where you want the +1 button to render. -->\r\n<div class=\"g-plusone\" data-size=\"tall\" data-annotation=\"none\"></div>\r\n<!-- Place this tag after the last +1 button tag. -->\r\n<script type=\"text/javascript\">\r\n  (function() {\r\n    var po = document.createElement(\'script\'); po.type = \'text/javascript\'; po.async = true;\r\n    po.src = \'https://apis.google.com/js/plusone.js\';\r\n    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(po, s);\r\n  })();\r\n</script>',NULL,NULL,3,NULL,3,NULL,1,2,'2012-10-10 01:14:50','2012-10-20 16:03:53','2012-10-09',0,NULL,NULL,1,1,2,0),(2,2,1,'Add Presidential Election Poll','Who do you want our next president to be?\r\n \r\nMitt Romney\r\n \r\nBarrack Obama\r\n \r\nSomeone Else\r\n \r\nI Don\'t Care',NULL,NULL,3,NULL,3,NULL,1,2,'2012-10-10 01:16:02','2012-10-20 20:09:42','2012-10-10',0,NULL,NULL,2,1,2,0),(3,2,1,'Sitemap and Robots.txt','- Need to update site with latest sitemap from john email\r\n\r\n- need to find solution for automatically creating sitemaps\r\n\r\n- need to settle on optimal robots.txt format for magento',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-10 01:17:48','2012-10-10 01:17:48','2012-10-10',0,NULL,NULL,3,1,2,0),(4,2,1,'Add Live Chat Solution','- use zoho chat\r\n\r\n- john\'s credentials:\r\n\r\nUsername: 1computeroutlet\r\nemail         john@computeroutletonline.com\r\nPassword standard...ask me...',NULL,NULL,3,NULL,3,NULL,1,2,'2012-10-10 01:18:43','2012-10-20 18:57:53','2012-10-10',0,NULL,NULL,4,1,2,0),(5,1,1,'Import Script Not Emailing Log','',NULL,NULL,3,NULL,2,NULL,1,3,'2012-10-10 01:20:11','2012-11-01 02:56:46','2012-10-10',0,NULL,NULL,5,1,2,0),(6,1,1,'Import Script Not Handling Discontinued Items','',NULL,NULL,3,NULL,2,NULL,1,2,'2012-10-10 01:21:08','2012-10-20 15:08:12','2012-10-10',0,NULL,NULL,6,1,2,0),(7,1,1,'Bing Crawl Issues','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-10 01:28:27','2012-10-10 01:28:27','2012-10-10',0,NULL,NULL,7,1,2,0),(8,2,1,'Multiple Magento Stores','- get multiple magento stores setup for the following urls\r\n- client would like “the search engines to start picking them up if possible.”\r\n\r\n\r\nhttp://1computeroutlet.com\r\nhttp://bulkpcdealer.com\r\nhttp://computeroutletonline.com\r\nhttp://bulkpcdealer.net/\r\nhttp://bulkpcdealer.org\r\nhttp://bulkpcdealer.info\r\nhttp://bulkpcparts.info\r\nhttp://bulkpcparts.net\r\nhttp://BULKPCPARTS.ORG\r\nhttp://1COMPUTEROUTLET.US\r\nhttp://1-COMPUTER-OUTLET.COM\r\nhttp://1-PC-STORE.COM\r\nhttp://1COMPUTEROUTLET.INFO\r\nhttp://1COMPUTEROUTLET.MOBI\r\nhttp://1COMPUTEROUTLET.NET\r\nhttp://1COMPUTEROUTLET.ORG\r\nhttp://1COMPUTEROUTLETS.COM\r\nhttp://ONE-COMPUTER-OUTLET.COM\r\nhttp://ONE-COMPUTER-STORE.COM\r\nhttp://ONE-PC-STORE.COM',NULL,NULL,1,NULL,3,NULL,1,3,'2012-10-10 01:29:29','2012-10-20 23:57:25','2012-10-10',0,NULL,NULL,8,1,2,0),(9,1,1,'META Tags are incorrect / non-descript','Client requested the following:\r\n\r\n\r\nTitle - Wholesale Computer Outlet, LLC - Computer Parts, Laptops, Electronics, HDTVs, Digital Cameras and More!\r\n \r\nDescription - Wholesale Computer Outlet, LLC offers the lowest prices on laptops, computer hardware, PC\'s, tablets, software, electronics, digital cameras, cell phones, Business Phones, GPS, and more with fast shipping and top-rated customer service.  Say \"no\" to retail!\r\n \r\nKeywords - Computer Components, Computer Parts, LCD Monitors, Video Cards, Processors and CPUs, Computer Memory, RAM, Digital Cameras, Printers, Notebook Computers, Laptops, Motherboards, Flash Memory, PC Speakers, LED TV, Office Supplies, Tablets, Electronics, Software, Business Telephones, GPS',NULL,NULL,3,NULL,2,NULL,1,1,'2012-10-10 01:34:56','2012-10-20 15:07:17','2012-10-10',0,NULL,NULL,9,1,2,0),(10,2,1,'Add To Footer','<a href=\"http://www.topcomputershops.com\"><img src=\"http://www.topcomputershops.com/b/recommended.gif\" border=\"0\" width=\"60\" height=\"60\" alt=\"Computer Shops\" /></a>\r\n \r\npeople won\'t realize they can click this, stick it on the bottom??? give me the url when done..',NULL,NULL,3,NULL,3,NULL,1,2,'2012-10-10 01:37:55','2012-10-20 21:50:55','2012-10-10',0,NULL,NULL,10,1,2,0),(11,2,1,'Add Anniversary Logo To Header','',NULL,NULL,3,NULL,3,NULL,1,2,'2012-10-10 01:38:30','2012-10-20 20:54:10','2012-10-10',0,NULL,NULL,11,1,2,0),(12,2,1,'Customize Featured Items Shown On Homepage','http://computeroutletonline.com/index.php/storage/hard-drives/iosafe-solo-pro-hard-drive-3-tb-external-desktop-3-5-usb-2-0-esata-300-with-1-year-data-recovery-service.html\r\n \r\nhttp://computeroutletonline.com/index.php/software/operating-systems/microsoft-windows-7-professional-w-sp1-license-and-media-1-pc-oem-dvd-64-bit-english.html\r\n \r\nhttp://computeroutletonline.com/index.php/memory/ram/kingston-hyperx-memory-2-gb-2-x-1-gb-dimm-240-pin-ddr2-1066-mhz-pc2-8500-cl5-2-2-v-unbuffered-non-ecc.html\r\n \r\nhttp://computeroutletonline.com/index.php/cameras/web-cameras/logitech-b910-hd-webcam-web-camera-color-audio-hi-speed-usb-with-logitech-bh870-wireless-mono-bluetooth-headset.html\r\n \r\nhttp://computeroutletonline.com/index.php/systems/desktops-and-servers/asus-all-in-one-pc-et1611put-all-in-one-1-x-atom-d425-1-8-ghz-ram-2-gb-hdd-1-x-320-gb-gma-3150-gigabit-ethernet-wlan-802-11b-g-n-windows-7-home-premium-64-bit-monitor-15-6-wide-led-backlight-tft.html\r\n \r\nhttp://computeroutletonline.com/index.php/networking/hubs-and-switches/cisco-small-business-200-series-smart-switch-sf200-24-switch-24-x-10-100-2-x-combo-gigabit-sfp-rack-mountable.html\r\n \r\nhttp://computeroutletonline.com/index.php/catalog/product/view/id/474709/s/cisco-telepresence-system-1000-mxp-video-conferencing-kit/category/218/\r\n \r\nhttp://computeroutletonline.com/index.php/audio-and-video/television/mitsubishi-wd-73640-73-640-series-3d-rear-projection-tv-dlp-widescreen-1080p-fullhd-platinum-black.html\r\n \r\nhttp://computeroutletonline.com/index.php/storage/hard-drives/kingston-ssdnow-s50-solid-state-drive-32-gb-internal-2-5-half-slim-sata-300.html\r\n \r\nhttp://computeroutletonline.com/index.php/catalog/product/view/id/194268/s/autocad-architecture-subscription-1-year-1-seat-win/category/165/\r\n \r\nhttp://computeroutletonline.com/index.php/cameras/camcorders-and-digital-cameras/toshiba-camileo-x100-camcorder-high-definition-10-0-mpix-10-x-optical-zoom-flash-4-gb-flash-card.html\r\n \r\nhttp://computeroutletonline.com/index.php/telephone-and-wireless/telephones/lg-ericsson-ldp-7008bd-digital-phone.html\r\n \r\nhttp://computeroutletonline.com/index.php/multifunction-and-office/multifunction-and-office-machines/canon-pixma-mg2120-multifunction-printer-copier-scanner-color-ink-jet-printing-up-to-8-4-ipm-mono-4-8-ipm-color-100-sheets-hi-speed-usb-with-canon-instantexchange.html\r\n \r\nhttp://computeroutletonline.com/index.php/audio-and-video/car-audio/sony-xm-gtr2202-amplifier-xplod-2-channel-440-watts-x-2.html\r\n \r\nhttp://computeroutletonline.com/index.php/audio-and-video/car-audio/sony-cdx-gt740ui-radio-cd-mp3-player-digital-player-xplod-full-din-in-dash-52-watts-x-4.html\r\n \r\nhttp://computeroutletonline.com/index.php/audio-and-video/video-cards/asus-hd7770-dc-1gd5-v2-graphics-card-radeon-hd-7770-1-gb-gddr5-pci-express-3-0-x16-2-x-dvi-hdmi-displayport.html\r\n \r\nhttp://computeroutletonline.com/index.php/systems/notebooks/asus-eee-pc-x101ch-atom-n2600-1-6-ghz-windows-7-starter-32-bit-1-gb-ram-320-gb-hdd-10-1-wide-1024-x-600-intel-gma-3600-matte-white-with-3-gb-asus-webstorage.html',NULL,NULL,3,NULL,3,NULL,1,2,'2012-10-10 01:39:14','2012-10-20 20:08:41','2012-10-10',0,NULL,NULL,12,1,2,0),(13,1,1,'Facebook Like Disappeared From Floating Sidebar After HDD Image To SSD','',NULL,NULL,3,NULL,2,NULL,1,1,'2012-10-10 01:40:16','2012-10-20 15:26:04','2012-10-10',0,NULL,NULL,13,1,2,0),(14,1,1,'Replace Magento Search With Google Site Search','Waiting to link search box with /custom-search page until all pages are indexed by google',NULL,NULL,2,NULL,2,NULL,1,1,'2012-10-10 01:47:55','2012-10-20 15:26:39','2012-10-10',0,NULL,NULL,14,1,2,0),(15,1,1,'Menu item - \"Adapters >> I/O Connectivity” Broken (Due To Front-Slash)','',NULL,NULL,3,NULL,2,NULL,1,1,'2012-10-10 01:49:54','2012-10-20 15:25:07','2012-10-10',0,NULL,NULL,15,1,2,0),(16,1,1,'Disable (Or Don\'t Import) New TechData Items With The Following Attributes','- must disable new / updated items (when importing) that have:\r\n	- product name with length < 5chars or null\r\n	- product price 0 or null or < 5',NULL,NULL,3,NULL,2,NULL,1,1,'2012-10-10 01:51:13','2012-10-20 15:05:13','2012-10-10',0,NULL,NULL,16,1,2,0),(17,2,1,'Add Functionality For Products To Be Shopped By Manufacturer Or Brand','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-10 01:53:34','2012-10-10 01:53:34','2012-10-10',0,NULL,NULL,17,1,2,0),(18,2,1,'Find Solution For Showing “Related Products” On Each Product Page','- may require extra data subscription',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-10 01:54:15','2012-10-10 01:54:15','2012-10-10',0,NULL,NULL,18,1,2,0),(19,2,1,'Install Magento Extension (“Customers Who Bought This Also Bought:”)','http://www.magentocommerce.com/magento-connect/customers-who-bought-this-product-also-purchased.html ',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-10 01:54:59','2012-10-10 01:54:59','2012-10-10',0,NULL,NULL,19,1,2,0),(20,3,2,'Run Known Performance Improvements For Magento','http://www.magentocommerce.com/blog/comments/performance-is-key-notes-on-magentos-performance/',NULL,NULL,1,NULL,2,NULL,1,1,'2012-10-10 01:56:14','2012-10-20 23:55:43','2012-10-10',0,NULL,NULL,20,1,2,0),(21,3,1,'Strange Mailing Issues','- strange: any new email sent from djohnson@whitehotlogic.com doesn’t show up in the john@computeroutletonline.com google apps mailbox (replies work ok)',NULL,NULL,1,NULL,1,NULL,1,2,'2012-10-10 01:57:08','2012-11-01 03:23:56','2012-10-10',0,NULL,NULL,21,1,2,0),(22,2,1,'Add Multiple Login Methods For Checkout / New Account','',NULL,NULL,1,NULL,2,NULL,1,1,'2012-10-10 02:01:00','2013-01-12 20:08:35','2012-10-10',0,NULL,NULL,22,1,2,0),(23,2,1,'Add Static Page - Common Computer Errors','',NULL,NULL,3,NULL,3,NULL,1,2,'2012-10-10 02:03:21','2012-10-20 23:49:08','2012-10-10',0,NULL,NULL,23,1,2,0),(24,2,1,'Add Static Page - Price List','',NULL,NULL,1,NULL,3,NULL,1,1,'2012-10-10 02:05:36','2012-10-20 14:53:19','2012-10-10',0,NULL,NULL,24,1,2,0),(25,2,1,'Add Google Adsense To All Pages','',NULL,NULL,2,NULL,3,NULL,1,3,'2012-10-10 02:07:18','2012-10-20 19:43:26','2012-10-10',0,NULL,NULL,25,1,2,0),(26,2,1,'Add Rich Snippets','see email',NULL,NULL,1,NULL,1,NULL,1,1,'2012-10-10 02:07:34','2012-11-01 07:41:23','2012-10-10',0,NULL,NULL,26,1,2,0),(27,2,1,'Add Facebook Shopping Mall Integration','Maybe only do featured items for now?',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-10 02:08:25','2012-10-10 02:08:25','2012-10-10',0,NULL,NULL,27,1,2,0),(28,2,1,'Integrate \"New\" Category from TechData','Use this category for a sidebar element and for the homepage (randomized)',NULL,NULL,1,NULL,2,NULL,1,1,'2012-10-15 01:20:10','2012-11-03 16:17:18','2012-10-15',0,NULL,NULL,28,1,2,0),(29,3,1,'Add CronJob Times and Tasks to Project Wiki','',NULL,NULL,1,NULL,1,NULL,1,1,'2012-10-15 01:21:06','2012-11-01 07:42:05','2012-10-15',0,NULL,NULL,29,1,2,0),(30,3,1,'Move Project Info from Google Docs to Redmine Project Wiki','',NULL,NULL,1,NULL,1,NULL,1,1,'2012-10-15 01:21:28','2012-11-01 07:44:44','2012-10-15',0,NULL,NULL,30,1,2,0),(31,1,3,'Restore - Warehouse PC Slow','',NULL,NULL,1,NULL,3,NULL,1,1,'2012-10-15 03:13:16','2012-10-18 13:46:14','2012-10-15',0,NULL,NULL,31,1,2,0),(32,1,3,'Restore - Wires Need to be Stapled to Wall and Switch Mounted','',NULL,NULL,3,NULL,3,NULL,1,2,'2012-10-15 03:14:39','2012-11-08 14:31:38','2012-10-15',0,NULL,NULL,32,1,2,0),(33,2,3,'Primary Habitat Server Not Running Raid Array','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-15 03:16:35','2012-10-15 03:16:35','2012-10-15',0,NULL,NULL,33,1,2,0),(34,1,3,'Drupal - Date and Time are incorrect','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-15 03:21:35','2012-10-15 03:21:35','2012-10-15',0,NULL,NULL,34,1,2,0),(35,1,3,'Drupal - Forgot My Password Function Broken','sends email but no password reset link',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-15 03:22:04','2012-10-15 03:22:04','2012-10-15',0,NULL,NULL,35,1,2,0),(36,2,3,'Drupal - Needs AutoPopulate Constant Contact Newsletter','- Requires at least 2 new Drupal modules - http://drupal.org/node/200702\r\n    - Mailhandler\r\n    - Mailsave',NULL,NULL,1,NULL,3,NULL,1,2,'2012-10-15 03:24:04','2012-11-08 21:51:44','2012-10-15',0,NULL,NULL,36,1,2,0),(37,2,3,'Drupal - Sidebar Needs New Images','- sidebar needs images created for:\r\n 	- create image for facebook link ---- add to sidebar - link\r\n        - create image for separate mailing list ----- add to sidebar',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-15 03:26:01','2012-10-15 03:26:01','2012-10-15',0,NULL,NULL,37,1,2,0),(38,2,3,'Drupal - Add Restore Sponsors from Pageant','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-15 03:26:44','2012-10-15 03:26:44','2012-10-15',0,NULL,NULL,38,1,2,0),(39,2,3,'Drupal - Intermittent Problem: \"The block On The Web was assigned to the invalid region right and has been disabled.\"','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-15 03:27:24','2012-10-15 03:27:24','2012-10-15',0,NULL,NULL,39,1,2,0),(40,2,3,'Habitat Offsite Backup Solution','',NULL,NULL,3,NULL,4,NULL,1,3,'2012-10-15 03:27:56','2012-11-08 14:31:01','2012-10-15',0,NULL,NULL,40,1,2,0),(41,1,3,'new.swvhabitat.org should just be swvhabitat.org','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-10-18 14:18:03','2012-10-18 14:18:03','2012-10-18',0,NULL,NULL,41,1,2,0),(42,2,2,'Performance Mods Recommended By Client','https://www.google.com/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=1&cad=rja&ved=0CCAQFjAA&url=https%3A%2F%2Fdevelopers.google.com%2Fspeed%2Fpagespeed%2Finsights&ei=AEGAUL6-G4GS9gT1-4DoBg&usg=AFQjCNFyzozQ_Owo1z6wVJKnUFXrWr1h_w\r\n \r\nEnable Compression\r\nhttp://turnkeye.com/blog/improve-magento-speed/\r\n \r\nLeverage Browser Caching\r\nhttp://stackoverflow.com/questions/11916316/speedtest-high-priority-enable-browser-caching\r\n \r\nMinify Javascript\r\nhttp://www.magentocommerce.com/magento-connect/js-css-compression-and-minify-user-interface-optimization.html',NULL,NULL,1,NULL,2,NULL,1,1,'2012-10-20 14:56:59','2012-11-01 07:42:54','2012-10-20',0,NULL,NULL,42,1,2,0),(43,1,1,'Swap Dog in Support Image','',NULL,NULL,3,NULL,3,NULL,1,1,'2012-10-20 14:57:48','2012-10-20 19:22:37','2012-10-20',0,NULL,NULL,43,1,2,0),(44,1,1,'Missing Active Product','SIIG Universal AC Power Adapter - power adapter - 90 Watt\r\nSIIG\r\nYour Exclusive Price $32.77\r\nMSRP $49.99\r\n Availability: 0\r\n	\r\nTD#	10537354\r\nMFR#	AC-PW0012-S1\r\nUPC/EAN#	662774008363\r\nAlternate Part#	 N/A\r\nStatus',NULL,NULL,1,NULL,3,NULL,1,0,'2012-10-20 14:59:11','2012-10-20 14:59:11','2012-10-20',0,NULL,NULL,44,1,2,0),(45,2,1,'change <meta description>	to product name','',NULL,NULL,3,NULL,2,NULL,1,0,'2012-11-01 02:21:05','2012-11-01 02:21:05','2012-11-01',0,NULL,NULL,45,1,2,0),(46,2,1,'change <meta keywords> to product description','',NULL,NULL,3,NULL,2,NULL,1,0,'2012-11-01 02:21:20','2012-11-01 02:21:20','2012-11-01',0,NULL,NULL,46,1,2,0),(47,2,1,'add h1 tags to product title on product page','',NULL,NULL,3,NULL,2,NULL,1,0,'2012-11-01 02:21:47','2012-11-01 02:21:47','2012-11-01',0,NULL,NULL,47,1,2,0),(48,1,1,'remove white pixels from outer edges of logo and 10yr anniversary','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-11-01 02:32:23','2012-11-01 02:32:23','2012-11-01',0,NULL,NULL,48,1,2,0),(49,2,1,'add browser incompatibility popup for older browsers','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-11-01 02:33:09','2012-11-01 02:33:09','2012-11-01',0,NULL,NULL,49,1,2,0),(50,2,1,'Link Sharing Script','Spec:\r\n- script for remote webpages that auto-updates with latest links\r\n- method for admin to approve link submissions\r\nUser Story:\r\n- business owner logs onto page (computeroutletonline.com/linksharing)\r\n- business owner submits form \r\n   - business webpage\r\n   - business description\r\n- business owner gets a jscript for his website\r\n- business owner waits for admin approval\r\n- admin logs onto admin panel, approves links waiting',NULL,NULL,1,NULL,3,NULL,1,2,'2012-11-01 02:46:52','2013-01-12 19:36:45','2012-11-01',0,NULL,NULL,50,1,2,0),(51,1,1,'Hover over dog, shows (555) phone number in callout','',NULL,NULL,3,NULL,2,NULL,1,0,'2012-11-01 06:26:20','2012-11-01 06:26:20','2012-11-01',0,NULL,NULL,51,1,2,0),(52,2,1,'add ezine articles widget to right sidebar','',NULL,NULL,3,NULL,2,NULL,1,0,'2012-11-01 07:09:17','2012-11-01 07:09:17','2012-11-01',0,NULL,NULL,52,1,2,0),(53,2,1,'add chat now graphic (see email) and popout to new window','',NULL,NULL,3,NULL,2,NULL,1,0,'2012-11-01 07:28:58','2012-11-01 07:28:58','2012-11-01',0,NULL,NULL,53,1,2,0),(54,1,1,'social bookmarking links don’t open in new tab','',NULL,NULL,3,NULL,2,NULL,1,0,'2012-11-01 07:31:31','2012-11-01 07:31:31','2012-11-01',0,NULL,NULL,54,1,2,0),(55,2,1,'Add Graphic for Cloud Backup Resale Account','See email for graphic\r\n\r\n-- waiting on John - graphic is incomplete',NULL,NULL,2,NULL,2,NULL,1,0,'2012-11-01 07:36:02','2012-11-01 07:36:02','2012-11-01',0,NULL,NULL,55,1,2,0),(56,2,1,'Social Bookmarking Modifications and Additions','- google+ should g+ the page and not john’s personal page\r\n- floating toolbar:\r\n 	- pinterest should be on floating toolbar\r\n 	- google+ should be on floating toolbar\r\n 	- add delicious to floating toolbar\r\n 	- add pick.me to floating toolbar',NULL,NULL,3,NULL,2,NULL,1,2,'2012-11-01 07:37:13','2012-11-02 00:46:21','2012-11-01',0,NULL,NULL,56,1,2,0),(57,1,1,'Persisting Import Script Issues','Need:\r\n- magmi script to automate disablement / removal of items that currently have null / $0.00 price, null title\r\n- find out why script imports 3022 items every night (and fix)\r\n- find out why script imports all items sometimes (and fix)\r\n- find out why $0.00 items showing again (and fix)',NULL,NULL,1,NULL,5,NULL,1,0,'2012-11-01 14:48:48','2012-11-01 14:48:48','2012-11-01',0,NULL,NULL,57,1,2,0),(58,2,1,'Add reviews and scape for data relevant to product name','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-11-01 21:33:25','2012-11-01 21:33:25','2012-11-01',0,NULL,NULL,58,1,2,0),(59,2,4,'Remove Magento Branding From Admin Panel and Associated Pages','',NULL,NULL,3,NULL,2,NULL,1,1,'2012-11-01 22:48:20','2012-11-01 23:36:35','2012-11-01',0,NULL,NULL,59,1,2,0),(60,2,4,'Remove Magento Branding From All Generated Emails','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-11-01 22:48:45','2012-11-01 22:48:45','2012-11-01',0,NULL,NULL,60,1,2,0),(61,2,4,'Setup Email Through GoDaddy','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-11-01 23:58:18','2012-11-01 23:58:18','2012-11-01',0,NULL,NULL,61,1,2,0),(62,2,1,'add daily reindexall to crontab','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-11-02 05:07:49','2012-11-02 05:07:49','2012-11-02',0,NULL,NULL,62,1,2,0),(63,1,1,'Redirect about.htm to about-us','',NULL,NULL,3,NULL,2,NULL,1,0,'2012-11-03 17:23:32','2012-11-03 17:23:32','2012-11-03',0,NULL,NULL,63,1,2,0),(64,2,3,'Add Twitter feed to website','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-11-08 18:30:22','2012-11-08 18:30:22','2012-11-08',0,NULL,NULL,64,1,2,0),(65,1,1,'Drive Space Problems','- COMPLETE - due to massive temp directory in wine (Content.IE5 Folder 32G)\r\n- need to add removal of .wine Temporary Internet Files to import script	\r\n	/root is 32G\r\n	due to 32G     ./.wine/drive_c/users/root/Local Settings/Temporary Internet Files/Content.IE5/QQV2FNA4',NULL,NULL,3,NULL,2,NULL,1,1,'2012-11-26 16:21:43','2012-11-26 16:22:16','2012-11-26',0,NULL,NULL,65,1,2,0),(66,1,1,'Fix Magento Search','- wco - fix search\r\n	- option: fix existing:\r\n		change from fulltext to “like” in admin panel, reindex catalogsearch_fulltext \r\n		modify query: http://www.magentocommerce.com/boards/viewthread/233799/\r\n 		As of v1.6.x the code for the prepareResult function has moved to \r\n 		/app/code/core/Mage/CatalogSearch/Model/Resource/Fulltext.php\r\n\r\n		change:\r\n\r\nif ($like) {\r\n    $likeCond = \'(\' . join(\' OR \', $like). \')\';\r\n}\r\n...to ‘ AND ‘…\r\nif ($like) {\r\n    $likeCond = \'(\' . join(\' AND \', $like). \')\';\r\n}\r\n\r\n	\r\n	http://stackoverflow.com/questions/1953715/magento-search-not-returning-expected-results\r\n 	limit to SKU, UPC, Name, & Description\r\n	- option: java solr\r\n	- option: apache lucene (may require extension)\r\n		- blast search lucene - $200\r\n	- option: celebros search for magento\r\n	- option: extensions\r\n 	http://www.magentocommerce.com/magento-connect/catalog-search-refinement.html\r\n 	http://www.magentocommerce.com/magento-connect/better-search-8400.html\r\n		http://www.magestore.com/product-instant-search.html\r\n 	http://www.magentocommerce.com/magento-connect/search-autocomplete-8858.html\r\n		http://www.magentocommerce.com/magento-connect/enhanced-search.html\r\nhttp://www.magentocommerce.com/magento-connect/exorbyte-commerce-popular-intelligent-store-search-and-merchandising-system-4799.html\r\n',NULL,NULL,3,NULL,2,NULL,1,1,'2012-11-26 16:31:06','2012-11-26 16:31:34','2012-11-26',0,NULL,NULL,66,1,2,0),(67,2,1,'Upgrade nginx to latest version','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-12-19 00:47:32','2012-12-19 00:47:32','2012-12-19',0,NULL,NULL,67,1,2,0),(69,1,4,'Cannot add SubCategory','per Dan ---- if a new category is created with a new subcategory, the import script will wipe it out the next time it runs',NULL,NULL,1,NULL,2,NULL,1,0,'2012-12-20 18:21:53','2012-12-20 18:21:53','2012-12-20',0,NULL,NULL,69,1,2,0),(70,1,4,'Images won’t update if new product is added with new image','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-12-20 18:29:46','2012-12-20 18:29:46','2012-12-20',0,NULL,NULL,70,1,2,0),(71,1,4,'cannot order more than 10 of something due to the 9+ issue','',NULL,NULL,1,NULL,2,NULL,1,0,'2012-12-20 18:31:50','2012-12-20 18:31:50','2012-12-20',0,NULL,NULL,71,1,2,0),(72,2,7,'sICM','complete new java version 2.0',NULL,NULL,2,NULL,2,NULL,1,0,'2012-12-22 15:28:23','2012-12-22 15:28:23','2012-12-22',0,NULL,NULL,72,1,2,0),(73,2,7,'Complete Access Control Integration with sICM','waiting on completion of sICM',NULL,NULL,1,NULL,2,NULL,1,0,'2012-12-22 15:28:48','2012-12-22 15:28:48','2012-12-22',0,NULL,NULL,73,1,2,0),(74,2,10,'Porftolio Script','requirements:\r\n* client logo\r\n* link\r\n* super-smooth interface\r\n* scalability\r\n\r\nChange from \"Portfolio\" to \"Clients\" on all Menus and links\r\n\r\n\r\nAdd these clients:\r\n- wholesale computer outlet\r\n- atvpartsandmore\r\n- aceac\r\n- swvhabitat',NULL,NULL,5,5,3,NULL,1,4,'2012-12-22 15:49:27','2012-12-27 00:31:49','2012-12-22',0,NULL,NULL,74,1,2,0),(75,2,10,'Login + Servers & Services Page','need to be able to login to main site and view list of links for all whl servers and services (vtiger, redmine, zabbix, etc.)',NULL,NULL,5,NULL,3,NULL,1,4,'2012-12-22 15:51:35','2012-12-22 20:59:22','2012-12-22',0,NULL,NULL,75,1,2,0),(76,2,10,'Promotions Page','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\n\r\nPROMOTIONS SECTION: referral program - $100 prepaid visa\r\n-- should have corresponding banner slider graphic\r\n\r\nPROMOTIONS SECTION: green campaign - whitehotlogic plants a tree for every new contract\r\n-- should have corresponding banner slider graphic\r\n\r\nPROMOTIONS SECTION: compliance gap analysis\r\n$599\r\n- includes 1 site/server\r\n- each additional server or site $299\r\n- every compliance check should sell:\r\n---- information systems acceptable use policy\r\n---- business continuity plan (hosted offsite)	\r\n\r\n\r\n- would be nice to integrate something like this: http://www.hostdime.com/web-hosting/business/\r\n\r\n\r\nPROMOTIONS SECTION: Mobile Dev Packages\r\n- current doc: https://docs.google.com/document/d/15Xk5NcsRbdue9QeMuPEOSGczID-HRc8MeLv1r5VhmIg/edit\r\n- mobile development widget on home.whitehotlogic.com should show all 3 packages (replacing current images)',NULL,NULL,5,1,2,NULL,1,9,'2012-12-22 16:06:29','2013-01-25 15:57:19','2012-12-22',0,NULL,NULL,76,1,2,0),(77,1,10,'Banner Slider does not link','slideshow does not link to softdev / syseng pages (need this to work for promotions)',NULL,NULL,5,5,3,NULL,1,5,'2012-12-22 16:26:55','2013-01-12 20:33:52','2012-12-22',0,NULL,NULL,77,1,2,0),(78,2,10,'add RSS link to top of news page','',NULL,NULL,5,5,2,NULL,1,5,'2012-12-22 16:28:09','2013-01-12 22:47:41','2012-12-22',0,NULL,NULL,78,1,2,0),(79,1,10,'javascript error  ---  on change day to night skin using floating sidebar','- bug: error in ie on change day to night skin using floating sidebar \r\n- (setBySkin is undefined - onLoad.min.js - line 6)\r\n- shows boolean:true in chrome',NULL,NULL,5,5,1,NULL,1,5,'2012-12-22 16:41:45','2013-01-12 22:47:12','2012-12-22',0,NULL,NULL,79,1,2,0),(80,1,10,'Facebook can\'t find whl logo (thumbnail) when posting link','fix bug where facebook can’t find logo for thumbnail',NULL,NULL,5,5,2,NULL,1,5,'2012-12-22 16:44:00','2013-01-25 15:57:01','2012-12-22',0,NULL,NULL,80,1,2,0),(81,2,10,'Get google \"Site Links\" working like wikipedia, elven labs','',NULL,NULL,5,5,2,NULL,1,6,'2012-12-26 23:57:10','2013-01-25 15:56:48','2012-12-26',0,NULL,NULL,81,1,2,0),(82,2,10,'Add levelsetlabs logo and link to clients list','http://levelsetlabs.com/logo.png\r\n\r\nhttp://levelsetlabs.com/',NULL,NULL,5,5,2,NULL,1,5,'2012-12-27 00:01:48','2013-01-12 20:50:27','2012-12-26',0,NULL,NULL,82,1,2,0),(83,2,10,'SEO','implement SEO optimizations\r\n\r\n	- see: seo analysis - https://docs.google.com/document/d/1BuZdqTT98dwnRkTND_GdADxF5uxkoQvy1g4ASEyZ6l8/edit\r\n	- see: helper app and tools - https://docs.google.com/document/d/15OwY22wBwd1Q9ct_dA-RWZ0jnYOhHGvlH0le6PvFYXE/edit',NULL,NULL,2,5,2,NULL,1,6,'2012-12-27 00:07:50','2013-01-25 16:06:04','2012-12-27',0,NULL,NULL,83,1,2,0),(84,1,11,'Blog article for waterfall printer ','- hardware list, software list, assembly steps, functional spec',NULL,NULL,2,5,2,NULL,1,2,'2012-12-27 00:10:54','2012-12-28 17:37:30','2012-12-27',0,NULL,NULL,84,1,2,0),(85,2,4,'Get client\'s ec2 instance setup and partsinc site moved over','',NULL,NULL,1,5,2,NULL,1,1,'2012-12-27 00:12:39','2012-12-27 00:22:45','2012-12-27',0,NULL,NULL,85,1,2,0),(86,2,10,'get whitehotlogic showing up for city searches SEO','- add per-city optimized pages for target cities in central florida (like smg-web-design)\r\n\r\n--- seems like duplicate content penalties should be inflicted? need to verify that they won\'t',NULL,NULL,1,1,1,NULL,1,1,'2012-12-27 00:47:41','2013-01-12 19:26:32','2012-12-27',0,NULL,NULL,86,1,2,0),(87,2,10,'Pure CSS tooltips for Day / Night Changers on the Side','- use menu \"title\" attribute style css for tooltips\r\n- also make the day/night links 30% larger\r\n- also make sure that the tooltip changes with the skin change\r\n- there should be a tooltip that loads with the first load of the page that says \"Hey, Look! Try Our Day/Night Skin Changer!\" or something else that doesn\'t sound like shit.',NULL,NULL,1,5,1,NULL,1,3,'2012-12-27 00:50:14','2012-12-27 01:02:31','2012-12-27',0,NULL,NULL,87,1,2,0),(88,1,10,'sitemap and robots.txt are missing','',NULL,NULL,5,5,3,NULL,1,5,'2012-12-27 04:41:51','2013-01-12 20:48:55','2012-12-27',0,NULL,NULL,88,1,2,0),(89,2,10,'Add rick hodge logo and link to clients section','rickhodge.com',NULL,NULL,5,5,2,NULL,1,3,'2012-12-29 20:53:15','2013-01-12 21:36:55','2012-12-29',0,NULL,NULL,89,1,2,0),(90,2,14,'Create sub-document formats for \"Custom Software Development Agreement\"','- exhibit A - functional specifications\r\n- exhibit B - development plan\r\n- Development Plan Modification Agreement',NULL,NULL,5,NULL,2,NULL,1,3,'2013-01-12 19:17:41','2013-02-12 12:26:00','2013-01-12',0,NULL,NULL,90,1,2,0),(91,2,14,'Create document format for Development Plan Modification Agreement','',NULL,NULL,5,NULL,2,NULL,1,1,'2013-01-12 19:18:15','2013-02-12 11:42:49','2013-01-12',0,NULL,NULL,91,1,2,0),(92,1,14,'Modify \"Custom Software Development Agreement\"','- add verbage to contract about exhibit A ---- same as development plan\r\n- add verbage that says if the functional spec is not submitted within X amount of time, it will be assumed the spec is in the hands of whl engineers',NULL,NULL,5,NULL,2,NULL,1,1,'2013-01-12 19:20:26','2013-02-12 12:11:33','2013-01-12',0,NULL,NULL,92,1,2,0),(93,1,10,'site does not pass XHTML or CSS standards check anymore','- whitehotlogic site does not meet WC3 standards \r\n- either remove assurance links from site footer or fix errors\r\n\r\nhttp://www.google.com/url?q=http%3A%2F%2Fvalidator.w3.org%2Fcheck%3Furi%3Dhttp%253a%252f%252fhome%252ewhitehotlogic%252ecom%252f&sa=D&sntz=1&usg=AFQjCNEwxhnn4wpHcctd6l69KzL4i2zyTQ',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 19:25:03','2013-01-12 19:25:03','2013-01-12',0,NULL,NULL,93,1,2,0),(94,2,9,'Add Wildcard Subdomain DNS (whatever.whitehotlogic.com redirect)','- add wildcard dns\r\n\r\nex: shittydicknipples.whitehotlogic.com should redirect to www.whitehotlogic.com even though it does not exist)\r\n\r\nmay need to do this in 1and1 control panel',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 19:28:01','2013-01-12 19:28:01','2013-01-12',0,NULL,NULL,94,1,2,0),(95,1,1,'Client Reports 2000+ Abandoned Shopping Carts','he is worried this has an impact on performance\r\n\r\nare these created by crawlers?',NULL,NULL,1,NULL,2,NULL,1,1,'2013-01-12 19:33:28','2013-01-12 19:34:02','2013-01-12',0,NULL,NULL,95,1,2,0),(96,1,1,'Add \"Like Us On Facebook\" to checkout process','add this somewhere in the checkout process',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 19:37:43','2013-01-12 19:37:43','2013-01-12',0,NULL,NULL,96,1,2,0),(97,1,1,'Remove back-to-school image','',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 19:38:12','2013-01-12 19:38:12','2013-01-12',0,NULL,NULL,97,1,2,0),(98,2,1,'Add Blog functionality to the site','Client-Provided this example: http://www.google.com/url?q=http%3A%2F%2Fecommerce.aheadworks.com%2Ffree-stuff%2Fblog.html&sa=D&sntz=1&usg=AFQjCNEuOMyyCwNmNU2WqPVam_LZltR1Gg\r\n\r\n\r\nWe should be able to take care of this with just the functionality that\'s already built into magento - dustin',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 19:40:25','2013-01-12 19:40:25','2013-01-12',0,NULL,NULL,98,1,2,0),(99,2,1,'Create script to add city pages','See email from client: https://mail.google.com/mail/#search/jam31018%40gmail.com/13ad24c5af2d7ecf',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 19:41:29','2013-01-12 19:41:29','2013-01-12',0,NULL,NULL,99,1,2,0),(100,1,14,'\"Custom Software Development Agreement\" - General Modification','- remove all the back-and-forth text from development plan section or add to functional req section also\r\n\r\n',NULL,NULL,5,NULL,2,NULL,1,1,'2013-01-12 19:48:04','2013-02-12 12:11:55','2013-01-12',0,NULL,NULL,100,1,2,0),(101,1,14,'Complete whitehotlogic Engineer Agreement','- this is urgent because David needs to sign it',NULL,NULL,1,NULL,5,NULL,1,0,'2013-01-12 19:49:39','2013-01-12 19:49:39','2013-01-12',0,NULL,NULL,101,1,2,0),(102,1,1,'Client Reports Crawl Errors (with sitemap making software)','see email: https://mail.google.com/mail/#search/jam31018%40gmail.com/13b90195b9d62cda',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 19:59:15','2013-01-12 19:59:15','2013-01-12',0,NULL,NULL,102,1,2,0),(103,1,1,'Client Reports Title too Long','\"One of the things that we are getting clobbered on for SEO is Title too long. I think we need to Truncate the title on the products Meta Tag Title to below 70 Characters.\"',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 20:00:07','2013-01-12 20:00:07','2013-01-12',0,NULL,NULL,103,1,2,0),(104,1,1,'Google Checkout marker does not remain enabled for all items','- this needs to be added as the last step to the import script before reindexing\r\n\r\n ',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 20:01:59','2013-01-12 20:01:59','2013-01-12',0,NULL,NULL,104,1,2,0),(105,2,1,'Client wants a banner slider','Client suggests using this magento extension: \r\n\r\nhttp://www.magentocommerce.com/magento-connect/banner-slider-3912.html',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 20:03:40','2013-01-12 20:03:40','2013-01-12',0,NULL,NULL,105,1,2,0),(106,2,1,'Client wants this extension installed (Amazon / Ebay integration)','http://www.magentocommerce.com/magento-connect/ebay-magento-integration-order-importing-and-stock-level-synchronization.html',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 20:06:14','2013-01-12 20:06:14','2013-01-12',0,NULL,NULL,106,1,2,0),(107,2,1,'Client wants this extension installed','http://www.magentocommerce.com/magento-connect/runa-saleslift-integration.html',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 20:10:31','2013-01-12 20:10:31','2013-01-12',0,NULL,NULL,107,1,2,0),(108,2,1,'Client wants us to test this extension (created by a dropshipping reseller - populates with their product)','Claims to allow you to resell 50k items:\r\n\r\nhttp://www.magentocommerce.com/magento-connect/stock-in-the-channel-1992.html\r\n',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 20:14:58','2013-01-12 20:14:58','2013-01-12',0,NULL,NULL,108,1,2,0),(109,2,1,'Add fields to import script and corresponding product attributes','Not Visible\r\n - Tech Data Part#\r\n - FrieghtPolicyException\r\n \r\nVisible on Product\r\n - Manufacturer Part#\r\n - Manufacturer Name\r\n - UPC / EAN\r\n - NoReturn (Only Visible if Non-Returnable)',NULL,NULL,1,NULL,2,NULL,1,0,'2013-01-12 20:18:04','2013-01-12 20:18:04','2013-01-12',0,NULL,NULL,109,1,2,0);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_details`
--

DROP TABLE IF EXISTS `journal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) NOT NULL DEFAULT '',
  `prop_key` varchar(30) NOT NULL DEFAULT '',
  `old_value` text,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_details`
--

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
INSERT INTO `journal_details` VALUES (1,2,'attr','tracker_id','1','2'),(2,4,'attr','tracker_id','1','3'),(3,5,'attr','priority_id','2','3'),(4,6,'attr','priority_id','2','3'),(5,7,'attr','priority_id','2','4'),(6,8,'attr','priority_id','2','3'),(7,10,'attr','priority_id','2','3'),(8,11,'attr','priority_id','2','3'),(9,12,'attr','priority_id','2','3'),(10,13,'attr','priority_id','2','3'),(11,15,'attr','priority_id','2','3'),(12,16,'attr','status_id','1','3'),(13,17,'attr','priority_id','2','3'),(14,18,'attr','status_id','1','3'),(15,19,'attr','status_id','1','3'),(16,20,'attr','status_id','1','2'),(17,21,'attr','priority_id','2','3'),(18,22,'attr','priority_id','2','3'),(19,23,'attr','priority_id','2','3'),(20,24,'attr','status_id','1','3'),(21,25,'attr','status_id','1','3'),(22,26,'attr','status_id','1','2'),(23,27,'attr','status_id','1','3'),(24,28,'attr','status_id','1','3'),(25,29,'attr','status_id','1','3'),(26,31,'attr','status_id','1','2'),(27,32,'attr','status_id','1','3'),(28,33,'attr','status_id','1','3'),(29,34,'attr','status_id','1','3'),(30,35,'attr','status_id','1','3'),(31,36,'attr','status_id','1','3'),(32,37,'attr','subject','Run Known Performance Imrprovements For Magento','Run Known Performance Improvements For Magento'),(33,38,'attr','priority_id','2','3'),(34,39,'attr','status_id','2','3'),(35,40,'attr','priority_id','2','1'),(36,41,'attr','priority_id','2','1'),(37,42,'attr','priority_id','2','1'),(38,43,'attr','project_id','1','2'),(39,44,'attr','priority_id','2','1'),(40,45,'attr','priority_id','2','3'),(41,47,'attr','status_id','1','3'),(42,48,'attr','status_id','1','3'),(43,50,'attr','status_id','1','3'),(44,51,'attr','status_id','1','3'),(45,54,'attr','status_id','1','3'),(49,57,'attr','subject','Add Promotions Features','Promotions Page'),(50,58,'attr','description','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\n* referral program - $100 prepaid visa\r\n* green campaign - whitehotlogic plants a tree for every new contract','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\n* referral program - $100 prepaid visa\r\n* green campaign - whitehotlogic plants a tree for every new contract\r\n- compliance gap analysis\r\n* $599.......... gap analysis\r\n* *includes 1 site/server\r\n* each additional server or site $299\r\n* every compliance check should sell:\r\n** information systems acceptable use policy\r\n** business continuity plan (hosted offsite)	'),(51,59,'attr','description','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\n* referral program - $100 prepaid visa\r\n* green campaign - whitehotlogic plants a tree for every new contract\r\n- compliance gap analysis\r\n* $599.......... gap analysis\r\n* *includes 1 site/server\r\n* each additional server or site $299\r\n* every compliance check should sell:\r\n** information systems acceptable use policy\r\n** business continuity plan (hosted offsite)	','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\nSECTION: referral program - $100 prepaid visa\r\nSECTION: green campaign - whitehotlogic plants a tree for every new contract\r\nSECTION: compliance gap analysis\r\n* $599\r\n* *includes 1 site/server\r\n* each additional server or site $299\r\n* every compliance check should sell:\r\n** information systems acceptable use policy\r\n** business continuity plan (hosted offsite)	'),(52,60,'attr','status_id','1','2'),(53,60,'attr','priority_id','2','3'),(54,61,'attr','priority_id','2','3'),(55,62,'attr','description','requirements:\r\n* client logo\r\n* link\r\n* super-smooth interface\r\n* scalability','requirements:\r\n* client logo\r\n* link\r\n* super-smooth interface\r\n* scalability\r\n\r\nChange from \"Portfolio\" to \"Clients\" on all Menus and links\r\n\r\n\r\nAdd these clients:\r\n- wholesale computer outlet\r\n- atvpartsandmore\r\n- aceac\r\n- swvhabitat'),(56,64,'attr','status_id','1','3'),(57,65,'attr','status_id','3','5'),(58,66,'attr','status_id','2','3'),(59,67,'attr','project_id','9','10'),(60,68,'attr','project_id','9','10'),(61,69,'attr','project_id','9','10'),(62,70,'attr','assigned_to_id',NULL,'5'),(63,71,'attr','assigned_to_id',NULL,'5'),(64,72,'attr','assigned_to_id',NULL,'5'),(65,73,'attr','assigned_to_id',NULL,'5'),(66,74,'attr','assigned_to_id',NULL,'5'),(67,75,'attr','assigned_to_id',NULL,'5'),(68,76,'attr','subject','Error in IE only ---  on change day to night skin using floating sidebar','javascript error  ---  on change day to night skin using floating sidebar'),(69,77,'attr','assigned_to_id',NULL,'5'),(70,78,'attr','assigned_to_id',NULL,'5'),(71,79,'attr','description','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\nSECTION: referral program - $100 prepaid visa\r\nSECTION: green campaign - whitehotlogic plants a tree for every new contract\r\nSECTION: compliance gap analysis\r\n* $599\r\n* *includes 1 site/server\r\n* each additional server or site $299\r\n* every compliance check should sell:\r\n** information systems acceptable use policy\r\n** business continuity plan (hosted offsite)	','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\nSECTION: referral program - $100 prepaid visa\r\n-- should have corresponding banner slider graphic\r\nSECTION: green campaign - whitehotlogic plants a tree for every new contract\r\n-- should have corresponding banner slider graphic\r\nSECTION: compliance gap analysis\r\n* $599\r\n* *includes 1 site/server\r\n* each additional server or site $299\r\n* every compliance check should sell:\r\n** information systems acceptable use policy\r\n** business continuity plan (hosted offsite)	'),(72,80,'attr','assigned_to_id',NULL,'5'),(73,81,'attr','status_id','3','5'),(74,81,'attr','assigned_to_id',NULL,'5'),(75,82,'attr','assigned_to_id',NULL,'5'),(76,83,'attr','assigned_to_id',NULL,'5'),(77,84,'attr','priority_id','2','1'),(78,85,'attr','description','- use menu \"title\" attribute style css for tooltips\r\n- also make the day/night links 30% larger\r\n- also make sure that the tooltip changes with the skin change','- use menu \"title\" attribute style css for tooltips\r\n- also make the day/night links 30% larger\r\n- also make sure that the tooltip changes with the skin change\r\n- there should be a tooltip that loads with the first load of the page that says \"Hey, Look! Try Our Day/Night Skin Changer!\" or something else that doesn\'t sound like shit.'),(79,86,'attr','description','using newest script - need to get logo from dan','http://levelsetlabs.com/logo.png\r\n\r\nhttp://levelsetlabs.com/'),(80,87,'attr','status_id','1','2'),(81,88,'attr','priority_id','2','3'),(82,90,'attr','status_id','1','3'),(83,91,'attr','status_id','1','3'),(84,92,'attr','status_id','1','2'),(85,93,'attr','priority_id','2','1'),(86,94,'attr','status_id','1','2'),(87,95,'attr','status_id','1','2'),(88,97,'attr','status_id','3','2'),(89,100,'attr','status_id','2','3'),(90,102,'attr','description','- pages for each city like smg-web-design?','- add per-city optimized pages for target cities in central florida (like smg-web-design)\r\n\r\n--- seems like duplicate content penalties should be inflicted? need to verify that they won\'t'),(91,103,'attr','description','he is worried this has an impact on performance','he is worried this has an impact on performance\r\n\r\nare these created by crawlers?'),(92,104,'attr','subject','Server-Side and Remote Auto-Update Script for Link Sharing','Link Sharing Script'),(93,105,'attr','subject','Add Facebook Login For Checkout / New Account','Add Multiple Login Methods For Checkout / New Account'),(94,106,'attr','status_id','2','3'),(95,107,'attr','status_id','3','5'),(96,108,'attr','description','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\nSECTION: referral program - $100 prepaid visa\r\n-- should have corresponding banner slider graphic\r\nSECTION: green campaign - whitehotlogic plants a tree for every new contract\r\n-- should have corresponding banner slider graphic\r\nSECTION: compliance gap analysis\r\n* $599\r\n* *includes 1 site/server\r\n* each additional server or site $299\r\n* every compliance check should sell:\r\n** information systems acceptable use policy\r\n** business continuity plan (hosted offsite)	','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\nSECTION: referral program - $100 prepaid visa\r\n-- should have corresponding banner slider graphic\r\nSECTION: green campaign - whitehotlogic plants a tree for every new contract\r\n-- should have corresponding banner slider graphic\r\nSECTION: compliance gap analysis\r\n* $599\r\n* *includes 1 site/server\r\n* each additional server or site $299\r\n* every compliance check should sell:\r\n** information systems acceptable use policy\r\n** business continuity plan (hosted offsite)	\r\n\r\n\r\n\r\nPromotions:\r\n\r\n\r\n- would be nice to integrate something like this: http://www.hostdime.com/web-hosting/business/\r\n\r\n\r\nMobile Packages:\r\n- current doc: https://docs.google.com/document/d/15Xk5NcsRbdue9QeMuPEOSGczID-HRc8MeLv1r5VhmIg/edit\r\n- mobile development widget on home.whitehotlogic.com should show all 3 packages (replacing current images)'),(97,109,'attr','description','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\nSECTION: referral program - $100 prepaid visa\r\n-- should have corresponding banner slider graphic\r\nSECTION: green campaign - whitehotlogic plants a tree for every new contract\r\n-- should have corresponding banner slider graphic\r\nSECTION: compliance gap analysis\r\n* $599\r\n* *includes 1 site/server\r\n* each additional server or site $299\r\n* every compliance check should sell:\r\n** information systems acceptable use policy\r\n** business continuity plan (hosted offsite)	\r\n\r\n\r\n\r\nPromotions:\r\n\r\n\r\n- would be nice to integrate something like this: http://www.hostdime.com/web-hosting/business/\r\n\r\n\r\nMobile Packages:\r\n- current doc: https://docs.google.com/document/d/15Xk5NcsRbdue9QeMuPEOSGczID-HRc8MeLv1r5VhmIg/edit\r\n- mobile development widget on home.whitehotlogic.com should show all 3 packages (replacing current images)','- add links from rates page to promotions page\r\n- add banner slider graphics with links to promotions page\r\n- add page: company >> promotions\r\n\r\nPROMOTIONS SECTION: referral program - $100 prepaid visa\r\n-- should have corresponding banner slider graphic\r\n\r\nPROMOTIONS SECTION: green campaign - whitehotlogic plants a tree for every new contract\r\n-- should have corresponding banner slider graphic\r\n\r\nPROMOTIONS SECTION: compliance gap analysis\r\n$599\r\n- includes 1 site/server\r\n- each additional server or site $299\r\n- every compliance check should sell:\r\n---- information systems acceptable use policy\r\n---- business continuity plan (hosted offsite)	\r\n\r\n\r\n- would be nice to integrate something like this: http://www.hostdime.com/web-hosting/business/\r\n\r\n\r\nPROMOTIONS SECTION: Mobile Dev Packages\r\n- current doc: https://docs.google.com/document/d/15Xk5NcsRbdue9QeMuPEOSGczID-HRc8MeLv1r5VhmIg/edit\r\n- mobile development widget on home.whitehotlogic.com should show all 3 packages (replacing current images)'),(98,110,'attr','status_id','3','5'),(99,111,'attr','status_id','3','5'),(100,112,'attr','status_id','1','2'),(101,112,'attr','assigned_to_id',NULL,'5'),(102,113,'attr','status_id','1','2'),(103,115,'attr','assigned_to_id','5','1'),(104,117,'attr','description','implement code changes from david’s seo recommendations\r\n	- see: seo analysis\r\n	- see: helper app and tools','implement SEO optimizations\r\n\r\n	- see: seo analysis - https://docs.google.com/document/d/1BuZdqTT98dwnRkTND_GdADxF5uxkoQvy1g4ASEyZ6l8/edit\r\n	- see: helper app and tools - https://docs.google.com/document/d/15OwY22wBwd1Q9ct_dA-RWZ0jnYOhHGvlH0le6PvFYXE/edit'),(105,118,'attr','status_id','2','3'),(106,119,'attr','status_id','3','5'),(107,120,'attr','status_id','1','2'),(108,121,'attr','status_id','1','3'),(109,122,'attr','status_id','2','3'),(110,123,'attr','status_id','3','5'),(111,124,'attr','status_id','3','5'),(112,125,'attr','status_id','2','5'),(113,126,'attr','status_id','2','5'),(114,127,'attr','status_id','1','5'),(115,128,'attr','status_id','1','5'),(116,129,'attr','subject','Create document format for \"Custom Software Development Agreement\" Exhibits (2)','Create document formats for \"Custom Software Development Agreement\"'),(117,129,'attr','description','- create document format for Custom Software Development Agreement - exhibit A - functional specifications\r\n- create document format for Custom Software Development Agreement - exhibit B - development plan','- exhibit A - functional specifications\r\n- exhibit B - development plan\r\n- Development Plan Modification Agreement'),(118,130,'attr','subject','Create document formats for \"Custom Software Development Agreement\"','Create sub-document formats for \"Custom Software Development Agreement\"'),(119,131,'attr','status_id','1','5'),(120,132,'attr','status_id','1','5'),(121,133,'attr','status_id','1','5');
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,6,'Issue',1,'Examples:\r\n\r\n-------------------------------------------------------------------------------------\r\n\r\nToshiba Satellite Pro C650-EZ1540 - Core 2 Duo P7570 / 2.26 GHz - Windows 7 Professional 64-bit - 4 GB RAM - 320 GB HDD - DVD SuperMulti DL - 15.6\" TruBrite wide 1366 x 768 / HD - Intel GMA 4500MHD - trax texture in black - keyboard: US\r\n\r\n-------------------------------------------------------------------------------------\r\n\r\n- macbook just purchased isn’t a currently valid product ( or latest)\r\n	- import script needs to be double-check that it is dropping items that don’t exist anymore\r\n\r\n\r\n\r\n','2012-10-10 01:25:12'),(2,8,'Issue',1,'','2012-10-10 01:33:54'),(3,5,'Issue',1,'- email notification with summary + full day’s log (http with .htaccess)','2012-10-10 01:52:49'),(4,21,'Issue',1,'','2012-10-10 01:57:47'),(5,36,'Issue',1,'','2012-10-18 13:45:41'),(6,31,'Issue',1,'','2012-10-18 13:46:14'),(7,40,'Issue',1,'','2012-10-18 13:46:38'),(8,32,'Issue',1,'','2012-10-18 13:47:03'),(9,40,'Issue',1,'- waiting on mission critical folder/file list from debbie to complete this task\r\n\r\n- NOTE: sftp upload bandwidth is capped at 50KB/s (could present a problem with initial upload if over a few gigs)','2012-10-19 07:21:54'),(10,12,'Issue',1,'','2012-10-20 14:50:31'),(11,24,'Issue',1,'','2012-10-20 14:53:19'),(12,25,'Issue',1,'','2012-10-20 14:54:36'),(13,23,'Issue',1,'','2012-10-20 14:55:26'),(14,8,'Issue',1,'Client Recommended: http://www.magentocommerce.com/knowledge-base/entry/tutorial-multi-site-multi-domain-setup','2012-10-20 15:00:43'),(15,10,'Issue',1,'','2012-10-20 15:04:08'),(16,16,'Issue',1,'','2012-10-20 15:05:13'),(17,11,'Issue',1,'','2012-10-20 15:07:01'),(18,9,'Issue',1,'','2012-10-20 15:07:17'),(19,6,'Issue',1,'','2012-10-20 15:08:12'),(20,5,'Issue',1,'','2012-10-20 15:09:20'),(21,1,'Issue',1,'','2012-10-20 15:11:17'),(22,2,'Issue',1,'','2012-10-20 15:11:31'),(23,4,'Issue',1,'','2012-10-20 15:11:50'),(24,15,'Issue',1,'','2012-10-20 15:25:07'),(25,13,'Issue',1,'','2012-10-20 15:26:05'),(26,14,'Issue',1,'','2012-10-20 15:26:39'),(27,1,'Issue',1,'','2012-10-20 16:03:53'),(28,4,'Issue',1,'','2012-10-20 18:57:53'),(29,43,'Issue',1,'','2012-10-20 19:22:37'),(30,25,'Issue',1,'Waiting on John --- \"Your AdSense for content application is still under review. You will only see blank ads until your account has been fully approved or disapproved.\"\r\n\r\nAlso this is linked to \r\njohn%computeroutletonline.com@gtempaccount.com instead of john@computeroutletonline.com','2012-10-20 19:43:07'),(31,25,'Issue',1,'','2012-10-20 19:43:26'),(32,12,'Issue',1,'','2012-10-20 20:08:41'),(33,2,'Issue',1,'','2012-10-20 20:09:43'),(34,11,'Issue',1,'','2012-10-20 20:54:10'),(35,10,'Issue',1,'','2012-10-20 21:50:56'),(36,23,'Issue',1,'','2012-10-20 23:49:08'),(37,20,'Issue',1,'','2012-10-20 23:55:43'),(38,8,'Issue',1,'','2012-10-20 23:57:25'),(39,5,'Issue',1,'','2012-11-01 02:56:46'),(40,21,'Issue',1,'','2012-11-01 03:23:56'),(41,26,'Issue',1,'','2012-11-01 07:41:23'),(42,29,'Issue',1,'','2012-11-01 07:42:05'),(43,42,'Issue',1,'','2012-11-01 07:42:54'),(44,30,'Issue',1,'','2012-11-01 07:44:44'),(45,50,'Issue',1,'','2012-11-01 07:45:07'),(46,56,'Issue',1,'Use AddThis on each product page - like http://myputnamcoupons.com/','2012-11-01 17:32:40'),(47,59,'Issue',1,'','2012-11-01 23:36:35'),(48,56,'Issue',1,'','2012-11-02 00:46:21'),(49,28,'Issue',1,'Method:\r\n-- Create New Category (\"New Items\") and modify import script to add items with techdata item status \"new\" to \"New Items\"\r\n-- Use \"Manage Categories\" feature in admin panel to assign these items to a block\r\n-- display block in sidebar or on homepage, etc.\r\n-- requires nightly reindexing','2012-11-03 16:17:18'),(50,40,'Issue',1,'','2012-11-08 14:31:01'),(51,32,'Issue',1,'','2012-11-08 14:31:38'),(52,36,'Issue',1,'	- verify modules installed\r\n        - verify webmail account created\r\n        - Mailsave to CCK Imagefield --- shows incompatible\r\n	- updated permissions so admins could set config\r\n 	- drupalNewsletterUpload@swvhabitat.org\r\n	- SWV123admin!\r\n 	- http://new.swvhabitat.org/node/218\r\n 	- quickstart one ----- http://new.swvhabitat.org/node/219\r\n 	- http://drupalcode.org/project/mailhandler.git/blob/refs/heads/6.x-2.x:/INSTALL.txt\r\n	- enabled feeds admin ui\r\n	- need to install modules:\r\n		- strongarm\r\n		- features','2012-11-08 21:51:44'),(53,65,'Issue',1,'TOP 20 FILES\r\n\r\n32354Mb /var/lib/mysql/ibdata1\r\n2711Mb /var/log/mysql/mysql.log\r\n2352Mb /var/lib/mysql/magento/catalogsearch_fulltext.MYD\r\n1938Mb /var/lib/mysql/magento/catalogsearch_fulltext.MYI\r\n35Mb /var/cache/apt/srcpkgcache.bin\r\n33Mb /var/cache/apt-xapian-index/index.2/postlist.DB\r\n31Mb /var/lib/mlocate/mlocate.db\r\n27Mb /var/cache/apt-xapian-index/index.2/termlist.DB\r\n24Mb /var/lib/apt/lists/us.archive.ubuntu.com_ubuntu_dists_precise_universe_binary-i386_Packages\r\n24Mb /var/lib/apt/lists/us.archive.ubuntu.com_ubuntu_dists_precise_universe_binary-amd64_Packages\r\n20Mb /var/lib/apt/lists/us.archive.ubuntu.com_ubuntu_dists_precise_universe_source_Sources\r\n14Mb /var/log/import_datapaq_select.log\r\n14Mb /var/lib/apt/lists/us.archive.ubuntu.com_ubuntu_dists_precise_universe_i18n_Translation-en\r\n12Mb /var/log/installer/cdebconf/templates.dat\r\n12Mb /var/log/mysql/mysql.log.1.gz\r\n7Mb /var/lib/apt/lists/us.archive.ubuntu.com_ubuntu_dists_precise_main_binary-i386_Packages\r\n7Mb /var/lib/apt/lists/us.archive.ubuntu.com_ubuntu_dists_precise_main_binary-amd64_Packages\r\n6Mb /var/log/nginx/magento.access.log.39.gz\r\n6Mb /var/log/nginx/magento.access.log.22.gz\r\n6Mb /var/log/nginx/magento.access.log.35.gz\r\n\r\nTOP 20 FOLDERS\r\n\r\n40869744        var\r\n33253004        root\r\n11906864        srv\r\n4727140 home\r\n1400452 usr\r\n215932  lib\r\n24640   boot\r\n8884    bin\r\n7584    etc\r\n6924    sbin\r\n336     run\r\n228     tmp\r\n16      lost+found\r\n12      media\r\n4       selinux\r\n4       opt\r\n4       mnt\r\n4       lib64\r\n4       dev\r\n0       vmlinuz','2012-11-26 16:22:16'),(54,66,'Issue',1,'','2012-11-26 16:31:34'),(57,76,'Issue',1,'','2012-12-22 16:07:12'),(58,76,'Issue',1,'','2012-12-22 16:17:32'),(59,76,'Issue',1,'','2012-12-22 16:22:22'),(60,74,'Issue',1,'','2012-12-22 16:29:05'),(61,75,'Issue',1,'','2012-12-22 16:29:44'),(62,74,'Issue',1,'','2012-12-22 16:39:29'),(63,75,'Issue',1,'added folder password protection using this tutorial: http://faq.1and1.co.uk/scripting/htaccess/3.html\r\n\r\n\r\n\r\nadding javascript to submit form to \"adminportal.html\" like this:\r\nhttp://admin:whl123admin@home.whitehotlogic.com/secure/adminportal.html\r\n\r\n\r\n','2012-12-22 19:31:14'),(64,75,'Issue',1,'','2012-12-22 20:58:44'),(65,75,'Issue',1,'','2012-12-22 20:59:22'),(66,74,'Issue',5,'Finished the flip card script. Original script can be found at http://tutorialzine.com/2010/03/sponsor-wall-flip-jquery-css/ Also the portfolio page has now been renamed clients.php','2012-12-22 21:01:26'),(67,82,'Issue',1,'','2012-12-27 00:03:27'),(68,81,'Issue',1,'','2012-12-27 00:03:50'),(69,83,'Issue',1,'','2012-12-27 00:08:19'),(70,85,'Issue',1,'','2012-12-27 00:22:45'),(71,83,'Issue',1,'','2012-12-27 00:25:53'),(72,82,'Issue',1,'','2012-12-27 00:26:12'),(73,81,'Issue',1,'','2012-12-27 00:26:31'),(74,80,'Issue',1,'','2012-12-27 00:26:50'),(75,79,'Issue',1,'','2012-12-27 00:27:13'),(76,79,'Issue',1,'also on page load (when monitoring in firebug)\r\n- confirmed in IE and FF','2012-12-27 00:27:56'),(77,78,'Issue',1,'','2012-12-27 00:28:22'),(78,77,'Issue',1,'','2012-12-27 00:29:15'),(79,76,'Issue',1,'','2012-12-27 00:30:17'),(80,76,'Issue',1,'','2012-12-27 00:30:35'),(81,74,'Issue',1,'','2012-12-27 00:31:49'),(82,84,'Issue',1,'','2012-12-27 00:33:52'),(83,87,'Issue',1,'','2012-12-27 00:50:35'),(84,87,'Issue',1,'','2012-12-27 00:54:09'),(85,87,'Issue',1,'','2012-12-27 01:02:31'),(86,82,'Issue',1,'','2012-12-27 02:18:11'),(87,81,'Issue',5,'Added titles to all of the nav elements, and some jquery code to hide/show the tooltip box. Changes are pushed to master git@github.com:whitehotlogic/home.whitehotlogic.com.git can\'t be marked as resolved until the sitelinks start appearing in Google results.','2012-12-27 02:57:10'),(88,77,'Issue',1,'','2012-12-27 04:33:08'),(89,81,'Issue',1,'additional info: http://hellboundbloggers.com/2010/03/13/25-basic-tips-to-get-google-sitelinks/','2012-12-27 04:42:43'),(90,82,'Issue',5,'Added Levelset lab logo and link to page, also centered the clients div.','2012-12-28 02:58:25'),(91,88,'Issue',5,'Added the robots and site map using these tools http://www.mcanerin.com/EN/search-engine/robots-txt.asp http://www.xml-sitemaps.com/','2012-12-28 02:59:22'),(92,80,'Issue',5,'we may need to alter some tags, it seems like we need to use the og:img tag, also I found this https://developers.facebook.com/tools/debug which tells you how facebook see the link you gave it.','2012-12-28 03:42:54'),(93,79,'Issue',5,'','2012-12-28 03:49:15'),(94,77,'Issue',5,'It has something to do with that repeat div being in front of the slides div, i\'ve tried some z-indexing with no luck, this will help http://jquery.malsup.com/cycle/anchor.html a demo of someone using this script with links.','2012-12-28 17:34:13'),(95,84,'Issue',5,'we have this doc open https://docs.google.com/document/d/1NfQHYgabXVp-eHN487_KXXphPavl8YX9ySPfARIG9ZY/edit which tells the parts list also I created https://docs.google.com/document/d/11O3h5loYPp3BwUYF_IQji-4N9DgqEebbX8OaFhlHVJg/edit for more personal information.','2012-12-28 17:37:30'),(96,80,'Issue',1,'expanded:\r\n\r\nthe og tag is apparently for the OpenGraph library which facebook uses to scrape sites for thumbnails:\r\n\r\n<meta property=\"og:title\" content=\"The Rock\"/>\r\n    <meta property=\"og:type\" content=\"movie\"/>\r\n    <meta property=\"og:url\" content=\"http://www.imdb.com/title/tt0117500/\"/>\r\n    <meta property=\"og:image\" content=\"http://ia.media-imdb.com/rock.jpg\"/>\r\n    <meta property=\"og:site_name\" content=\"IMDb\"/>\r\n    <meta property=\"fb:admins\" content=\"USER_ID\"/>\r\n    <meta property=\"og:description\"\r\n          content=\"A group of U.S. Marines, under command of\r\n                   a renegade general, take over Alcatraz and\r\n                   threaten San Francisco Bay with biological\r\n                   weapons.\"/>\r\n\r\nhttps://developers.facebook.com/docs/opengraph/\r\n\r\nhttp://wordpressdevelopment.com/blog/tips/how-to-specify-a-facebook-thumbnail-when-sharing-a-post/\r\n\r\nhttp://www.wpbeginner.com/wp-themes/how-to-avoid-no-thumbnail-issue-while-sharing-post-on-facebook/\r\n\r\n\r\nAnother solution may be:\r\n\r\n<link rel=\"image_src\" href=\"IMAGE SOURCE\" />\r\n\r\nhttp://wordpressdevelopment.com/blog/tips/how-to-specify-a-facebook-thumbnail-when-sharing-a-post/','2012-12-28 20:41:53'),(97,88,'Issue',1,'need to submit sitemap to google through whitehotlogic@gmail.com account for this ticket to be completed','2012-12-29 14:45:26'),(98,88,'Issue',1,'robots.txt shouldn\'t disallow any robots','2012-12-29 14:54:11'),(99,83,'Issue',1,'analysis on home.whitehotlogic.com from seoautomatic.com https://docs.google.com/file/d/0Bxx3HfVqHjCdaHlSWk5LRXc0RlU/edit','2012-12-29 15:03:22'),(100,88,'Issue',5,'','2013-01-12 18:03:23'),(101,80,'Issue',5,'Alright, I am able to load the images on Google+ and I believe Facebook as per: https://developers.facebook.com/tools/debug/og/object?q=http%3A%2F%2Fhome.whitehotlogic.com this probably needs a follow up.','2013-01-12 19:07:53'),(102,86,'Issue',1,'','2013-01-12 19:26:32'),(103,95,'Issue',1,'','2013-01-12 19:34:02'),(104,50,'Issue',1,'- this is currently hosted at http://linkexchange.whitehotlogic.com/admin.php\r\n\r\n- found but not used:\r\n		- http://www.hotscripts.com/listing/php-reciprocal-links-manager/\r\n		- http://www.hotscripts.com/listing/automated-link-exchange-portal/\r\n\r\nTODO\r\n- remove linkman branding, deploy to client server (add linking to existing pages)','2013-01-12 19:36:45'),(105,22,'Issue',1,'Client approved this $150 extension being installed, if it works as advertised: http://www.magentocommerce.com/magento-connect/catalog/product/view/id/15404/s/super-checkout-8646/','2013-01-12 20:08:35'),(106,77,'Issue',5,'Alright, so now the slider links work with a transparent image in front of the slider there is a new div called LINKS this div holds the links for the images in the Slides div.','2013-01-12 20:26:59'),(107,77,'Issue',1,'','2013-01-12 20:33:52'),(108,76,'Issue',1,'','2013-01-12 20:45:20'),(109,76,'Issue',1,'','2013-01-12 20:46:34'),(110,88,'Issue',1,'','2013-01-12 20:48:56'),(111,82,'Issue',1,'','2013-01-12 20:50:27'),(112,89,'Issue',1,'','2013-01-12 20:55:22'),(113,78,'Issue',1,'','2013-01-12 20:56:41'),(114,78,'Issue',1,'use a standard rss image for the link like the one in the feeds menu on home.whitehotlogic.com','2013-01-12 20:57:21'),(115,76,'Issue',1,'','2013-01-12 20:58:24'),(116,81,'Issue',1,'17 days since the changes were made to this ticket - still no sitelinks','2013-01-12 21:11:30'),(117,83,'Issue',1,'','2013-01-12 21:26:29'),(118,89,'Issue',5,'','2013-01-12 21:33:06'),(119,89,'Issue',1,'','2013-01-12 21:36:55'),(120,83,'Issue',1,'Please list all tasks performed for SEO as updates for this ticket.','2013-01-12 21:40:53'),(121,79,'Issue',5,'Took out the line that was causing the setBySkin error','2013-01-12 21:49:59'),(122,78,'Issue',5,'','2013-01-12 22:32:33'),(123,79,'Issue',1,'','2013-01-12 22:47:12'),(124,78,'Issue',1,'','2013-01-12 22:47:41'),(125,81,'Issue',1,'','2013-01-25 15:56:48'),(126,80,'Issue',1,'','2013-01-25 15:57:01'),(127,76,'Issue',1,'','2013-01-25 15:57:20'),(128,91,'Issue',1,'combined to ticket 90','2013-02-12 11:42:49'),(129,90,'Issue',1,'','2013-02-12 11:43:22'),(130,90,'Issue',1,'','2013-02-12 11:43:47'),(131,92,'Issue',1,'Functional Specifications and Development Plan will now be submitted before the contract is signed, so they can be included in the contract','2013-02-12 12:11:33'),(132,100,'Issue',1,'done.','2013-02-12 12:11:56'),(133,90,'Issue',1,'Done - see partsinc','2013-02-12 12:26:00');
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
INSERT INTO `member_roles` VALUES (1,1,3,NULL),(2,2,3,NULL),(3,3,3,NULL),(4,4,3,NULL),(5,5,3,NULL),(6,6,3,NULL),(7,7,3,NULL),(8,8,3,NULL),(9,9,3,NULL),(10,10,3,NULL),(11,11,3,NULL),(12,12,3,NULL),(13,13,3,NULL),(14,14,3,NULL);
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,1,4,'2012-12-27 00:17:58',0),(2,4,4,'2012-12-27 00:21:46',0),(3,5,4,'2012-12-27 00:21:46',0),(4,5,9,'2012-12-27 00:23:42',0),(5,1,9,'2012-12-27 00:24:31',0),(6,5,10,'2012-12-27 00:25:21',0),(7,1,10,'2012-12-27 00:25:21',0),(8,5,11,'2012-12-27 00:33:26',0),(9,1,11,'2012-12-27 00:33:26',0),(10,5,14,'2013-01-12 17:56:29',0),(11,1,14,'2013-01-12 17:56:30',0),(12,4,1,'2013-01-12 19:30:05',0),(13,5,1,'2013-01-12 19:30:06',0),(14,1,1,'2013-01-12 19:30:06',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `description` text,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `homepage` varchar(255) DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'computeroutletonline.com','','computeroutletonline.com',0,NULL,'2012-10-09 21:57:06','2012-10-09 21:57:06','wco-001',1,3,6),(2,'Performance Analysis','Isolate software/hardware bottlenecks','',0,1,'2012-10-10 01:33:06','2012-10-15 01:08:36','wco-001-001',1,4,5),(3,'SWV Habitat','','',0,NULL,'2012-10-15 03:12:42','2012-10-15 03:28:18','swvhabitat',1,17,18),(4,'Parts Inc','','',0,NULL,'2012-11-01 21:55:38','2012-11-03 16:14:45','partsinc-001',1,11,12),(5,'Shafer Billing','','',0,NULL,'2012-12-09 20:58:21','2012-12-20 18:17:28','shafer-billing',1,15,16),(6,'SajlawLextrust','','',0,NULL,'2012-12-09 21:00:43','2012-12-20 18:17:01','sajlaw-lextrust',1,13,14),(7,'AceAC','','',0,NULL,'2012-12-09 21:01:21','2012-12-20 18:02:08','aceac',1,1,2),(9,'whitehotlogic Internal','','',0,NULL,'2012-12-22 15:31:18','2012-12-26 23:43:52','whitehotlogic-internal',1,19,26),(10,'home.whitehotlogic.com','','',0,9,'2012-12-22 15:47:43','2012-12-22 15:57:42','www-whitehotlogic-com',1,22,23),(11,'Social Networking','','',0,9,'2012-12-27 00:10:19','2012-12-27 00:20:10','social-networking',1,24,25),(12,'Freelancer','Freelancer.com projects','http://freelancer.com',0,NULL,'2012-12-29 15:42:45','2012-12-29 15:42:45','freelancer',1,7,10),(13,'4073410 - Convert document to form','https://docs.google.com/document/d/1QRsd_9rofugrN0wyKy7fVqsLMKWoojjrtvXyjCthUg8/edit','',0,12,'2012-12-29 15:44:22','2012-12-29 15:44:22','convert-doc',1,8,9),(14,'Forms and Documents','','',0,9,'2013-01-12 17:56:19','2013-01-25 15:54:11','forms-and-documents',1,20,21);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_trackers`
--

DROP TABLE IF EXISTS `projects_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_trackers`
--

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(6,1),(6,2),(6,3),(7,1),(7,2),(7,3),(9,1),(9,2),(9,3),(10,1),(10,2),(10,3),(11,1),(11,2),(11,3),(12,1),(12,2),(12,3),(13,1),(13,2),(13,3),(14,1),(14,2),(14,3);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filters` text,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `column_names` text,
  `sort_criteria` text,
  `group_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `root_url` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `path_encoding` varchar(64) DEFAULT NULL,
  `log_encoding` varchar(64) DEFAULT NULL,
  `extra_info` text,
  `identifier` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text,
  `issues_visibility` varchar(30) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',1,1,1,'--- \n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default'),(2,'Anonymous',2,1,2,'--- \n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_files\n- :browse_repository\n- :view_changesets\n','default'),(3,'Manager',3,1,0,'--- \n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :move_issues\n- :delete_issues\n- :manage_public_queries\n- :save_queries\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :log_time\n- :view_time_entries\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :manage_news\n- :comment_news\n- :manage_documents\n- :view_documents\n- :manage_files\n- :view_files\n- :manage_wiki\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :view_wiki_pages\n- :export_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_repository\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n- :manage_boards\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_calendar\n- :view_gantt\n','all'),(4,'Developer',4,1,0,'--- \n- :manage_versions\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :manage_files\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n','default'),(5,'Reporter',5,1,0,'--- \n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('100'),('101'),('102'),('103'),('104'),('105'),('106'),('107'),('108'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('20'),('20090214190337'),('20090312172426'),('20090312194159'),('20090318181151'),('20090323224724'),('20090401221305'),('20090401231134'),('20090403001910'),('20090406161854'),('20090425161243'),('20090503121501'),('20090503121505'),('20090503121510'),('20090614091200'),('20090704172350'),('20090704172355'),('20090704172358'),('20091010093521'),('20091017212227'),('20091017212457'),('20091017212644'),('20091017212938'),('20091017213027'),('20091017213113'),('20091017213151'),('20091017213228'),('20091017213257'),('20091017213332'),('20091017213444'),('20091017213536'),('20091017213642'),('20091017213716'),('20091017213757'),('20091017213835'),('20091017213910'),('20091017214015'),('20091017214107'),('20091017214136'),('20091017214236'),('20091017214308'),('20091017214336'),('20091017214406'),('20091017214440'),('20091017214519'),('20091017214611'),('20091017214644'),('20091017214720'),('20091017214750'),('20091025163651'),('20091108092559'),('20091114105931'),('20091123212029'),('20091205124427'),('20091220183509'),('20091220183727'),('20091220184736'),('20091225164732'),('20091227112908'),('20100129193402'),('20100129193813'),('20100221100219'),('20100313132032'),('20100313171051'),('20100705164950'),('20100819172912'),('20101104182107'),('20101107130441'),('20101114115114'),('20101114115359'),('20110220160626'),('20110223180944'),('20110223180953'),('20110224000000'),('20110226120112'),('20110226120132'),('20110227125750'),('20110228000000'),('20110228000100'),('20110401192910'),('20110408103312'),('20110412065600'),('20110511000000'),('20110902000000'),('20111201201315'),('20120115143024'),('20120115143100'),('20120115143126'),('20120127174243'),('20120205111326'),('20120223110929'),('20120301153455'),('20120422150750'),('20120705074331'),('20120707064544'),('20120714122000'),('20120714122100'),('20120714122200'),('20120731164049'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('49'),('5'),('50'),('51'),('52'),('53'),('54'),('55'),('56'),('57'),('58'),('59'),('6'),('60'),('61'),('62'),('63'),('64'),('65'),('66'),('67'),('68'),('69'),('7'),('70'),('71'),('72'),('73'),('74'),('75'),('76'),('77'),('78'),('79'),('8'),('80'),('81'),('82'),('83'),('84'),('85'),('86'),('87'),('88'),('89'),('9'),('90'),('91'),('92'),('93'),('94'),('95'),('96'),('97'),('98'),('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'repositories_encodings','','2013-01-12 19:14:53'),(2,'per_page_options','25,50,100','2013-01-12 19:14:54'),(3,'activity_days_default','30','2013-01-12 19:14:54'),(4,'diff_max_lines_displayed','1500','2013-01-12 19:14:54'),(5,'app_title','whitehotlogic™ Issue Tracker','2013-01-12 19:14:54'),(6,'host_name','localhost:3000','2013-01-12 19:14:54'),(7,'cache_formatted_text','0','2013-01-12 19:14:54'),(8,'attachment_max_size','5120','2013-01-12 19:14:54'),(9,'welcome_text','','2013-01-12 19:14:54'),(10,'text_formatting','textile','2013-01-12 19:14:54'),(11,'protocol','http','2013-01-12 19:14:54'),(12,'file_max_size_displayed','512','2013-01-12 19:14:54'),(13,'feeds_limit','15','2013-01-12 19:14:54'),(14,'wiki_compression','','2013-01-12 19:14:54'),(15,'date_format','','2013-04-08 00:58:12'),(16,'gravatar_enabled','0','2013-04-08 00:58:12'),(17,'default_language','en','2013-04-08 00:58:12'),(18,'thumbnails_enabled','0','2013-04-08 00:58:12'),(19,'user_format','firstname_lastname','2013-04-08 00:58:12'),(20,'start_of_week','','2013-04-08 00:58:12'),(21,'time_format','','2013-04-08 00:58:12'),(22,'ui_theme','pixel-cookers','2013-04-08 01:26:15'),(23,'gravatar_default','','2013-04-08 00:58:12'),(24,'thumbnails_size','100','2013-04-08 00:58:12');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_entries`
--

DROP TABLE IF EXISTS `time_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_entries`
--

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,1,'feeds','f91be0d046835939d2617709c82491f27fd145a9','2012-10-09 21:50:05'),(2,1,'recovery','b41dc7cdb4d5464e1a16d7f221f7e7169206f03c','2012-10-15 00:42:57'),(3,4,'feeds','8b006ccb12d38cd0e89cfeef86bf2a810f63965d','2012-11-02 03:29:41'),(4,5,'feeds','cf79b8fffa4533c79c9cd6ead2d1f6ec55bde6b9','2012-12-19 23:58:03');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'Bug',1,1,0,0),(2,'Feature',1,2,1,0),(3,'Support',0,3,0,0);
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text,
  `hide_mail` tinyint(1) DEFAULT '0',
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'--- \n:no_self_notified: false\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \"1\"\n',0,''),(2,4,'--- \n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n:no_self_notified: false\n:gantt_zoom: 2\n:comments_sorting: asc\n',0,''),(3,5,'--- \n:comments_sorting: asc\n:no_self_notified: false\n:gantt_zoom: 2\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n',0,'');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(30) NOT NULL DEFAULT '',
  `mail` varchar(60) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `mail_notification` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'djohnson','9bfc0b2bbf450ac2fbb7adcb2f0b05a428c14a97','Dustin','Johnson','djohnson@whitehotlogic.com',1,1,'2013-04-25 13:44:46','en',NULL,'2012-10-02 16:05:25','2013-04-25 13:44:46','User',NULL,'all','cb6f0e48982cbcbed04f3c011928f7bf'),(2,'','','','Anonymous','',0,0,NULL,'',NULL,'2012-10-02 16:06:16','2012-10-02 16:06:16','AnonymousUser',NULL,'only_my_events',NULL),(3,'','','','Anonymous','',0,0,NULL,'',NULL,'2012-10-02 16:06:16','2012-10-02 16:06:16','AnonymousUser',NULL,'only_my_events',NULL),(4,'dlewis','466f6062bde89a6b510ecf0d8d77de772b8cd36d','Dan','Lewis','daniel@levelsetlabs.com',1,1,'2012-11-02 03:29:41','en',NULL,'2012-11-02 03:29:25','2012-11-02 03:29:41','User',NULL,'only_my_events','6e6ecfd47d4652c6b6e06d1345c8a1dd'),(5,'drivera','d73db683249f18d9d29ab87b410f6a2d960c045e','David','Rivera','drivera@whitehotlogic.com',1,1,'2013-01-31 22:25:08','en',NULL,'2012-12-09 20:57:33','2013-01-31 22:25:08','User',NULL,'only_my_events','8fe4a31522b6d8c50e470e791405b8b9');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) DEFAULT '',
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
INSERT INTO `wiki_content_versions` VALUES (1,1,1,1,'h1. Wiki\r\n\r\n- 10:00am - techdata posts datapaq select\r\n- 4:00pm - import script runs\r\n- 6:00pm - sync time with pool.ntp.org','','','2012-11-02 04:41:29',1);
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext,
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
INSERT INTO `wiki_contents` VALUES (1,1,1,'h1. Wiki\r\n\r\n- 10:00am - techdata posts datapaq select\r\n- 4:00pm - import script runs\r\n- 6:00pm - sync time with pool.ntp.org','','2012-11-02 04:41:29',1);
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
INSERT INTO `wiki_pages` VALUES (1,1,'Wiki','2012-11-02 04:41:29',0,NULL);
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_redirects`
--

DROP TABLE IF EXISTS `wiki_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `redirects_to` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_redirects`
--

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1),(2,2,'Wiki',1),(3,3,'Wiki',1),(4,4,'Wiki',1),(5,5,'Wiki',1),(6,6,'Wiki',1),(7,7,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `field_name` varchar(30) DEFAULT NULL,
  `rule` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,1,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(2,1,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(3,1,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(4,1,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(5,1,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(6,1,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(7,1,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(8,1,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(9,1,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(10,1,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(11,1,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(12,1,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(13,1,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(14,1,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(15,1,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(16,1,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(17,1,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(18,1,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(19,1,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(20,1,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(21,1,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(22,1,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(23,1,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(24,1,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(25,1,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(26,1,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(27,1,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(28,1,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(29,1,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(30,1,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(31,2,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(32,2,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(33,2,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(34,2,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(35,2,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(36,2,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(37,2,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(38,2,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(39,2,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(40,2,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(41,2,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(42,2,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(43,2,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(44,2,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(45,2,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(46,2,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(47,2,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(48,2,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(49,2,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(50,2,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(51,2,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(52,2,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(53,2,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(54,2,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(55,2,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(56,2,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(57,2,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(58,2,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(59,2,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(60,2,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(61,3,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(62,3,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(63,3,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(64,3,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(65,3,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(66,3,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(67,3,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(68,3,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(69,3,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(70,3,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(71,3,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(72,3,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(73,3,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(74,3,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(75,3,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(76,3,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(77,3,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(78,3,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(79,3,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(80,3,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(81,3,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(82,3,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(83,3,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(84,3,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(85,3,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(86,3,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(87,3,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(88,3,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(89,3,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(90,3,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(91,1,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(92,1,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(93,1,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(94,1,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(95,1,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(96,1,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(97,1,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(98,1,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(99,1,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(100,1,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(101,1,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(102,1,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(103,1,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(104,2,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(105,2,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(106,2,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(107,2,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(108,2,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(109,2,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(110,2,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(111,2,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(112,2,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(113,2,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(114,2,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(115,2,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(116,2,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(117,3,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(118,3,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(119,3,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(120,3,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(121,3,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(122,3,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(123,3,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(124,3,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(125,3,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(126,3,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(127,3,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(128,3,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(129,3,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(130,1,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(131,1,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(132,1,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(133,1,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(134,1,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(135,2,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(136,2,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(137,2,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(138,2,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(139,2,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(140,3,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(141,3,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(142,3,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(143,3,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(144,3,3,4,5,0,0,'WorkflowTransition',NULL,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-25 13:58:06
