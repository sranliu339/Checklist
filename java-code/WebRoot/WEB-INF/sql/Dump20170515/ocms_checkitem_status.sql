-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: ocms
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `checkitem_status`
--

DROP TABLE IF EXISTS `checkitem_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkitem_status` (
  `checkitem_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL COMMENT '状態\n０：NO　１：YES',
  `comment` varchar(200) DEFAULT NULL COMMENT 'コメント\nユーザが自由にコメント',
  `deliverables` varchar(100) DEFAULT NULL COMMENT 'コメントの根拠となる成果物',
  `prj_type` int(11) DEFAULT NULL COMMENT 'プロジェクトタイプ\n',
  `importance` int(11) DEFAULT NULL COMMENT '重要度',
  `history` datetime DEFAULT NULL COMMENT '変更履歴',
  `problem` int(11) DEFAULT NULL COMMENT '不遵守事項有無\n',
  `checkitem_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`checkitem_status_id`),
  KEY `fk_chekitem_statuses_checkitem_idx` (`checkitem_id`),
  KEY `fk_checkitem_status_item_idx` (`item_id`),
  CONSTRAINT `fk_checkitem_status_checkitem` FOREIGN KEY (`checkitem_id`) REFERENCES `checkitem` (`checkitem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_checkitem_status_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8 COMMENT='\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkitem_status`
--

LOCK TABLES `checkitem_status` WRITE;
/*!40000 ALTER TABLE `checkitem_status` DISABLE KEYS */;
INSERT INTO `checkitem_status` VALUES (45,5,'test2',NULL,1,1,NULL,1,1,24),(46,5,'',NULL,1,1,NULL,1,2,24),(47,1,'',NULL,1,1,NULL,1,3,25),(48,5,'',NULL,1,1,NULL,0,4,25),(49,1,'',NULL,1,1,NULL,1,5,26),(50,1,'',NULL,1,1,NULL,0,6,26),(51,1,'',NULL,1,1,NULL,0,7,27),(54,1,'',NULL,1,1,NULL,0,8,27),(55,5,'',NULL,1,1,NULL,1,9,24),(56,5,'',NULL,1,1,NULL,0,10,25),(57,3,'',NULL,1,1,NULL,0,11,25),(58,1,'',NULL,1,1,NULL,0,12,31),(59,1,'',NULL,1,1,NULL,0,13,31),(60,1,'',NULL,1,1,NULL,0,14,31),(61,1,'',NULL,1,1,NULL,0,15,32),(62,1,'',NULL,1,1,NULL,0,16,32),(63,1,'',NULL,1,1,NULL,0,17,32),(64,1,'',NULL,1,1,NULL,0,18,33),(65,1,'',NULL,1,1,NULL,0,19,33),(66,1,'',NULL,1,1,NULL,0,20,33),(67,1,'',NULL,1,1,NULL,0,21,33),(68,1,'',NULL,1,1,NULL,0,22,34),(69,1,'',NULL,1,1,NULL,0,23,34),(70,1,'',NULL,1,1,NULL,0,24,26),(71,1,'',NULL,1,1,NULL,0,25,27),(72,1,'',NULL,1,1,NULL,0,26,27),(73,1,'',NULL,1,1,NULL,0,27,35),(74,1,'',NULL,1,1,NULL,0,28,35),(75,1,'',NULL,1,1,NULL,0,29,35),(76,1,'',NULL,1,1,NULL,0,30,36),(77,1,'',NULL,1,1,NULL,0,31,36),(78,1,'',NULL,1,1,NULL,0,32,36),(79,1,'',NULL,1,1,NULL,0,33,37),(80,1,'',NULL,1,1,NULL,0,34,37),(81,1,'',NULL,1,1,NULL,0,35,38),(82,1,'',NULL,1,1,NULL,0,36,38),(163,1,NULL,NULL,1,1,NULL,0,37,41),(164,1,NULL,NULL,1,1,NULL,0,38,41),(165,1,NULL,NULL,1,1,NULL,0,39,41),(166,1,NULL,NULL,1,1,NULL,0,40,42),(167,1,NULL,NULL,1,1,NULL,0,41,42),(168,1,NULL,NULL,1,1,NULL,0,42,42),(169,1,NULL,NULL,1,1,NULL,0,43,42),(170,1,NULL,NULL,1,1,NULL,0,44,43),(171,1,NULL,NULL,1,1,NULL,0,45,43),(172,1,NULL,NULL,1,1,NULL,0,46,43),(173,1,NULL,NULL,1,1,NULL,0,47,43),(174,1,NULL,NULL,1,1,NULL,0,48,43),(175,1,NULL,NULL,1,1,NULL,0,49,44),(176,1,NULL,NULL,1,1,NULL,0,50,44),(177,1,NULL,NULL,1,1,NULL,0,51,44),(178,1,NULL,NULL,1,1,NULL,0,52,45),(179,1,NULL,NULL,1,1,NULL,0,53,45),(180,1,NULL,NULL,1,1,NULL,0,54,46),(181,1,NULL,NULL,1,1,NULL,0,55,46),(182,1,NULL,NULL,1,1,NULL,0,56,48),(183,1,NULL,NULL,1,1,NULL,0,57,48),(184,1,NULL,NULL,1,1,NULL,0,58,48),(185,1,NULL,NULL,1,1,NULL,0,59,48),(186,1,NULL,NULL,1,1,NULL,0,60,49),(187,1,NULL,NULL,1,1,NULL,0,61,49),(188,1,NULL,NULL,1,1,NULL,0,62,49),(189,1,NULL,NULL,1,1,NULL,0,63,50),(190,1,NULL,NULL,1,1,NULL,0,64,50),(191,1,NULL,NULL,1,1,NULL,0,65,50),(192,1,NULL,NULL,1,1,NULL,0,66,50),(193,1,NULL,NULL,1,1,NULL,0,67,50),(194,1,NULL,NULL,1,1,NULL,0,68,51),(195,1,NULL,NULL,1,1,NULL,0,69,51),(196,1,NULL,NULL,1,1,NULL,0,70,51),(197,1,NULL,NULL,1,1,NULL,0,71,52),(198,1,NULL,NULL,1,1,NULL,0,72,52),(199,1,NULL,NULL,1,1,NULL,0,73,52),(200,1,NULL,NULL,1,1,NULL,0,74,52),(201,1,NULL,NULL,1,1,NULL,0,75,53),(202,1,NULL,NULL,1,1,NULL,0,76,53),(203,1,NULL,NULL,1,1,NULL,0,77,53),(204,1,NULL,NULL,1,1,NULL,0,78,63),(205,1,NULL,NULL,1,1,NULL,0,79,63),(206,1,NULL,NULL,1,1,NULL,0,80,63),(207,1,NULL,NULL,1,1,NULL,0,81,63),(208,1,NULL,NULL,1,1,NULL,0,82,64),(209,1,NULL,NULL,1,1,NULL,0,83,64),(210,1,NULL,NULL,1,1,NULL,0,84,64),(211,1,NULL,NULL,1,1,NULL,0,85,65),(212,1,NULL,NULL,1,1,NULL,0,86,65),(213,1,NULL,NULL,1,1,NULL,0,87,65),(214,1,NULL,NULL,1,1,NULL,0,88,65),(215,1,NULL,NULL,1,1,NULL,0,89,66),(216,1,NULL,NULL,1,1,NULL,0,90,66),(217,1,NULL,NULL,1,1,NULL,0,91,66),(218,1,NULL,NULL,1,1,NULL,0,92,66),(219,1,NULL,NULL,1,1,NULL,0,93,66),(220,1,NULL,NULL,1,1,NULL,0,94,67),(221,1,NULL,NULL,1,1,NULL,0,95,67),(222,1,NULL,NULL,1,1,NULL,0,96,67),(223,1,NULL,NULL,1,1,NULL,0,97,56),(224,1,NULL,NULL,1,1,NULL,0,98,56),(225,1,NULL,NULL,1,1,NULL,0,99,56),(226,1,NULL,NULL,1,1,NULL,0,100,56),(227,1,NULL,NULL,1,1,NULL,0,101,57),(228,1,NULL,NULL,1,1,NULL,0,102,57),(229,1,NULL,NULL,1,1,NULL,0,103,57),(230,1,NULL,NULL,1,1,NULL,0,104,57),(231,1,NULL,NULL,1,1,NULL,0,105,57),(232,1,NULL,NULL,1,1,NULL,0,106,57),(233,1,NULL,NULL,1,1,NULL,0,107,58),(234,1,NULL,NULL,1,1,NULL,0,108,58),(235,1,NULL,NULL,1,1,NULL,0,109,58),(236,1,NULL,NULL,1,1,NULL,0,110,58),(237,1,NULL,NULL,1,1,NULL,0,111,59),(238,1,NULL,NULL,1,1,NULL,0,112,59),(239,1,NULL,NULL,1,1,NULL,0,113,59),(240,1,NULL,NULL,1,1,NULL,0,114,59),(241,1,NULL,NULL,1,1,NULL,0,115,60),(242,1,NULL,NULL,1,1,NULL,0,116,60),(243,1,NULL,NULL,1,1,NULL,0,117,60),(244,1,NULL,NULL,1,1,NULL,0,118,61),(245,1,NULL,NULL,1,1,NULL,0,119,61),(246,1,NULL,NULL,1,1,NULL,0,120,61),(247,1,NULL,NULL,1,1,NULL,0,121,69),(248,1,NULL,NULL,1,1,NULL,0,122,69),(249,1,NULL,NULL,1,1,NULL,0,123,69),(250,1,NULL,NULL,1,1,NULL,0,124,69),(251,1,NULL,NULL,1,1,NULL,0,125,70),(252,1,NULL,NULL,1,1,NULL,0,126,70),(253,1,NULL,NULL,1,1,NULL,0,127,70),(254,1,NULL,NULL,1,1,NULL,0,128,70),(255,1,NULL,NULL,1,1,NULL,0,129,71),(256,1,NULL,NULL,1,1,NULL,0,130,71),(257,1,NULL,NULL,1,1,NULL,0,131,71),(258,1,NULL,NULL,1,1,NULL,0,132,71),(259,1,NULL,NULL,1,1,NULL,0,133,72),(260,1,NULL,NULL,1,1,NULL,0,134,72),(261,1,NULL,NULL,1,1,NULL,0,135,72),(262,1,NULL,NULL,1,1,NULL,0,136,73),(263,1,NULL,NULL,1,1,NULL,0,137,73),(264,1,NULL,NULL,1,1,NULL,0,138,73),(265,1,NULL,NULL,1,1,NULL,0,139,73),(266,1,NULL,NULL,1,1,NULL,0,140,74),(267,1,NULL,NULL,1,1,NULL,0,141,74);
/*!40000 ALTER TABLE `checkitem_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-15 17:21:41
