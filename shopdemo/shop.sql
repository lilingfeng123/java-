/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3307
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 12/07/2019 13:10:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `AdminID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Password` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`AdminID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('llf', '123456');

-- ----------------------------
-- Table structure for tb_buyinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_buyinfo`;
CREATE TABLE `tb_buyinfo`  (
  `BuyID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `GoodsID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Num` int(32) NULL DEFAULT NULL,
  `OrderID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `SumPrice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MemberID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`BuyID`) USING BTREE,
  INDEX `four`(`MemberID`) USING BTREE,
  CONSTRAINT `four` FOREIGN KEY (`MemberID`) REFERENCES `tb_members` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_car
-- ----------------------------
DROP TABLE IF EXISTS `tb_car`;
CREATE TABLE `tb_car`  (
  `c_s_id` int(11) NOT NULL,
  `c_a_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `c_id` int(11) NOT NULL,
  `c_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `c_price` double(10, 2) NULL DEFAULT NULL,
  `c_num` int(10) NULL DEFAULT NULL,
  `c_weight` double(10, 2) NULL DEFAULT NULL,
  `c_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `oneone`(`c_s_id`) USING BTREE,
  INDEX `twotwo`(`c_a_id`) USING BTREE,
  CONSTRAINT `oneone` FOREIGN KEY (`c_s_id`) REFERENCES `tb_shop` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `twotwo` FOREIGN KEY (`c_a_id`) REFERENCES `tb_admin` (`AdminID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_class
-- ----------------------------
DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class`  (
  `ClassID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CategoryUrl` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ClassID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_goodsinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_goodsinfo`;
CREATE TABLE `tb_goodsinfo`  (
  `GoodsID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ClassID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `GoodsIntroduce` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `GoodsBrand` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `GoodsUnit` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `GoodsWeight` float(16, 0) NULL DEFAULT NULL,
  `GoodsUrl` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `MarketPrice` float(16, 0) NULL DEFAULT NULL,
  `MemberPrice` float(16, 0) NULL DEFAULT NULL,
  `Isrefinement` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IsHot` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `AddDate` datetime NULL DEFAULT NULL,
  `IsDiscount` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`GoodsID`) USING BTREE,
  INDEX `one`(`ClassID`) USING BTREE,
  CONSTRAINT `one` FOREIGN KEY (`ClassID`) REFERENCES `tb_class` (`ClassID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_image`;
CREATE TABLE `tb_image`  (
  `ImageID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ImageName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ImageUrl` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ImageID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_members
-- ----------------------------
DROP TABLE IF EXISTS `tb_members`;
CREATE TABLE `tb_members`  (
  `MemberID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Sex` bit(1) NULL DEFAULT NULL,
  `Password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TrueName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Phonecode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Emails` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `City` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Address` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PostCode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `AdvancePayment` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LoadDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`MemberID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderinfo`;
CREATE TABLE `tb_orderinfo`  (
  `OrderID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `OrderDate` datetime NULL DEFAULT NULL,
  `GoodsFee` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TotalPrice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ShipFee` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ShipType` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `MemberID` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ReceiverName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ReceiverPhone` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IsConfirm` bit(1) NULL DEFAULT NULL,
  `IsPayment` bit(1) NULL DEFAULT NULL,
  `IsConsignment` bit(1) NULL DEFAULT NULL,
  `IsPigeonhole` bit(1) NULL DEFAULT NULL,
  `ReceiverPostCode` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ReceiverAddress` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ReceiverEmails` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_paytype
-- ----------------------------
DROP TABLE IF EXISTS `tb_paytype`;
CREATE TABLE `tb_paytype`  (
  `PayID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `PayWay` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PayID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop`  (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `s_price` double(10, 2) NULL DEFAULT NULL,
  `s_num` int(10) NULL DEFAULT NULL,
  `s_weight` double(10, 2) NULL DEFAULT NULL,
  `s_type` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES (2, '电脑', 5000.00, 10, 100.00, '电子产品');
INSERT INTO `tb_shop` VALUES (3, '洗衣机', 2000.00, 20, 800.00, '家庭生活用品');
INSERT INTO `tb_shop` VALUES (4, '电风扇', 200.00, 80, 400.00, '家庭生活用品');
INSERT INTO `tb_shop` VALUES (5, '空调', 8000.00, 10, 1000.00, '家庭生活用品');

-- ----------------------------
-- Table structure for tb_shopcart
-- ----------------------------
DROP TABLE IF EXISTS `tb_shopcart`;
CREATE TABLE `tb_shopcart`  (
  `CartID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `GoodsID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Num` int(50) NOT NULL,
  `MemberPrice` float(50, 0) NOT NULL,
  `MarketPrice` float(16, 0) NOT NULL,
  `MemberID` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `GoodsWeig` float(16, 0) NOT NULL,
  PRIMARY KEY (`CartID`) USING BTREE,
  INDEX `two`(`GoodsID`) USING BTREE,
  INDEX `three`(`MemberID`) USING BTREE,
  CONSTRAINT `three` FOREIGN KEY (`MemberID`) REFERENCES `tb_members` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `two` FOREIGN KEY (`GoodsID`) REFERENCES `tb_class` (`ClassID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
