-- Adminer 4.7.4 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `sign` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sign`;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台管理员',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `admin` (`Id`, `username`, `password`) VALUES
(1,	'admin',	'123456');

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级',
  `name` varchar(255) DEFAULT NULL,
  `majorPlanId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `majorPlayId` (`majorPlanId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `class` (`Id`, `name`, `majorPlanId`) VALUES
(1,	'网络一班',	1),
(2,	'软件一班',	2);

DROP TABLE IF EXISTS `curriculum`;
CREATE TABLE `curriculum` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `curriculum` (`Id`, `name`) VALUES
(1,	'大学英语'),
(2,	'思想品德');

DROP TABLE IF EXISTS `curriculumplan`;
CREATE TABLE `curriculumplan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程计划',
  `xueqi` varchar(255) DEFAULT NULL,
  `curriculumId` int(11) DEFAULT NULL,
  `majorPlayId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `curriculumId` (`curriculumId`),
  KEY `majorPlayId` (`majorPlayId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `curriculumplan` (`Id`, `xueqi`, `curriculumId`, `majorPlayId`) VALUES
(1,	'一',	1,	1),
(2,	'一',	2,	2);

DROP TABLE IF EXISTS `instructor`;
CREATE TABLE `instructor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '辅导员',
  `InstructorId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `instructor` (`Id`, `InstructorId`, `name`, `password`) VALUES
(1,	1,	'陈配红',	123456);

DROP TABLE IF EXISTS `kaoqin`;
CREATE TABLE `kaoqin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤',
  `studId` int(11) DEFAULT NULL,
  `sktimeId` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `studId` (`studId`),
  KEY `sktimeId` (`sktimeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `kaoqin` (`Id`, `studId`, `sktimeId`, `state`) VALUES
(1,	1,	1,	'准时'),
(2,	2,	2,	'迟到');

DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业',
  `name` varchar(255) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `major` (`Id`, `name`, `number`) VALUES
(1,	'网络技术',	1001),
(2,	'软件技术',	1002);

DROP TABLE IF EXISTS `majorplan`;
CREATE TABLE `majorplan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业计划',
  `majorId` int(11) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `majorId` (`majorId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `majorplan` (`Id`, `majorId`, `grade`) VALUES
(1,	1,	'2017级'),
(2,	2,	'2019级');

DROP TABLE IF EXISTS `sktime`;
CREATE TABLE `sktime` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上课时间',
  `zhouci` varchar(255) DEFAULT NULL,
  `week` varchar(255) DEFAULT NULL,
  `jieci` int(11) DEFAULT NULL,
  `curriculumPlanId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `curriculumPlayId` (`curriculumPlanId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `sktime` (`Id`, `zhouci`, `week`, `jieci`, `curriculumPlanId`) VALUES
(1,	'一',	'星期一',	1,	1),
(2,	'一',	'星期一',	2,	1);

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `studId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `password` int(11) DEFAULT NULL,
  `live` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `classId` (`classId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `student` (`Id`, `studId`, `name`, `classId`, `password`, `live`) VALUES
(1,	2019001,	'李天天',	1,	123456,	0),
(2,	2019002,	'李小天',	2,	123456,	0);

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `password` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `teacher` (`Id`, `teacherId`, `name`, `classId`, `password`) VALUES
(1,	7,	'张三丰',	1,	123456);

-- 2019-11-13 02:49:28
