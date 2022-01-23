/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.26 : Database - secretspace
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`secretspace` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `secretspace`;

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '博客编号',
  `headline` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客标题',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客作者',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客内容',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客分类',
  `clicknum` int NOT NULL COMMENT '点击数',
  `commitnum` int NOT NULL COMMENT '回复数',
  `uptime` date NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `author_username` (`author`),
  KEY `type_name` (`type`),
  CONSTRAINT `author_username` FOREIGN KEY (`author`) REFERENCES `user` (`username`),
  CONSTRAINT `type_name` FOREIGN KEY (`type`) REFERENCES `type` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `blog` */

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏人',
  `blog_id` int NOT NULL COMMENT '收藏帖子编号',
  `date` date NOT NULL COMMENT '收藏日期',
  PRIMARY KEY (`id`),
  KEY `user_username` (`user`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `user_username` FOREIGN KEY (`user`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `collect` */

/*Table structure for table `commit` */

DROP TABLE IF EXISTS `commit`;

CREATE TABLE `commit` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `blog_id` int NOT NULL COMMENT '帖子编号',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论作者',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `uptime` date NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `blog_id_id` (`blog_id`),
  KEY `author_author` (`author`),
  CONSTRAINT `author_author` FOREIGN KEY (`author`) REFERENCES `user` (`username`),
  CONSTRAINT `blog_id_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `commit` */

/*Table structure for table `findpsd` */

DROP TABLE IF EXISTS `findpsd`;

CREATE TABLE `findpsd` (
  `question` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密保问题',
  PRIMARY KEY (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `findpsd` */

/*Table structure for table `focus` */

DROP TABLE IF EXISTS `focus`;

CREATE TABLE `focus` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '关注编号',
  `username_from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关注者',
  `username_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '被关注者',
  PRIMARY KEY (`id`),
  KEY `focus_from` (`username_from`),
  KEY `focus_to` (`username_to`),
  CONSTRAINT `focus_from` FOREIGN KEY (`username_from`) REFERENCES `user` (`username`),
  CONSTRAINT `focus_to` FOREIGN KEY (`username_to`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `focus` */

/*Table structure for table `hobby` */

DROP TABLE IF EXISTS `hobby`;

CREATE TABLE `hobby` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户搜索内容编号',
  `username` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `content` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户搜索内容',
  PRIMARY KEY (`id`),
  KEY `username_hobby_username` (`username`),
  CONSTRAINT `username_hobby_username` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hobby` */

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '更新日志的编号',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志版本号',
  `date` date NOT NULL COMMENT '更新日期',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `log` */

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '私信编号',
  `username_from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发件人',
  `username_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收件人',
  `headline` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '私信标题',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '私信内容',
  `sendtime` date NOT NULL COMMENT '私信时间',
  `state` int NOT NULL COMMENT '0代表未读，1代表已读',
  PRIMARY KEY (`id`),
  KEY `from` (`username_from`),
  KEY `to` (`username_to`),
  CONSTRAINT `from` FOREIGN KEY (`username_from`) REFERENCES `user` (`username`),
  CONSTRAINT `to` FOREIGN KEY (`username_to`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `message` */

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `state` int NOT NULL COMMENT '0代表固定，1代表可变',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `type` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地区',
  `headphoto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `question` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密保问题',
  `answer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密保问题答案',
  `role` int NOT NULL COMMENT '0是用户，1是管理员，2是待审核管理员',
  PRIMARY KEY (`username`),
  KEY `question_question` (`question`),
  CONSTRAINT `question_question` FOREIGN KEY (`question`) REFERENCES `findpsd` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

/* Trigger structure for table `commit` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `commitInsertTrigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `commitInsertTrigger` AFTER INSERT ON `commit` FOR EACH ROW begin
	UPDATE `blog` 
	SET `commitnum`=`commitnum`+1 
	WHERE `id`=new.`blog_id`;
end */$$


DELIMITER ;

/* Trigger structure for table `commit` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `commitDeleteTrigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `commitDeleteTrigger` AFTER DELETE ON `commit` FOR EACH ROW BEGIN
	UPDATE `blog` 
	SET `commitnum`=`commitnum`-1 
	WHERE `id`=old.`blog_id`;
END */$$


DELIMITER ;

/* Procedure structure for procedure `deleteBlog` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteBlog` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBlog`(IN blogId Int)
BEGIN
		delete from collect where blog_id=blogId;
		delete from `commit` where blog_id=blogId;
		delete from blog where id=blogId;
	END */$$
DELIMITER ;

/*Table structure for table `commit_user` */

DROP TABLE IF EXISTS `commit_user`;

/*!50001 DROP VIEW IF EXISTS `commit_user` */;
/*!50001 DROP TABLE IF EXISTS `commit_user` */;

/*!50001 CREATE TABLE  `commit_user`(
 `id` int ,
 `blog_id` int ,
 `author` varchar(20) ,
 `content` mediumtext ,
 `uptime` date ,
 `password` varchar(50) ,
 `sex` varchar(10) ,
 `birthday` date ,
 `area` varchar(50) ,
 `headphoto` varchar(50) ,
 `question` varchar(50) ,
 `answer` varchar(50) ,
 `role` int 
)*/;

/*View structure for view commit_user */

/*!50001 DROP TABLE IF EXISTS `commit_user` */;
/*!50001 DROP VIEW IF EXISTS `commit_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `commit_user` AS select `commit`.`id` AS `id`,`commit`.`blog_id` AS `blog_id`,`commit`.`author` AS `author`,`commit`.`content` AS `content`,`commit`.`uptime` AS `uptime`,`user`.`password` AS `password`,`user`.`sex` AS `sex`,`user`.`birthday` AS `birthday`,`user`.`area` AS `area`,`user`.`headphoto` AS `headphoto`,`user`.`question` AS `question`,`user`.`answer` AS `answer`,`user`.`role` AS `role` from (`commit` join `user`) where (`commit`.`author` = `user`.`username`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
