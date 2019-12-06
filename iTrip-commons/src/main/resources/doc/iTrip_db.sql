-- 创建数据库itrip_db
DROP DATABASE IF EXISTS itrip_db;
CREATE DATABASE itrip_db CHARACTER SET 'utf8mb4';
USE itrip_db;

-- 创建用户表itrip_user
DROP TABLE IF EXISTS itrip_user;
CREATE TABLE itrip_user (
  user_id BIGINT(15) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  userCode VARCHAR(255) NOT NULL COMMENT '用户登录名称',
  userPassword VARCHAR(255) NOT NULL COMMENT '用户登录密码',
  email VARCHAR(255) NOT NULL COMMENT '用户电子邮箱',
  cellphone VARCHAR(255) NOT NULL COMMENT '用户手机',
  userType INT(10) NOT NULL COMMENT '用户类型',
  flatID BIGINT(20) NOT NULL COMMENT '平台 ID（根据不同登录用户，进行相应存入：自注册用户主键 ID、微信 ID、QQID、微博 ID）',
  userName VARCHAR(255) NOT NULL COMMENT '用户真实姓名',
  weChat VARCHAR(255) DEFAULT NULL COMMENT '微信号',
  QQ VARCHAR(255) DEFAULT NULL COMMENT 'QQ号',
  weibo VARCHAR(255) DEFAULT NULL COMMENT '微博号',
  baidu VARCHAR(255) DEFAULT NULL COMMENT '百度账号',
  creationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  createdBy BIGINT(15) NOT NULL COMMENT '创建人',
  modifyDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  modifiedBy BIGINT(15) NOT NULL COMMENT '修改人',
  activated INT(2) NOT NULL COMMENT '是否激活(0:未激活 1:激活)',
  PRIMARY KEY (user_id)
) ENGINE=INNODB CHARSET=utf8mb4 COMMENT='用户信息表'

-- 创建酒店表itrip_hotel
DROP TABLE IF EXISTS itrip_hotel;
CREATE TABLE itrip_hotel (
  hotel_id BIGINT(12) NOT NULL AUTO_INCREMENT COMMENT '酒店主键',
  hotelName VARCHAR(255) NOT NULL COMMENT '酒店名称',
  countryId BIGINT(10) NOT NULL COMMENT '国家ID',
  provinceId BIGINT(10) NOT NULL COMMENT '省份ID',
  cityId BIGINT(10) NOT NULL COMMENT '市ID',
  details TEXT COMMENT '酒店描述',
  facilities TEXT COMMENT '酒店设施',
  hotelPolicy TEXT COMMENT '酒店政策',
  hotelType INT(10) NOT NULL COMMENT '酒店类型',
  hotelLevel INT(10) NOT NULL COMMENT '酒店级别',
  isGroupPurchase INT(10) NOT NULL COMMENT '是否团购(0:不支持 1:支持)',
  creationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  createdBy BIGINT(12) NOT NULL COMMENT '创建人',
  modifyDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  modifiedBy BIGINT(12) NOT NULL COMMENT '修改人',
  PRIMARY KEY (hotel_id)
) ENGINE=INNODB CHARSET=utf8mb4 COMMENT='酒店信息表'


DROP TABLE IF EXISTS itrip_hotel_room;
CREATE TABLE itrip_hotel_room (
  hotel_room_id BIGINT(12) NOT NULL AUTO_INCREMENT COMMENT '房间 ID',
  hotelId BIGINT(12) NOT NULL COMMENT '酒店 ID',
  roomTitle VARCHAR(255) NOT NULL COMMENT '房间标题',
  roomPrice DECIMAL(10,0) NOT NULL COMMENT '房间价格',
  roomBedTypeId BIGINT(10) NOT NULL COMMENT '房间床型',
  isHavingBreakfast INT(2) NOT NULL COMMENT '是否含早餐',
  payType INT(10) NOT NULL COMMENT '支付类型',
  satisfaction DECIMAL(12,2) NOT NULL COMMENT '满意度',
  isBook INT(2) NOT NULL COMMENT '是否可预订',
  isCancel INT(2) NOT NULL COMMENT '是否可取消',
  isTimelyResponse INT(2) NOT NULL COMMENT '是否及时确认',
  creationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  createdBy BIGINT(12) NOT NULL COMMENT '创建人',
  modifyDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  modifiedBy BIGINT(12) NOT NULL COMMENT '修改人',
  PRIMARY KEY (hotel_room_id)
) ENGINE=INNODB CHARSET=utf8mb4 COMMENT='酒店房间表'


DROP TABLE IF EXISTS itrip_area_dic;
CREATE TABLE itrip_area_dic (
  area_dic_id BIGINT(12) NOT NULL AUTO_INCREMENT COMMENT '区域主键',
  areaName VARCHAR(255) NOT NULL COMMENT '区域名称',
  areaNo VARCHAR(255) NOT NULL COMMENT '区域编号',
  parent BIGINT(12) NOT NULL COMMENT '父级区域 ID',
  isActivated INT(2) NOT NULL COMMENT '是否激活',
  isTradingArea INT(2) NOT NULL COMMENT '是否是商圈',
  isHot INT(2) NOT NULL COMMENT '是否是热门城市',
  `level` INT(2) NOT NULL COMMENT '区域级别(0:国家级 1:省',
  isChina INT(2) NOT NULL COMMENT '1:国内 2：国外',
  pinyin VARCHAR(255) NOT NULL COMMENT '区域名称拼音',
  creationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  createdBy BIGINT(12) NOT NULL COMMENT '创建人',
  modifyDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  modifiedBy BIGINT(12) NOT NULL COMMENT '修改人',
  PRIMARY KEY (area_dic_id)
) ENGINE=INNODB CHARSET=utf8mb4 COMMENT='区域字典信息'

DROP TABLE IF EXISTS itrip_image;
CREATE TABLE `itrip_image` (
  `image_id` BIGINT(12) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `image_type` VARCHAR(255) NOT NULL COMMENT '图片类型(0:酒店图片 1:房',
  `targetId` BIGINT(12) NOT NULL COMMENT '关联id',
  `position` INT(10) NOT NULL COMMENT '图片上传顺序位置',
  `imgUrl` VARCHAR(255) NOT NULL COMMENT '图片地址',
  creationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  createdBy BIGINT(12) NOT NULL COMMENT '创建人',
  modifyDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  modifiedBy BIGINT(12) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`image_id`)
) ENGINE=INNODB CHARSET=utf8mb4 COMMENT='图片信息表'



DROP TABLE IF EXISTS itrip_hotel_order;
CREATE TABLE `itrip_hotel_order` (
  `hotel_order_id` BIGINT(12) NOT NULL AUTO_INCREMENT COMMENT '酒店订单主键',
  `userId` BIGINT(12) NOT NULL COMMENT '用户Id',
  `orderType` INT(10) NOT NULL COMMENT '订单类型',
  `orderNo` VARCHAR(255) NOT NULL COMMENT '订单编号',
  `tradeNo` VARCHAR(255) NOT NULL COMMENT '交易编号',
  `hotelId` BIGINT(12) NOT NULL COMMENT '酒店ID',
  `hotelName` VARCHAR(255) NOT NULL COMMENT '酒店名称',
  `roomId` BIGINT(12) NOT NULL COMMENT '房间ID',
  `count` INT(10) NOT NULL COMMENT '房间数量',
  `bookingDays` INT(10) NOT NULL COMMENT '预订天数',
  `checkInDate` DATETIME NOT NULL COMMENT '入住日期',
  `checkOutDate` DATETIME NOT NULL COMMENT '退房日期',
  `orderStatus` INT(2) NOT NULL COMMENT '订单状态',
  `payAmount` DECIMAL(10,0) NOT NULL COMMENT '订单金额',
  `payType` INT(2) NOT NULL COMMENT '订单支付类型',
  `noticePhone` VARCHAR(255) NOT NULL COMMENT '通知手机号',
  `noticeEmail` VARCHAR(255) NOT NULL COMMENT '通知邮箱',
  `specialRequirement` TEXT COMMENT '特殊需求',
  `isNeedInvoice` INT(2) DEFAULT NULL COMMENT '是否需要发票',
  `invoiceType` INT(2) DEFAULT NULL COMMENT '发票类型',
  `invoiceHead` VARCHAR(255) DEFAULT NULL COMMENT '发票抬头',
  `linkUserName` VARCHAR(255) NOT NULL COMMENT '联系人姓名',
  `bookType` INT(2) NOT NULL COMMENT '预订类型',
  creationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  createdBy BIGINT(12) NOT NULL COMMENT '创建人',
  modifyDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  modifiedBy BIGINT(12) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`hotel_order_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COMMENT='订单信息表'
