/*
Navicat MySQL Data Transfer

Source Server         : localhost_3308
Source Server Version : 50721
Source Host           : localhost:3308
Source Database       : dormitory_management

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-11-21 21:11:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lecture`
-- ----------------------------
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE `lecture` (
  `lecid` varchar(20) CHARACTER SET gbk NOT NULL,
  `time` date DEFAULT NULL,
  `suite` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `type` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `text` varchar(1000) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`lecid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lecture
-- ----------------------------
INSERT INTO `lecture` VALUES ('1', '2019-12-25', '01010101', '数学科学', null);

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` varchar(15) CHARACTER SET gbk NOT NULL,
  `pwd` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('001', '123456');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `roomid` varchar(10) CHARACTER SET gbk NOT NULL,
  `apar` varchar(3) CHARACTER SET gbk DEFAULT NULL,
  `unit` varchar(3) CHARACTER SET gbk DEFAULT NULL,
  `sex` varchar(4) CHARACTER SET gbk DEFAULT NULL,
  `acad` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `flag` int(1) DEFAULT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('0101010101', '01', '01', 'M', '计算机', '0');
INSERT INTO `room` VALUES ('0201010102', '02', '01', 'M', '网安', '0');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(15) CHARACTER SET gbk NOT NULL,
  `pwd` varchar(20) CHARACTER SET gbk NOT NULL,
  `name` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `sex` varchar(4) CHARACTER SET gbk DEFAULT NULL,
  `acad` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `apar` varchar(3) CHARACTER SET gbk DEFAULT NULL,
  `unit` varchar(3) CHARACTER SET gbk DEFAULT NULL,
  `roomid` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `lecid` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201928015029001', '123456', '郭飞', 'M', '计算机', null, null, null, null);
INSERT INTO `student` VALUES ('201928015028001', 'qwert', '李蓉', 'F', '计算机', null, null, null, null);
