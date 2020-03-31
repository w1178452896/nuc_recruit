/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : nuc_recruit

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 31/03/2020 14:55:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `cid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `registerTime` date DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE INDEX `account`(`mail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (00000001, NULL, '474260872@qq.com', '123456', '2016-08-16', '3');
INSERT INTO `company` VALUES (00000002, '', '130774207@qqcom', '123456', '2016-08-08', '3');
INSERT INTO `company` VALUES (00000003, '1c6d6ecae0dea46024ac9efaee1ca5b3', '601647957@qq.com', '123456', '2016-09-01', '3');
INSERT INTO `company` VALUES (00000004, 'cd40fa2d7b6bf5dc0b048752e6522ebb', '1502427730@qq.com', '123456', '2016-09-01', '3');
INSERT INTO `company` VALUES (00000005, '5ba67f68cd39a14af723307785f1d8ae', '2919138769@qq.com', 'w111111', '2020-03-25', '3');

-- ----------------------------
-- Table structure for companyinfo
-- ----------------------------
DROP TABLE IF EXISTS `companyinfo`;
CREATE TABLE `companyinfo`  (
  `ciid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `companyname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `location` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `industry` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contacts` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `companyinstruction` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ciid`) USING BTREE,
  INDEX `sys_ci_id_to_c_id`(`ciid`) USING BTREE,
  CONSTRAINT `companyinfo_ibfk_1` FOREIGN KEY (`ciid`) REFERENCES `company` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companyinfo
-- ----------------------------
INSERT INTO `companyinfo` VALUES (00000001, '东软', '广州', '科学城', '软件', '李天一', '男', '13222222222', '1111111', '软件公司', '3ffd0133-becd-4c35-a23d-ef6cff10abef.png');
INSERT INTO `companyinfo` VALUES (00000002, '工商', '广州', '天河科韵路', '信贷', '陈冠希', '男', '13222222222', '123456', '银行', '3ffd0133-becd-4c35-a23d-ef6cff10abef.png');
INSERT INTO `companyinfo` VALUES (00000003, '技术霸主网', '杭州', '东软大厦', '计算机硬件', '梁家伟', '男', '13515151544', '020-3453253245', '招聘网站', '99138183-d960-4431-8a7c-51f206036afe.jpg');
INSERT INTO `companyinfo` VALUES (00000004, '华南农业大学', '广州', '五山路华山区', '高等教育', '陈晓阳', '男', '13515151515', '020-8122106', '广东高水平建设学校', '3396f488-8f6c-4851-8218-9a07ccc5d14f.jpg');
INSERT INTO `companyinfo` VALUES (00000005, '饭堂科技有限公司', '北京', '啊啊啊啊啊啊啊啊啊啊啊啊啊', '互联网', '史凡唐', '男', '15934462135', '11111111', '1111111111111', 'f6591821-5b6c-4d6f-8631-d5ee437061a2.JPG');

-- ----------------------------
-- Table structure for education_experience
-- ----------------------------
DROP TABLE IF EXISTS `education_experience`;
CREATE TABLE `education_experience`  (
  `eid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `uid` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `school` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `college` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stime` date DEFAULT NULL,
  `etime` date DEFAULT NULL,
  `statement` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`eid`) USING BTREE,
  INDEX `sys_eid`(`eid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `education_experience_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of education_experience
-- ----------------------------
INSERT INTO `education_experience` VALUES (00000001, 00000001, '华农', '软件', '软件', '大专', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience` VALUES (00000002, 00000002, '中大', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000003, 00000003, '中大', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000004, 00000004, '中大', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000005, 00000005, '华农', '软件', '软件', '大专', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience` VALUES (00000006, 00000006, '华农', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000007, 00000007, '华工', '软件', '软件', '大专', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience` VALUES (00000008, 00000008, '中大', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000009, 00000009, '华农', '软件', '软件', '大专', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience` VALUES (00000010, 00000010, '华农', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000011, 00000011, '华工', '软件', '软件', '大专', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience` VALUES (00000012, 00000012, '中大', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000013, 00000013, '华农', '软件', '软件', '大专', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience` VALUES (00000014, 00000014, '华农', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000015, 00000015, '华工', '软件', '软件', '大专', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience` VALUES (00000016, 00000016, '中大', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000017, 00000017, '华工', '软件', '软件', '大专', '2016-08-17', '2016-08-31', '好');
INSERT INTO `education_experience` VALUES (00000018, 00000018, '中大', '数学', '数学', '本科', '2016-08-30', '2016-09-06', '好');
INSERT INTO `education_experience` VALUES (00000019, 00000032, '111', '111', '111', '111', '2020-03-06', '2020-03-09', 'sdfd???');

-- ----------------------------
-- Table structure for major_skill
-- ----------------------------
DROP TABLE IF EXISTS `major_skill`;
CREATE TABLE `major_skill`  (
  `mid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `uid` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `skill` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `sys_mid`(`mid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `major_skill_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major_skill
-- ----------------------------
INSERT INTO `major_skill` VALUES (00000001, 00000001, 'java');
INSERT INTO `major_skill` VALUES (00000002, 00000001, 'php');
INSERT INTO `major_skill` VALUES (00000003, 00000001, 'jsp');
INSERT INTO `major_skill` VALUES (00000004, 00000002, 'java');
INSERT INTO `major_skill` VALUES (00000005, 00000002, 'php');
INSERT INTO `major_skill` VALUES (00000006, 00000002, 'jsp');
INSERT INTO `major_skill` VALUES (00000007, 00000003, 'java');
INSERT INTO `major_skill` VALUES (00000008, 00000003, 'php');
INSERT INTO `major_skill` VALUES (00000009, 00000003, 'jsp');
INSERT INTO `major_skill` VALUES (00000010, 00000004, 'java');
INSERT INTO `major_skill` VALUES (00000011, 00000004, 'php');
INSERT INTO `major_skill` VALUES (00000012, 00000004, 'jsp');
INSERT INTO `major_skill` VALUES (00000013, 00000005, 'java');
INSERT INTO `major_skill` VALUES (00000014, 00000005, 'php');
INSERT INTO `major_skill` VALUES (00000015, 00000005, 'jsp');
INSERT INTO `major_skill` VALUES (00000016, 00000006, 'java');
INSERT INTO `major_skill` VALUES (00000017, 00000006, 'php');
INSERT INTO `major_skill` VALUES (00000018, 00000006, 'jsp');
INSERT INTO `major_skill` VALUES (00000019, 00000007, 'java');
INSERT INTO `major_skill` VALUES (00000020, 00000007, 'php');
INSERT INTO `major_skill` VALUES (00000021, 00000007, 'jsp');
INSERT INTO `major_skill` VALUES (00000022, 00000008, 'java');
INSERT INTO `major_skill` VALUES (00000023, 00000008, 'php');
INSERT INTO `major_skill` VALUES (00000024, 00000008, 'jsp');
INSERT INTO `major_skill` VALUES (00000025, 00000009, 'java');
INSERT INTO `major_skill` VALUES (00000026, 00000009, 'php');
INSERT INTO `major_skill` VALUES (00000027, 00000009, 'jsp');
INSERT INTO `major_skill` VALUES (00000028, 00000010, 'java');
INSERT INTO `major_skill` VALUES (00000029, 00000010, 'php');
INSERT INTO `major_skill` VALUES (00000030, 00000010, 'jsp');
INSERT INTO `major_skill` VALUES (00000031, 00000011, 'java');
INSERT INTO `major_skill` VALUES (00000032, 00000011, 'php');
INSERT INTO `major_skill` VALUES (00000033, 00000011, 'jsp');
INSERT INTO `major_skill` VALUES (00000034, 00000012, 'java');
INSERT INTO `major_skill` VALUES (00000035, 00000012, 'php');
INSERT INTO `major_skill` VALUES (00000036, 00000012, 'jsp');
INSERT INTO `major_skill` VALUES (00000037, 00000013, 'java');
INSERT INTO `major_skill` VALUES (00000038, 00000013, 'php');
INSERT INTO `major_skill` VALUES (00000039, 00000013, 'jsp');
INSERT INTO `major_skill` VALUES (00000040, 00000014, 'java');
INSERT INTO `major_skill` VALUES (00000041, 00000014, 'php');
INSERT INTO `major_skill` VALUES (00000042, 00000014, 'jsp');
INSERT INTO `major_skill` VALUES (00000043, 00000015, 'java');
INSERT INTO `major_skill` VALUES (00000044, 00000015, 'php');
INSERT INTO `major_skill` VALUES (00000045, 00000015, 'jsp');
INSERT INTO `major_skill` VALUES (00000046, 00000016, 'java');
INSERT INTO `major_skill` VALUES (00000047, 00000016, 'php');
INSERT INTO `major_skill` VALUES (00000048, 00000016, 'jsp');
INSERT INTO `major_skill` VALUES (00000049, 00000017, 'java');
INSERT INTO `major_skill` VALUES (00000050, 00000017, 'php');
INSERT INTO `major_skill` VALUES (00000051, 00000017, 'jsp');
INSERT INTO `major_skill` VALUES (00000052, 00000018, 'java');
INSERT INTO `major_skill` VALUES (00000053, 00000018, 'php');
INSERT INTO `major_skill` VALUES (00000054, 00000018, 'java');
INSERT INTO `major_skill` VALUES (00000055, 00000032, '1');
INSERT INTO `major_skill` VALUES (00000056, 00000032, '1');
INSERT INTO `major_skill` VALUES (00000057, 00000032, '1');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `pid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `cid` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `workplace` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `classification` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salary` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `eduRequest` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `experience` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `statement` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `browsingnumber` int(8) DEFAULT NULL,
  `releasedate` date DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `sys_pid_to_c_id`(`pid`) USING BTREE,
  INDEX `position_ibfk_1`(`cid`) USING BTREE,
  CONSTRAINT `position_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `company` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (00000001, 00000001, '测试员', '广州', '软件', '测试', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-11', '1', '2016-07-23');
INSERT INTO `position` VALUES (00000002, 00000001, '测试工程师', '深圳', '软件', '测试', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-27', '2', '2016-07-21');
INSERT INTO `position` VALUES (00000003, 00000001, 'php开发', '广州', '软件', '研发', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-11', '2', '2016-07-23');
INSERT INTO `position` VALUES (00000004, 00000001, 'java开发', '广州', '软件', '开发', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-11', '1', '2016-07-23');
INSERT INTO `position` VALUES (00000005, 00000001, '前端工程师', '广州', '软件', '研发', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-11', '2', '2016-07-23');
INSERT INTO `position` VALUES (00000006, 00000001, 'c++开发', '广州', '软件', '开发', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-11', '1', '2016-07-23');
INSERT INTO `position` VALUES (00000007, 00000001, 'ios开发', '深圳', '软件', '开发', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-27', '1', '2016-07-21');
INSERT INTO `position` VALUES (00000008, 00000001, 'c#开发', '深圳', '软件', '开发', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-27', '2', '2016-07-21');
INSERT INTO `position` VALUES (00000009, 00000001, 'Android开发', '广州', '软件', '开发', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-11', '2', '2016-07-23');
INSERT INTO `position` VALUES (00000010, 00000001, 'UI设计', '广州', '软件', '开发', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-11', '2', '2016-07-23');
INSERT INTO `position` VALUES (00000011, 00000001, '财务管理', '深圳', '软件', '财务', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-27', '1', '2016-07-21');
INSERT INTO `position` VALUES (00000012, 00000001, '财务总监', '深圳', '软件', '财务', '1', '1', '1', '运维开发', '15016291381@163.com', 1233, '2016-07-27', '1', '2016-07-21');
INSERT INTO `position` VALUES (00000013, 00000003, '人力招聘', '广州', '区域销售经理/主管', '财务', '2', '1', '1', '运维开发', '15016291381@163.com', 546, '2016-08-26', '1', '2016-08-16');
INSERT INTO `position` VALUES (00000014, 00000003, '测试员', '广州', '技术或工艺设计经理', '开发', '1', '1', '1', '运维开发', '15016291381@163.com', 456, '2016-09-01', '1', '2016-09-14');
INSERT INTO `position` VALUES (00000015, 00000003, '测试工程师', '广州', '网络/在线销售', '开发', '1', '2', '1', '运维开发', '15016291381@163.com', 456, '2016-09-01', '1', '2016-09-04');
INSERT INTO `position` VALUES (00000016, 00000003, 'php开发', '广州', '财务总监', '开发', '2', '2', '2', '运维开发', '15016291381@163.com', 456, '2016-09-01', '1', '2016-09-03');
INSERT INTO `position` VALUES (00000017, 00000003, 'java开发', '广州', '材料工程师', '开发', '1', '1', '1', '运维开发', '15016291381@163.com', 7, '2016-09-01', '2', '2016-09-14');
INSERT INTO `position` VALUES (00000018, 00000003, '前端工程师', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 4, '2016-08-26', '1', '2016-08-16');
INSERT INTO `position` VALUES (00000019, 00000003, 'c++开发', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 44, '2016-08-26', '2', '2016-08-16');
INSERT INTO `position` VALUES (00000020, 00000003, 'ios开发', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 8, '2016-08-26', '1', '2016-08-16');
INSERT INTO `position` VALUES (00000021, 00000003, 'c#开发', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 6, '2016-08-26', '1', '2016-08-16');
INSERT INTO `position` VALUES (00000022, 00000003, 'Android开发', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 4, '2016-08-26', '2', '2016-08-16');
INSERT INTO `position` VALUES (00000023, 00000003, 'UI设计', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 4, '2016-08-26', '1', '2016-08-16');
INSERT INTO `position` VALUES (00000024, 00000003, '财务管理', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 8, '2016-08-26', '2', '2016-08-16');
INSERT INTO `position` VALUES (00000025, 00000003, '财务总监', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 4, '2016-08-26', '1', '2016-08-16');
INSERT INTO `position` VALUES (00000026, 00000003, '实验室管理员', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 3, '2016-08-26', '2', '2016-08-16');
INSERT INTO `position` VALUES (00000027, 00000003, '招生委员', '广州', '区域销售经理/主管', '开发', '2', '1', '1', '运维开发', '15016291381@163.com', 1, '2016-08-26', '1', '2016-08-16');
INSERT INTO `position` VALUES (00000028, 00000003, '清洁工', '重庆', '高级软件工程师', '开发', '1', '1', '1', 'java公司', '15016291381@163.com', 7, '2016-09-01', '2', '2016-09-25');
INSERT INTO `position` VALUES (00000029, 00000004, '实验室管理员', '广州', '高级软件工程师', '教育部', '4', '3', '3', '负责实验室管理', '123456@qq.com', 1, '2016-09-02', '1', '2016-09-29');
INSERT INTO `position` VALUES (00000030, 00000004, '招生委员', '广州', '人力资源总监', '人事部', '1', '2', '3', '负责学校招生信息', '123456@qq.com', 1, '2016-09-02', '1', '2016-09-24');
INSERT INTO `position` VALUES (00000031, 00000004, '清洁工', '广州', '后勤/总务', '后勤部', '1', '1', '6', '负责清洁工作', '123456@qq.com', 0, '2016-09-02', '2', '2016-09-14');
INSERT INTO `position` VALUES (00000032, 00000002, '清洁工', '重庆', '高级软件工程师', '开发', '1', '1', '1', 'java公司', '15016291381@163.com', 7, '2016-09-01', '1', '2016-09-25');
INSERT INTO `position` VALUES (00000033, 00000002, '实验室管理员', '广州', '高级软件工程师', '教育部', '4', '3', '3', '负责实验室管理', '123456@qq.com', 1, '2016-09-02', '1', '2016-09-29');
INSERT INTO `position` VALUES (00000034, 00000002, '招生委员', '广州', '人力资源总监', '人事部', '1', '2', '3', '负责学校招生信息', '123456@qq.com', 1, '2016-09-02', '1', '2016-09-24');
INSERT INTO `position` VALUES (00000085, 00000004, '搬运工', '广州', '集装箱业务', '搬运', '1', '1', '1', '搬运货物', '123456@qq.com', 0, '2016-09-02', '1', '2016-09-12');
INSERT INTO `position` VALUES (00000086, 00000005, '前端工程师', '北京', '软件工程师', '项目研发部', '4', '1', '1', '11\r\nsdfsdf\r\nafafa', '2919138769@qq.com', 0, '2020-03-25', '1', '2020-04-18');

-- ----------------------------
-- Table structure for position_resume
-- ----------------------------
DROP TABLE IF EXISTS `position_resume`;
CREATE TABLE `position_resume`  (
  `pid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `deliverydate` date NOT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `pr_pid_to_c_id`(`pid`) USING BTREE,
  INDEX `pr_rid_to_u_id`(`uid`) USING BTREE,
  CONSTRAINT `position_resume_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `position_resume_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `position` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position_resume
-- ----------------------------
INSERT INTO `position_resume` VALUES (00000002, 00000002, '2016-08-18', 's');
INSERT INTO `position_resume` VALUES (00000002, 00000004, '2016-08-27', 'w');
INSERT INTO `position_resume` VALUES (00000002, 00000006, '2016-08-25', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000014, '2016-08-10', 'r');
INSERT INTO `position_resume` VALUES (00000002, 00000001, '2016-08-26', 'w');
INSERT INTO `position_resume` VALUES (00000009, 00000010, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000002, 00000009, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000002, 00000005, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000004, 00000007, '2016-08-26', 'w');
INSERT INTO `position_resume` VALUES (00000002, 00000008, '2016-08-26', 'w');
INSERT INTO `position_resume` VALUES (00000002, 00000003, '2016-08-26', 'w');
INSERT INTO `position_resume` VALUES (00000010, 00000013, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000010, 00000015, '2016-08-26', 'w');
INSERT INTO `position_resume` VALUES (00000005, 00000016, '2016-08-26', 'r');
INSERT INTO `position_resume` VALUES (00000003, 00000011, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000005, 00000012, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000001, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000002, '2016-08-18', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000004, '2016-08-27', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000003, '2016-08-26', 'r');
INSERT INTO `position_resume` VALUES (00000013, 00000009, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000005, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000006, '2016-08-25', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000007, '2016-08-26', 'w');
INSERT INTO `position_resume` VALUES (00000013, 00000008, '2016-08-26', 'w');
INSERT INTO `position_resume` VALUES (00000013, 00000010, '2016-08-26', 'w');
INSERT INTO `position_resume` VALUES (00000013, 00000011, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000012, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000013, 00000013, '2016-08-26', 's');
INSERT INTO `position_resume` VALUES (00000001, 00000014, '2016-08-10', 'w');
INSERT INTO `position_resume` VALUES (00000001, 00000015, '2016-08-26', 'w');
INSERT INTO `position_resume` VALUES (00000001, 00000016, '2016-08-26', 'r');
INSERT INTO `position_resume` VALUES (00000029, 00000018, '2016-09-02', 's');
INSERT INTO `position_resume` VALUES (00000001, 00000018, '2016-09-02', 's');
INSERT INTO `position_resume` VALUES (00000029, 00000032, '2020-03-22', 'e');
INSERT INTO `position_resume` VALUES (00000086, 00000032, '2020-03-30', 'e');

-- ----------------------------
-- Table structure for practical_experience
-- ----------------------------
DROP TABLE IF EXISTS `practical_experience`;
CREATE TABLE `practical_experience`  (
  `peid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `uid` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `company` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stime` date DEFAULT NULL,
  `etime` date DEFAULT NULL,
  PRIMARY KEY (`peid`) USING BTREE,
  INDEX `sys_peid`(`peid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `pratical_experience_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of practical_experience
-- ----------------------------
INSERT INTO `practical_experience` VALUES (00000001, 00000001, '阿里', '后台', '2016-08-16', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000002, 00000002, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000003, 00000003, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000004, 00000004, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000005, 00000005, '阿里', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000006, 00000006, '微软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000007, 00000007, '东软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000008, 00000008, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000009, 00000009, '阿里', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000010, 00000010, '微软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000011, 00000011, '东软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000012, 00000012, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000013, 00000013, '阿里', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000014, 00000014, '微软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000015, 00000015, '东软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000016, 00000016, '工商', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000017, 00000017, '东软', '后台', '2016-08-31', '2016-08-16');
INSERT INTO `practical_experience` VALUES (00000018, 00000018, '东软', '后台', '2016-08-31', '2016-08-31');
INSERT INTO `practical_experience` VALUES (00000019, 00000032, '??', 'sdf', '2020-03-12', '2020-03-12');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `pid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `uid` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `project` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stime` date DEFAULT NULL,
  `etime` date DEFAULT NULL,
  `statement` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `sys_pid`(`pid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (00000001, 00000001, '推箱子', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000002, 00000001, '图片管理', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000003, 00000002, '连连看', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000004, 00000002, '扫雷', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000005, 00000003, '推箱子', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000006, 00000003, '图片管理', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000007, 00000004, '连连看', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000008, 00000004, '扫雷', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000009, 00000005, '推箱子', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000010, 00000005, '图片管理', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000011, 00000006, '连连看', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000012, 00000006, '扫雷', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000013, 00000007, '推箱子', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000014, 00000007, '图片管理', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000015, 00000008, '连连看', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000016, 00000008, '扫雷', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000017, 00000009, '推箱子', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000018, 00000009, '图片管理', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000019, 00000010, '连连看', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000020, 00000010, '扫雷', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000021, 00000011, '推箱子', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000022, 00000011, '图片管理', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000023, 00000012, '连连看', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000024, 00000012, '扫雷', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000025, 00000013, '推箱子', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000026, 00000013, '图片管理', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000027, 00000014, '连连看', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000028, 00000014, '扫雷', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000029, 00000015, '推箱子', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000030, 00000015, '图片管理', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000031, 00000016, '连连看', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000032, 00000016, '扫雷', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000033, 00000017, '推箱子', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000034, 00000017, '图片管理', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000035, 00000018, '连连看', '后台', '2016-08-08', '2016-08-16', '123');
INSERT INTO `project` VALUES (00000036, 00000018, '扫雷', '前端', '2016-08-16', '2016-08-18', '123');
INSERT INTO `project` VALUES (00000037, 00000032, '111', '111', '2020-03-18', '2020-03-17', '啊啊啊啊');
INSERT INTO `project` VALUES (00000038, 00000032, '11', 'sdfs', '2020-03-17', '2020-03-08', '?????');

-- ----------------------------
-- Table structure for qquser
-- ----------------------------
DROP TABLE IF EXISTS `qquser`;
CREATE TABLE `qquser`  (
  `openId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(8) NOT NULL,
  `type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`openId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qquser
-- ----------------------------
INSERT INTO `qquser` VALUES ('B808C3D27C40D253E8F8CE086633B39F', 28, '0');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0-男 \r\n1-女\r\n 2-其他',
  `nativePlace` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `education` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workYear` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idCard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mail` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `personPic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `introduction` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `positionApplied` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `exceptedCity` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `exceptedSalary` double(10, 2) DEFAULT NULL,
  `postscript` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `resume_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (00000003, '詹三', '男', '广州', '1991-08-26', '3', '3', '13923039420', '441542455632326532', '601647957@qq.com', '天津', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '测试工程师', '天津', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000002, '张违', '男', '广州', '1991-08-26', '4', '2', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000004, '铝管', '男', '广州', '1986-09-01', '2', '2', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000005, '温地', '女', '广州', '1991-08-26', '2', '4', '13923039420', '441542455632326532', '601647957@qq.com', '上海', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '前端工程师', '上海', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000006, '张小', '女', '广州', '1991-08-14', '2', '2', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000007, '张凡', '男', '广州', '1991-08-26', '2', '5', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '前端工程师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000008, '赵高', '男', '广州', '1991-08-26', '1', '2', '13923039420', '441542455632326532', '601647957@qq.com', '深圳', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '前端工程师', '深圳', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000009, '乔峰', '男', '广州', '1991-08-26', '2', '2', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000010, '碧瑶', '女', '广州', '1991-08-26', '2', '3', '13923039420', '441542455632326532', '601647957@qq.com', '梅州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '前端工程师', '梅州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000011, '雪琪', '女', '广州', '1991-08-26', '4', '1', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000012, '叶帆', '男', '广州', '1991-08-26', '3', '1', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'php工程师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000013, '刘迪', '女', '广州', '1991-08-26', '2', '3', '13923039420', '441542455632326532', '601647957@qq.com', '天津', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '天津', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000014, '刘德法', '男', '广州', '1991-08-26', '3', '4', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'php工程师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000015, '张从', '女', '广州', '1991-08-26', '1', '2', '13923039420', '441542455632326532', '601647957@qq.com', '北京', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'java工程师', '北京', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000016, '张具', '男', '广州', '1991-08-26', '4', '3', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'php工程师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000001, '张小凡', '男', '广州', '1991-08-26', '4', '1', '13923039420', '441542455632326532', '601647957@qq.com', '广州', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', '厨师', '广州', 8965.00, '我就是我颜色不一样的烟火');
INSERT INTO `resume` VALUES (00000017, '习近平', '男', '北京', '1974-06-06', '2', '3', '13515151515', '545646456546', '60164795467@qq.com', '哈尔滨', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我是主席，我怕谁', '主席', '北京', 546.00, '色不一样的烟火');
INSERT INTO `resume` VALUES (00000018, '邓小平', '男', '北京', '2016-09-12', '2', '3', '13515151515', '545646456546', '60164795467@qq.com', '哈尔滨', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '我就是我颜色不一样的烟火', 'php工程师', '北京', 4534.00, '色不一样的烟火');
INSERT INTO `resume` VALUES (00000032, 'zhang3', '男', 'sfdfV?sdf?', '2020-03-10', '1', '1', '15934462135', '121212', '1178452896@qq.com', '??', '6f3e37cf-95a9-4fbc-95ba-4e248f24b59d.JPG', '哈哈哈', '1211', '??', 111.00, '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mail` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `registerTime` date DEFAULT NULL,
  `sno` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学号',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (00000001, '123', '123', '3', '1233', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000002, '123', '123', '3', '1234', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000003, '123', '123', '3', '1235', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000004, '123', '123', '3', '1236', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000005, '123', '123', '3', '1237', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000006, '123', '123', '3', '1238', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000007, '123', '123', '3', '1239', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000008, '123', '123', '3', '12310', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000009, '123', '123', '3', '12311', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000010, '123', '123', '3', '12312', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000011, '123', '123', '3', '12313', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000012, '123', '123', '3', '12314', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000013, '123', '123', '3', '12315', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000014, '123', '123', '3', '12316', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000015, '123', '123', '3', '12317', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000016, '123', '123', '3', '12318', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000017, '123', '123', '3', '12319', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000018, '123', '123456', '3', '123456@qq.com', '123', '2016-08-01', NULL);
INSERT INTO `user` VALUES (00000028, NULL, '123456', '2', '601647957@qq.com', 'baa3f3f1a81c8503eb31726846b96478', '2016-09-02', NULL);
INSERT INTO `user` VALUES (00000032, NULL, 'w111111', '3', '1178452896@qq.com', '0be264a74f780e42aeaa7302165ff4fc', '2020-03-21', '1111111111');

SET FOREIGN_KEY_CHECKS = 1;
