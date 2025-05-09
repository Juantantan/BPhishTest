-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: user_management
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('M','F','X') DEFAULT NULL,
  `date_of_birth` int unsigned DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `account_status` enum('active','suspended','deleted') DEFAULT 'active',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `role` enum('admin','user','moderator') DEFAULT 'user',
  `profile_picture` varchar(255) DEFAULT NULL,
  `verification_token` varchar(64) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
-- Data dump generated with mysqldump --skip-comments --no-create-info --complete-insert --extended-insert=FALSE
INSERT INTO users VALUES (1,'f47ac10b-58cc-4372-a567-0e02b2c3d479','jsmith82','John Smith','$2a$12$K8HKT7u4FYW0vF5YJ2JN7u2V9yCtzKUXA9z4BI4l1YQwxDg5jKKe2','john.smith@example.com','M',315532800,'+1-555-123-4567','123 Oak Street','Boston','Massachusetts','USA','02108','active','2025-04-25 15:32:17','2020-03-15 09:23:54','2025-04-25 15:32:17','user','profiles/jsmith82.jpg',NULL,1);
INSERT INTO `users` VALUES (2,'550e8400-e29b-41d4-a716-446655440000','ejohnson','Emily Johnson','$2a$12$9s8vjEDV84K4I42xPyvQWOsJVeOzQTJqVx.9UEcwjrNWAwe5u2a6u','emily.johnson@example.com','F',441763200,'+1-555-987-6543','456 Pine Avenue','San Francisco','California','USA','94107','active','2025-04-27 08:12:33','2019-11-22 14:45:12','2025-04-27 08:12:33','moderator','profiles/ejohnson.jpg',NULL,1);
INSERT INTO `users` VALUES (3,'6ba7b810-9dad-11d1-80b4-00c04fd430c8','mwilliams','Michael Williams','$2a$12$OXdsxL0x5kK7QvQK9lGWl.TXkXFQBZZlS3fCp3AxGx5mdSyJVtMqy','michael.williams@example.com','M',536457600,'+1-555-234-5678','789 Maple Drive','Chicago','Illinois','USA','60611','active','2025-04-26 17:45:51','2021-01-05 11:32:09','2025-04-26 17:45:51','user','profiles/mwilliams.jpg',NULL,1);
INSERT INTO `users` VALUES (4,'6ba7b811-9dad-11d1-80b4-00c04fd430c8','jbrown','Jessica Brown','$2a$12$kLkbFK1KJbHxDSVaZxStZeuA/R/YJrjfKiXBUJPS2wrrS4xrOBAn2','jessica.brown@example.com','F',567993600,'+1-555-345-6789','101 Cedar Lane','Seattle','Washington','USA','98101','suspended','2025-03-18 10:25:42','2020-06-19 08:15:37','2025-03-18 10:25:42','user','profiles/jbrown.jpg',NULL,1);
INSERT INTO `users` VALUES (5,'6ba7b812-9dad-11d1-80b4-00c04fd430c8','djones','David Jones','$2a$12$zEu5bcHO8O4YGFEHJJRWe.CPwzpo6heLJEHycGrwUWHf97nwXDgS.','david.jones@example.com','M',599616000,'+1-555-456-7890','202 Birch Boulevard','Austin','Texas','USA','78701','active','2025-04-24 14:05:19','2020-09-30 15:48:22','2025-04-24 14:05:19','user','profiles/djones.jpg',NULL,1);
INSERT INTO `users` VALUES (6,'6ba7b813-9dad-11d1-80b4-00c04fd430c8','smiller','Sarah Miller','$2a$12$jGa9bkS.dvA1Hb2A.XBQ8eny0TdnxiwOB8ALujHPQJNv96FYNZ5e2','sarah.miller@example.com','F',631152000,'+1-555-567-8901','303 Aspen Court','Denver','Colorado','USA','80202','active','2025-04-22 09:38:27','2021-04-12 17:59:33','2025-04-22 09:38:27','user','profiles/smiller.jpg',NULL,1);
INSERT INTO `users` VALUES (7,'6ba7b814-9dad-11d1-80b4-00c04fd430c8','jdavis','James Davis','$2a$12$XlB5S5vzUSN7d5DMxLnLT.L/WQS3iBz/4Hp5YdBrrnSJ1QqOv0g.e','james.davis@example.com','M',662688000,'+1-555-678-9012','404 Elm Street','Atlanta','Georgia','USA','30303','active','2025-04-27 11:52:16','2019-07-28 12:21:45','2025-04-27 11:52:16','user','profiles/jdavis.jpg',NULL,1);
INSERT INTO `users` VALUES (8,'6ba7b815-9dad-11d1-80b4-00c04fd430c8','lgarcia','Lisa Garcia','$2a$12$VEZj2TN2ZMwT4saEzzrAteK1DQ1vLKFIu13o.YfH3W3bIGVEJaPny','lisa.garcia@example.com','F',694224000,'+1-555-789-0123','505 Walnut Way','Miami','Florida','USA','33130','active','2025-04-26 16:14:55','2020-11-15 10:37:42','2025-04-26 16:14:55','user','profiles/lgarcia.jpg',NULL,1);
INSERT INTO `users` VALUES (9,'6ba7b816-9dad-11d1-80b4-00c04fd430c8','rrodriguez','Robert Rodriguez','$2a$12$WNlqnE3c9RwW7FiPBwGkQe8C6Gzjl.CY/F74h1sBuxFv/FGhAVIS.','robert.rodriguez@example.com','M',725846400,'+1-555-890-1234','606 Spruce Street','Phoenix','Arizona','USA','85004','active','2025-04-23 08:47:39','2021-02-03 13:59:18','2025-04-23 08:47:39','user','profiles/rrodriguez.jpg',NULL,1);
INSERT INTO `users` VALUES (10,'6ba7b817-9dad-11d1-80b4-00c04fd430c8','jmartinez','Jennifer Martinez','$2a$12$rKsH.boXHwXVbTTR3oiK1eMcQd/IixRHJ56BMcZ/Sxs63.E1FYvda','jennifer.martinez@example.com','F',757382400,'+1-555-901-2345','707 Fir Avenue','Portland','Oregon','USA','97204','active','2025-04-25 12:33:21','2020-08-14 15:28:51','2025-04-25 12:33:21','user','profiles/jmartinez.jpg',NULL,1);
INSERT INTO `users` VALUES (11,'6ba7b818-9dad-11d1-80b4-00c04fd430c8','ataylor','Alex Taylor','$2a$12$E5KCK5tLMQZ3TT1cVbX3beYp4KhkFdzun7XEYh0KaA1HYwQAv2/ba','alex.taylor@example.com','X',788918400,'+1-555-012-3456','808 Redwood Road','Minneapolis','Minnesota','USA','55401','active','2025-04-26 19:21:48','2021-06-27 09:44:36','2025-04-26 19:21:48','user','profiles/ataylor.jpg',NULL,1);
INSERT INTO `users` VALUES (12,'6ba7b819-9dad-11d1-80b4-00c04fd430c8','panderson','Patricia Anderson','$2a$12$zNEYcNK/QU5I8XQsVadPz.IShqAT9JzGN/Gyi5XY4COjONdwT7SjW','patricia.anderson@example.com','F',820454400,'+1-555-123-4567','909 Sequoia Street','Detroit','Michigan','USA','48226','active','2025-04-24 15:57:33','2019-12-08 18:12:29','2025-04-24 15:57:33','user','profiles/panderson.jpg',NULL,1);
INSERT INTO `users` VALUES (13,'6ba7b81a-9dad-11d1-80b4-00c04fd430c8','twilson','Thomas Wilson','$2a$12$W4f4tC3B3NNZ0xvyR7JeR.9YWRgnxgtvYBJD8DjlnHRgAwg5ER9TO','thomas.wilson@example.com','M',852076800,'+1-555-234-5678','1010 Willow Walk','Philadelphia','Pennsylvania','USA','19103','active','2025-04-27 07:42:19','2021-03-19 14:35:07','2025-04-27 07:42:19','user','profiles/twilson.jpg',NULL,1);
INSERT INTO `users` VALUES (14,'6ba7b81b-9dad-11d1-80b4-00c04fd430c8','emoore','Elizabeth Moore','$2a$12$vfhY2xCgZpt/lTB.YDNYAOlgBpgXFvJLJj3IPgEE3qYrmwkHE8kdu','elizabeth.moore@example.com','F',883612800,'+1-555-345-6789','1111 Cypress Circle','Las Vegas','Nevada','USA','89101','active','2025-04-21 16:29:54','2020-05-25 11:43:02','2025-04-21 16:29:54','user','profiles/emoore.jpg',NULL,1);
INSERT INTO `users` VALUES (15,'6ba7b81c-9dad-11d1-80b4-00c04fd430c8','clee','Charles Lee','$2a$12$8dQ.xNfRdTMaZD9hENjpKOWk3Qm./NJNvAW0gZQXLlz7/nJKvgxH.','charles.lee@example.com','M',915148800,'+1-555-456-7890','1212 Magnolia Drive','Nashville','Tennessee','USA','37203','active','2025-04-22 20:11:45','2021-07-31 08:52:14','2025-04-22 20:11:45','user','profiles/clee.jpg',NULL,1);
INSERT INTO `users` VALUES (16,'6ba7b81d-9dad-11d1-80b4-00c04fd430c8','mjackson','Margaret Jackson','$2a$12$pBdSDT8LsAQgzSgP5y.XteyBxnggZNjdDd8xLEtxaWCQHH1.YKTaW','margaret.jackson@example.com','F',946684800,'+1-555-567-8901','1313 Juniper Junction','New Orleans','Louisiana','USA','70112','active','2025-04-25 13:48:37','2019-09-16 17:01:25','2025-04-25 13:48:37','user','profiles/mjackson.jpg',NULL,1);
INSERT INTO `users` VALUES (17,'6ba7b81e-9dad-11d1-80b4-00c04fd430c8','cwhite','Christopher White','$2a$12$N/Y7IXt6qLSw0MQlOY/xzu/jU1WYMixk92M6/uPT6WzlKVMwl5ZlS','christopher.white@example.com','M',978307200,'+1-555-678-9012','1414 Sycamore Street','Salt Lake City','Utah','USA','84101','active','2025-04-26 09:35:26','2020-12-22 19:28:33','2025-04-26 09:35:26','user','profiles/cwhite.jpg',NULL,1);
INSERT INTO `users` VALUES (18,'6ba7b81f-9dad-11d1-80b4-00c04fd430c8','sharris','Susan Harris','$2a$12$E/fyJyTUBkJhgUH6uMdxLuQJnYpvNflxm/6AeHymBZEXsKKdwfWYW','susan.harris@example.com','F',1009843200,'+1-555-789-0123','1515 Birch Boulevard','Kansas City','Missouri','USA','64105','active','2025-04-23 18:19:42','2021-05-07 12:47:19','2025-04-23 18:19:42','user','profiles/sharris.jpg',NULL,1);
INSERT INTO `users` VALUES (19,'6ba7b820-9dad-11d1-80b4-00c04fd430c8','mclark','Matthew Clark','$2a$12$vE19AnZpdeLk0R3wN55mDeBbZIPW2JeCQFqm1BziDHGc1kUepMenG','matthew.clark@example.com','M',1041379200,'+1-555-890-1234','1616 Cedar Court','Albuquerque','New Mexico','USA','87102','active','2025-04-24 10:53:08','2019-10-12 15:39:27','2025-04-24 10:53:08','user','profiles/mclark.jpg',NULL,1);
INSERT INTO `users` VALUES (20,'6ba7b821-9dad-11d1-80b4-00c04fd430c8','nlewis','Nancy Lewis','$2a$12$aDe.N.8A3UyChIm0K6WCPOPp9H90jFNj1Y6JbQpLxfkBvW0fATPxe','nancy.lewis@example.com','F',1072915200,'+1-555-901-2345','1717 Elm Lane','Oklahoma City','Oklahoma','USA','73102','active','2025-04-27 14:27:59','2021-08-14 16:55:41','2025-04-27 14:27:59','user','profiles/nlewis.jpg',NULL,1);
INSERT INTO `users` VALUES (21,'6ba7b822-9dad-11d1-80b4-00c04fd430c8','rwalker','Riley Walker','$2a$12$V0JkGZ9XbwK/f5o4Zd7bHuQXvnZz4a3OdLzw.YNM7ZYKMZDsS/wAS','riley.walker@example.com','X',1104537600,'+1-555-012-3456','1818 Aspen Street','Louisville','Kentucky','USA','40202','active','2025-04-22 07:15:36','2020-02-28 13:21:38','2025-04-22 07:15:36','user','profiles/rwalker.jpg',NULL,1);
INSERT INTO `users` VALUES (22,'6ba7b823-9dad-11d1-80b4-00c04fd430c8','dhall','Donna Hall','$2a$12$vCf1i6/MfMaNMQJdJ6F1pObEGKKFWwh0U8/VKL6mMOMN1HZv4tqWi','donna.hall@example.com','F',1136073600,'+1-555-123-4567','1919 Maple Street','Milwaukee','Wisconsin','USA','53202','active','2025-04-25 11:43:48','2020-07-09 18:49:55','2025-04-25 11:43:48','user','profiles/dhall.jpg',NULL,1);
INSERT INTO `users` VALUES (23,'6ba7b824-9dad-11d1-80b4-00c04fd430c8','dyoung','Daniel Young','$2a$12$xwZu/vv3nkF7.J29JIlhH.6QZUc8/JbTZXlrJRm5rp.K/2eDnMsMO','daniel.young@example.com','M',1167609600,'+1-555-234-5678','2020 Pine Drive','Tucson','Arizona','USA','85701','active','2025-04-26 15:32:17','2021-09-30 07:36:14','2025-04-26 15:32:17','user','profiles/dyoung.jpg',NULL,1);
INSERT INTO `users` VALUES (24,'6ba7b825-9dad-11d1-80b4-00c04fd430c8','mallen','Michelle Allen','$2a$12$htgLXuiXTiPJt1WMH5XKNO3/jnF7NExL8JgW7JVAyN5bDpCHZYfRO','michelle.allen@example.com','F',1199145600,'+1-555-345-6789','2121 Oak Lane','Omaha','Nebraska','USA','68102','active','2025-04-21 19:08:52','2019-11-05 14:22:31','2025-04-21 19:08:52','user','profiles/mallen.jpg',NULL,1);
INSERT INTO `users` VALUES (25,'6ba7b826-9dad-11d1-80b4-00c04fd430c8','kscott','Kevin Scott','$2a$12$m2B4oSJh4oE.1jTuQQZHmuSuGF9lBjkLT.gTJ48F0CzU2hc6jvOJe','kevin.scott@example.com','M',1230768000,'+1-555-456-7890','2222 Spruce Square','Cleveland','Ohio','USA','44113','active','2025-04-23 12:56:34','2020-04-17 09:18:42','2025-04-23 12:56:34','user','profiles/kscott.jpg',NULL,1);
INSERT INTO `users` VALUES (26,'6ba7b827-9dad-11d1-80b4-00c04fd430c8','kgreen','Kimberly Green','$2a$12$hG2v9nG4Gg26TBgODPUkTeXW.J04s5FrNbuiQMXWm65bqGjkG0IIK','kimberly.green@example.com','F',1262304000,'+1-555-567-8901','2323 Redwood Avenue','Raleigh','North Carolina','USA','27601','active','2025-04-24 16:41:25','2021-10-08 17:33:09','2025-04-24 16:41:25','user','profiles/kgreen.jpg',NULL,1);
INSERT INTO `users` VALUES (27,'6ba7b828-9dad-11d1-80b4-00c04fd430c8','badams','Brian Adams','$2a$12$eJSH5HVsKZnbTFOtkuvLt.2FYm.EYnFxVCIe.m.OGvMxfnG7D3iqu','brian.adams@example.com','M',1293840000,'+1-555-678-9012','2424 Walnut Way','St. Louis','Missouri','USA','63101','active','2025-04-26 08:15:46','2020-01-25 11:57:22','2025-04-26 08:15:46','user','profiles/badams.jpg',NULL,1);
INSERT INTO `users` VALUES (28,'6ba7b829-9dad-11d1-80b4-00c04fd430c8','sbaker','Stephanie Baker','$2a$12$UjZhFdXUx5SbbYB60A2oVOZIoM6yTRZKYSVzv4RWvjgv1jn2Rn4R2','stephanie.baker@example.com','F',1325376000,'+1-555-789-0123','2525 Fir Road','Pittsburgh','Pennsylvania','USA','15222','active','2025-04-27 13:29:37','2021-11-17 15:08:43','2025-04-27 13:29:37','user','profiles/sbaker.jpg',NULL,1);
INSERT INTO `users` VALUES (29,'6ba7b82a-9dad-11d1-80b4-00c04fd430c8','jgonzalez','Jordan Gonzalez','$2a$12$iYzkMOrhHHI0n8DcnyJnH.5r9lRv4vQEKLvSgEH1sYoiGSAQvhVXS','jordan.gonzalez@example.com','X',1356998400,'+1-555-890-1234','2626 Cypress Circle','Cincinnati','Ohio','USA','45202','active','2025-04-22 17:52:18','2019-08-03 12:44:56','2025-04-22 17:52:18','user','profiles/jgonzalez.jpg',NULL,1);
INSERT INTO `users` VALUES (30,'6ba7b82b-9dad-11d1-80b4-00c04fd430c8','lnelson','Laura Nelson','$2a$12$3X.4zNWXzMOazq0V5zCrFOtX2P2FZXvQT9mZWl4wMLMeMU5B9LF5q','laura.nelson@example.com','F',1388534400,'+1-555-901-2345','2727 Birch Lane','Indianapolis','Indiana','USA','46204','active','2025-04-25 09:36:54','2020-06-12 18:31:15','2025-04-25 09:36:54','user','profiles/lnelson.jpg',NULL,1);
INSERT INTO `users` VALUES (31,'6ba7b82c-9dad-11d1-80b4-00c04fd430c8','rcarter','Richard Carter','$2a$12$PUkHD1SywHX3RG1tQpT9kuXJkPfpkw.zHJtOzH3QYLHylWChW5tBq','richard.carter@example.com','M',1420070400,'+1-555-012-3456','2828 Sequoia Street','Columbus','Ohio','USA','43215','active','2025-04-23 14:48:31','2021-12-03 09:16:28','2025-04-23 14:48:31','user','profiles/rcarter.jpg',NULL,1);
INSERT INTO `users` VALUES (32,'6ba7b82d-9dad-11d1-80b4-00c04fd430c8','rmitchell','Rebecca Mitchell','$2a$12$4Z6xfUhBbXbdFUBIzrWKR.XTFmxQWN9BKsJ8bB9BjVFRyZe9YPXZS','rebecca.mitchell@example.com','F',1451606400,'+1-555-123-4567','2929 Magnolia Avenue','Buffalo','New York','USA','14202','active','2025-04-24 12:24:47','2020-03-28 16:54:37','2025-04-24 12:24:47','user','profiles/rmitchell.jpg',NULL,1);
INSERT INTO `users` VALUES (33,'6ba7b82e-9dad-11d1-80b4-00c04fd430c8','jperez','Joseph Perez','$2a$12$9kgZP5nXoMQTUYkHQvLVGOlFplMsiVf6W6P9EoU0Y2G0NBAu.Hx42','joseph.perez@example.com','M',1483228800,'+1-555-234-5678','3030 Juniper Road','Richmond','Virginia','USA','23219','active','2025-04-26 11:19:38','2022-01-15 13:05:09','2025-04-26 11:19:38','user','profiles/jperez.jpg',NULL,1);
INSERT INTO `users` VALUES (34,'6ba7b82f-9dad-11d1-80b4-00c04fd430c8','aroberts','Amanda Roberts','$2a$12$n/KTGbFkDWb/n.lh6NxfUeX0W44S2DZ.rlrL3AHxc0GZuWKSf.3hu','amanda.roberts@example.com','F',1514764800,'+1-555-345-6789','3131 Sycamore Drive','Sacramento','California','USA','95814','active','2025-04-27 16:37:22','2020-02-19 10:42:51','2025-04-27 16:37:22','user','profiles/aroberts.jpg',NULL,1);
INSERT INTO `users` VALUES (35,'6ba7b830-9dad-11d1-80b4-00c04fd430c8','cturner','Casey Turner','$2a$12$DlP0M7XG1F4.4Gy/5NaJVuzV9GXt2Xfz8mHTnvQX9pYoLIZ9VWMDO','casey.turner@example.com','X',1546300800,'+1-555-456-7890','3232 Willow Way','Orlando','Florida','USA','32801','active','2025-04-21 15:45:16','2021-05-26 14:23:45','2025-04-21 15:45:16','user','profiles/cturner.jpg',NULL,1);
INSERT INTO `users` VALUES (36,'6ba7b831-9dad-11d1-80b4-00c04fd430c8','sphillips','Sandra Phillips','$2a$12$aZXlFHs/QG4EkswTmSO33e3dIUjH6gSVLAJ7S.8WE2VIXv.IYC9te','sandra.phillips@example.com','F',1577836800,'+1-555-567-8901','3333 Cedar Street','Charlotte','North Carolina','USA','28202','active','2025-04-22 19:12:29','2019-12-11 08:59:37','2025-04-22 19:12:29','user','profiles/sphillips.jpg',NULL,1);
INSERT INTO `users` VALUES (37,'6ba7b832-9dad-11d1-80b4-00c04fd430c8','gcampbell','George Campbell','$2a$12$F1rL6HYJ1JocQO9jRuCmEecn5J5LMJqZHgLVXlFZP3Vf4b85uqvtS','george.campbell@example.com','M',1609459200,'+1-555-678-9012','3434 Elm Circle','Memphis','Tennessee','USA','38103','active','2025-04-25 08:53:47','2020-08-07 17:31:04','2025-04-25 08:53:47','user','profiles/gcampbell.jpg',NULL,1);
INSERT INTO `users` VALUES (38,'6ba7b833-9dad-11d1-80b4-00c04fd430c8','nparker','Nicole Parker','$2a$12$hNz5xsxGbM5AMPt3OniEEOHRgHvy0JKBn/5ZJSNLLiEbLmkN7OTQm','nicole.parker@example.com','F',1640995200,'+1-555-789-0123','3535 Maple Court','Baltimore','Maryland','USA','21202','active','2025-04-24 17:26:35','2022-02-09 11:14:52','2025-04-24 17:26:35','user','profiles/nparker.jpg',NULL,1);
INSERT INTO `users` VALUES (39,'6ba7b834-9dad-11d1-80b4-00c04fd430c8','eevans','Edward Evans','$2a$12$ORpXZ/ixK5XGezUdQOV3D.rPEMQouyPNfmCJPp/Cr1PW2gGqLqc0q','edward.evans@example.com','M',1672531200,'+1-555-890-1234','3636 Pine Path','San Diego','California','USA','92101','active','2025-04-26 14:09:28','2020-05-13 15:38:06','2025-04-26 14:09:28','user','profiles/eevans.jpg',NULL,1);
INSERT INTO `users` VALUES (40,'6ba7b835-9dad-11d1-80b4-00c04fd430c8','dedwards','Deborah Edwards','$2a$12$d2Nd64CwS7.q.FeMN0ULg.94MtDz93NL6hRQmb1fgWUSkTvnEpCkO','deborah.edwards@example.com','F',1704067200,'+1-555-901-2345','3737 Oak Street','Dallas','Texas','USA','75201','active','2025-04-27 10:34:13','2021-07-21 09:47:19','2025-04-27 10:34:13','moderator','profiles/dedwards.jpg',NULL,1);
INSERT INTO `users` VALUES (41,'6ba7b836-9dad-11d1-80b4-00c04fd430c8','rcollins','Ryan Collins','$2a$12$OOdPW8.EBhU00UjNZdPdPu/EZOXb0G1JgySJjTpDdmLL1SdSO0gGi','ryan.collins@example.com','M',1095120000,'+1-555-012-3456','3838 Spruce Drive','Houston','Texas','USA','77002','suspended','2025-03-15 13:51:42','2020-09-04 16:25:31','2025-03-15 13:51:42','user','profiles/rcollins.jpg',NULL,1);
INSERT INTO `users` VALUES (42,'6ba7b837-9dad-11d1-80b4-00c04fd430c8','sstewart','Stephanie Stewart','$2a$12$5SQULe8MUP4yY/9UkMoHJu7C5Jh4KY7eFfsGpKWfHk7/tKSL.vpue','stephanie.stewart@example.com','F',1026576000,'+1-555-123-4567','3939 Birch Boulevard','New York','New York','USA','10007','active','2025-04-25 18:06:59','2021-03-27 10:39:25','2025-04-25 18:06:59','user','profiles/sstewart.jpg',NULL,1);
INSERT INTO `users` VALUES (43,'6ba7b838-9dad-11d1-80b4-00c04fd430c8','tsanchez','Taylor Sanchez','$2a$12$UswFVgA4h3SBghyf1CSuB.yvUqg8HMrHH2mBk3n9SLmvCv7e69EFe','taylor.sanchez@example.com','X',1058112000,'+1-555-234-5678','4040 Cedar Lane','Los Angeles','California','USA','90012','active','2025-04-22 09:24:37','2019-10-30 14:17:48','2025-04-22 09:24:37','user','profiles/tsanchez.jpg',NULL,1);
INSERT INTO `users` VALUES (44,'6ba7b839-9dad-11d1-80b4-00c04fd430c8','amorris','Amy Morris','$2a$12$hWm3fhPRQR0F7K2pKgUQP.2KYqDvEVa5l9FUt5TxXo9Gq1HZtXlVS','amy.morris@example.com','F',989648000,'+1-555-345-6789','4141 Walnut Avenue','Seattle','Washington','USA','98101','active','2025-04-27 12:58:42','2020-07-15 11:56:03','2025-04-27 12:58:42','user','profiles/amorris.jpg',NULL,1);
INSERT INTO `users` VALUES (45,'6ba7b83a-9dad-11d1-80b4-00c04fd430c8','arogers','Andrew Rogers','$2a$12$lA8Jn9hBG8d8QqbJ2SLKDujYpO.lI0JUEvpBRaOCOzLzW4KADnw4C','andrew.rogers@example.com','M',921184000,'+1-555-456-7890','4242 Elm Road','Chicago','Illinois','USA','60601','active','2025-04-23 16:32:18','2022-04-05 08:29:37','2025-04-23 16:32:18','user','profiles/arogers.jpg',NULL,1);
INSERT INTO `users` VALUES (46,'6ba7b83b-9dad-11d1-80b4-00c04fd430c8','hreed','Helen Reed','$2a$12$mRXG98k7GKrfVTe/YqJyJe3zRXGLhV0O64pRXdEsYLB1j.TyNSCJe','helen.reed@example.com','F',852720000,'+1-555-567-8901','4343 Fir Street','Boston','Massachusetts','USA','02108','active','2025-04-24 08:47:33','2020-11-19 17:08:14','2025-04-24 08:47:33','user','profiles/hreed.jpg',NULL,1);
INSERT INTO `users` VALUES (47,'6ba7b83c-9dad-11d1-80b4-00c04fd430c8','jcook','Joshua Cook','$2a$12$q08z3sMZU56rYxHHekn/JuC/SYU.hKvv0/1GBSUPBb1yEfYq9oExO','joshua.cook@example.com','M',784256000,'+1-555-678-9012','4444 Maple Lane','San Francisco','California','USA','94105','active','2025-04-26 19:15:29','2021-08-02 13:41:26','2025-04-26 19:15:29','user','profiles/jcook.jpg',NULL,1);
INSERT INTO `users` VALUES (48,'6ba7b83d-9dad-11d1-80b4-00c04fd430c8','rmorgan','Robin Morgan','$2a$12$8AJbj/U2LZE1XmYgjkzMquO7UEIfCefQnR6Hzd1C1bnp3YKK7xT3i','robin.morgan@example.com','X',715792000,'+1-555-789-0123','4545 Aspen Avenue','Denver','Colorado','USA','80202','active','2025-04-21 11:38:54','2019-06-24 16:13:39','2025-04-21 11:38:54','user','profiles/rmorgan.jpg',NULL,1);
INSERT INTO `users` VALUES (49,'6ba7b83e-9dad-11d1-80b4-00c04fd430c8','aadmin','Admin User','$2a$12$kHqXQDFffD8zfLdgQo2KHO/YX9OMGDc2F.BtPIrYJwMrQYPVj6xsG','admin@example.com','M',631152000,'+1-555-890-1234','5555 Admin Street','Washington','DC','USA','20001','active','2025-04-27 09:21:45','2019-05-10 08:00:00','2025-04-27 09:21:45','admin','profiles/aadmin.jpg',NULL,1);
INSERT INTO `users` VALUES (50,'6ba7b83f-9dad-11d1-80b4-00c04fd430c8','ttest','Test User','$2a$12$TQGtRgWA5Uc6cLYzWnZQF.h8qKCRlNwZoBiRkKU7N6JTOddvQUD3a','test@example.com','F',1199145600,'+1-555-901-2345','6666 Test Drive','Portland','Oregon','USA','97201','deleted','2025-01-15 14:19:23','2022-01-01 12:00:00','2025-01-15 14:19:23','user','profiles/ttest.jpg','a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_history`
--

DROP TABLE IF EXISTS `user_login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `login_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` text,
  `login_status` enum('success','failed') NOT NULL,
  `failure_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_history`
--

LOCK TABLES `user_login_history` WRITE;
/*!40000 ALTER TABLE `user_login_history` DISABLE KEYS */;
INSERT INTO `user_login_history` VALUES (1,1,'2025-04-25 15:32:17','192.168.1.105','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','success',NULL);
INSERT INTO `user_login_history` VALUES (2,2,'2025-04-27 08:12:33','192.168.1.110','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Safari/605.1.15','success',NULL);
INSERT INTO `user_login_history` VALUES (3,3,'2025-04-26 17:45:51','192.168.1.112','Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1','success',NULL);
INSERT INTO `user_login_history` VALUES (4,4,'2025-03-18 10:25:42','192.168.1.115','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36','success',NULL);
INSERT INTO `user_login_history` VALUES (5,5,'2025-04-24 14:05:19','192.168.1.120','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','success',NULL);
INSERT INTO `user_login_history` VALUES (6,4,'2025-03-18 10:20:42','192.168.1.115','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36','failed','Invalid password');
INSERT INTO `user_login_history` VALUES (7,8,'2025-04-26 16:14:55','192.168.1.135','Mozilla/5.0 (iPad; CPU OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1','success',NULL);
INSERT INTO `user_login_history` VALUES (8,11,'2025-04-26 19:21:48','192.168.1.142','Mozilla/5.0 (Linux; Android 13; SM-G998U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Mobile Safari/537.36','success',NULL);
INSERT INTO `user_login_history` VALUES (9,13,'2025-04-27 07:42:19','192.168.1.150','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0','success',NULL);
INSERT INTO `user_login_history` VALUES (10,49,'2025-04-27 09:21:45','192.168.1.200','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0','success',NULL);
/*!40000 ALTER TABLE `user_login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `theme` enum('light','dark','system') DEFAULT 'system',
  `email_notifications` tinyint(1) DEFAULT '1',
  `sms_notifications` tinyint(1) DEFAULT '0',
  `two_factor_enabled` tinyint(1) DEFAULT '0',
  `language_preference` varchar(10) DEFAULT 'en-US',
  `timezone` varchar(50) DEFAULT 'UTC',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,1,'light',1,0,1,'en-US','America/New_York','2020-03-15 09:23:54','2025-01-10 11:45:22');
INSERT INTO `user_settings` VALUES (2,2,'dark',1,1,1,'en-US','America/Los_Angeles','2019-11-22 14:45:12','2025-02-15 09:32:18');
INSERT INTO `user_settings` VALUES (3,3,'system',1,0,0,'en-US','America/Chicago','2021-01-05 11:32:09','2024-12-02 16:28:45');
INSERT INTO `user_settings` VALUES (4,4,'dark',0,0,0,'en-US','America/Los_Angeles','2020-06-19 08:15:37','2025-01-22 14:39:10');
INSERT INTO `user_settings` VALUES (5,5,'light',1,0,0,'en-US','America/Chicago','2020-09-30 15:48:22',NULL);
INSERT INTO `user_settings` VALUES (6,6,'system',1,0,0,'en-US','America/Denver','2021-04-12 17:59:33',NULL);
INSERT INTO `user_settings` VALUES (7,7,'dark',1,1,1,'en-US','America/New_York','2019-07-28 12:21:45','2024-11-14 10:15:27');
INSERT INTO `user_settings` VALUES (8,8,'light',1,0,0,'es-ES','America/Los_Angeles','2020-11-15 10:37:42','2025-03-08 14:22:36');
INSERT INTO `user_settings` VALUES (9,9,'system',1,0,0,'en-US','America/Phoenix','2021-02-03 13:59:18',NULL);
INSERT INTO `user_settings` VALUES (10,10,'dark',1,1,0,'en-US','America/Los_Angeles','2020-08-14 15:28:51','2025-01-30 11:28:14');
INSERT INTO `user_settings` VALUES (11,11,'system',1,0,1,'en-US','America/Chicago','2021-06-27 09:44:36','2025-02-18 16:35:27');
INSERT INTO `user_settings` VALUES (12,12,'light',0,0,0,'en-US','America/Detroit','2019-12-08 18:12:29',NULL);
INSERT INTO `user_settings` VALUES (13,13,'dark',1,0,0,'en-US','America/New_York','2021-03-19 14:35:07',NULL);
INSERT INTO `user_settings` VALUES (14,14,'light',1,0,0,'en-US','America/Los_Angeles','2020-05-25 11:43:02',NULL);
INSERT INTO `user_settings` VALUES (15,15,'system',1,1,1,'en-US','America/Chicago','2021-07-31 08:52:14','2025-01-05 09:12:43');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2025-04-28 11:23:45