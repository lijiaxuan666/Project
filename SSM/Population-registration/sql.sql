/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.24 : Database - student_manager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student_manager` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `student_manager`;

/*Table structure for table `arrange_course` */

DROP TABLE IF EXISTS `arrange_course`;

CREATE TABLE `arrange_course` (
  `ctid` int NOT NULL AUTO_INCREMENT,
  `oid` int DEFAULT NULL,
  `rid` int DEFAULT NULL,
  `weekno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `week` int DEFAULT NULL,
  `start` int DEFAULT NULL,
  `size` int DEFAULT NULL,
  PRIMARY KEY (`ctid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `arrange_course` */

insert  into `arrange_course`(`ctid`,`oid`,`rid`,`weekno`,`week`,`start`,`size`) values (1,1,5,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',1,1,2),(2,2,6,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',1,3,2),(3,4,7,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',1,5,3),(4,3,8,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',2,1,2),(5,6,9,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',2,5,2),(6,7,10,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',3,1,2),(7,1,5,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',4,3,2),(8,2,6,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',4,9,2),(9,3,7,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',5,3,2),(10,6,8,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',5,5,2),(11,8,10,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',1,3,2),(12,9,9,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',1,1,2),(13,11,8,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',1,5,3),(14,10,7,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',2,3,2),(15,13,6,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',2,6,2),(16,14,5,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',3,3,2),(17,8,8,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',4,5,2),(18,9,7,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',4,7,2),(19,10,6,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',5,1,2),(20,13,5,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16',5,7,2),(24,1,10,'1,3,5,7,9,11,13,15',5,7,2);

/*Table structure for table `clazz` */

DROP TABLE IF EXISTS `clazz`;

CREATE TABLE `clazz` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mid` int DEFAULT NULL,
  `cremark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `clazz` */

insert  into `clazz`(`cid`,`cname`,`mid`,`cremark`) values (1,'19小教1班',1,'无'),(2,'20小教1班',1,'无'),(3,'19学前1班',3,'无'),(4,'20学前1班',3,'无'),(5,'19计科1班',4,'无'),(6,'19计科2班',4,'无'),(7,'20计科1班',4,'无'),(8,'20计科2班',4,'无'),(9,'19数学1班',5,'无'),(10,'19数学2班',5,'无'),(11,'20数学1班',5,'无'),(12,'19物联网1班',6,'无'),(13,'20物联网1班',6,'无'),(14,'19汉语言1班',9,'无'),(15,'20汉语言1班',9,'无'),(16,'20汉语言2班',9,'无'),(17,'19英语1班',11,'无'),(18,'20英语1班',11,'无');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseId` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `courseRemark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`courseId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `course` */

insert  into `course`(`courseId`,`courseName`,`courseRemark`) values (1,'高等数学','无'),(2,'线性代数','无'),(3,'概率论与数理统计','无'),(4,'离散数学','无'),(5,'大学英语','无'),(6,'形势与政策','无'),(7,'C程序设计','无'),(8,'数据结构','无'),(9,'操作系统','无'),(10,'计算机组成原理','无'),(11,'计算机网络','无'),(12,'Java程序设计','无'),(13,'数据库原理及应用','无'),(14,'Python程序设计','无'),(15,'人工智能','无');

/*Table structure for table `course_grade` */

DROP TABLE IF EXISTS `course_grade`;

CREATE TABLE `course_grade` (
  `cgid` int NOT NULL AUTO_INCREMENT,
  `oid` int DEFAULT NULL,
  `sid` int DEFAULT NULL,
  `score` decimal(10,1) DEFAULT NULL,
  PRIMARY KEY (`cgid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `course_grade` */

insert  into `course_grade`(`cgid`,`oid`,`sid`,`score`) values (1,1,1,'85.0'),(2,1,2,'87.0'),(3,1,3,'59.5'),(4,8,7,'95.5'),(5,8,8,'87.0'),(6,8,9,'59.5'),(18,1,4,'92.0'),(19,1,5,'85.0'),(20,1,6,'77.0'),(21,8,10,'55.0'),(22,8,11,'44.0'),(23,8,12,'99.0'),(24,2,1,'86.0'),(25,2,2,'75.0'),(26,2,3,'33.0'),(27,2,4,'60.0'),(28,2,5,'95.0'),(29,2,6,'71.0'),(30,3,1,'78.0'),(31,3,2,'64.0'),(32,3,3,'99.0'),(33,3,4,'51.0'),(34,3,5,'77.0'),(35,3,6,'85.0');

/*Table structure for table `major` */

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `mname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mdept` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mremark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `major` */

insert  into `major`(`mid`,`mname`,`mdept`,`mremark`) values (1,'小学教育','教育科学学院','无'),(2,'教育技术学','教育科学学院','无'),(3,'学前教育','学前教育学院','无'),(4,'计算机科学与技术','数学与信息技术学院','无'),(5,'数学与应用数学','数学与信息技术学院','无'),(6,'物联网工程','数学与信息技术学院','无'),(7,'物理学','物理与电子工程学院','无'),(8,'电子信息工程','物理与电子工程学院','无'),(9,'汉语言文学','文学院','无'),(10,'秘书学','文学院','无'),(11,'英语','外国语学院','无'),(13,'生物科学','生命科学与化学化工学院','无'),(14,'化学','生命科学与化学化工学院','无'),(15,'财务管理','商学院','无'),(16,'音乐学','音乐学院','无'),(19,'美术学','美术学院','无');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `manager` */

insert  into `manager`(`id`,`username`,`password`,`name`,`remark`) values (1,'admin','admin','root','管理员');

/*Table structure for table `open_course` */

DROP TABLE IF EXISTS `open_course`;

CREATE TABLE `open_course` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `year` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `term` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `tid` int DEFAULT NULL,
  `courseId` int DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `open_course` */

insert  into `open_course`(`oid`,`year`,`term`,`cid`,`tid`,`courseId`,`remark`) values (1,'2021-2022学年','第一学期',7,1,1,'基础课'),(2,'2021-2022学年','第一学期',7,2,2,'基础课'),(3,'2021-2022学年','第一学期',7,3,4,'基础课'),(4,'2021-2022学年','第一学期',7,4,5,'专业课'),(5,'2021-2022学年','第一学期',7,5,6,'专业课'),(6,'2021-2022学年','第一学期',7,6,7,'专业课'),(7,'2021-2022学年','第一学期',7,7,10,'专业课'),(8,'2021-2022学年','第一学期',8,1,1,'基础课'),(9,'2021-2022学年','第一学期',8,2,2,'基础课'),(10,'2021-2022学年','第一学期',8,3,4,'基础课'),(11,'2021-2022学年','第一学期',8,4,5,'专业课'),(12,'2021-2022学年','第一学期',8,5,6,'专业课'),(13,'2021-2022学年','第一学期',8,6,7,'专业课'),(14,'2021-2022学年','第一学期',8,7,10,'专业课');

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `rname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `room` */

insert  into `room`(`rid`,`rname`,`capacity`,`remark`) values (1,'博1-101',200,'阶梯教室'),(2,'博1-102',200,'阶梯教室'),(3,'博1-201',200,'阶梯教室'),(4,'博1-202',200,'阶梯教室'),(5,'博2-101',70,'普通教室'),(6,'博2-102',70,'普通教室'),(7,'博2-201',70,'普通教室'),(8,'博2-202',70,'普通教室'),(9,'博2-301',150,'普通教室'),(10,'博2-302',150,'普通教室'),(11,'明1-301',70,'实验室1'),(12,'明1-302',70,'实验室1'),(13,'明1-401',150,'实验室2'),(14,'崇1-301',140,'普通教室');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `snum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ssex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sage` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `sstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sremark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pswd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `student` */

insert  into `student`(`sid`,`sname`,`snum`,`ssex`,`sage`,`cid`,`sstatus`,`sremark`,`idcard`,`phone`,`address`,`entime`,`pswd`,`pic`) values (1,'张无忌','2020710001','男',20,7,'正常','无','320282200012121234','18698765432','湖北省十堰市丹江口市武当山','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223024.jpg'),(2,'周芷若','2020710002','女',17,7,'正常','无','320282200012121234','18698765432','四川省乐山市峨眉山市峨眉山','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223040.jpg'),(3,'赵敏','2020710003','女',16,7,'正常','无','320282200012121234','18698765432','北京市东城区汝阳王府','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223054.jpg'),(4,'郭靖','2020710004','男',18,7,'正常','无','320282200012121234','18698765432','浙江省杭州市牛家村','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223118.jpg'),(5,'黄蓉','2020710005','女',16,7,'正常','无','320282200012121234','18698765432','浙江省舟山市桃花岛','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223136.jpg'),(6,'杨过','2020710006','男',17,7,'正常','无','320282200012121234','18698765432','陕西省西安市终南山','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223155.jpg'),(7,'小龙女','2020710007','女',16,8,'正常','无','320282200012121234','18698765432','陕西省西安市终南山','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223208.jpg'),(8,'段誉','2020710008','男',20,8,'正常','无','320282200012121234','18698765432','云南省大理市大理皇宫','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223226.jpg'),(9,'乔峰','2020710009','男',23,8,'正常','无','320282200012121234','18698765432','内蒙古赤峰市南院大王府','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223246.jpg'),(10,'虚竹','2020710010','男',21,8,'正常','无','320282200012121234','18698765432','河南省郑州市登封市少林寺','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223300.jpg'),(11,'王语嫣','2020710011','女',17,8,'正常','无','320282200012121234','18698765432','江苏省苏州市吴中区金庭镇曼陀山庄','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223320.jpg'),(12,'陆冠英','2020710012','男',18,1,'正常','无','320282200012121234','18698765432','江苏省无锡市宜兴市周铁镇归云庄','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223357.jpg'),(13,'贾宝玉','2020710013','男',15,2,'正常','无','320282200012121234','18698765432','江苏省南京市秦淮区荣国公府','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223448.jpg'),(14,'林黛玉','2020710014','女',13,2,'正常','无','320282200012121234','18698765432','江苏省苏州市姑苏区林府','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223500.jpg'),(15,'薛宝钗','2020710015','女',16,2,'正常','无','320282200012121234','18698765432','江苏省南京市秦淮区薛府','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223516.jpg'),(16,'贾探春','2020710016','女',14,2,'正常','无','320282200012121234','18698765432','江苏省南京市秦淮区荣国公府','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223516.jpg'),(17,'王熙凤','2020710017','女',23,2,'正常','无','320282200012121234','18698765432','江苏省南京市秦淮区王府','2019-09-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211009223530.jpg');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tnum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tsex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tage` int DEFAULT NULL,
  `tstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tremark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `entime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pswd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `teacher` */

insert  into `teacher`(`tid`,`tname`,`tnum`,`tsex`,`tage`,`tstatus`,`tremark`,`idcard`,`phone`,`address`,`entime`,`pswd`,`pic`) values (1,'张三丰','15001','男',121,'正常','无','320282190002011234','13952776288','湖北省十堰市丹江口市武当山','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010194556.jpg'),(2,'王重阳','15002','男',110,'正常','无','320282190002011234','13952776288','陕西省西安市终南山','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193355.jpg'),(3,'马钰','15003','男',64,'正常','无','320282190002011234','13952776288','陕西省西安市终南山','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193432.jpg'),(4,'洪七公','15004','男',62,'正常','无','320282190002011234','13952776288','河南省开封市丐帮总舵','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193453.jpg'),(5,'黄药师','15005','男',57,'正常','无','320282190002011234','13952776288','浙江省舟山市桃花岛','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193516.jpg'),(6,'柯镇恶','15006','男',53,'正常','无','320282190002011234','13952776288','浙江省嘉兴市南湖区南湖','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193535.jpg'),(7,'独孤求败','15007','男',120,'正常','无','320282190002011234','13952776288','湖北省襄阳市城郊','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193546.jpg'),(8,'风清扬','15008','男',115,'正常','无','320282190002011234','13952776288','陕西省渭南市华阴市华山','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193609.jpg'),(9,'宁中则','15009','女',32,'正常','无','320282190002011234','13952776288','陕西省渭南市华阴市华山','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193633.jpg'),(10,'岳不群','15010','男',41,'正常','无','320282190002011234','13952776288','陕西省渭南市华阴市华山','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193703.jpg'),(11,'天山童姥','15011','女',76,'正常','无','320282190002011234','13952776288','新疆省乌鲁木齐市天山灵鹫宫','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193726.jpg'),(12,'穆人清','15012','男',69,'正常','无','320282190002011234','13952776288','陕西省渭南市华阴市华山','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193801.jpg'),(13,'陈近南','15013','男',35,'正常','无','320282190002011234','13952776288','福建省漳州府龙溪县石美村','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010193823.jpg'),(14,'九难','15014','女',25,'正常','无','320282190002011234','13952776288','北京市东城区紫禁城','2017-07-01','123456','http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010194016.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
