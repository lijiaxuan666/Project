/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.24 : Database - pets
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pets` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pets`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cotnet` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `article` */

insert  into `article`(`aid`,`title`,`cotnet`,`time`,`file_name`) values (1,'猫猫狗狗可以一起养吗？','正常情况下是可以在一起饲养的。但是有一些情况需要注意，首先，要尽量选择攻击性低，性格温和的犬猫品种。 其次最好是养年龄相近的猫狗，从小就一起饲养，当动物之间互相熟悉了对方的味道，相对来说就不会有很强的攻 击性。一旦发现有打架攻击的倾向，就要隔离开，分开饲养。最后，要注意将犬猫的粮食分开饲喂，防止出现猫咪 偷吃狗粮，狗狗偷吃猫粮的情况。可以将猫咪的饭碗放到台子上，这样狗狗就够不到了。还要注意狗狗是否会偷吃 猫砂，如果狗狗食入大量的猫砂会引起消化道的问题。最后定期带它们注射疫苗，定期进行体内外的驱虫，多和它们沟通感情。','2022-09-07 10:58','img40.png'),(2,'猫咪发生呕吐的时候怎么办','首先要看猫咪是因为什么症状而发生这种情况的，吐毛球？肠胃不适？吃错东西？ 要看猫咪吐出的是什么，如果是毛球那就不需要大惊小怪，给猫咪买一些化毛膏之类的混在猫粮吃就可以，或者有化毛成分的猫粮，如果猫咪是吃错东西或者肠胃不适引起的可以禁食（包括水）不要心疼！24小时看看猫咪还会不会发生呕吐，然后再喂一些...... ','2022-09-07 10:58','img7.png'),(3,'挑选纯种泰迪犬的一些实用技巧','对于现代人来说养一条狗狗已经不是什么高档消费了，特别是对于一些白领一族来说养一条合适的狗狗是比较的容易的了！但是选购一条好品质的狗狗确并不容易！下面瑞鹏宠物......','2022-09-07 10:58','img9.png'),(4,'如何帮宝贝们养成良好的生活习惯','自从我当了宠物医生以后身边总是有很多朋友问我很多关于养狗的问题比如为什么家里狗狗挑食，为什么就是不听话,怎么在家里随地大小便，很多很多诸如此类的问题。那今天小编就在这里为大家简单说一下......','2022-09-07 10:58','img11 (2).png'),(5,'微笑天使——萨摩耶保养攻略','萨摩耶的颜值是靠其毛发来撑起的，所以想要萨摩耶保持高颜值，毛发必须要护理好，如果毛发粗糙毛量稀少，你说这样一只萨摩耶会好看吗？平时要定期给狗狗洗澡护理，多梳毛，可以喂点深海鱼油的美毛狗粮.......','2022-09-07 10:58','img10.png');

/*Table structure for table `tiezi` */

DROP TABLE IF EXISTS `tiezi`;

CREATE TABLE `tiezi` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `time` varchar(20) DEFAULT NULL,
  `kind` varchar(20) NOT NULL DEFAULT '狗狗',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '宠物百科',
  `phone` varchar(30) DEFAULT NULL,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '未审核',
  `status2` varchar(20) DEFAULT '未领养',
  `imag` varchar(100) DEFAULT NULL,
  `user` varchar(20) NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `tiezi` */

insert  into `tiezi`(`tid`,`time`,`kind`,`type`,`phone`,`title`,`status`,`status2`,`imag`,`user`) values (1,'2022-11-30 14:20','狗狗','宠物百科','10086','猫猫狗狗可以一起养吗？','已删除','未领养','img4.png','test'),(2,'2022-11-10 14:20','猫咪','送养','10086','10个月大的小猫咪等你带回家','已审核','已领养','img20.jpg','test'),(3,'2022-1-30 11:20','狗狗','找宠物','10086','紧急寻找家犬！！！','已审核','未找到','img22.png','test'),(4,'2022-08-29 19:20','狗狗','领养','10086','忠诚田园犬求领养','已审核','已领养','img3.png','test'),(5,'2022-09-19 17:24','猫咪','找主人','10086','花园小区捡到只流浪猫，失主快来认领','已审核','未找到','img23.png','test'),(6,'2022-08-31 14:20','狗狗','送养','10086','自家泰迪，求一户好人家','已审核','已领养','img27.jpg','test'),(7,'2023-04-05 15:08:12','狗狗','领养','10086','一只小金毛，求带走','已审核','未领养','img26.jpg','test'),(8,'2023-04-05 15:12:09','领养','狗狗','12345','小猫咪','已审核','未领养','img26.jpg','test');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `power` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`power`) values (1,'test','123',0),(2,'mary','123',0),(3,'admin','123',1);

/*Table structure for table `xiaoxi` */

DROP TABLE IF EXISTS `xiaoxi`;

CREATE TABLE `xiaoxi` (
  `xid` int NOT NULL AUTO_INCREMENT,
  `time` varchar(20) DEFAULT NULL,
  `content` varchar(128) NOT NULL,
  `user` varchar(20) DEFAULT '0',
  `read` int DEFAULT '0',
  PRIMARY KEY (`xid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `xiaoxi` */

insert  into `xiaoxi`(`xid`,`time`,`content`,`user`,`read`) values (1,'2023-04-05 15:08:12','帖子已通过审核','test',0),(2,'2023-04-05 15:08:12','您发布的送养信息有人请求','test',1),(3,'2023-04-05 15:08:12','您发布的找主人信息有人请求','test',0),(4,'2023-04-05 15:08:12','您的找宠物请求成功！','test',1),(58,'2023-04-05 16:22:40','您的帖子已审核','test',0),(62,'2023-04-05 22:14:53','您发布的帖子有人已领养','test',0),(63,'2023-04-06 20:59:23','您的帖子已删除','test',0),(64,'2023-04-06 20:59:27','您的帖子已审核','test',1),(67,'2023-04-06 21:25:59','您的帖子已审核','test',0),(68,'2023-04-06 21:26:53','您发布的帖子有人已领养','test',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
