-- Adminer 4.7.4 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL,
  `majorplanId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `majorplanId` (`majorplanId`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`majorplanId`) REFERENCES `majorplan` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `class` (`Id`, `class`, `majorplanId`) VALUES
(1,	'网络一班',	1),
(2,	'软件一班',	2);

DROP TABLE IF EXISTS `curriculum`;
CREATE TABLE `curriculum` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `curriculum` (`Id`, `name`) VALUES
(1,	'大学英语'),
(2,	'思想品德');

DROP TABLE IF EXISTS `curriculumplan`;
CREATE TABLE `curriculumplan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculumId` int(11) NOT NULL,
  `majorplanId` int(11) NOT NULL,
  `xueqi` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `curriculumId` (`curriculumId`),
  KEY `majorplanId` (`majorplanId`),
  CONSTRAINT `curriculumplan_ibfk_1` FOREIGN KEY (`curriculumId`) REFERENCES `curriculum` (`Id`),
  CONSTRAINT `curriculumplan_ibfk_2` FOREIGN KEY (`majorplanId`) REFERENCES `majorplan` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `curriculumplan` (`Id`, `curriculumId`, `majorplanId`, `xueqi`) VALUES
(1,	1,	1,	1),
(2,	2,	2,	2);

DROP TABLE IF EXISTS `instructor`;
CREATE TABLE `instructor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `instructor` (`Id`, `username`, `password`, `name`) VALUES
(1,	'701',	'123456',	'陈浩南');

DROP TABLE IF EXISTS `kaoqin`;
CREATE TABLE `kaoqin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `sktimeId` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `studentId` (`studentId`),
  KEY `sktimeId` (`sktimeId`),
  CONSTRAINT `kaoqin_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`Id`),
  CONSTRAINT `kaoqin_ibfk_2` FOREIGN KEY (`sktimeId`) REFERENCES `sktime` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `kaoqin` (`Id`, `studentId`, `sktimeId`, `state`) VALUES
(1,	1,	1,	'迟到'),
(2,	2,	2,	'准时'),
(4,	1,	3,	'准时'),
(5,	1,	4,	'迟到');

DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `major` (`Id`, `name`) VALUES
(1,	'网络技术'),
(2,	'软件技术');

DROP TABLE IF EXISTS `majorplan`;
CREATE TABLE `majorplan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `majorId` int(11) NOT NULL,
  `grade` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `majorId` (`majorId`),
  CONSTRAINT `majorplan_ibfk_1` FOREIGN KEY (`majorId`) REFERENCES `major` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `majorplan` (`Id`, `majorId`, `grade`) VALUES
(1,	1,	'2017'),
(2,	2,	'2017');

DROP TABLE IF EXISTS `sktime`;
CREATE TABLE `sktime` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculumplanId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `zhouzi` int(20) NOT NULL,
  `week` varchar(255) NOT NULL,
  `jieci` int(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `curriculumplanId` (`curriculumplanId`),
  KEY `classId` (`classId`),
  CONSTRAINT `sktime_ibfk_1` FOREIGN KEY (`curriculumplanId`) REFERENCES `curriculumplan` (`Id`),
  CONSTRAINT `sktime_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sktime` (`Id`, `curriculumplanId`, `classId`, `zhouzi`, `week`, `jieci`) VALUES
(1,	1,	1,	13,	'星期一',	1),
(2,	1,	1,	13,	'星期一',	2),
(3,	1,	1,	14,	'星期二',	5),
(4,	2,	1,	14,	'星期二',	6);

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `classId` int(11) NOT NULL,
  `live` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `classId` (`classId`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `student` (`Id`, `username`, `password`, `name`, `classId`, `live`) VALUES
(1,	'2017001',	'123456',	'李天天',	1,	0),
(2,	'2017002',	'123456',	'李晓天',	2,	0);

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `classId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `classId` (`classId`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `teacher` (`Id`, `username`, `password`, `classId`) VALUES
(1,	'7',	'123456',	1);

-- 2019-12-01 14:49:06
