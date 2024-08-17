/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 8.0.36 : Database - volleybox_ipis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`volleybox_ipis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `volleybox_ipis`;

/*Table structure for table `_user` */

DROP TABLE IF EXISTS `_user`;

CREATE TABLE `_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `_user` */

insert  into `_user`(`id`,`firstname`,`lastname`,`email`,`password`,`role`) values 
(1,'Dimitrije','Dobrijevic','dimitrije.dobrijevic@gmail.com','$2a$10$ttblwJnzphnqc0azTG84YuOZwLZxewrStUUlH4MAcacVYWPEnH/r.','ADMIN'),
(2,'Petar','Petrovic','petar.petrovic@gmail.com','$2a$10$i5JaUevR3kKxO2oaVhkaMuFHV/4lPP2nzcV4QOPwsAhzsLLEHgN3W','EDITOR'),
(3,'Marko','Markovic','marko@gmail.com','$2a$10$uhBlJC/YbUpHRHh4YeFEEOCX9HDg12TTuQH4tSjuUVmbA8GjnhdfK','ADMIN'),
(4,'Zivojin','Zivojinovic','zivojin@gmail.com','$2a$10$8I9Tugu9R8y8.R1Gp.v/CuUmUZim9FAfgeaXV.O5/ktnRpBYSpp2C','EDITOR');

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryId` int NOT NULL AUTO_INCREMENT,
  `countryName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `country` */

insert  into `country`(`countryId`,`countryName`) values 
(1,'Serbia'),
(2,'Bosnia and Hercegovina'),
(3,'Croatia'),
(4,'Montenegro');

/*Table structure for table `hall` */

DROP TABLE IF EXISTS `hall`;

CREATE TABLE `hall` (
  `hallId` int NOT NULL AUTO_INCREMENT,
  `hallName` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`hallId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hall` */

insert  into `hall`(`hallId`,`hallName`,`address`) values 
(1,'USC Vozdovac','Crnotravska 4, Beograd'),
(2,'SC Pozarevac','Partizanska 1, Pozarevac'),
(3,'SC Master Zemun','Cvetna 4, Beograd'),
(4,'SPC Vojvodina','Sutjeska 2, Novi Sad'),
(5,'HS Kraljevo','Kraljevo'),
(6,'SH Breza','Korcaginova bb, Gornji Milanovac'),
(7,'HS Dudova Suma','Ferenca Sepa 3, Subotica'),
(8,'SH Jezero','Grada sirena 15, Kragujevac'),
(9,'OS Sava Kerkovic','Svetog Save bb, Ljig'),
(10,'HS Stara Pazova','Branka Radicevica 6, Stara Pazova'),
(11,'O. S. Karadjordje','Mije Todorovic br 8, Topola'),
(12,'SD Slobodan Piva Ivkovic','Vojvode Supljikca 31, Beograd');

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `playerId` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `spike` int DEFAULT NULL,
  `block` int DEFAULT NULL,
  `dominantHand` varchar(20) DEFAULT NULL,
  `nationality` int DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  KEY `fk_country` (`nationality`),
  CONSTRAINT `fk_country` FOREIGN KEY (`nationality`) REFERENCES `country` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `player` */

insert  into `player`(`playerId`,`firstname`,`lastname`,`birthdate`,`height`,`weight`,`spike`,`block`,`dominantHand`,`nationality`,`photo`) values 
(1,'Dimitrije','Dobrijevic','2000-01-28',193,89,335,310,'RIGHT',1,'cv2.jpeg'),
(2,'Filip','Trifunovic','1999-07-11',186,75,305,300,'RIGHT',1,'filip-trifunovic.png'),
(3,'Aleksandar','Gmitrovic','1994-11-23',200,96,340,320,'RIGHT',1,'no-player.jpg'),
(4,'Luka','Tadic','2000-10-10',203,100,340,320,'RIGHT',1,'luka-tadic.webp'),
(5,'Aleksandar','Bosnjak','2000-06-20',207,91,350,330,'RIGHT',1,'aleksandar-bosnjak.webp'),
(6,'Maksim','Buculjevic','1991-01-20',191,92,340,315,'RIGHT',1,'no-player.jpg'),
(7,'Aleksandar','Okolic','1993-06-26',205,90,347,320,'RIGHT',1,'no-player.jpg'),
(8,'Stefan','Skakic','1999-10-19',195,89,330,320,'LEFT',1,'stefan-skakic.webp'),
(9,'Milenko','Kozic','2002-02-07',197,90,325,320,'LEFT',2,'milenko-kozic.webp'),
(17,'Ivan','Cirovic','1998-06-14',193,95,340,320,'RIGHT',1,'ivan-cirovic.webp'),
(18,'Aleksa','Vukosavljevic','1999-11-12',192,93,320,300,'LEFT',1,'aleksa-vukosavljevic.webp'),
(19,'Stefan','Cvijic','2001-07-27',189,87,326,315,'RIGHT',2,'stefan cvijic.webp'),
(20,'Luka','Ratkovic','2003-03-31',190,103,310,290,'RIGHT',1,'luka-ratkovic.webp'),
(21,'Nenad','Paravinja','1996-08-28',196,94,320,310,'LEFT',1,'nenad-paravinja.webp'),
(22,'Bogdan','Vujic','1999-02-02',179,85,310,290,'RIGHT',1,'no-player.jpg');

/*Table structure for table `playerengagement` */

DROP TABLE IF EXISTS `playerengagement`;

CREATE TABLE `playerengagement` (
  `playerEngagementId` int NOT NULL AUTO_INCREMENT,
  `playerId` int NOT NULL,
  `teamId` int NOT NULL,
  `seasonId` int NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `number` int DEFAULT NULL,
  PRIMARY KEY (`playerEngagementId`),
  UNIQUE KEY `uk_team_season_person` (`playerId`,`teamId`,`seasonId`),
  KEY `fk_pe_season` (`seasonId`),
  KEY `fk_pe_person` (`playerId`),
  KEY `fk_pe_team` (`teamId`),
  CONSTRAINT `fk_pe_player` FOREIGN KEY (`playerId`) REFERENCES `player` (`playerId`) ON DELETE CASCADE,
  CONSTRAINT `fk_pe_season` FOREIGN KEY (`seasonId`) REFERENCES `season` (`seasonId`),
  CONSTRAINT `fk_pe_team` FOREIGN KEY (`teamId`) REFERENCES `team` (`teamId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `playerengagement` */

insert  into `playerengagement`(`playerEngagementId`,`playerId`,`teamId`,`seasonId`,`position`,`number`) values 
(4,1,14,8,'MIDDLE_BLOCKER',14),
(5,2,2,9,'LIBERO',4),
(6,5,10,8,'MIDDLE_BLOCKER',45),
(7,5,12,7,'MIDDLE_BLOCKER',9),
(8,2,14,8,'OUTSIDE_HITTER',16),
(9,18,14,8,'OPPOSITE',11),
(10,9,14,8,'SETTER',3),
(12,19,14,8,'OPPOSITE',8),
(13,20,3,6,'LIBERO',13),
(14,20,14,8,'LIBERO',13),
(16,21,14,5,'SETTER',17),
(18,22,14,8,'LIBERO',4),
(19,9,15,7,'SETTER',3),
(20,1,14,9,'MIDDLE_BLOCKER',14),
(28,2,14,7,'OPPOSITE',16),
(29,2,14,9,'OPPOSITE',16),
(31,9,15,8,'SETTER',3),
(32,9,1,5,'SETTER',3),
(33,2,1,5,'LIBERO',16),
(34,5,9,9,'MIDDLE_BLOCKER',45),
(35,4,11,9,'OUTSIDE_HITTER',10),
(36,4,11,8,'OUTSIDE_HITTER',10),
(37,4,1,7,'OUTSIDE_HITTER',10),
(38,4,1,6,'OUTSIDE_HITTER',10),
(39,4,1,5,'OUTSIDE_HITTER',10),
(40,3,2,9,'OPPOSITE',14),
(41,22,14,9,'LIBERO',4),
(42,9,14,9,'SETTER',3),
(43,9,14,10,'SETTER',3);

/*Table structure for table `season` */

DROP TABLE IF EXISTS `season`;

CREATE TABLE `season` (
  `seasonId` int NOT NULL AUTO_INCREMENT,
  `startYear` int NOT NULL,
  `endYear` int NOT NULL,
  PRIMARY KEY (`seasonId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `season` */

insert  into `season`(`seasonId`,`startYear`,`endYear`) values 
(1,2015,2016),
(2,2016,2017),
(3,2017,2018),
(4,2018,2019),
(5,2019,2020),
(6,2020,2021),
(7,2021,2022),
(8,2022,2023),
(9,2023,2024),
(10,2024,2025);

/*Table structure for table `team` */

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `teamId` int NOT NULL AUTO_INCREMENT,
  `teamName` varchar(100) DEFAULT NULL,
  `founded` int DEFAULT NULL,
  `country` int DEFAULT NULL,
  `hall` int DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`teamId`),
  KEY `fk_team_country` (`country`),
  KEY `fk_team_hall` (`hall`),
  CONSTRAINT `fk_team_country` FOREIGN KEY (`country`) REFERENCES `country` (`countryId`),
  CONSTRAINT `fk_team_hall` FOREIGN KEY (`hall`) REFERENCES `hall` (`hallId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `team` */

insert  into `team`(`teamId`,`teamName`,`founded`,`country`,`hall`,`logo`) values 
(1,'Crvena Zvezda Belgrade',1945,1,1,'crvena-zvezda.jpg'),
(2,'Mladi Radnik Pozarevac',1946,1,2,'mladi-radnik.jpg'),
(3,'Ribnica Kraljevo',1954,1,5,'ribnica.jpg'),
(4,'OK Metalac Takovo',1976,1,6,'takovo.jpg'),
(5,'Spartak Subotica',1981,1,7,'spartak-subotica.jpg'),
(6,'Radnicki Kragujevac',1945,1,8,'radnicki-kragujevac.jpg'),
(7,'Spartak Ljig',1975,1,9,'spartak-ljig.jpg'),
(8,'Jedinstvo Stara Pazova',1931,1,10,'jedinstvo-pazova.jpg'),
(9,'OK Karadjordje Topola',1964,1,11,'karadjordje-topola.jpg'),
(10,'Novi Sad',2004,1,4,'ns-maneks.jpg'),
(11,'Partizan Beograd',1945,1,3,'partizan.jpg'),
(12,'Vojvodina Novi Sad',1946,1,4,'vojvodina.jpg'),
(14,'OK FON',2012,1,1,'fon-logo.jpg'),
(15,'Zeleznicar Beograd',1947,1,12,'zeleznicar-bg.webp');

/* Trigger structure for table `playerengagement` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `BEFORE_INSERT_PLAYERENGAGEMENT` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `BEFORE_INSERT_PLAYERENGAGEMENT` BEFORE INSERT ON `playerengagement` FOR EACH ROW BEGIN
    IF ((SELECT COUNT(*) FROM playerengagement WHERE playerId = NEW.playerId AND seasonId = NEW.seasonId) >= 2) THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Already 2 engagements for that player in the same season';
    END IF;
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
