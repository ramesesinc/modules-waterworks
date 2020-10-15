/*
 Navicat Premium Data Transfer

 Source Server         : tagbilaran_db
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost:3306
 Source Schema         : tagbilaran_waterworks3

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 27/03/2020 10:42:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_email_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_email_template`;
CREATE TABLE `sys_email_template` (
  `objid` varchar(50) NOT NULL,
  `message` mediumtext,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule`;
CREATE TABLE `sys_rule` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `salience` int(11) DEFAULT NULL,
  `effectivefrom` date DEFAULT NULL,
  `effectiveto` date DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `noloop` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_rulegroup_ruleset` (`rulegroup`,`ruleset`) USING BTREE,
  KEY `ix_ruleset` (`ruleset`) USING BTREE,
  CONSTRAINT `fk_sys_rule_rulegroup_ruleset` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`),
  CONSTRAINT `fk_sys_rule_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule` VALUES ('RUL-173a0991:1688ea323e8:-7657', 'DRAFT', 'REMOVE_DISCOUNT', 'waterworksbilling', 'summary', 'REMOVE DISCOUNT', NULL, 50000, NULL, NULL, '2019-01-27 17:42:38', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-316b7756:16d900d6052:-721d', 'DRAFT', 'PENALTY_EFFECTIVITY', 'waterworksbilling', 'initial', 'PENALTY EFFECTIVITY', NULL, 50000, NULL, NULL, '2019-10-03 13:50:23', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-316b7756:16d900d6052:-7f24', 'DRAFT', 'COMPUTE_SURCHARGE', 'waterworksbilling', 'surcharge', 'COMPUTE SURCHARGE', NULL, 50000, NULL, NULL, '2019-10-03 13:38:15', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-34fcc9d0:16348fa1256:-79da', 'APPROVED', 'DETERMINE_SCHEDULE', 'waterworksbillingschedule', 'post-initial', 'DETERMINE SCHEDULE', NULL, 100000, NULL, NULL, '2018-05-10 15:52:52', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-36e45df8:17089c57633:-7d8b', 'DEPLOYED', 'WATER_SURCHARGE', 'waterworksbilling', 'surcharge', 'WATER SURCHARGE', NULL, 50000, NULL, NULL, '2020-02-28 11:19:03', 'USR5b13925b:17066eb8fad:-7eac', 'EMN3', 1);
INSERT INTO `sys_rule` VALUES ('RUL-41d808ec:16fa2b737d3:-7a69', 'DRAFT', 'CREDIT_BALANCE_MAPPING', 'waterworksbilling', 'account-mapping', 'CREDIT_BALANCE_MAPPING', NULL, 50000, NULL, NULL, '2020-01-14 15:57:05', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-43899399:1692d800670:-6c33', 'APPROVED', 'DETERMINE_DISC_DUE_DATE_S04', 'waterworksbillingschedule', 'post-initial', 'DETERMINE DISC DUE DATE BATCH 4', NULL, 50000, NULL, NULL, '2019-02-27 14:33:50', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-43899399:1692d800670:-6c44', 'APPROVED', 'DETERMINE_DISC_DUE_DATE_S03', 'waterworksbillingschedule', 'post-initial', 'DETERMINE DISC DUE DATE BATCH 3', NULL, 50000, NULL, NULL, '2019-02-27 14:33:38', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-43899399:1692d800670:-6c55', 'APPROVED', 'DETERMINE_DISC_DUE_DATE_S02', 'waterworksbillingschedule', 'post-initial', 'DETERMINE DISC DUE DATE BATCH 2', NULL, 50000, NULL, NULL, '2019-02-27 14:33:27', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-43899399:1692d800670:-7779', 'APPROVED', 'DETERMINE_READING_DATE_S04', 'waterworksbillingschedule', 'post-initial', 'DETERMINE_READING_DATE BATCH 4', NULL, 50000, NULL, NULL, '2019-02-27 14:11:15', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-43899399:1692d800670:-778a', 'APPROVED', 'DETERMINE_READING_DATE_S03', 'waterworksbillingschedule', 'post-initial', 'DETERMINE_READING_DATE BATCH 3', NULL, 50000, NULL, NULL, '2019-02-27 14:10:59', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-43899399:1692d800670:-779b', 'APPROVED', 'DETERMINE_READING_DATE_S02', 'waterworksbillingschedule', 'post-initial', 'DETERMINE_READING_DATE BATCH 2', NULL, 50000, NULL, NULL, '2019-02-27 14:10:45', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-43899399:1692d800670:-7a80', 'APPROVED', 'DETERMINE_SCHEDULE_S04', 'waterworksbillingschedule', 'post-initial', 'DETERMINE SCHEDULE BATCH 4', NULL, 100000, NULL, NULL, '2019-02-27 14:04:12', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-43899399:1692d800670:-7c21', 'APPROVED', 'DETERMINE_SCHEDULE_S02', 'waterworksbillingschedule', 'post-initial', 'DETERMINE SCHEDULE BATCH 2', NULL, 100000, NULL, NULL, '2019-02-27 14:00:17', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-43899399:1692d800670:-7cf7', 'APPROVED', 'DETERMINE_SCHEDULE_S03', 'waterworksbillingschedule', 'post-initial', 'DETERMINE SCHEDULE BATCH 3', NULL, 100000, NULL, NULL, '2019-02-27 13:57:09', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-54f2b5cd:167813a3810:-7b83', 'DEPLOYED', 'COMPUTATION_FOR_SENIOR', 'waterworkscomputation', 'initial', 'Computation consumption for SENIOR', NULL, 60000, NULL, NULL, '2018-12-06 10:07:59', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL273a1fe9:134951a1bcf:-3109', 'DEPLOYED', 'COMPUTATION_FOR_SUBDIVISION', 'waterworkscomputation', 'initial', 'Computation consumption for SUBDIVISION', NULL, 60000, NULL, NULL, '2018-11-24 17:05:12', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL273a1fe9:134951a1bcf:-31f7', 'DEPLOYED', 'COMPUTATION_FOR_INDUSTRIAL_BULK', 'waterworkscomputation', 'initial', 'Computation consumption for industrial and bulk', NULL, 50000, NULL, NULL, '2018-11-24 16:59:07', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL2ae95b31:170896138b4:-5f01', 'DEPLOYED', 'SET_DUEDATE', 'waterworksbillingschedule', 'post-initial', 'SET_DUEDATE', NULL, 35000, NULL, NULL, '2020-02-28 09:49:11', 'USR5b13925b:17066eb8fad:-7eac', 'EMN3', 1);
INSERT INTO `sys_rule` VALUES ('RUL2ae95b31:170896138b4:-611f', 'DEPLOYED', 'SET_BILLING_DUEDATE', 'waterworksbillingschedule', 'post-initial', 'SET_BILLING_DUEDATE', NULL, 38000, NULL, NULL, '2020-02-28 09:46:51', 'USR5b13925b:17066eb8fad:-7eac', 'EMN3', 1);
INSERT INTO `sys_rule` VALUES ('RUL2ae95b31:170896138b4:-643c', 'DEPLOYED', 'SET_READING_DUEDATE', 'waterworksbillingschedule', 'post-initial', 'SET_READING_DATE', NULL, 39000, NULL, NULL, '2020-02-28 09:42:41', 'USR5b13925b:17066eb8fad:-7eac', 'EMN3', 1);
INSERT INTO `sys_rule` VALUES ('RUL2ae95b31:170896138b4:-6dcb', 'DEPLOYED', 'SET_READING_DATE', 'waterworksbillingschedule', 'post-initial', 'SET_READING_DATE', NULL, 40000, NULL, NULL, '2020-02-28 09:37:42', 'USR5b13925b:17066eb8fad:-7eac', 'EMN3', 1);
INSERT INTO `sys_rule` VALUES ('RUL2ae95b31:170896138b4:-7bf8', 'DEPLOYED', 'WATER_BILLING_PERIOD_30', 'waterworksbillingschedule', 'post-initial', 'water billing schedule for 30', NULL, 50000, NULL, NULL, '2020-02-28 09:30:51', 'USR5b13925b:17066eb8fad:-7eac', 'EMN3', 1);
INSERT INTO `sys_rule` VALUES ('RUL2c46bd2e:1620eb5fe9d:-7750', 'APPROVED', 'DETERMINE_BILLING_DATES', 'waterworksbillingschedule', 'post-initial', 'DETERMINE BILLING DATES', NULL, 50000, NULL, NULL, '2018-03-10 15:09:14', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL2c46bd2e:1620eb5fe9d:-7ec5', 'APPROVED', 'DETERMINE_READING_DUE_DATE', 'waterworksbillingschedule', 'post-initial', 'DETERMINE READING DUE DATE', NULL, 50000, NULL, NULL, '2018-03-10 15:02:25', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL38ede6eb:16888143c74:-7f8c', 'DRAFT', 'COMPUTE_DISCOUNT', 'waterworksbilling', 'discount', 'compute discount', NULL, 50000, NULL, NULL, '2019-01-26 10:56:49', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL5939ba7a:16927ecacfc:-4dc9', 'DEPLOYED', 'COMPUTATION_FOR_LOT_DONOR', 'waterworkscomputation', 'initial', 'COMPUTATION_FOR_LOT_DONOR', NULL, 80000, NULL, NULL, '2019-02-26 16:34:35', 'USR26329f24:16927d6dd3f:-7caa', 'AFIEL', 1);
INSERT INTO `sys_rule` VALUES ('RUL5939ba7a:16927ecacfc:-6cc0', 'DEPLOYED', 'COMMERCIAL', 'waterworkscomputation', 'initial', 'Computation consumption for COMMERCIAL', NULL, 50000, NULL, NULL, '2019-02-26 15:34:09', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL5b2b695a:1620ec467e4:-7b26', 'APPROVED', 'DETERMINE_DUE_DATE', 'waterworksbillingschedule', 'post-initial', 'DETERMINE DUE DATE', NULL, 50000, NULL, NULL, '2018-03-10 15:23:32', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL5b2b695a:1620ec467e4:-7e9b', 'APPROVED', 'DETERMINE_DISC_DUE_DATE', 'waterworksbillingschedule', 'post-initial', 'DETERMINE DISC DUE DATE', NULL, 50000, NULL, NULL, '2018-03-10 15:21:02', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL746193b0:1684af9777d:-7390', 'DRAFT', 'WATER_BILL_REMARKS', 'waterworksbilling', 'summary', 'WATER BILL REMARKS', NULL, 50000, NULL, NULL, '2019-01-14 14:19:31', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL746193b0:1684af9777d:-760b', 'DRAFT', 'APPLY_EXCESS_PAYMENT', 'waterworksbilling', 'payment', 'APPLY EXCESS PAYMENT', NULL, 50000, NULL, NULL, '2019-01-14 14:17:09', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL746193b0:1684af9777d:-77bd', 'DRAFT', 'APPLY_PAYMENT', 'waterworksbilling', 'payment', 'APPLY PAYMENT', NULL, 50000, NULL, NULL, '2019-01-14 14:16:20', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL746193b0:1684af9777d:-7901', 'DRAFT', 'PRIOR_SALES_MAPPING', 'waterworksbilling', 'account-mapping', 'PRIOR SALES MAPPING', NULL, 50000, NULL, NULL, '2019-01-14 14:15:12', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL746193b0:1684af9777d:-7b3e', 'DRAFT', 'ARREAR_SALES_MAPPING', 'waterworksbilling', 'account-mapping', 'ARREAR SALES MAPPING', NULL, 50000, NULL, NULL, '2019-01-14 14:14:05', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL746193b0:1684af9777d:-7f28', 'DRAFT', 'CURRENT_SALES_MAPPING', 'waterworksbilling', 'account-mapping', 'CURRENT SALES MAPPING', NULL, 50000, NULL, NULL, '2019-01-14 14:11:52', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL77046b1c:1692cc75e1b:-7acb', 'APPROVED', 'S04', 'waterworksbillingschedule', 'initial', 'Batch 4: Every 22nd day of the month', NULL, 50000, NULL, NULL, '2019-02-27 11:07:38', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL77046b1c:1692cc75e1b:-7b69', 'APPROVED', 'S03', 'waterworksbillingschedule', 'initial', 'Batch 3: Every 15th day of the month', NULL, 50000, NULL, NULL, '2019-02-27 11:06:35', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL77046b1c:1692cc75e1b:-7c1d', 'APPROVED', 'S02', 'waterworksbillingschedule', 'initial', 'Batch 2: Every 8th day of the month', NULL, 50000, NULL, NULL, '2019-02-27 11:05:15', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL77046b1c:1692cc75e1b:-7d31', 'APPROVED', 'S01', 'waterworksbillingschedule', 'initial', 'Batch 1: Every 1st day of the month', NULL, 50000, NULL, NULL, '2019-02-27 11:02:21', 'USR-ADMIN', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RULa6b099d:eb1f3248b7:-75ed', 'DEPLOYED', 'COMPUTATION_FOR_COMMERCIAL', 'waterworkscomputation', 'initial', 'Computation consumption for COMMERCIAL', NULL, 50000, NULL, NULL, '2018-01-13 16:45:10', 'USR5dc62ef:160e9053989:-7fd2', 'CWD', 1);
INSERT INTO `sys_rule` VALUES ('RULa6b099d:eb1f3248b7:-7630', 'DEPLOYED', 'COMPUTATION_FOR_RESIDENTAIL', 'waterworkscomputation', 'initial', 'Computation consumption for RESIDENTIAL', NULL, 50000, NULL, NULL, '2018-01-13 16:44:48', 'USR5dc62ef:160e9053989:-7fd2', 'CWD', 1);
INSERT INTO `sys_rule` VALUES ('RULbd2aa65:17089d46f09:-7ded', 'DEPLOYED', 'SET_DUE_DATE', 'waterworksbilling', 'initial', 'SET_DUE_DATE', NULL, 50000, NULL, NULL, '2020-02-28 11:37:43', 'USR5b13925b:17066eb8fad:-7eac', 'EMN3', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_action
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_action`;
CREATE TABLE `sys_rule_action` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondef_objid` varchar(50) DEFAULT NULL,
  `actiondef_name` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_actiondef_objid` (`actiondef_objid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_action_actiondef_objid` FOREIGN KEY (`actiondef_objid`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `fk_sys_rule_action_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_action
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_action` VALUES ('RA-4222130b:1708975c319:-7ff4', 'RUL2ae95b31:170896138b4:-5f01', 'waterworks.actions.SetWaterBillingPeriod', 'set-waterworks-billing-period', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-4222130b:1708975c319:-7ff9', 'RUL2ae95b31:170896138b4:-611f', 'waterworks.actions.SetWaterBillingPeriod', 'set-waterworks-billing-period', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-4222130b:1708975c319:-7ffe', 'RUL2ae95b31:170896138b4:-643c', 'waterworks.actions.SetWaterBillingPeriod', 'set-waterworks-billing-period', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-531043eb:16fa30e5e51:-7fff', 'RUL-41d808ec:16fa2b737d3:-7a69', 'treasury.actions.SetBillItemAccount', 'set-billitem-account', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-6c2874cd:160ed01f3d2:-7fc4', 'RULa6b099d:eb1f3248b7:-75ed', 'waterworks.actions.ComputeConsumption', 'compute-consumption', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-6c2874cd:160ed01f3d2:-7fcb', 'RULa6b099d:eb1f3248b7:-7630', 'waterworks.actions.ComputeConsumption', 'compute-consumption', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7f60', 'RUL-43899399:1692d800670:-6c33', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7f67', 'RUL-43899399:1692d800670:-6c44', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7f6e', 'RUL-43899399:1692d800670:-6c55', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7f8a', 'RUL-43899399:1692d800670:-7779', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7f91', 'RUL-43899399:1692d800670:-778a', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7f98', 'RUL-43899399:1692d800670:-779b', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7f9f', 'RUL-43899399:1692d800670:-7a80', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7fa2', 'RUL-43899399:1692d800670:-7a80', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7fac', 'RUL-43899399:1692d800670:-7c21', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7faf', 'RUL-43899399:1692d800670:-7c21', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7fe0', 'RUL-43899399:1692d800670:-7cf7', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-741dcf01:1692d772ea2:-7fe3', 'RUL-43899399:1692d800670:-7cf7', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-7fd7225d:1692ca418ad:-7fe5', 'RUL77046b1c:1692cc75e1b:-7acb', 'treasury.actions.AddVarInteger', 'add-var-integer', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-7fd7225d:1692ca418ad:-7fea', 'RUL77046b1c:1692cc75e1b:-7b69', 'treasury.actions.AddVarInteger', 'add-var-integer', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-7fd7225d:1692ca418ad:-7fef', 'RUL77046b1c:1692cc75e1b:-7c1d', 'treasury.actions.AddVarInteger', 'add-var-integer', 0);
INSERT INTO `sys_rule_action` VALUES ('RA-7fd7225d:1692ca418ad:-7ff4', 'RUL77046b1c:1692cc75e1b:-7d31', 'treasury.actions.AddVarInteger', 'add-var-integer', 0);
INSERT INTO `sys_rule_action` VALUES ('RA216faf2b:16348e519b7:-7fe5', 'RUL-34fcc9d0:16348fa1256:-79da', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RA2f280dc1:1684ad50113:-7fd6', 'RUL746193b0:1684af9777d:-7901', 'treasury.actions.SetBillItemAccount', 'set-billitem-account', 0);
INSERT INTO `sys_rule_action` VALUES ('RA2f280dc1:1684ad50113:-7fdf', 'RUL746193b0:1684af9777d:-7b3e', 'treasury.actions.SetBillItemAccount', 'set-billitem-account', 0);
INSERT INTO `sys_rule_action` VALUES ('RA6b47a6f1:16927d455fb:-7f92', 'RUL5939ba7a:16927ecacfc:-4dc9', 'waterworks.actions.ComputeConsumption', 'compute-consumption', 0);
INSERT INTO `sys_rule_action` VALUES ('RA6b47a6f1:16927d455fb:-7f9b', 'RUL5939ba7a:16927ecacfc:-6cc0', 'waterworks.actions.ComputeConsumption', 'compute-consumption', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-173a0991:1688ea323e8:-59d0', 'RUL-173a0991:1688ea323e8:-7657', 'treasury.actions.RemoveDiscountItem', 'remove-discount', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-18601aa3:168883a5d31:-7f27', 'RUL38ede6eb:16888143c74:-7f8c', 'treasury.actions.AddDiscountItem', 'add-discount-item', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-21b6b0b3:16f89ad96d4:-7ac1', 'RUL-316b7756:16d900d6052:-7f24', 'treasury.actions.AddSurchargeItem', 'add-surcharge-item', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-2ebf3254:1677d2a3a0a:-69be', 'RUL273a1fe9:134951a1bcf:-31f7', 'waterworks.actions.ComputeConsumption', 'compute-consumption', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-316b7756:16d900d6052:-70e9', 'RUL-316b7756:16d900d6052:-721d', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-34fcc9d0:16348fa1256:-7909', 'RUL-34fcc9d0:16348fa1256:-79da', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-36e45df8:17089c57633:-6f82', 'RUL-36e45df8:17089c57633:-7d8b', 'treasury.actions.AddSurchargeItem', 'add-surcharge-item', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-54f2b5cd:167813a3810:-7973', 'RUL-54f2b5cd:167813a3810:-7b83', 'waterworks.actions.ComputeConsumption', 'compute-consumption', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-6bdca530:16fa295b523:-7b93', 'RUL746193b0:1684af9777d:-760b', 'treasury.actions.AddCreditBillItem', 'add-credit-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT273a1fe9:134951a1bcf:-2162', 'RUL273a1fe9:134951a1bcf:-3109', 'waterworks.actions.ComputeConsumption', 'compute-consumption', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT2ae95b31:170896138b4:-6bb7', 'RUL2ae95b31:170896138b4:-6dcb', 'waterworks.actions.SetWaterBillingPeriod', 'set-waterworks-billing-period', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT2ae95b31:170896138b4:-7826', 'RUL2ae95b31:170896138b4:-7bf8', 'waterworks.actions.SetWaterBillingPeriod', 'set-waterworks-billing-period', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT2c46bd2e:1620eb5fe9d:-72d9', 'RUL2c46bd2e:1620eb5fe9d:-7750', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT2c46bd2e:1620eb5fe9d:-7a13', 'RUL2c46bd2e:1620eb5fe9d:-7ec5', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT5818723f:1684b4acf6c:-7df4', 'RUL746193b0:1684af9777d:-7390', 'treasury.actions.SetBillItemProperty', 'set-billitem-property', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT5b2b695a:1620ec467e4:-79b2', 'RUL5b2b695a:1620ec467e4:-7b26', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT5b2b695a:1620ec467e4:-7cb0', 'RUL5b2b695a:1620ec467e4:-7e9b', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT746193b0:1684af9777d:-74bf', 'RUL746193b0:1684af9777d:-760b', 'treasury.actions.AddCreditBillItem', 'add-excess-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT746193b0:1684af9777d:-7656', 'RUL746193b0:1684af9777d:-77bd', 'treasury.actions.ApplyPayment', 'apply-payment', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT746193b0:1684af9777d:-7bc1', 'RUL746193b0:1684af9777d:-7f28', 'treasury.actions.SetBillItemAccount', 'set-billitem-account', 0);
INSERT INTO `sys_rule_action` VALUES ('RACTbd2aa65:17089d46f09:-76a4', 'RULbd2aa65:17089d46f09:-7ded', 'treasury.actions.SetBillItemProperty', 'set-billitem-property', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_action_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_action_param`;
CREATE TABLE `sys_rule_action_param` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondefparam_objid` varchar(100) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `booleanvalue` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `expr` longtext,
  `exprtype` varchar(25) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `obj_key` varchar(50) DEFAULT NULL,
  `obj_value` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `lov` varchar(50) DEFAULT NULL,
  `rangeoption` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_var_objid` (`var_objid`) USING BTREE,
  KEY `ix_actiondefparam_objid` (`actiondefparam_objid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_action_param_actiondefparam_objid` FOREIGN KEY (`actiondefparam_objid`) REFERENCES `sys_rule_actiondef_param` (`objid`),
  CONSTRAINT `fk_sys_rule_action_param_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`),
  CONSTRAINT `fk_sys_rule_action_param_var_objid` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_action_param
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_action_param` VALUES ('RAP-4222130b:1708975c319:-7ff3', 'RA-4222130b:1708975c319:-7ff4', 'waterworks.actions.SetWaterBillingPeriod.billingperiod', NULL, NULL, 'RC-4222130b:1708975c319:-7ff6', 'BILPRD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-4222130b:1708975c319:-7ff8', 'RA-4222130b:1708975c319:-7ff9', 'waterworks.actions.SetWaterBillingPeriod.billingperiod', NULL, NULL, 'RC-4222130b:1708975c319:-7ffb', 'BILPRD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-4222130b:1708975c319:-7ffc', 'RA-4222130b:1708975c319:-7ffe', 'waterworks.actions.SetWaterBillingPeriod.billingperiod', NULL, NULL, 'RC-4222130b:1708975c319:-8000', 'BILPRD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-531043eb:16fa30e5e51:-7ffd', 'RA-531043eb:16fa30e5e51:-7fff', 'treasury.actions.SetBillItemAccount.billitem', NULL, NULL, 'RCOND-41d808ec:16fa2b737d3:-7999', 'CBAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-531043eb:16fa30e5e51:-7ffe', 'RA-531043eb:16fa30e5e51:-7fff', 'treasury.actions.SetBillItemAccount.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATER_TAX_CREDIT', 'WATER SALES - TAX CREDIT', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f5e', 'RA-741dcf01:1692d772ea2:-7f60', 'treasury.actions.AddVarDate.tag', 'discdate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f5f', 'RA-741dcf01:1692d772ea2:-7f60', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@FINDNEXTWORKDAY(  @DATE( YR ,MON,15 ), HOLIDAYS, 1 );', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f65', 'RA-741dcf01:1692d772ea2:-7f67', 'treasury.actions.AddVarDate.tag', 'discdate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f66', 'RA-741dcf01:1692d772ea2:-7f67', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@FINDNEXTWORKDAY(  @DATE( YR ,MON,7 ), HOLIDAYS, 1 );', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f6c', 'RA-741dcf01:1692d772ea2:-7f6e', 'treasury.actions.AddVarDate.tag', 'discdate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f6d', 'RA-741dcf01:1692d772ea2:-7f6e', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@FINDNEXTWORKDAY(  @DATE( YR ,MON,30 ), HOLIDAYS, 1 );', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f88', 'RA-741dcf01:1692d772ea2:-7f8a', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@FINDNEXTWORKDAY( @DAYADD( DATE , 1) , HOLIDAYS, 1)', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f89', 'RA-741dcf01:1692d772ea2:-7f8a', 'treasury.actions.AddVarDate.tag', 'readingdate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f8f', 'RA-741dcf01:1692d772ea2:-7f91', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@FINDNEXTWORKDAY( @DAYADD( DATE ,1 ) , HOLIDAYS, 1)', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f90', 'RA-741dcf01:1692d772ea2:-7f91', 'treasury.actions.AddVarDate.tag', 'readingdate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f96', 'RA-741dcf01:1692d772ea2:-7f98', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@FINDNEXTWORKDAY( @DAYADD( DATE ,1 ) ,HOLIDAYS,1 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f97', 'RA-741dcf01:1692d772ea2:-7f98', 'treasury.actions.AddVarDate.tag', 'readingdate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f9d', 'RA-741dcf01:1692d772ea2:-7f9f', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@MONTHADD( @DATE( YR ,MON,22 ),-1 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7f9e', 'RA-741dcf01:1692d772ea2:-7f9f', 'treasury.actions.AddVarDate.tag', 'fromperiod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7fa0', 'RA-741dcf01:1692d772ea2:-7fa2', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, 'def dt = @DAYADD( @DATE( YR ,MON,22),-1);\nreturn dt;', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7fa1', 'RA-741dcf01:1692d772ea2:-7fa2', 'treasury.actions.AddVarDate.tag', 'toperiod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7faa', 'RA-741dcf01:1692d772ea2:-7fac', 'treasury.actions.AddVarDate.tag', 'toperiod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7fab', 'RA-741dcf01:1692d772ea2:-7fac', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, 'def dt = @DAYADD( @DATE( YR ,MON,8),-1);\nreturn dt;', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7fad', 'RA-741dcf01:1692d772ea2:-7faf', 'treasury.actions.AddVarDate.tag', 'fromperiod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7fae', 'RA-741dcf01:1692d772ea2:-7faf', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@MONTHADD( @DATE( YR ,MON,8 ),-1 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7fde', 'RA-741dcf01:1692d772ea2:-7fe0', 'treasury.actions.AddVarDate.tag', 'toperiod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7fdf', 'RA-741dcf01:1692d772ea2:-7fe0', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, 'def dt = @DAYADD( @DATE( YR ,MON,15),-1);\nreturn dt;', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7fe1', 'RA-741dcf01:1692d772ea2:-7fe3', 'treasury.actions.AddVarDate.tag', 'fromperiod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-741dcf01:1692d772ea2:-7fe2', 'RA-741dcf01:1692d772ea2:-7fe3', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@MONTHADD( @DATE( YR ,MON,15 ),-1 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-7fd7225d:1692ca418ad:-7fe3', 'RA-7fd7225d:1692ca418ad:-7fe5', 'treasury.actions.AddVarInteger.tag', 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-7fd7225d:1692ca418ad:-7fe4', 'RA-7fd7225d:1692ca418ad:-7fe5', 'treasury.actions.AddVarInteger.value', NULL, NULL, NULL, NULL, '22', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-7fd7225d:1692ca418ad:-7fe8', 'RA-7fd7225d:1692ca418ad:-7fea', 'treasury.actions.AddVarInteger.value', NULL, NULL, NULL, NULL, '15', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-7fd7225d:1692ca418ad:-7fe9', 'RA-7fd7225d:1692ca418ad:-7fea', 'treasury.actions.AddVarInteger.tag', 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-7fd7225d:1692ca418ad:-7fed', 'RA-7fd7225d:1692ca418ad:-7fef', 'treasury.actions.AddVarInteger.tag', 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-7fd7225d:1692ca418ad:-7fee', 'RA-7fd7225d:1692ca418ad:-7fef', 'treasury.actions.AddVarInteger.value', NULL, NULL, NULL, NULL, '8', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-7fd7225d:1692ca418ad:-7ff2', 'RA-7fd7225d:1692ca418ad:-7ff4', 'treasury.actions.AddVarInteger.value', NULL, NULL, NULL, NULL, '1', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-7fd7225d:1692ca418ad:-7ff3', 'RA-7fd7225d:1692ca418ad:-7ff4', 'treasury.actions.AddVarInteger.tag', 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP2f280dc1:1684ad50113:-7fd4', 'RA2f280dc1:1684ad50113:-7fd6', 'treasury.actions.SetBillItemAccount.billitem', NULL, NULL, 'RC2f280dc1:1684ad50113:-7fdc', 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP2f280dc1:1684ad50113:-7fd5', 'RA2f280dc1:1684ad50113:-7fd6', 'treasury.actions.SetBillItemAccount.account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ITMACCT-301d72d4:15a5e00b210:-7101', 'CWD WATER BILL - ARREARS', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP2f280dc1:1684ad50113:-7fdd', 'RA2f280dc1:1684ad50113:-7fdf', 'treasury.actions.SetBillItemAccount.billitem', NULL, NULL, 'RC2f280dc1:1684ad50113:-7fe5', 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP2f280dc1:1684ad50113:-7fde', 'RA2f280dc1:1684ad50113:-7fdf', 'treasury.actions.SetBillItemAccount.account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ITMACCT-301d72d4:15a5e00b210:-7101', 'CWD WATER BILL - ARREARS', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP6b47a6f1:16927d455fb:-7f90', 'RA6b47a6f1:16927d455fb:-7f92', 'waterworks.actions.ComputeConsumption.ref', NULL, NULL, 'RC6b47a6f1:16927d455fb:-7f94', 'WC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP6b47a6f1:16927d455fb:-7f91', 'RA6b47a6f1:16927d455fb:-7f92', 'waterworks.actions.ComputeConsumption.amount', NULL, NULL, 'RCC6b47a6f1:16927d455fb:-7f93', 'VOL', '<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n    <tr>\n        <td colspan=\"3\">Use Variable: VOL</td>\n    </tr>\n    \n        <tr>\n            <th>Greater than</th>\n            <th>Less than or equal to</th>\n            <th>Formula</th>\n        </tr>\n    \n    \n    \n        <tr>\n            <td></td>\n            <td>10.00</td>\n            <td>0</td>\n        </tr>\n    \n        <tr>\n            <td>10.00</td>\n            <td>20.00</td>\n            <td>62</td>\n        </tr>\n    \n        <tr>\n            <td>20.00</td>\n            <td>30.00</td>\n            <td>((VOL-10)*7)+62</td>\n        </tr>\n    \n        <tr>\n            <td>30.00</td>\n            <td>40.00</td>\n            <td>((VOL-20)*8)+132</td>\n        </tr>\n    \n        <tr>\n            <td>40.00</td>\n            <td>50.00</td>\n            <td>((VOL-30)*11)+212</td>\n        </tr>\n    \n        <tr>\n            <td>50.00</td>\n            <td>60.00</td>\n            <td>((VOL-40)*14)+322</td>\n        </tr>\n    \n        <tr>\n            <td>60.00</td>\n            <td>70.00</td>\n            <td>((VOL-50)*17)+462</td>\n        </tr>\n    \n        <tr>\n            <td>70.00</td>\n            <td>80.00</td>\n            <td>((VOL-60)*20)+632</td>\n        </tr>\n    \n        <tr>\n            <td>80.00</td>\n            <td>90.00</td>\n            <td>((VOL-70)*23)+832</td>\n        </tr>\n    \n</table>', 'range', NULL, NULL, NULL, '[[to:10.00,value:\"0\",from:0],[to:20.00,value:\"62\",from:10.00],[to:30.00,value:\"((VOL-10)*7)+62\",from:20.00],[to:40.00,value:\"((VOL-20)*8)+132\",from:30.00],[to:50.00,value:\"((VOL-30)*11)+212\",from:40.00],[value:\"((VOL-40)*14)+322\",from:50.00,to:60.00],[from:60.00,to:70.00,value:\"((VOL-50)*17)+462\"],[from:70.00,to:80.00,value:\"((VOL-60)*20)+632\"],[from:80.00,to:90.00,value:\"((VOL-70)*23)+832\"]]', NULL, 1);
INSERT INTO `sys_rule_action_param` VALUES ('RAP6b47a6f1:16927d455fb:-7f99', 'RA6b47a6f1:16927d455fb:-7f9b', 'waterworks.actions.ComputeConsumption.ref', NULL, NULL, 'RC6b47a6f1:16927d455fb:-7f9d', 'WC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP6b47a6f1:16927d455fb:-7f9a', 'RA6b47a6f1:16927d455fb:-7f9b', 'waterworks.actions.ComputeConsumption.amount', NULL, NULL, 'RCC6b47a6f1:16927d455fb:-7f9c', 'VOL', 'VOL * 23', 'expression', NULL, NULL, NULL, '[[to:10.00,value:\"25\",from:0],[to:20.00,value:\"35\",from:10.00],[to:30.00,value:\"55\",from:20.00],[to:40.00,value:\"85\",from:30.00],[to:50.00,value:\"150\",from:40.00],[value:\"150\",from:50.00]]', NULL, 1);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-173a0991:1688ea323e8:-59c4', 'RACT-173a0991:1688ea323e8:-59d0', 'treasury.actions.RemoveDiscountItem.billitem', NULL, NULL, 'RCOND-173a0991:1688ea323e8:-5f60', 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-18601aa3:168883a5d31:-7ecc', 'RACT-18601aa3:168883a5d31:-7f27', 'treasury.actions.AddDiscountItem.amount', NULL, NULL, NULL, NULL, 'def d = new java.text.DecimalFormat(\'0.0\').format(PRIN * 0.05); \nreturn new BigDecimal( d.toString());\n', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-18601aa3:168883a5d31:-7ef8', 'RACT-18601aa3:168883a5d31:-7f27', 'treasury.actions.AddDiscountItem.account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ITMACCT-1f0bd8fa1d36d5ce0019084c0b40e06e', 'ICWS WATER BILL - DISCOUNT', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-18601aa3:168883a5d31:-7f13', 'RACT-18601aa3:168883a5d31:-7f27', 'treasury.actions.AddDiscountItem.billitem', NULL, NULL, 'RCOND38ede6eb:16888143c74:-7569', 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-21b6b0b3:16f89ad96d4:-577e', 'RACT746193b0:1684af9777d:-7bc1', 'treasury.actions.SetBillItemAccount.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATER_SALES', 'WATER SALES', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-21b6b0b3:16f89ad96d4:-5811', 'RA2f280dc1:1684ad50113:-7fdf', 'treasury.actions.SetBillItemAccount.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATER_SALES', 'WATER SALES', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-21b6b0b3:16f89ad96d4:-58a4', 'RA2f280dc1:1684ad50113:-7fd6', 'treasury.actions.SetBillItemAccount.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATER_SALES', 'WATER SALES', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-21b6b0b3:16f89ad96d4:-7a32', 'RACT-21b6b0b3:16f89ad96d4:-7ac1', 'treasury.actions.AddSurchargeItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REVITEM-66153714:140b876a648:-7ec9', 'ICWS WATER BILL PENALTY', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-21b6b0b3:16f89ad96d4:-7a8a', 'RACT-21b6b0b3:16f89ad96d4:-7ac1', 'treasury.actions.AddSurchargeItem.amount', NULL, NULL, NULL, NULL, 'AMT * 0.14', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-21b6b0b3:16f89ad96d4:-7aa9', 'RACT-21b6b0b3:16f89ad96d4:-7ac1', 'treasury.actions.AddSurchargeItem.billitem', NULL, NULL, 'RCOND-316b7756:16d900d6052:-699a', 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2ebf3254:1677d2a3a0a:-67ca', 'RACT273a1fe9:134951a1bcf:-2162', 'waterworks.actions.ComputeConsumption.amount', NULL, NULL, NULL, NULL, 'def v = VOL; \ndef cm = UNITS * 10; \ndef totals = []; \ndef n = v - cm;\nif ( n > 0) totals << (cm * 1.8);  \nelse totals << (v * 1.8); \n\nv = (n > 0 ? n : 0); n = v - cm; \nif ( n > 0) totals << (cm * 2.3);  \nelse totals << (v * 2.3); \n\nv = (n > 0 ? n : 0); n = v - cm; \nif ( n > 0) totals << (cm * 2.8);  \nelse totals << (v * 2.8); \n\nv = (n > 0 ? n : 0); n = v - cm; \nif ( n > 0) totals << (cm * 3.4);  \nelse totals << (v * 3.4); \n\nv = (n > 0 ? n : 0); \ntotals << (v > 0 ? v : 0) * 5.0; \nreturn (totals ? totals.sum{it} : 0.0); ', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2ebf3254:1677d2a3a0a:-67f5', 'RACT273a1fe9:134951a1bcf:-2162', 'waterworks.actions.ComputeConsumption.ref', NULL, NULL, 'RC-a002ae:16744d718df:-7ff1', 'WC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2ebf3254:1677d2a3a0a:-697d', 'RACT-2ebf3254:1677d2a3a0a:-69be', 'waterworks.actions.ComputeConsumption.amount', NULL, NULL, 'RCONST-694f3c0a:1677d756f0d:-7561', 'VOL', '<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n    <tr>\n        <td colspan=\"3\">Use Variable: VOL</td>\n    </tr>\n    \n        <tr>\n            <th>Greater than</th>\n            <th>Less than or equal to</th>\n            <th>Formula</th>\n        </tr>\n    \n    \n    \n        <tr>\n            <td></td>\n            <td>10.00</td>\n            <td>192</td>\n        </tr>\n    \n        <tr>\n            <td>10.00</td>\n            <td>20.00</td>\n            <td>192 + ((VOL-10) * 6.9)</td>\n        </tr>\n    \n        <tr>\n            <td>20.00</td>\n            <td>30.00</td>\n            <td>261 + ((VOL-20) * 8.4)</td>\n        </tr>\n    \n        <tr>\n            <td>30.00</td>\n            <td>40.00</td>\n            <td>345 + ((VOL-30) * 10.2)</td>\n        </tr>\n    \n        <tr>\n            <td>40.00</td>\n            <td>50.00</td>\n            <td>447 + ((VOL-40) * 12.3)</td>\n        </tr>\n    \n        <tr>\n            <td>50.00</td>\n            <td></td>\n            <td>570 + ((VOL-50) * 15)</td>\n        </tr>\n    \n</table>', 'range', NULL, NULL, NULL, '[[to:10.00,value:\"192\",from:0],[to:20.00,value:\"192 + ((VOL-10) * 6.9)\",from:10.00],[to:30.00,value:\"261 + ((VOL-20) * 8.4)\",from:20.00],[to:40.00,value:\"345 + ((VOL-30) * 10.2)\",from:30.00],[to:50.00,value:\"447 + ((VOL-40) * 12.3)\",from:40.00],[value:\"570 + ((VOL-50) * 15)\",from:50.00]]', NULL, 1);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2ebf3254:1677d2a3a0a:-69a8', 'RACT-2ebf3254:1677d2a3a0a:-69be', 'waterworks.actions.ComputeConsumption.ref', NULL, NULL, 'RCOND-694f3c0a:1677d756f0d:-7588', 'WC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2ebf3254:1677d2a3a0a:-6c1f', 'RA-6c2874cd:160ed01f3d2:-7fc4', 'waterworks.actions.ComputeConsumption.amount', NULL, NULL, 'RCONST-694f3c0a:1677d756f0d:-777a', 'VOL', '<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n    <tr>\n        <td colspan=\"3\">Use Variable: VOL</td>\n    </tr>\n    \n        <tr>\n            <th>Greater than</th>\n            <th>Less than or equal to</th>\n            <th>Formula</th>\n        </tr>\n    \n    \n    \n        <tr>\n            <td></td>\n            <td>10.00</td>\n            <td>40</td>\n        </tr>\n    \n        <tr>\n            <td>10.00</td>\n            <td>20.00</td>\n            <td>40 + ((VOL-10) * 4.60)</td>\n        </tr>\n    \n        <tr>\n            <td>20.00</td>\n            <td>30.00</td>\n            <td>86 + ((VOL-20) * 5.60)</td>\n        </tr>\n    \n        <tr>\n            <td>30.00</td>\n            <td>40.00</td>\n            <td>142 + ((VOL-30) * 6.80)</td>\n        </tr>\n    \n        <tr>\n            <td>40.00</td>\n            <td>50.00</td>\n            <td>210 + ((VOL-40) * 8.20)</td>\n        </tr>\n    \n        <tr>\n            <td>50.00</td>\n            <td></td>\n            <td>292 + ((VOL-50) * 10.00)</td>\n        </tr>\n    \n</table>', 'range', NULL, NULL, NULL, '[[to:10.00,value:\"40\",from:0],[to:20.00,value:\"40 + ((VOL-10) * 4.60)\",from:10.00],[to:30.00,value:\"86 + ((VOL-20) * 5.60)\",from:20.00],[to:40.00,value:\"142 + ((VOL-30) * 6.80)\",from:30.00],[to:50.00,value:\"210 + ((VOL-40) * 8.20)\",from:40.00],[value:\"292 + ((VOL-50) * 10.00)\",from:50.00]]', NULL, 1);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2ebf3254:1677d2a3a0a:-6c4a', 'RA-6c2874cd:160ed01f3d2:-7fc4', 'waterworks.actions.ComputeConsumption.ref', NULL, NULL, 'RCOND-694f3c0a:1677d756f0d:-77aa', 'WC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2ebf3254:1677d2a3a0a:-6ff6', 'RA-6c2874cd:160ed01f3d2:-7fcb', 'waterworks.actions.ComputeConsumption.amount', NULL, NULL, 'RCONST-2ebf3254:1677d2a3a0a:-2d16', 'VOL', '<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n    <tr>\n        <td colspan=\"3\">Use Variable: VOL</td>\n    </tr>\n    \n        <tr>\n            <th>Greater than</th>\n            <th>Less than or equal to</th>\n            <th>Formula</th>\n        </tr>\n    \n    \n    \n        <tr>\n            <td></td>\n            <td>10.00</td>\n            <td>20</td>\n        </tr>\n    \n        <tr>\n            <td>10.00</td>\n            <td>20.00</td>\n            <td>20 + ((VOL-10) * 2.30)</td>\n        </tr>\n    \n        <tr>\n            <td>20.00</td>\n            <td>30.00</td>\n            <td>43 + ((VOL-20) * 2.80)</td>\n        </tr>\n    \n        <tr>\n            <td>30.00</td>\n            <td>40.00</td>\n            <td>71 + ((VOL-30) * 3.40)</td>\n        </tr>\n    \n        <tr>\n            <td>40.00</td>\n            <td>50.00</td>\n            <td>105 + ((VOL-40) * 4.10)</td>\n        </tr>\n    \n        <tr>\n            <td>50.00</td>\n            <td></td>\n            <td>146 + ((VOL-50) * 5.00)</td>\n        </tr>\n    \n</table>', 'range', NULL, NULL, NULL, '[[to:10.00,value:\"20\",from:0],[to:20.00,value:\"20 + ((VOL-10) * 2.30)\",from:10.00],[to:30.00,value:\"43 + ((VOL-20) * 2.80)\",from:20.00],[to:40.00,value:\"71 + ((VOL-30) * 3.40)\",from:30.00],[to:50.00,value:\"105 + ((VOL-40) * 4.10)\",from:40.00],[value:\"146 + ((VOL-50) * 5.00)\",from:50.00]]', NULL, 1);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2ebf3254:1677d2a3a0a:-7006', 'RA-6c2874cd:160ed01f3d2:-7fcb', 'waterworks.actions.ComputeConsumption.ref', NULL, NULL, 'RCOND-2ebf3254:1677d2a3a0a:-2d46', 'WC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-316b7756:16d900d6052:-70c7', 'RACT-316b7756:16d900d6052:-70e9', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@DATE( 2019 , 10, 1 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-316b7756:16d900d6052:-70d9', 'RACT-316b7756:16d900d6052:-70e9', 'treasury.actions.AddVarDate.tag', 'penaltyeffectivitydate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-36e45df8:17089c57633:-6ee8', 'RACT-36e45df8:17089c57633:-6f82', 'treasury.actions.AddSurchargeItem.amount', NULL, NULL, NULL, NULL, 'AMT * 0.14', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-36e45df8:17089c57633:-6f26', 'RACT-36e45df8:17089c57633:-6f82', 'treasury.actions.AddSurchargeItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATER_SURCHARGE', 'WATER SURCHARGE', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-36e45df8:17089c57633:-6f5e', 'RACT-36e45df8:17089c57633:-6f82', 'treasury.actions.AddSurchargeItem.billitem', NULL, NULL, 'RCOND-36e45df8:17089c57633:-7aa1', 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-54f2b5cd:167813a3810:-794d', 'RACT-54f2b5cd:167813a3810:-7973', 'waterworks.actions.ComputeConsumption.amount', NULL, NULL, NULL, NULL, 'def amount = 0.0; \nif ( VOL <= 10 ) amount = 20.0;  \nelse if ( VOL <= 20 ) amount = 20.0 + ((VOL-10) * 2.30); \nelse if ( VOL <= 30 ) amount = 43.0 + ((VOL-20) * 2.80);\nelse if ( VOL <= 40 ) amount = 71.0 + ((VOL-30) * 3.40);\nelse if ( VOL <= 50 ) amount = 105.0 + ((VOL-40) * 4.10);\nelse amount = 146.0 + ((VOL-50) * 5.00); \n\ndef value = (amount > 0 ? amount * 0.80 : 0.0);\ndef bd = new java.math.BigDecimal(value.toString());\nreturn bd.setScale(1, java.math.RoundingMode.HALF_UP);', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-54f2b5cd:167813a3810:-795d', 'RACT-54f2b5cd:167813a3810:-7973', 'waterworks.actions.ComputeConsumption.ref', NULL, NULL, 'RC61484a76:167813a20bc:-7ff6', 'WC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-5ad05ee4:1684fb5b631:-6a5b', 'RACT746193b0:1684af9777d:-74bf', 'treasury.actions.AddCreditBillItem.reftype', 'waterworks_credit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-6bdca530:16fa295b523:-7b4d', 'RACT-6bdca530:16fa295b523:-7b93', 'treasury.actions.AddCreditBillItem.amount', NULL, NULL, NULL, NULL, 'AMT', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-6bdca530:16fa295b523:-7b7b', 'RACT-6bdca530:16fa295b523:-7b93', 'treasury.actions.AddCreditBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATER_ADVANCE_PAYMENT', 'WATER ADVANCE PAYMENT', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT16e4575c:1677753e95d:-7aef', 'RACT2c46bd2e:1620eb5fe9d:-7a13', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, 'def dt = VARDATE;\n(1..4).each {\n     dt =  @FINDNEXTWORKDAY(  @DAYADD(  dt, 1 ), HOLIDAYS, 1  );\n};\nreturn dt;', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT16e4575c:1677753e95d:-7b03', 'RACT2c46bd2e:1620eb5fe9d:-7a13', 'treasury.actions.AddVarDate.tag', 'readingduedate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT2ae95b31:170896138b4:-5d6d', 'RA-4222130b:1708975c319:-7ff4', 'waterworks.actions.SetWaterBillingPeriod.duedate', NULL, NULL, NULL, NULL, '@DAYADD( BILLDUEDATE , 15  )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT2ae95b31:170896138b4:-5f55', 'RA-4222130b:1708975c319:-7ff9', 'waterworks.actions.SetWaterBillingPeriod.discdate', NULL, NULL, NULL, NULL, '@DAYADD( READINGDUEDATE , 2 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT2ae95b31:170896138b4:-5fa8', 'RA-4222130b:1708975c319:-7ff9', 'waterworks.actions.SetWaterBillingPeriod.billingduedate', NULL, NULL, NULL, NULL, '@DAYADD( READINGDUEDATE , 2 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT2ae95b31:170896138b4:-624f', 'RA-4222130b:1708975c319:-7ffe', 'waterworks.actions.SetWaterBillingPeriod.readingduedate', NULL, NULL, NULL, NULL, '@DAYADD( READINGDATE , 2 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT2ae95b31:170896138b4:-6b3b', 'RACT2ae95b31:170896138b4:-6bb7', 'waterworks.actions.SetWaterBillingPeriod.readingdate', NULL, NULL, NULL, NULL, '@DAYADD( TODATE , 2 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT2ae95b31:170896138b4:-6b81', 'RACT2ae95b31:170896138b4:-6bb7', 'waterworks.actions.SetWaterBillingPeriod.billingperiod', NULL, NULL, 'RCOND2ae95b31:170896138b4:-6d78', 'BILPRD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT2ae95b31:170896138b4:-7360', 'RACT2ae95b31:170896138b4:-7826', 'waterworks.actions.SetWaterBillingPeriod.toperiod', NULL, NULL, NULL, NULL, '@MONTHEND(   @DATE(  YEAR, MON,  1 )  )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT2ae95b31:170896138b4:-77ae', 'RACT2ae95b31:170896138b4:-7826', 'waterworks.actions.SetWaterBillingPeriod.fromperiod', NULL, NULL, NULL, NULL, '@DATE(YEAR  , MON,  1 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT2ae95b31:170896138b4:-77f0', 'RACT2ae95b31:170896138b4:-7826', 'waterworks.actions.SetWaterBillingPeriod.billingperiod', NULL, NULL, 'RCOND2ae95b31:170896138b4:-7b06', 'BILPRD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT5818723f:1684b4acf6c:-7d8c', 'RACT5818723f:1684b4acf6c:-7df4', 'treasury.actions.SetBillItemProperty.value', NULL, NULL, NULL, NULL, '@DATEFORMAT( FROMDATE , \'MMM-yyyy\' ) +\' - \'+ @DATEFORMAT( TODATE , \'MMM-yyyy\' )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT5818723f:1684b4acf6c:-7dc5', 'RACT5818723f:1684b4acf6c:-7df4', 'treasury.actions.SetBillItemProperty.fieldname', 'remarks', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT5818723f:1684b4acf6c:-7de0', 'RACT5818723f:1684b4acf6c:-7df4', 'treasury.actions.SetBillItemProperty.billitem', NULL, NULL, 'RCOND746193b0:1684af9777d:-7303', 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT746193b0:1684af9777d:-740f', 'RACT746193b0:1684af9777d:-74bf', 'treasury.actions.AddCreditBillItem.amount', NULL, NULL, NULL, NULL, 'AMT', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT746193b0:1684af9777d:-74af', 'RACT746193b0:1684af9777d:-74bf', 'treasury.actions.AddCreditBillItem.account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REVITEM-677886ef:140be489c11:-7f26', 'CWD WATER BILL - ADVANCE', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT746193b0:1684af9777d:-764a', 'RACT746193b0:1684af9777d:-7656', 'treasury.actions.ApplyPayment.payment', NULL, NULL, 'RCOND746193b0:1684af9777d:-7722', 'PMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT746193b0:1684af9777d:-7b9b', 'RACT746193b0:1684af9777d:-7bc1', 'treasury.actions.SetBillItemAccount.account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REVITEM-677886ef:140be489c11:-7f5e', 'CWD WATER BILL - CURRENT', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT746193b0:1684af9777d:-7bb1', 'RACT746193b0:1684af9777d:-7bc1', 'treasury.actions.SetBillItemAccount.billitem', NULL, NULL, 'RCOND746193b0:1684af9777d:-7cee', 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-740d', 'RACT-34fcc9d0:16348fa1256:-7909', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, 'def dt = @DATE( YR, MON, 1  );\nfor( int i=1; i < DAYS; i++ ) {\n     dt = @FINDNEXTWORKDAY(  @DAYADD( dt, 1 ), HOLIDAYS, 1 );\n};\nreturn dt;', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-7421', 'RACT-34fcc9d0:16348fa1256:-7909', 'treasury.actions.AddVarDate.tag', 'toperiod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-7448', 'RA216faf2b:16348e519b7:-7fe5', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, 'def dt = @MONTHADD( @DATE( YR, MON, 1  ), -1 );\nfor( int i=1; i < DAYS; i++ ) {\n     dt = @FINDNEXTWORKDAY(  @DAYADD( dt, 1 ), HOLIDAYS, 1 );\n};\nreturn dt; ', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-745c', 'RA216faf2b:16348e519b7:-7fe5', 'treasury.actions.AddVarDate.tag', 'fromperiod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-7827', 'RACT2c46bd2e:1620eb5fe9d:-72d9', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, 'return  VARDATE;', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-783b', 'RACT2c46bd2e:1620eb5fe9d:-72d9', 'treasury.actions.AddVarDate.tag', 'billingduedate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-7977', 'RACT5b2b695a:1620ec467e4:-7cb0', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@FINDNEXTWORKDAY(  @DAYADD(  VARDATE, 15 ), HOLIDAYS, 1 );', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-799f', 'RACT5b2b695a:1620ec467e4:-7cb0', 'treasury.actions.AddVarDate.tag', 'discdate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-7e32', 'RACT5b2b695a:1620ec467e4:-79b2', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@DAYADD(  VARDATE, 5 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTb701e29:16777f95d74:-7e46', 'RACT5b2b695a:1620ec467e4:-79b2', 'treasury.actions.AddVarDate.tag', 'duedate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTbd2aa65:17089d46f09:-7628', 'RACTbd2aa65:17089d46f09:-76a4', 'treasury.actions.SetBillItemProperty.value', NULL, NULL, NULL, NULL, 'DUEDATE', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTbd2aa65:17089d46f09:-766d', 'RACTbd2aa65:17089d46f09:-76a4', 'treasury.actions.SetBillItemProperty.fieldname', 'duedate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTbd2aa65:17089d46f09:-768c', 'RACTbd2aa65:17089d46f09:-76a4', 'treasury.actions.SetBillItemProperty.billitem', NULL, NULL, 'RCONDbd2aa65:17089d46f09:-7928', 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_actiondef
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_actiondef`;
CREATE TABLE `sys_rule_actiondef` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `actionname` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `actionclass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_actiondef
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.AddRequirement', 'add-requirement', 'Add Requirement', 2, 'add-requirement', 'enterprise', 'enterprise.actions.AddRequirement');
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.PrintTest', 'print-test', 'Print Test', 1, 'print-test', 'ENTERPRISE', 'enterprise.actions.PrintTest');
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.ThrowException', 'throw-exeception', 'Throw Exception', 1, 'throw-exeception', 'ENTERPRISE', 'enterprise.actions.ThrowException');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddCreditBillItem', 'add-credit-billitem', 'Add Credit Bill Item', 2, 'add-credit-billitem', 'TREASURY', 'treasury.actions.AddCreditBillItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddDiscountItem', 'add-discount-item', 'Add Discount', 3, 'add-discount-item', 'TREASURY', 'treasury.actions.AddDiscountItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddExcessBillItem', 'add-excess-billitem', 'Add Excess Bill Item', 2, 'add-excess-billitem', 'TREASURY', 'treasury.actions.AddExcessBillItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddInterestItem', 'add-interest-item', 'Add Interest', 3, 'add-interest-item', 'TREASURY', 'treasury.actions.AddInterestItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddRevenueShare', 'add-share', 'Add Revenue Share', 1, 'add-share', 'TREASURY', 'treasury.actions.AddRevenueShare');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddRevenueShareByOrg', 'add-share-by-org', 'Add Revenue Share By Org', 1, 'add-share-by-org', 'TREASURY', 'treasury.actions.AddRevenueShareByOrg');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddSurchargeItem', 'add-surcharge-item', 'Add Surcharge', 3, 'add-surcharge-item', 'TREASURY', 'treasury.actions.AddSurchargeItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddVarDate', 'add-vardate', 'Add Variable Date', 1, 'add-vardate', 'TREASURY', 'treasury.actions.AddVarDate');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddVarDecimal', 'add-var-decimal', 'Add Var Decimal', 1, 'add-var-decimal', 'TREASURY', 'treasury.actions.AddVarDecimal');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddVarInteger', 'add-var-integer', 'Add Var Integer', 1, 'add-var-integer', 'TREASURY', 'treasury.actions.AddVarInteger');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddVarString', 'add-var-string', 'Add Var String', 1, 'add-var-string', 'TREASURY', 'treasury.actions.AddVarString');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.ApplyPayment', 'apply-payment', 'Apply Payment', 5, 'apply-payment', 'TREASURY', 'treasury.actions.ApplyPayment');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.ComputeFee', 'compute-fee', 'Compute Fee', 0, 'compute-fee', 'treasury', 'treasury.actions.ComputeFee');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.RemoveDiscountItem', 'remove-discount', 'Remove Discount', 1, 'remove-discount', 'TREASURY', 'treasury.actions.RemoveDiscountItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.SetBillItemAccount', 'set-billitem-account', 'Set Bill Item Account', 4, 'set-billitem-account', 'TREASURY', 'treasury.actions.SetBillItemAccount');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.SetBillItemProperty', 'set-billitem-property', 'Set BillItem Property Value', 10, 'set-billitem-property', 'TREASURY', 'treasury.actions.SetBillItemProperty');
INSERT INTO `sys_rule_actiondef` VALUES ('waterworks.actions.AddRepeatingFee', 'add-repeating-fee', 'Add Repeating Fee', 5, 'add-repeating-fee', 'waterworks', 'waterworks.actions.AddRepeatingFee');
INSERT INTO `sys_rule_actiondef` VALUES ('waterworks.actions.AddWaterBillItem', 'add-waterbillitem', 'Add Water Bill Item', 0, 'add-waterbillitem', 'waterworks', 'waterworks.actions.AddWaterBillItem');
INSERT INTO `sys_rule_actiondef` VALUES ('waterworks.actions.AddWaterConsumption', 'add-waterconsumption', 'Add Water Consumption', 1, 'add-waterconsumption', 'WATERWORKS', 'waterworks.actions.AddWaterConsumption');
INSERT INTO `sys_rule_actiondef` VALUES ('waterworks.actions.ComputeConsumption', 'compute-consumption', 'Compute Consumption', 0, 'compute-consumption', 'waterworks', 'waterworks.actions.ComputeConsumption');
INSERT INTO `sys_rule_actiondef` VALUES ('waterworks.actions.SetWaterBillingPeriod', 'set-waterworks-billing-period', 'Set Waterworks Billing Period', 1, 'set-waterworks-billing-period', 'WATERWORKS', 'waterworks.actions.SetWaterBillingPeriod');
INSERT INTO `sys_rule_actiondef` VALUES ('waterworks.actions.SetWaterConsumptionProperty', 'set-waterconsumpotion-property', 'Set Water Consumption Property Value', 10, 'set-waterconsumpotion-property', 'WATERWORKS', 'waterworks.actions.SetWaterConsumptionProperty');
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_actiondef_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
CREATE TABLE `sys_rule_actiondef_param` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_actiondef_param_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_actiondef_param
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddRequirement.message', 'enterprise.actions.AddRequirement', 'message', 2, 'Message', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddRequirement.reqtype', 'enterprise.actions.AddRequirement', 'reqtype', 1, 'Requirement Type', NULL, 'lookup', 'sys_requirement_type:lookup', 'code', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddRequirement.required', 'enterprise.actions.AddRequirement', 'required', 4, 'Required', 'boolean', 'boolean', NULL, NULL, NULL, 'boolean', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddRequirement.sortorder', 'enterprise.actions.AddRequirement', 'sortorder', 3, 'Sort Order', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.PrintTest.message', 'enterprise.actions.PrintTest', 'message', 1, 'Message', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.ThrowException.msg', 'enterprise.actions.ThrowException', 'msg', 1, 'Message', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddCreditBillItem.account', 'treasury.actions.AddCreditBillItem', 'account', 1, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddCreditBillItem.amount', 'treasury.actions.AddCreditBillItem', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddCreditBillItem.billcode', 'treasury.actions.AddCreditBillItem', 'billcode', 1, 'Bill code', NULL, 'lookup', 'waterworks_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddCreditBillItem.reftype', 'treasury.actions.AddCreditBillItem', 'reftype', 3, 'Ref Type', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.account', 'treasury.actions.AddDiscountItem', 'account', 2, 'Discount Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.amount', 'treasury.actions.AddDiscountItem', 'amount', 3, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.billcode', 'treasury.actions.AddDiscountItem', 'billcode', 3, 'Billcode', NULL, 'lookup', 'waterworks_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.billitem', 'treasury.actions.AddDiscountItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddExcessBillItem.account', 'treasury.actions.AddExcessBillItem', 'account', 1, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddExcessBillItem.amount', 'treasury.actions.AddExcessBillItem', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.account', 'treasury.actions.AddInterestItem', 'account', 2, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.amount', 'treasury.actions.AddInterestItem', 'amount', 3, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.billcode', 'treasury.actions.AddInterestItem', 'billcode', 3, 'Billcode', NULL, 'lookup', 'waterworks_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.billitem', 'treasury.actions.AddInterestItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShare.amount', 'treasury.actions.AddRevenueShare', 'amount', 3, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShare.payableaccount', 'treasury.actions.AddRevenueShare', 'payableaccount', 2, 'Payable Account', NULL, 'lookup', 'payableaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShare.refitem', 'treasury.actions.AddRevenueShare', 'refitem', 1, 'Ref Item', NULL, 'var', 'revenueitem:lookup', 'objid', 'title', 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShareByOrg.amount', 'treasury.actions.AddRevenueShareByOrg', 'amount', 4, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShareByOrg.org', 'treasury.actions.AddRevenueShareByOrg', 'org', 3, 'Org', NULL, 'var', NULL, NULL, NULL, 'enterprise.facts.Org', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShareByOrg.payableaccount', 'treasury.actions.AddRevenueShareByOrg', 'payableaccount', 2, 'Payable Account', NULL, 'lookup', 'payableaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShareByOrg.refitem', 'treasury.actions.AddRevenueShareByOrg', 'refitem', 1, 'Ref Item', NULL, 'var', 'revenueitem:lookup', 'objid', 'title', 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.account', 'treasury.actions.AddSurchargeItem', 'account', 2, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.amount', 'treasury.actions.AddSurchargeItem', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.billcode', 'treasury.actions.AddSurchargeItem', 'billcode', 3, 'Bill code', NULL, 'lookup', 'waterworks_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.billitem', 'treasury.actions.AddSurchargeItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.txntype', 'treasury.actions.AddSurchargeItem', 'txntype', 4, 'Txn Type', NULL, 'lookup', 'billitem_txntype:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDate.date', 'treasury.actions.AddVarDate', 'date', 2, 'Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDate.tag', 'treasury.actions.AddVarDate', 'tag', 1, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDecimal.tag', 'treasury.actions.AddVarDecimal', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDecimal.value', 'treasury.actions.AddVarDecimal', 'value', 1, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarInteger.tag', 'treasury.actions.AddVarInteger', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarInteger.value', 'treasury.actions.AddVarInteger', 'value', 1, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarString.tag', 'treasury.actions.AddVarString', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarString.value', 'treasury.actions.AddVarString', 'value', 1, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.ApplyPayment.payment', 'treasury.actions.ApplyPayment', 'payment', 1, 'Payment', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.Payment', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.ComputeFee.account', 'treasury.actions.ComputeFee', 'account', 1, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.ComputeFee.amount', 'treasury.actions.ComputeFee', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.ComputeFee.remarks', 'treasury.actions.ComputeFee', 'remarks', 3, 'Remarks', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.RemoveDiscountItem.billitem', 'treasury.actions.RemoveDiscountItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemAccount.account', 'treasury.actions.SetBillItemAccount', 'account', 2, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemAccount.billcode', 'treasury.actions.SetBillItemAccount', 'billcode', 3, 'Billcode', NULL, 'lookup', 'waterworks_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemAccount.billitem', 'treasury.actions.SetBillItemAccount', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemProperty.billitem', 'treasury.actions.SetBillItemProperty', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemProperty.fieldname', 'treasury.actions.SetBillItemProperty', 'fieldname', 2, 'Property Field Name', NULL, 'fieldlist', NULL, 'billitem', NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemProperty.value', 'treasury.actions.SetBillItemProperty', 'value', 3, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.AddRepeatingFee.account', 'waterworks.actions.AddRepeatingFee', 'account', 1, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.AddRepeatingFee.amount', 'waterworks.actions.AddRepeatingFee', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.AddRepeatingFee.remarks', 'waterworks.actions.AddRepeatingFee', 'remarks', 3, 'Remarks', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.AddWaterBillItem.amount', 'waterworks.actions.AddWaterBillItem', 'amount', 5, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.AddWaterBillItem.month', 'waterworks.actions.AddWaterBillItem', 'month', 2, 'Month', NULL, 'var', NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.AddWaterBillItem.refid', 'waterworks.actions.AddWaterBillItem', 'refid', 3, 'Ref', NULL, 'var', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.AddWaterBillItem.txntype', 'waterworks.actions.AddWaterBillItem', 'txntype', 4, 'Txn Type', NULL, 'lookup', 'waterworks_txntype:lookup', 'objid', 'title', NULL, 'WATERWORKS_TXNTYPE');
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.AddWaterBillItem.year', 'waterworks.actions.AddWaterBillItem', 'year', 1, 'Year', NULL, 'var', NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.AddWaterConsumption.volume', 'waterworks.actions.AddWaterConsumption', 'volume', 1, 'Volume', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.ComputeConsumption.amount', 'waterworks.actions.ComputeConsumption', 'amount', 1, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.ComputeConsumption.ref', 'waterworks.actions.ComputeConsumption', 'ref', 2, 'Ref', NULL, 'var', NULL, NULL, NULL, 'waterworks.facts.WaterConsumption', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterBillingPeriod.billingduedate', 'waterworks.actions.SetWaterBillingPeriod', 'billingduedate', 6, 'Billing Due Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterBillingPeriod.billingperiod', 'waterworks.actions.SetWaterBillingPeriod', 'billingperiod', 1, 'Billing Period', NULL, 'var', NULL, NULL, NULL, 'waterworks.facts.WaterBillingPeriod', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterBillingPeriod.discdate', 'waterworks.actions.SetWaterBillingPeriod', 'discdate', 7, 'Discount Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterBillingPeriod.duedate', 'waterworks.actions.SetWaterBillingPeriod', 'duedate', 8, 'Due Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterBillingPeriod.fromperiod', 'waterworks.actions.SetWaterBillingPeriod', 'fromperiod', 2, 'From Period', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterBillingPeriod.readingdate', 'waterworks.actions.SetWaterBillingPeriod', 'readingdate', 4, 'Reading Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterBillingPeriod.readingduedate', 'waterworks.actions.SetWaterBillingPeriod', 'readingduedate', 5, 'Reading Due Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterBillingPeriod.toperiod', 'waterworks.actions.SetWaterBillingPeriod', 'toperiod', 3, 'To Period', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterConsumptionProperty.fieldname', 'waterworks.actions.SetWaterConsumptionProperty', 'fieldname', 2, 'Property Field Name', 'string', 'string', NULL, 'waterworks.facts.WaterConsumption', NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterConsumptionProperty.item', 'waterworks.actions.SetWaterConsumptionProperty', 'item', 1, 'Item', NULL, 'var', NULL, NULL, NULL, 'waterworks.facts.WaterConsumption', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('waterworks.actions.SetWaterConsumptionProperty.value', 'waterworks.actions.SetWaterConsumptionProperty', 'value', 3, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_condition
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_condition`;
CREATE TABLE `sys_rule_condition` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `fact_name` varchar(50) DEFAULT NULL,
  `fact_objid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `ruletext` longtext,
  `displaytext` longtext,
  `dynamic_datatype` varchar(50) DEFAULT NULL,
  `dynamic_key` varchar(50) DEFAULT NULL,
  `dynamic_value` varchar(50) DEFAULT NULL,
  `notexist` int(11) NOT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_fact_objid` (`fact_objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_condition_fact_objid` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `fk_sys_rule_condition_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_condition
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_condition` VALUES ('RC-4222130b:1708975c319:-7ff6', 'RUL2ae95b31:170896138b4:-5f01', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-4222130b:1708975c319:-7ffb', 'RUL2ae95b31:170896138b4:-611f', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-4222130b:1708975c319:-8000', 'RUL2ae95b31:170896138b4:-643c', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-6c2874cd:160ed01f3d2:-7fc6', 'RULa6b099d:eb1f3248b7:-75ed', 'wateraccount', 'waterworks.facts.WaterAccount', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-6c2874cd:160ed01f3d2:-7fcf', 'RULa6b099d:eb1f3248b7:-7630', 'wateraccount', 'waterworks.facts.WaterAccount', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f61', 'RUL-43899399:1692d800670:-6c33', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f64', 'RUL-43899399:1692d800670:-6c33', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f68', 'RUL-43899399:1692d800670:-6c44', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f6b', 'RUL-43899399:1692d800670:-6c44', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f6f', 'RUL-43899399:1692d800670:-6c55', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f72', 'RUL-43899399:1692d800670:-6c55', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f8b', 'RUL-43899399:1692d800670:-7779', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f8e', 'RUL-43899399:1692d800670:-7779', 'treasury.facts.VarDate', 'treasury.facts.VarDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f92', 'RUL-43899399:1692d800670:-778a', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f95', 'RUL-43899399:1692d800670:-778a', 'treasury.facts.VarDate', 'treasury.facts.VarDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f99', 'RUL-43899399:1692d800670:-779b', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7f9c', 'RUL-43899399:1692d800670:-779b', 'treasury.facts.VarDate', 'treasury.facts.VarDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7fa5', 'RUL-43899399:1692d800670:-7a80', 'treasury.facts.VarInteger', 'treasury.facts.VarInteger', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7fa6', 'RUL-43899399:1692d800670:-7a80', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7fa9', 'RUL-43899399:1692d800670:-7a80', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILLPER', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7fb2', 'RUL-43899399:1692d800670:-7c21', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILLPER', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7fb3', 'RUL-43899399:1692d800670:-7c21', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7fb6', 'RUL-43899399:1692d800670:-7c21', 'treasury.facts.VarInteger', 'treasury.facts.VarInteger', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7fe6', 'RUL-43899399:1692d800670:-7cf7', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILLPER', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7fe7', 'RUL-43899399:1692d800670:-7cf7', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-741dcf01:1692d772ea2:-7fea', 'RUL-43899399:1692d800670:-7cf7', 'treasury.facts.VarInteger', 'treasury.facts.VarInteger', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-7fd7225d:1692ca418ad:-7fe7', 'RUL77046b1c:1692cc75e1b:-7acb', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-7fd7225d:1692ca418ad:-7fec', 'RUL77046b1c:1692cc75e1b:-7b69', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-7fd7225d:1692ca418ad:-7ff1', 'RUL77046b1c:1692cc75e1b:-7c1d', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-7fd7225d:1692ca418ad:-7ff6', 'RUL77046b1c:1692cc75e1b:-7d31', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-a002ae:16744d718df:-7ff1', 'RUL273a1fe9:134951a1bcf:-3109', 'WaterConsumption', 'waterworks.facts.WaterConsumption', 'WC', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-a002ae:16744d718df:-7ff7', 'RUL273a1fe9:134951a1bcf:-31f7', 'wateraccount', 'waterworks.facts.WaterAccount', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC-c4c94d7:16d900ad4ab:-7ff5', 'RUL-316b7756:16d900d6052:-7f24', 'com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC216faf2b:16348e519b7:-7fe8', 'RUL-34fcc9d0:16348fa1256:-79da', 'treasury.facts.VarInteger', 'treasury.facts.VarInteger', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC216faf2b:16348e519b7:-7fe9', 'RUL-34fcc9d0:16348fa1256:-79da', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC216faf2b:16348e519b7:-7fec', 'RUL-34fcc9d0:16348fa1256:-79da', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILLPER', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC2f280dc1:1684ad50113:-7fd9', 'RUL746193b0:1684af9777d:-7901', 'com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC2f280dc1:1684ad50113:-7fdc', 'RUL746193b0:1684af9777d:-7901', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'WBI', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC2f280dc1:1684ad50113:-7fe2', 'RUL746193b0:1684af9777d:-7b3e', 'com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC2f280dc1:1684ad50113:-7fe5', 'RUL746193b0:1684af9777d:-7b3e', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'WBI', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC61484a76:167813a20bc:-7ff6', 'RUL-54f2b5cd:167813a3810:-7b83', 'waterworks.facts.WaterConsumption', 'waterworks.facts.WaterConsumption', 'WC', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC61484a76:167813a20bc:-7ff8', 'RUL-54f2b5cd:167813a3810:-7b83', 'wateraccount', 'waterworks.facts.WaterAccount', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC6b47a6f1:16927d455fb:-7f94', 'RUL5939ba7a:16927ecacfc:-4dc9', 'waterworks.facts.WaterConsumption', 'waterworks.facts.WaterConsumption', 'WC', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC6b47a6f1:16927d455fb:-7f9d', 'RUL5939ba7a:16927ecacfc:-6cc0', 'waterworks.facts.WaterConsumption', 'waterworks.facts.WaterConsumption', 'WC', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC6b47a6f1:16927d455fb:-7f9f', 'RUL5939ba7a:16927ecacfc:-6cc0', 'wateraccount', 'waterworks.facts.WaterAccount', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-173a0991:1688ea323e8:-5f60', 'RUL-173a0991:1688ea323e8:-7657', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'WBI', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-18601aa3:168883a5d31:-511a', 'RUL38ede6eb:16888143c74:-7f8c', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', '', 3, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-2ebf3254:1677d2a3a0a:-2d46', 'RULa6b099d:eb1f3248b7:-7630', 'waterworks.facts.WaterConsumption', 'waterworks.facts.WaterConsumption', 'WC', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-316b7756:16d900d6052:-699a', 'RUL-316b7756:16d900d6052:-7f24', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'WBI', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-316b7756:16d900d6052:-6e48', 'RUL-316b7756:16d900d6052:-7f24', 'treasury.facts.VarDate', 'treasury.facts.VarDate', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-316b7756:16d900d6052:-7167', 'RUL-316b7756:16d900d6052:-721d', 'com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-36e45df8:17089c57633:-77af', 'RUL-36e45df8:17089c57633:-7d8b', 'com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-36e45df8:17089c57633:-7aa1', 'RUL-36e45df8:17089c57633:-7d8b', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'WBI', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-36e45df8:17089c57633:-7cbf', 'RUL-36e45df8:17089c57633:-7d8b', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-41d808ec:16fa2b737d3:-7999', 'RUL-41d808ec:16fa2b737d3:-7a69', 'treasury.facts.CreditBalanceBillItem', 'treasury.facts.CreditBalanceBillItem', 'CBAL', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-6915', 'RUL-43899399:1692d800670:-6c33', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-69e9', 'RUL-43899399:1692d800670:-6c44', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-6b15', 'RUL-43899399:1692d800670:-6c55', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-6bcb', 'RUL5b2b695a:1620ec467e4:-7e9b', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-6d18', 'RUL-43899399:1692d800670:-7779', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-6dca', 'RUL-43899399:1692d800670:-778a', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-6e70', 'RUL-43899399:1692d800670:-779b', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-6f36', 'RUL-34fcc9d0:16348fa1256:-79da', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 3, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-715b', 'RUL-43899399:1692d800670:-7a80', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 3, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-720e', 'RUL-43899399:1692d800670:-7cf7', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 3, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-43899399:1692d800670:-72af', 'RUL-43899399:1692d800670:-7c21', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 3, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-54f2b5cd:167813a3810:-7ad9', 'RUL-54f2b5cd:167813a3810:-7b83', 'waterworks.facts.WaterworksAttribute', 'waterworks.facts.WaterworksAttribute', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-694f3c0a:1677d756f0d:-7588', 'RUL273a1fe9:134951a1bcf:-31f7', 'waterworks.facts.WaterConsumption', 'waterworks.facts.WaterConsumption', 'WC', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-694f3c0a:1677d756f0d:-77aa', 'RULa6b099d:eb1f3248b7:-75ed', 'waterworks.facts.WaterConsumption', 'waterworks.facts.WaterConsumption', 'WC', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND273a1fe9:134951a1bcf:-2f23', 'RUL273a1fe9:134951a1bcf:-3109', 'waterworks.facts.WaterworksAttribute', 'waterworks.facts.WaterworksAttribute', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND273a1fe9:134951a1bcf:-2fb2', 'RUL273a1fe9:134951a1bcf:-3109', 'waterworks.facts.WaterAccount', 'waterworks.facts.WaterAccount', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND2ae95b31:170896138b4:-6d78', 'RUL2ae95b31:170896138b4:-6dcb', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND2ae95b31:170896138b4:-794e', 'RUL2ae95b31:170896138b4:-7bf8', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND2ae95b31:170896138b4:-7b06', 'RUL2ae95b31:170896138b4:-7bf8', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND2ae95b31:170896138b4:-7b97', 'RUL2ae95b31:170896138b4:-7bf8', 'waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'WBS', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND2c46bd2e:1620eb5fe9d:-7538', 'RUL2c46bd2e:1620eb5fe9d:-7750', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND2c46bd2e:1620eb5fe9d:-76c7', 'RUL2c46bd2e:1620eb5fe9d:-7750', 'treasury.facts.VarDate', 'treasury.facts.VarDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND2c46bd2e:1620eb5fe9d:-788f', 'RUL2c46bd2e:1620eb5fe9d:-7ec5', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND2c46bd2e:1620eb5fe9d:-7b90', 'RUL2c46bd2e:1620eb5fe9d:-7ec5', 'treasury.facts.VarDate', 'treasury.facts.VarDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND38ede6eb:16888143c74:-7569', 'RUL38ede6eb:16888143c74:-7f8c', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'WBI', 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND38ede6eb:16888143c74:-7a1c', 'RUL38ede6eb:16888143c74:-7f8c', 'com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND38ede6eb:16888143c74:-7caf', 'RUL38ede6eb:16888143c74:-7f8c', 'treasury.facts.CashReceipt', 'treasury.facts.CashReceipt', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND56c42d72:1692ca4583c:-4b82', 'RUL5b2b695a:1620ec467e4:-7e9b', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND5939ba7a:16927ecacfc:-4ce4', 'RUL5939ba7a:16927ecacfc:-4dc9', 'waterworks.facts.WaterworksAttribute', 'waterworks.facts.WaterworksAttribute', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND5b2b695a:1620ec467e4:-7a9c', 'RUL5b2b695a:1620ec467e4:-7b26', 'treasury.facts.VarDate', 'treasury.facts.VarDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND5b2b695a:1620ec467e4:-7d04', 'RUL5b2b695a:1620ec467e4:-7e9b', 'treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'HOLIDAYS', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND5b2b695a:1620ec467e4:-7e12', 'RUL5b2b695a:1620ec467e4:-7e9b', 'treasury.facts.VarDate', 'treasury.facts.VarDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND746193b0:1684af9777d:-7303', 'RUL746193b0:1684af9777d:-7390', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'WBI', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND746193b0:1684af9777d:-7548', 'RUL746193b0:1684af9777d:-760b', 'treasury.facts.ExcessPayment', 'treasury.facts.ExcessPayment', 'EXPMT', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND746193b0:1684af9777d:-7722', 'RUL746193b0:1684af9777d:-77bd', 'treasury.facts.Payment', 'treasury.facts.Payment', 'PMT', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND746193b0:1684af9777d:-7cee', 'RUL746193b0:1684af9777d:-7f28', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'WBI', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND746193b0:1684af9777d:-7ec3', 'RUL746193b0:1684af9777d:-7f28', 'com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCONDbd2aa65:17089d46f09:-7928', 'RULbd2aa65:17089d46f09:-7ded', 'waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'WBI', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCONDbd2aa65:17089d46f09:-7c77', 'RULbd2aa65:17089d46f09:-7ded', 'waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'BILPRD', 0, NULL, NULL, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_condition_constraint
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
CREATE TABLE `sys_rule_condition_constraint` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `field_objid` varchar(100) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `operator_caption` varchar(50) DEFAULT NULL,
  `operator_symbol` varchar(50) DEFAULT NULL,
  `usevar` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `decimalvalue` decimal(16,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `datevalue` date DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_var_objid` (`var_objid`) USING BTREE,
  KEY `ix_field_objid` (`field_objid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_condition_constraint_field_objid` FOREIGN KEY (`field_objid`) REFERENCES `sys_rule_fact_field` (`objid`),
  CONSTRAINT `fk_sys_rule_condition_constraint_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`),
  CONSTRAINT `fk_sys_rule_condition_constraint_var_objid` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_condition_constraint
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-6c2874cd:160ed01f3d2:-7fc5', 'RC-6c2874cd:160ed01f3d2:-7fc6', 'waterworks.facts.WaterAccount.classification', 'classification', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"COMMERCIAL\",value:\"COMMERCIAL\"]]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-6c2874cd:160ed01f3d2:-7fce', 'RC-6c2874cd:160ed01f3d2:-7fcf', 'waterworks.facts.WaterAccount.classification', 'classification', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"RESIDENTIAL\",value:\"RESIDENTIAL\"],[key:\"GOVERNMENT\",value:\"GOVERNMENT\"]]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f62', 'RC-741dcf01:1692d772ea2:-7f64', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f63', 'RC-741dcf01:1692d772ea2:-7f64', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f69', 'RC-741dcf01:1692d772ea2:-7f6b', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f6a', 'RC-741dcf01:1692d772ea2:-7f6b', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f70', 'RC-741dcf01:1692d772ea2:-7f72', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f71', 'RC-741dcf01:1692d772ea2:-7f72', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f8c', 'RC-741dcf01:1692d772ea2:-7f8e', 'treasury.facts.VarDate.date', 'date', 'DATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f8d', 'RC-741dcf01:1692d772ea2:-7f8e', 'treasury.facts.VarDate.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'toperiod', NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f93', 'RC-741dcf01:1692d772ea2:-7f95', 'treasury.facts.VarDate.date', 'date', 'DATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f94', 'RC-741dcf01:1692d772ea2:-7f95', 'treasury.facts.VarDate.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'toperiod', NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f9a', 'RC-741dcf01:1692d772ea2:-7f9c', 'treasury.facts.VarDate.date', 'date', 'DATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7f9b', 'RC-741dcf01:1692d772ea2:-7f9c', 'treasury.facts.VarDate.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'toperiod', NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fa3', 'RC-741dcf01:1692d772ea2:-7fa5', 'treasury.facts.VarInteger.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'days', NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fa4', 'RC-741dcf01:1692d772ea2:-7fa5', 'treasury.facts.VarInteger.value', 'value', 'DAYS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fa7', 'RC-741dcf01:1692d772ea2:-7fa9', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fa8', 'RC-741dcf01:1692d772ea2:-7fa9', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fb0', 'RC-741dcf01:1692d772ea2:-7fb2', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fb1', 'RC-741dcf01:1692d772ea2:-7fb2', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fb4', 'RC-741dcf01:1692d772ea2:-7fb6', 'treasury.facts.VarInteger.value', 'value', 'DAYS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fb5', 'RC-741dcf01:1692d772ea2:-7fb6', 'treasury.facts.VarInteger.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'days', NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fe4', 'RC-741dcf01:1692d772ea2:-7fe6', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fe5', 'RC-741dcf01:1692d772ea2:-7fe6', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fe8', 'RC-741dcf01:1692d772ea2:-7fea', 'treasury.facts.VarInteger.value', 'value', 'DAYS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-741dcf01:1692d772ea2:-7fe9', 'RC-741dcf01:1692d772ea2:-7fea', 'treasury.facts.VarInteger.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'days', NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-7fd7225d:1692ca418ad:-7fe6', 'RC-7fd7225d:1692ca418ad:-7fe7', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S04\",value:\"S04\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-7fd7225d:1692ca418ad:-7feb', 'RC-7fd7225d:1692ca418ad:-7fec', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S03\",value:\"S03\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-7fd7225d:1692ca418ad:-7ff0', 'RC-7fd7225d:1692ca418ad:-7ff1', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S02\",value:\"S02\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-7fd7225d:1692ca418ad:-7ff5', 'RC-7fd7225d:1692ca418ad:-7ff6', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"30\",value:\"30\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-a002ae:16744d718df:-7ff6', 'RC-a002ae:16744d718df:-7ff7', 'waterworks.facts.WaterAccount.classification', 'classification', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"INDUSTRIAL\",value:\"INDUSTRIAL\"],[key:\"BULK\",value:\"BULK\"]]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-c4c94d7:16d900ad4ab:-7ff4', 'RC-c4c94d7:16d900ad4ab:-7ff5', 'com.rameses.rules.common.CurrentDate.date', 'date', 'CDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC2f280dc1:1684ad50113:-7fd7', 'RC2f280dc1:1684ad50113:-7fd9', 'com.rameses.rules.common.CurrentDate.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC2f280dc1:1684ad50113:-7fd8', 'RC2f280dc1:1684ad50113:-7fd9', 'com.rameses.rules.common.CurrentDate.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC2f280dc1:1684ad50113:-7fda', 'RC2f280dc1:1684ad50113:-7fdc', 'waterworks.facts.WaterBillItem.year', 'year', NULL, 'equal to', '==', 1, 'RCC2f280dc1:1684ad50113:-7fd7', 'YR', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC2f280dc1:1684ad50113:-7fdb', 'RC2f280dc1:1684ad50113:-7fdc', 'waterworks.facts.WaterBillItem.month', 'month', NULL, 'less than', '<', 1, 'RCC2f280dc1:1684ad50113:-7fd8', 'MON', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC2f280dc1:1684ad50113:-7fe0', 'RC2f280dc1:1684ad50113:-7fe2', 'com.rameses.rules.common.CurrentDate.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC2f280dc1:1684ad50113:-7fe3', 'RC2f280dc1:1684ad50113:-7fe5', 'waterworks.facts.WaterBillItem.year', 'year', NULL, 'less than', '<', 1, 'RCC2f280dc1:1684ad50113:-7fe0', 'YR', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC61484a76:167813a20bc:-7ff5', 'RC61484a76:167813a20bc:-7ff6', 'waterworks.facts.WaterConsumption.volume', 'volume', 'VOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC61484a76:167813a20bc:-7ff7', 'RC61484a76:167813a20bc:-7ff8', 'waterworks.facts.WaterAccount.classification', 'classification', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"RESIDENTIAL\",value:\"RESIDENTIAL\"]]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC6b47a6f1:16927d455fb:-7f93', 'RC6b47a6f1:16927d455fb:-7f94', 'waterworks.facts.WaterConsumption.volume', 'volume', 'VOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC6b47a6f1:16927d455fb:-7f9c', 'RC6b47a6f1:16927d455fb:-7f9d', 'waterworks.facts.WaterConsumption.volume', 'volume', 'VOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC6b47a6f1:16927d455fb:-7f9e', 'RC6b47a6f1:16927d455fb:-7f9f', 'waterworks.facts.WaterAccount.classification', 'classification', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"COMMERCIAL\",value:\"COMMERCIAL\"]]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-173a0991:1688ea323e8:-5eb9', 'RCOND-173a0991:1688ea323e8:-5f60', 'waterworks.facts.WaterBillItem.partialunpaid', 'partialunpaid', 'PU', 'greater than', '>', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-18601aa3:168883a5d31:-50c3', 'RCOND-18601aa3:168883a5d31:-511a', 'waterworks.facts.WaterBillItem.duedate', 'duedate', NULL, 'before', '<', 1, 'RCONST38ede6eb:16888143c74:-79ef', 'CURRDATE', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-2ebf3254:1677d2a3a0a:-2d16', 'RCOND-2ebf3254:1677d2a3a0a:-2d46', 'waterworks.facts.WaterConsumption.volume', 'volume', 'VOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-2ebf3254:1677d2a3a0a:-6881', 'RC-a002ae:16744d718df:-7ff1', 'waterworks.facts.WaterConsumption.volume', 'volume', 'VOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-316b7756:16d900d6052:-6869', 'RCOND-316b7756:16d900d6052:-699a', 'waterworks.facts.WaterBillItem.duedate', 'duedate', NULL, 'before', '<', 1, 'RCC-c4c94d7:16d900ad4ab:-7ff4', 'CDATE', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-316b7756:16d900d6052:-68eb', 'RCOND-316b7756:16d900d6052:-699a', 'waterworks.facts.WaterBillItem.duedate', 'duedate', NULL, 'on or after', '>=', 1, 'RCONST-316b7756:16d900d6052:-6d92', 'PEDATE', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-316b7756:16d900d6052:-6952', 'RCOND-316b7756:16d900d6052:-699a', 'waterworks.facts.WaterBillItem.amount', 'amount', 'AMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-316b7756:16d900d6052:-6d92', 'RCOND-316b7756:16d900d6052:-6e48', 'treasury.facts.VarDate.date', 'date', 'PEDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-316b7756:16d900d6052:-6dca', 'RCOND-316b7756:16d900d6052:-6e48', 'treasury.facts.VarDate.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'penaltyeffectivitydate', NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-36e45df8:17089c57633:-71c4', 'RCOND-36e45df8:17089c57633:-7aa1', 'waterworks.facts.WaterBillItem.amount', 'amount', 'AMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-36e45df8:17089c57633:-7309', 'RCOND-36e45df8:17089c57633:-7cbf', 'waterworks.facts.WaterBillingPeriod.duedate', 'duedate', NULL, 'before', '<', 1, 'RCONST-36e45df8:17089c57633:-776f', 'CURRDATE', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-36e45df8:17089c57633:-776f', 'RCOND-36e45df8:17089c57633:-77af', 'com.rameses.rules.common.CurrentDate.date', 'date', 'CURRDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-36e45df8:17089c57633:-799e', 'RCOND-36e45df8:17089c57633:-7aa1', 'waterworks.facts.WaterBillItem.month', 'month', NULL, 'equal to', '==', 1, 'RCONST-36e45df8:17089c57633:-7c1b', 'MON', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-36e45df8:17089c57633:-7a2d', 'RCOND-36e45df8:17089c57633:-7aa1', 'waterworks.facts.WaterBillItem.year', 'year', NULL, 'equal to', '==', 1, 'RCONST-36e45df8:17089c57633:-7c72', 'YR', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-36e45df8:17089c57633:-7c1b', 'RCOND-36e45df8:17089c57633:-7cbf', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-36e45df8:17089c57633:-7c72', 'RCOND-36e45df8:17089c57633:-7cbf', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-6905', 'RCOND-43899399:1692d800670:-6915', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S04\",value:\"S04\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-69d9', 'RCOND-43899399:1692d800670:-69e9', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S03\",value:\"S03\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-6b05', 'RCOND-43899399:1692d800670:-6b15', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S02\",value:\"S02\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-6bbb', 'RCOND-43899399:1692d800670:-6bcb', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S01\",value:\"S01\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-6d08', 'RCOND-43899399:1692d800670:-6d18', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S04\",value:\"S04\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-6dba', 'RCOND-43899399:1692d800670:-6dca', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S03\",value:\"S03\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-6e60', 'RCOND-43899399:1692d800670:-6e70', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S02\",value:\"S02\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-6f26', 'RCOND-43899399:1692d800670:-6f36', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S01\",value:\"S01\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-714b', 'RCOND-43899399:1692d800670:-715b', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S04\",value:\"S04\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-71fe', 'RCOND-43899399:1692d800670:-720e', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S03\",value:\"S03\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-43899399:1692d800670:-729f', 'RCOND-43899399:1692d800670:-72af', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"S02\",value:\"S02\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-54f2b5cd:167813a3810:-7ac9', 'RCOND-54f2b5cd:167813a3810:-7ad9', 'waterworks.facts.WaterworksAttribute.name', 'name', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"SENIOR\",value:\"SENIOR CITIZEN\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-694f3c0a:1677d756f0d:-7561', 'RCOND-694f3c0a:1677d756f0d:-7588', 'waterworks.facts.WaterConsumption.volume', 'volume', 'VOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-694f3c0a:1677d756f0d:-777a', 'RCOND-694f3c0a:1677d756f0d:-77aa', 'waterworks.facts.WaterConsumption.volume', 'volume', 'VOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST16e4575c:1677753e95d:-7b90', 'RCOND2c46bd2e:1620eb5fe9d:-7b90', 'treasury.facts.VarDate.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'readingdate', NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST16e4575c:1677753e95d:-7c90', 'RCOND2c46bd2e:1620eb5fe9d:-7b90', 'treasury.facts.VarDate.date', 'date', 'VARDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST273a1fe9:134951a1bcf:-2f13', 'RCOND273a1fe9:134951a1bcf:-2f23', 'waterworks.facts.WaterworksAttribute.name', 'name', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"SUBDIVISION\",value:\"SUBDIVISION\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST273a1fe9:134951a1bcf:-2f64', 'RCOND273a1fe9:134951a1bcf:-2fb2', 'waterworks.facts.WaterAccount.units', 'units', 'UNITS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST2ae95b31:170896138b4:-5e65', 'RC-4222130b:1708975c319:-7ff6', 'waterworks.facts.WaterBillingPeriod.billingduedate', 'billingduedate', 'BILLDUEDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST2ae95b31:170896138b4:-6092', 'RC-4222130b:1708975c319:-7ffb', 'waterworks.facts.WaterBillingPeriod.readingduedate', 'readingduedate', 'READINGDUEDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST2ae95b31:170896138b4:-6383', 'RC-4222130b:1708975c319:-8000', 'waterworks.facts.WaterBillingPeriod.readingdate', 'readingdate', 'READINGDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST2ae95b31:170896138b4:-6cfe', 'RCOND2ae95b31:170896138b4:-6d78', 'waterworks.facts.WaterBillingPeriod.toperiod', 'toperiod', 'TODATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST2ae95b31:170896138b4:-79d3', 'RCOND2ae95b31:170896138b4:-7b06', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST2ae95b31:170896138b4:-7a39', 'RCOND2ae95b31:170896138b4:-7b06', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST2ae95b31:170896138b4:-7b87', 'RCOND2ae95b31:170896138b4:-7b97', 'waterworks.facts.WaterBlockSchedule.id', 'id', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"30\",value:\"30\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST38ede6eb:16888143c74:-70f9', 'RCOND38ede6eb:16888143c74:-7569', 'waterworks.facts.WaterBillItem.principal', 'principal', 'PRIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST38ede6eb:16888143c74:-74b1', 'RCOND38ede6eb:16888143c74:-7569', 'waterworks.facts.WaterBillItem.amount', 'amount', 'AMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST38ede6eb:16888143c74:-7514', 'RCOND38ede6eb:16888143c74:-7569', 'waterworks.facts.WaterBillItem.duedate', 'duedate', NULL, 'on or after', '>=', 1, 'RCONST38ede6eb:16888143c74:-79ef', 'CURRDATE', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST38ede6eb:16888143c74:-79ef', 'RCOND38ede6eb:16888143c74:-7a1c', 'com.rameses.rules.common.CurrentDate.date', 'date', 'CURRDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST56c42d72:1692ca4583c:-4b2b', 'RCOND56c42d72:1692ca4583c:-4b82', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST56c42d72:1692ca4583c:-4b5e', 'RCOND56c42d72:1692ca4583c:-4b82', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST5939ba7a:16927ecacfc:-4cd5', 'RCOND5939ba7a:16927ecacfc:-4ce4', 'waterworks.facts.WaterworksAttribute.name', 'name', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"LOT_DONOR\",value:\"LOT_DONOR\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST746193b0:1684af9777d:-690d', 'RCOND746193b0:1684af9777d:-7303', 'waterworks.facts.WaterBillItem.todate', 'todate', 'TODATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST746193b0:1684af9777d:-6993', 'RCOND746193b0:1684af9777d:-7303', 'waterworks.facts.WaterBillItem.fromdate', 'fromdate', 'FROMDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST746193b0:1684af9777d:-7538', 'RCOND746193b0:1684af9777d:-7548', 'treasury.facts.ExcessPayment.amount', 'amount', 'AMT', 'greater than', '>', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST746193b0:1684af9777d:-76ec', 'RCOND746193b0:1684af9777d:-7722', 'treasury.facts.Payment.amount', 'amount', NULL, 'greater than', '>', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST746193b0:1684af9777d:-7c65', 'RCOND746193b0:1684af9777d:-7cee', 'waterworks.facts.WaterBillItem.month', 'month', NULL, 'equal to', '==', 1, 'RCONST746193b0:1684af9777d:-7e58', 'MON', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST746193b0:1684af9777d:-7cb7', 'RCOND746193b0:1684af9777d:-7cee', 'waterworks.facts.WaterBillItem.year', 'year', NULL, 'equal to', '==', 1, 'RCONST746193b0:1684af9777d:-7e9a', 'YR', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST746193b0:1684af9777d:-7e58', 'RCOND746193b0:1684af9777d:-7ec3', 'com.rameses.rules.common.CurrentDate.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST746193b0:1684af9777d:-7e9a', 'RCOND746193b0:1684af9777d:-7ec3', 'com.rameses.rules.common.CurrentDate.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-7139', 'RC216faf2b:16348e519b7:-7fe8', 'treasury.facts.VarInteger.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'days', NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-716a', 'RC216faf2b:16348e519b7:-7fe8', 'treasury.facts.VarInteger.value', 'value', 'DAYS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-7538', 'RC216faf2b:16348e519b7:-7fec', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-7573', 'RC216faf2b:16348e519b7:-7fec', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-78c2', 'RCOND2c46bd2e:1620eb5fe9d:-76c7', 'treasury.facts.VarDate.date', 'date', 'VARDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-78f1', 'RCOND2c46bd2e:1620eb5fe9d:-76c7', 'treasury.facts.VarDate.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'readingduedate', NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-7a26', 'RCOND5b2b695a:1620ec467e4:-7e12', 'treasury.facts.VarDate.date', 'date', 'VARDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-7a5b', 'RCOND5b2b695a:1620ec467e4:-7e12', 'treasury.facts.VarDate.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'billingduedate', NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-7dce', 'RCOND5b2b695a:1620ec467e4:-7a9c', 'treasury.facts.VarDate.tag', 'tag', NULL, 'equal to', '==', NULL, NULL, NULL, NULL, NULL, 'discdate', NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTb701e29:16777f95d74:-7eb1', 'RCOND5b2b695a:1620ec467e4:-7a9c', 'treasury.facts.VarDate.date', 'date', 'VARDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTbd2aa65:17089d46f09:-7788', 'RCONDbd2aa65:17089d46f09:-7928', 'waterworks.facts.WaterBillItem.month', 'month', NULL, 'equal to', '==', 1, 'RCONSTbd2aa65:17089d46f09:-7b4a', 'MON', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTbd2aa65:17089d46f09:-7817', 'RCONDbd2aa65:17089d46f09:-7928', 'waterworks.facts.WaterBillItem.year', 'year', NULL, 'equal to', '==', 1, 'RCONSTbd2aa65:17089d46f09:-7bba', 'YR', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTbd2aa65:17089d46f09:-7b4a', 'RCONDbd2aa65:17089d46f09:-7c77', 'waterworks.facts.WaterBillingPeriod.month', 'month', 'MON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTbd2aa65:17089d46f09:-7bba', 'RCONDbd2aa65:17089d46f09:-7c77', 'waterworks.facts.WaterBillingPeriod.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTbd2aa65:17089d46f09:-7c1c', 'RCONDbd2aa65:17089d46f09:-7c77', 'waterworks.facts.WaterBillingPeriod.duedate', 'duedate', 'DUEDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_condition_var
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_condition_var`;
CREATE TABLE `sys_rule_condition_var` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `ruleid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_condition_var_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_condition_var
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_condition_var` VALUES ('RC-4222130b:1708975c319:-7ff6', 'RC-4222130b:1708975c319:-7ff6', 'RUL2ae95b31:170896138b4:-5f01', 'BILPRD', 'waterworks.facts.WaterBillingPeriod', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-4222130b:1708975c319:-7ffb', 'RC-4222130b:1708975c319:-7ffb', 'RUL2ae95b31:170896138b4:-611f', 'BILPRD', 'waterworks.facts.WaterBillingPeriod', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-4222130b:1708975c319:-8000', 'RC-4222130b:1708975c319:-8000', 'RUL2ae95b31:170896138b4:-643c', 'BILPRD', 'waterworks.facts.WaterBillingPeriod', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7f61', 'RC-741dcf01:1692d772ea2:-7f61', 'RUL-43899399:1692d800670:-6c33', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7f64', 'RC-741dcf01:1692d772ea2:-7f64', 'RUL-43899399:1692d800670:-6c33', 'BILPRD', 'treasury.facts.BillingPeriod', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7f68', 'RC-741dcf01:1692d772ea2:-7f68', 'RUL-43899399:1692d800670:-6c44', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7f6b', 'RC-741dcf01:1692d772ea2:-7f6b', 'RUL-43899399:1692d800670:-6c44', 'BILPRD', 'treasury.facts.BillingPeriod', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7f6f', 'RC-741dcf01:1692d772ea2:-7f6f', 'RUL-43899399:1692d800670:-6c55', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7f72', 'RC-741dcf01:1692d772ea2:-7f72', 'RUL-43899399:1692d800670:-6c55', 'BILPRD', 'treasury.facts.BillingPeriod', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7f8b', 'RC-741dcf01:1692d772ea2:-7f8b', 'RUL-43899399:1692d800670:-7779', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7f92', 'RC-741dcf01:1692d772ea2:-7f92', 'RUL-43899399:1692d800670:-778a', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7f99', 'RC-741dcf01:1692d772ea2:-7f99', 'RUL-43899399:1692d800670:-779b', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7fa6', 'RC-741dcf01:1692d772ea2:-7fa6', 'RUL-43899399:1692d800670:-7a80', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7fa9', 'RC-741dcf01:1692d772ea2:-7fa9', 'RUL-43899399:1692d800670:-7a80', 'BILLPER', 'treasury.facts.BillingPeriod', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7fb2', 'RC-741dcf01:1692d772ea2:-7fb2', 'RUL-43899399:1692d800670:-7c21', 'BILLPER', 'treasury.facts.BillingPeriod', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7fb3', 'RC-741dcf01:1692d772ea2:-7fb3', 'RUL-43899399:1692d800670:-7c21', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7fe6', 'RC-741dcf01:1692d772ea2:-7fe6', 'RUL-43899399:1692d800670:-7cf7', 'BILLPER', 'treasury.facts.BillingPeriod', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-741dcf01:1692d772ea2:-7fe7', 'RC-741dcf01:1692d772ea2:-7fe7', 'RUL-43899399:1692d800670:-7cf7', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-7fd7225d:1692ca418ad:-7fe7', 'RC-7fd7225d:1692ca418ad:-7fe7', 'RUL77046b1c:1692cc75e1b:-7acb', 'WBS', 'waterworks.facts.WaterBlockSchedule', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-7fd7225d:1692ca418ad:-7fec', 'RC-7fd7225d:1692ca418ad:-7fec', 'RUL77046b1c:1692cc75e1b:-7b69', 'WBS', 'waterworks.facts.WaterBlockSchedule', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-7fd7225d:1692ca418ad:-7ff1', 'RC-7fd7225d:1692ca418ad:-7ff1', 'RUL77046b1c:1692cc75e1b:-7c1d', 'WBS', 'waterworks.facts.WaterBlockSchedule', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-7fd7225d:1692ca418ad:-7ff6', 'RC-7fd7225d:1692ca418ad:-7ff6', 'RUL77046b1c:1692cc75e1b:-7d31', 'WBS', 'waterworks.facts.WaterBlockSchedule', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RC-a002ae:16744d718df:-7ff1', 'RC-a002ae:16744d718df:-7ff1', 'RUL273a1fe9:134951a1bcf:-3109', 'WC', 'waterworks.facts.WaterConsumption', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC216faf2b:16348e519b7:-7fe9', 'RC216faf2b:16348e519b7:-7fe9', 'RUL-34fcc9d0:16348fa1256:-79da', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC216faf2b:16348e519b7:-7fec', 'RC216faf2b:16348e519b7:-7fec', 'RUL-34fcc9d0:16348fa1256:-79da', 'BILLPER', 'treasury.facts.BillingPeriod', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RC2f280dc1:1684ad50113:-7fdc', 'RC2f280dc1:1684ad50113:-7fdc', 'RUL746193b0:1684af9777d:-7901', 'WBI', 'waterworks.facts.WaterBillItem', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC2f280dc1:1684ad50113:-7fe5', 'RC2f280dc1:1684ad50113:-7fe5', 'RUL746193b0:1684af9777d:-7b3e', 'WBI', 'waterworks.facts.WaterBillItem', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RC61484a76:167813a20bc:-7ff6', 'RC61484a76:167813a20bc:-7ff6', 'RUL-54f2b5cd:167813a3810:-7b83', 'WC', 'waterworks.facts.WaterConsumption', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RC6b47a6f1:16927d455fb:-7f94', 'RC6b47a6f1:16927d455fb:-7f94', 'RUL5939ba7a:16927ecacfc:-4dc9', 'WC', 'waterworks.facts.WaterConsumption', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RC6b47a6f1:16927d455fb:-7f9d', 'RC6b47a6f1:16927d455fb:-7f9d', 'RUL5939ba7a:16927ecacfc:-6cc0', 'WC', 'waterworks.facts.WaterConsumption', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7f62', 'RC-741dcf01:1692d772ea2:-7f64', 'RUL-43899399:1692d800670:-6c33', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7f63', 'RC-741dcf01:1692d772ea2:-7f64', 'RUL-43899399:1692d800670:-6c33', 'MON', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7f69', 'RC-741dcf01:1692d772ea2:-7f6b', 'RUL-43899399:1692d800670:-6c44', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7f6a', 'RC-741dcf01:1692d772ea2:-7f6b', 'RUL-43899399:1692d800670:-6c44', 'MON', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7f70', 'RC-741dcf01:1692d772ea2:-7f72', 'RUL-43899399:1692d800670:-6c55', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7f71', 'RC-741dcf01:1692d772ea2:-7f72', 'RUL-43899399:1692d800670:-6c55', 'MON', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7f8c', 'RC-741dcf01:1692d772ea2:-7f8e', 'RUL-43899399:1692d800670:-7779', 'DATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7f93', 'RC-741dcf01:1692d772ea2:-7f95', 'RUL-43899399:1692d800670:-778a', 'DATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7f9a', 'RC-741dcf01:1692d772ea2:-7f9c', 'RUL-43899399:1692d800670:-779b', 'DATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7fa4', 'RC-741dcf01:1692d772ea2:-7fa5', 'RUL-43899399:1692d800670:-7a80', 'DAYS', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7fa7', 'RC-741dcf01:1692d772ea2:-7fa9', 'RUL-43899399:1692d800670:-7a80', 'YR', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7fa8', 'RC-741dcf01:1692d772ea2:-7fa9', 'RUL-43899399:1692d800670:-7a80', 'MON', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7fb0', 'RC-741dcf01:1692d772ea2:-7fb2', 'RUL-43899399:1692d800670:-7c21', 'MON', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7fb1', 'RC-741dcf01:1692d772ea2:-7fb2', 'RUL-43899399:1692d800670:-7c21', 'YR', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7fb4', 'RC-741dcf01:1692d772ea2:-7fb6', 'RUL-43899399:1692d800670:-7c21', 'DAYS', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7fe4', 'RC-741dcf01:1692d772ea2:-7fe6', 'RUL-43899399:1692d800670:-7cf7', 'MON', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7fe5', 'RC-741dcf01:1692d772ea2:-7fe6', 'RUL-43899399:1692d800670:-7cf7', 'YR', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-741dcf01:1692d772ea2:-7fe8', 'RC-741dcf01:1692d772ea2:-7fea', 'RUL-43899399:1692d800670:-7cf7', 'DAYS', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-c4c94d7:16d900ad4ab:-7ff4', 'RC-c4c94d7:16d900ad4ab:-7ff5', 'RUL-316b7756:16d900d6052:-7f24', 'CDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC2f280dc1:1684ad50113:-7fd7', 'RC2f280dc1:1684ad50113:-7fd9', 'RUL746193b0:1684af9777d:-7901', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC2f280dc1:1684ad50113:-7fd8', 'RC2f280dc1:1684ad50113:-7fd9', 'RUL746193b0:1684af9777d:-7901', 'MON', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC2f280dc1:1684ad50113:-7fe0', 'RC2f280dc1:1684ad50113:-7fe2', 'RUL746193b0:1684af9777d:-7b3e', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC61484a76:167813a20bc:-7ff5', 'RC61484a76:167813a20bc:-7ff6', 'RUL-54f2b5cd:167813a3810:-7b83', 'VOL', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC6b47a6f1:16927d455fb:-7f93', 'RC6b47a6f1:16927d455fb:-7f94', 'RUL5939ba7a:16927ecacfc:-4dc9', 'VOL', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC6b47a6f1:16927d455fb:-7f9c', 'RC6b47a6f1:16927d455fb:-7f9d', 'RUL5939ba7a:16927ecacfc:-6cc0', 'VOL', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-173a0991:1688ea323e8:-5f60', 'RCOND-173a0991:1688ea323e8:-5f60', 'RUL-173a0991:1688ea323e8:-7657', 'WBI', 'waterworks.facts.WaterBillItem', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-2ebf3254:1677d2a3a0a:-2d46', 'RCOND-2ebf3254:1677d2a3a0a:-2d46', 'RULa6b099d:eb1f3248b7:-7630', 'WC', 'waterworks.facts.WaterConsumption', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-316b7756:16d900d6052:-699a', 'RCOND-316b7756:16d900d6052:-699a', 'RUL-316b7756:16d900d6052:-7f24', 'WBI', 'waterworks.facts.WaterBillItem', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-36e45df8:17089c57633:-7aa1', 'RCOND-36e45df8:17089c57633:-7aa1', 'RUL-36e45df8:17089c57633:-7d8b', 'WBI', 'waterworks.facts.WaterBillItem', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-36e45df8:17089c57633:-7cbf', 'RCOND-36e45df8:17089c57633:-7cbf', 'RUL-36e45df8:17089c57633:-7d8b', 'BILPRD', 'waterworks.facts.WaterBillingPeriod', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-41d808ec:16fa2b737d3:-7999', 'RCOND-41d808ec:16fa2b737d3:-7999', 'RUL-41d808ec:16fa2b737d3:-7a69', 'CBAL', 'treasury.facts.CreditBalanceBillItem', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-6915', 'RCOND-43899399:1692d800670:-6915', 'RUL-43899399:1692d800670:-6c33', 'WBS', 'waterworks.facts.WaterBlockSchedule', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-69e9', 'RCOND-43899399:1692d800670:-69e9', 'RUL-43899399:1692d800670:-6c44', 'WBS', 'waterworks.facts.WaterBlockSchedule', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-6b15', 'RCOND-43899399:1692d800670:-6b15', 'RUL-43899399:1692d800670:-6c55', 'WBS', 'waterworks.facts.WaterBlockSchedule', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-6bcb', 'RCOND-43899399:1692d800670:-6bcb', 'RUL5b2b695a:1620ec467e4:-7e9b', 'WBS', 'waterworks.facts.WaterBlockSchedule', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-6d18', 'RCOND-43899399:1692d800670:-6d18', 'RUL-43899399:1692d800670:-7779', 'WBS', 'waterworks.facts.WaterBlockSchedule', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-6dca', 'RCOND-43899399:1692d800670:-6dca', 'RUL-43899399:1692d800670:-778a', 'WBS', 'waterworks.facts.WaterBlockSchedule', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-6e70', 'RCOND-43899399:1692d800670:-6e70', 'RUL-43899399:1692d800670:-779b', 'WBS', 'waterworks.facts.WaterBlockSchedule', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-6f36', 'RCOND-43899399:1692d800670:-6f36', 'RUL-34fcc9d0:16348fa1256:-79da', 'WBS', 'waterworks.facts.WaterBlockSchedule', 3);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-715b', 'RCOND-43899399:1692d800670:-715b', 'RUL-43899399:1692d800670:-7a80', 'WBS', 'waterworks.facts.WaterBlockSchedule', 3);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-720e', 'RCOND-43899399:1692d800670:-720e', 'RUL-43899399:1692d800670:-7cf7', 'WBS', 'waterworks.facts.WaterBlockSchedule', 3);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-43899399:1692d800670:-72af', 'RCOND-43899399:1692d800670:-72af', 'RUL-43899399:1692d800670:-7c21', 'WBS', 'waterworks.facts.WaterBlockSchedule', 3);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-694f3c0a:1677d756f0d:-7588', 'RCOND-694f3c0a:1677d756f0d:-7588', 'RUL273a1fe9:134951a1bcf:-31f7', 'WC', 'waterworks.facts.WaterConsumption', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-694f3c0a:1677d756f0d:-77aa', 'RCOND-694f3c0a:1677d756f0d:-77aa', 'RULa6b099d:eb1f3248b7:-75ed', 'WC', 'waterworks.facts.WaterConsumption', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND2ae95b31:170896138b4:-6d78', 'RCOND2ae95b31:170896138b4:-6d78', 'RUL2ae95b31:170896138b4:-6dcb', 'BILPRD', 'waterworks.facts.WaterBillingPeriod', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND2ae95b31:170896138b4:-794e', 'RCOND2ae95b31:170896138b4:-794e', 'RUL2ae95b31:170896138b4:-7bf8', 'HOLIDAYS', 'treasury.facts.HolidayFact', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND2ae95b31:170896138b4:-7b06', 'RCOND2ae95b31:170896138b4:-7b06', 'RUL2ae95b31:170896138b4:-7bf8', 'BILPRD', 'waterworks.facts.WaterBillingPeriod', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND2ae95b31:170896138b4:-7b97', 'RCOND2ae95b31:170896138b4:-7b97', 'RUL2ae95b31:170896138b4:-7bf8', 'WBS', 'waterworks.facts.WaterBlockSchedule', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND2c46bd2e:1620eb5fe9d:-7538', 'RCOND2c46bd2e:1620eb5fe9d:-7538', 'RUL2c46bd2e:1620eb5fe9d:-7750', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND2c46bd2e:1620eb5fe9d:-788f', 'RCOND2c46bd2e:1620eb5fe9d:-788f', 'RUL2c46bd2e:1620eb5fe9d:-7ec5', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND38ede6eb:16888143c74:-7569', 'RCOND38ede6eb:16888143c74:-7569', 'RUL38ede6eb:16888143c74:-7f8c', 'WBI', 'waterworks.facts.WaterBillItem', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND56c42d72:1692ca4583c:-4b82', 'RCOND56c42d72:1692ca4583c:-4b82', 'RUL5b2b695a:1620ec467e4:-7e9b', 'BILPRD', 'treasury.facts.BillingPeriod', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND5b2b695a:1620ec467e4:-7d04', 'RCOND5b2b695a:1620ec467e4:-7d04', 'RUL5b2b695a:1620ec467e4:-7e9b', 'HOLIDAYS', 'treasury.facts.HolidayFact', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND746193b0:1684af9777d:-7303', 'RCOND746193b0:1684af9777d:-7303', 'RUL746193b0:1684af9777d:-7390', 'WBI', 'waterworks.facts.WaterBillItem', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND746193b0:1684af9777d:-7548', 'RCOND746193b0:1684af9777d:-7548', 'RUL746193b0:1684af9777d:-760b', 'EXPMT', 'treasury.facts.ExcessPayment', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND746193b0:1684af9777d:-7722', 'RCOND746193b0:1684af9777d:-7722', 'RUL746193b0:1684af9777d:-77bd', 'PMT', 'treasury.facts.Payment', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND746193b0:1684af9777d:-7cee', 'RCOND746193b0:1684af9777d:-7cee', 'RUL746193b0:1684af9777d:-7f28', 'WBI', 'waterworks.facts.WaterBillItem', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONDbd2aa65:17089d46f09:-7928', 'RCONDbd2aa65:17089d46f09:-7928', 'RULbd2aa65:17089d46f09:-7ded', 'WBI', 'waterworks.facts.WaterBillItem', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONDbd2aa65:17089d46f09:-7c77', 'RCONDbd2aa65:17089d46f09:-7c77', 'RULbd2aa65:17089d46f09:-7ded', 'BILPRD', 'waterworks.facts.WaterBillingPeriod', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-173a0991:1688ea323e8:-5eb9', 'RCOND-173a0991:1688ea323e8:-5f60', 'RUL-173a0991:1688ea323e8:-7657', 'PU', 'decimal', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-2ebf3254:1677d2a3a0a:-2d16', 'RCOND-2ebf3254:1677d2a3a0a:-2d46', 'RULa6b099d:eb1f3248b7:-7630', 'VOL', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-2ebf3254:1677d2a3a0a:-6881', 'RC-a002ae:16744d718df:-7ff1', 'RUL273a1fe9:134951a1bcf:-3109', 'VOL', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-316b7756:16d900d6052:-6952', 'RCOND-316b7756:16d900d6052:-699a', 'RUL-316b7756:16d900d6052:-7f24', 'AMT', 'decimal', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-316b7756:16d900d6052:-6d92', 'RCOND-316b7756:16d900d6052:-6e48', 'RUL-316b7756:16d900d6052:-7f24', 'PEDATE', 'date', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-36e45df8:17089c57633:-71c4', 'RCOND-36e45df8:17089c57633:-7aa1', 'RUL-36e45df8:17089c57633:-7d8b', 'AMT', 'decimal', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-36e45df8:17089c57633:-776f', 'RCOND-36e45df8:17089c57633:-77af', 'RUL-36e45df8:17089c57633:-7d8b', 'CURRDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-36e45df8:17089c57633:-7c1b', 'RCOND-36e45df8:17089c57633:-7cbf', 'RUL-36e45df8:17089c57633:-7d8b', 'MON', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-36e45df8:17089c57633:-7c72', 'RCOND-36e45df8:17089c57633:-7cbf', 'RUL-36e45df8:17089c57633:-7d8b', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-694f3c0a:1677d756f0d:-7561', 'RCOND-694f3c0a:1677d756f0d:-7588', 'RUL273a1fe9:134951a1bcf:-31f7', 'VOL', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-694f3c0a:1677d756f0d:-777a', 'RCOND-694f3c0a:1677d756f0d:-77aa', 'RULa6b099d:eb1f3248b7:-75ed', 'VOL', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST16e4575c:1677753e95d:-7c90', 'RCOND2c46bd2e:1620eb5fe9d:-7b90', 'RUL2c46bd2e:1620eb5fe9d:-7ec5', 'VARDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST273a1fe9:134951a1bcf:-2f64', 'RCOND273a1fe9:134951a1bcf:-2fb2', 'RUL273a1fe9:134951a1bcf:-3109', 'UNITS', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST2ae95b31:170896138b4:-5e65', 'RC-4222130b:1708975c319:-7ff6', 'RUL2ae95b31:170896138b4:-5f01', 'BILLDUEDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST2ae95b31:170896138b4:-6092', 'RC-4222130b:1708975c319:-7ffb', 'RUL2ae95b31:170896138b4:-611f', 'READINGDUEDATE', 'date', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST2ae95b31:170896138b4:-6383', 'RC-4222130b:1708975c319:-8000', 'RUL2ae95b31:170896138b4:-643c', 'READINGDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST2ae95b31:170896138b4:-6cfe', 'RCOND2ae95b31:170896138b4:-6d78', 'RUL2ae95b31:170896138b4:-6dcb', 'TODATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST2ae95b31:170896138b4:-79d3', 'RCOND2ae95b31:170896138b4:-7b06', 'RUL2ae95b31:170896138b4:-7bf8', 'MON', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST2ae95b31:170896138b4:-7a39', 'RCOND2ae95b31:170896138b4:-7b06', 'RUL2ae95b31:170896138b4:-7bf8', 'YEAR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST2c46bd2e:1620eb5fe9d:-7652', 'RCOND2c46bd2e:1620eb5fe9d:-76c7', 'RUL2c46bd2e:1620eb5fe9d:-7750', 'VARDATE', 'date', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST2c46bd2e:1620eb5fe9d:-7aaf', 'RCOND2c46bd2e:1620eb5fe9d:-7b90', 'RUL2c46bd2e:1620eb5fe9d:-7ec5', 'VARDATE', 'date', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST38ede6eb:16888143c74:-70f9', 'RCOND38ede6eb:16888143c74:-7569', 'RUL38ede6eb:16888143c74:-7f8c', 'PRIN', 'decimal', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST38ede6eb:16888143c74:-74b1', 'RCOND38ede6eb:16888143c74:-7569', 'RUL38ede6eb:16888143c74:-7f8c', 'AMT', 'decimal', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST38ede6eb:16888143c74:-79ef', 'RCOND38ede6eb:16888143c74:-7a1c', 'RUL38ede6eb:16888143c74:-7f8c', 'CURRDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST56c42d72:1692ca4583c:-4b2b', 'RCOND56c42d72:1692ca4583c:-4b82', 'RUL5b2b695a:1620ec467e4:-7e9b', 'MON', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST56c42d72:1692ca4583c:-4b5e', 'RCOND56c42d72:1692ca4583c:-4b82', 'RUL5b2b695a:1620ec467e4:-7e9b', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST5b2b695a:1620ec467e4:-7a3b', 'RCOND5b2b695a:1620ec467e4:-7a9c', 'RUL5b2b695a:1620ec467e4:-7b26', 'VARDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST746193b0:1684af9777d:-690d', 'RCOND746193b0:1684af9777d:-7303', 'RUL746193b0:1684af9777d:-7390', 'TODATE', 'date', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST746193b0:1684af9777d:-6993', 'RCOND746193b0:1684af9777d:-7303', 'RUL746193b0:1684af9777d:-7390', 'FROMDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST746193b0:1684af9777d:-7538', 'RCOND746193b0:1684af9777d:-7548', 'RUL746193b0:1684af9777d:-760b', 'AMT', 'decimal', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST746193b0:1684af9777d:-7e58', 'RCOND746193b0:1684af9777d:-7ec3', 'RUL746193b0:1684af9777d:-7f28', 'MON', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST746193b0:1684af9777d:-7e9a', 'RCOND746193b0:1684af9777d:-7ec3', 'RUL746193b0:1684af9777d:-7f28', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONSTb701e29:16777f95d74:-716a', 'RC216faf2b:16348e519b7:-7fe8', 'RUL-34fcc9d0:16348fa1256:-79da', 'DAYS', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONSTb701e29:16777f95d74:-7538', 'RC216faf2b:16348e519b7:-7fec', 'RUL-34fcc9d0:16348fa1256:-79da', 'YR', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONSTb701e29:16777f95d74:-7573', 'RC216faf2b:16348e519b7:-7fec', 'RUL-34fcc9d0:16348fa1256:-79da', 'MON', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONSTb701e29:16777f95d74:-7a26', 'RCOND5b2b695a:1620ec467e4:-7e12', 'RUL5b2b695a:1620ec467e4:-7e9b', 'VARDATE', 'date', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONSTbd2aa65:17089d46f09:-7b4a', 'RCONDbd2aa65:17089d46f09:-7c77', 'RULbd2aa65:17089d46f09:-7ded', 'MON', 'integer', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONSTbd2aa65:17089d46f09:-7bba', 'RCONDbd2aa65:17089d46f09:-7c77', 'RULbd2aa65:17089d46f09:-7ded', 'YR', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONSTbd2aa65:17089d46f09:-7c1c', 'RCONDbd2aa65:17089d46f09:-7c77', 'RULbd2aa65:17089d46f09:-7ded', 'DUEDATE', 'date', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_deployed
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_deployed`;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL,
  `ruletext` longtext,
  PRIMARY KEY (`objid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_deployed_objid` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_deployed
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_deployed` VALUES ('RUL-36e45df8:17089c57633:-7d8b', '\npackage waterworksbilling.WATER_SURCHARGE;\nimport waterworksbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"WATER_SURCHARGE\"\n	agenda-group \"surcharge\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		 com.rameses.rules.common.CurrentDate (  CURRDATE:date ) \n		\n		BILPRD: waterworks.facts.WaterBillingPeriod (  YR:year,MON:month,duedate < CURRDATE ) \n		\n		WBI: waterworks.facts.WaterBillItem (  year == YR,month == MON,AMT:amount ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"CURRDATE\", CURRDATE );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"BILPRD\", BILPRD );\n		\n		bindings.put(\"MON\", MON );\n		\n		bindings.put(\"WBI\", WBI );\n		\n		bindings.put(\"AMT\", AMT );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", WBI );\n_p0.put( \"amount\", (new ActionExpression(\"AMT * 0.14\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"WATER_SURCHARGE\", \"WATER SURCHARGE\") );\naction.execute( \"add-surcharge-item\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL-54f2b5cd:167813a3810:-7b83', '\npackage waterworkscomputation.COMPUTATION_FOR_SENIOR;\nimport waterworkscomputation.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTATION_FOR_SENIOR\"\n	agenda-group \"initial\"\n	salience 60000\n	no-loop\n	when\n		\n		\n		 waterworks.facts.WaterAccount (  classification matches \"RESIDENTIAL\" ) \n		\n		WC: waterworks.facts.WaterConsumption (  VOL:volume ) \n		\n		 waterworks.facts.WaterworksAttribute (  name matches \"SENIOR\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VOL\", VOL );\n		\n		bindings.put(\"WC\", WC );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"def amount = 0.0;  if ( VOL <= 10 ) amount = 20.0;   else if ( VOL <= 20 ) amount = 20.0 + ((VOL-10) * 2.30);  else if ( VOL <= 30 ) amount = 43.0 + ((VOL-20) * 2.80); else if ( VOL <= 40 ) amount = 71.0 + ((VOL-30) * 3.40); else if ( VOL <= 50 ) amount = 105.0 + ((VOL-40) * 4.10); else amount = 146.0 + ((VOL-50) * 5.00);   def value = (amount > 0 ? amount * 0.80 : 0.0); def bd = new java.math.BigDecimal(value.toString()); return bd.setScale(1, java.math.RoundingMode.HALF_UP);\", bindings)) );\n_p0.put( \"ref\", WC );\naction.execute( \"compute-consumption\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL273a1fe9:134951a1bcf:-3109', '\npackage waterworkscomputation.COMPUTATION_FOR_SUBDIVISION;\nimport waterworkscomputation.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTATION_FOR_SUBDIVISION\"\n	agenda-group \"initial\"\n	salience 60000\n	no-loop\n	when\n		\n		\n		WC: waterworks.facts.WaterConsumption (  VOL:volume ) \n		\n		 waterworks.facts.WaterAccount (  UNITS:units ) \n		\n		 waterworks.facts.WaterworksAttribute (  name matches \"SUBDIVISION\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VOL\", VOL );\n		\n		bindings.put(\"UNITS\", UNITS );\n		\n		bindings.put(\"WC\", WC );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"def v = VOL;  def cm = UNITS * 10;  def totals = [];  def n = v - cm; if ( n > 0) totals << (cm * 1.8);   else totals << (v * 1.8);   v = (n > 0 ? n : 0); n = v - cm;  if ( n > 0) totals << (cm * 2.3);   else totals << (v * 2.3);   v = (n > 0 ? n : 0); n = v - cm;  if ( n > 0) totals << (cm * 2.8);   else totals << (v * 2.8);   v = (n > 0 ? n : 0); n = v - cm;  if ( n > 0) totals << (cm * 3.4);   else totals << (v * 3.4);   v = (n > 0 ? n : 0);  totals << (v > 0 ? v : 0) * 5.0;  return (totals ? totals.sum{it} : 0.0); \", bindings)) );\n_p0.put( \"ref\", WC );\naction.execute( \"compute-consumption\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL273a1fe9:134951a1bcf:-31f7', '\npackage waterworkscomputation.COMPUTATION_FOR_INDUSTRIAL_BULK;\nimport waterworkscomputation.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTATION_FOR_INDUSTRIAL_BULK\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		 waterworks.facts.WaterAccount (  classification matches \"INDUSTRIAL|BULK\" ) \n		\n		WC: waterworks.facts.WaterConsumption (  VOL:volume ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VOL\", VOL );\n		\n		bindings.put(\"WC\", WC );\n		\n	RangeEntry re0 = new RangeEntry(\"COMPUTATION_FOR_INDUSTRIAL_BULK\");\nre0.setBindings(bindings);\nre0.setIntvalue(VOL);\nre0.getParams().put( \"amount\", 0.0 );\nre0.getParams().put( \"ref\", WC );\ninsert(re0);\n\nend\n\n\n	\nrule \"compute-consumption_0_0\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_INDUSTRIAL_BULK\", intvalue <= 10.00 )\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"192\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_1\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_INDUSTRIAL_BULK\", intvalue > 10.00, intvalue <= 20.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"192 + ((VOL-10) * 6.9)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_2\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_INDUSTRIAL_BULK\", intvalue > 20.00, intvalue <= 30.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"261 + ((VOL-20) * 8.4)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_3\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_INDUSTRIAL_BULK\", intvalue > 30.00, intvalue <= 40.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"345 + ((VOL-30) * 10.2)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_4\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_INDUSTRIAL_BULK\", intvalue > 40.00, intvalue <= 50.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"447 + ((VOL-40) * 12.3)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_5\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_INDUSTRIAL_BULK\", intvalue > 50.00 )\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"570 + ((VOL-50) * 15)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL2ae95b31:170896138b4:-5f01', '\npackage waterworksbillingschedule.SET_DUEDATE;\nimport waterworksbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_DUEDATE\"\n	agenda-group \"post-initial\"\n	salience 35000\n	no-loop\n	when\n		\n		\n		BILPRD: waterworks.facts.WaterBillingPeriod (  BILLDUEDATE:billingduedate ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"BILPRD\", BILPRD );\n		\n		bindings.put(\"BILLDUEDATE\", BILLDUEDATE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billingperiod\", BILPRD );\n_p0.put( \"duedate\", (new ActionExpression(\"@DAYADD( BILLDUEDATE , 15  )\", bindings)) );\naction.execute( \"set-waterworks-billing-period\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL2ae95b31:170896138b4:-611f', '\npackage waterworksbillingschedule.SET_BILLING_DUEDATE;\nimport waterworksbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_BILLING_DUEDATE\"\n	agenda-group \"post-initial\"\n	salience 38000\n	no-loop\n	when\n		\n		\n		BILPRD: waterworks.facts.WaterBillingPeriod (  READINGDUEDATE:readingduedate ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"BILPRD\", BILPRD );\n		\n		bindings.put(\"READINGDUEDATE\", READINGDUEDATE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billingperiod\", BILPRD );\n_p0.put( \"billingduedate\", (new ActionExpression(\"@DAYADD( READINGDUEDATE , 2 )\", bindings)) );\n_p0.put( \"discdate\", (new ActionExpression(\"@DAYADD( READINGDUEDATE , 2 )\", bindings)) );\naction.execute( \"set-waterworks-billing-period\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL2ae95b31:170896138b4:-643c', '\npackage waterworksbillingschedule.SET_READING_DUEDATE;\nimport waterworksbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_READING_DUEDATE\"\n	agenda-group \"post-initial\"\n	salience 39000\n	no-loop\n	when\n		\n		\n		BILPRD: waterworks.facts.WaterBillingPeriod (  READINGDATE:readingdate ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"BILPRD\", BILPRD );\n		\n		bindings.put(\"READINGDATE\", READINGDATE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billingperiod\", BILPRD );\n_p0.put( \"readingduedate\", (new ActionExpression(\"@DAYADD( READINGDATE , 2 )\", bindings)) );\naction.execute( \"set-waterworks-billing-period\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL2ae95b31:170896138b4:-6dcb', '\npackage waterworksbillingschedule.SET_READING_DATE;\nimport waterworksbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_READING_DATE\"\n	agenda-group \"post-initial\"\n	salience 40000\n	no-loop\n	when\n		\n		\n		BILPRD: waterworks.facts.WaterBillingPeriod (  TODATE:toperiod ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"BILPRD\", BILPRD );\n		\n		bindings.put(\"TODATE\", TODATE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billingperiod\", BILPRD );\n_p0.put( \"readingdate\", (new ActionExpression(\"@DAYADD( TODATE , 2 )\", bindings)) );\naction.execute( \"set-waterworks-billing-period\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL2ae95b31:170896138b4:-7bf8', '\npackage waterworksbillingschedule.WATER_BILLING_PERIOD_30;\nimport waterworksbillingschedule.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"WATER_BILLING_PERIOD_30\"\n	agenda-group \"post-initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		WBS: waterworks.facts.WaterBlockSchedule (  id matches \"30\" ) \n		\n		BILPRD: waterworks.facts.WaterBillingPeriod (  YEAR:year,MON:month ) \n		\n		HOLIDAYS: treasury.facts.HolidayFact (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"WBS\", WBS );\n		\n		bindings.put(\"YEAR\", YEAR );\n		\n		bindings.put(\"BILPRD\", BILPRD );\n		\n		bindings.put(\"MON\", MON );\n		\n		bindings.put(\"HOLIDAYS\", HOLIDAYS );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billingperiod\", BILPRD );\n_p0.put( \"fromperiod\", (new ActionExpression(\"@DATE(YEAR  , MON,  1 )\", bindings)) );\n_p0.put( \"toperiod\", (new ActionExpression(\"@MONTHEND(   @DATE(  YEAR, MON,  1 )  )\", bindings)) );\naction.execute( \"set-waterworks-billing-period\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL5939ba7a:16927ecacfc:-4dc9', '\npackage waterworkscomputation.COMPUTATION_FOR_LOT_DONOR;\nimport waterworkscomputation.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTATION_FOR_LOT_DONOR\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		\n		 waterworks.facts.WaterworksAttribute (  name matches \"LOT_DONOR\" ) \n		\n		WC: waterworks.facts.WaterConsumption (  VOL:volume ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VOL\", VOL );\n		\n		bindings.put(\"WC\", WC );\n		\n	RangeEntry re0 = new RangeEntry(\"COMPUTATION_FOR_LOT_DONOR\");\nre0.setBindings(bindings);\nre0.setIntvalue(VOL);\nre0.getParams().put( \"amount\", 0.0 );\nre0.getParams().put( \"ref\", WC );\ninsert(re0);\n\nend\n\n\n	\nrule \"compute-consumption_0_0\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_LOT_DONOR\", intvalue <= 10.00 )\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"0\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_1\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_LOT_DONOR\", intvalue > 10.00, intvalue <= 20.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"62\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_2\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_LOT_DONOR\", intvalue > 20.00, intvalue <= 30.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"((VOL-10)*7)+62\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_3\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_LOT_DONOR\", intvalue > 30.00, intvalue <= 40.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"((VOL-20)*8)+132\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_4\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_LOT_DONOR\", intvalue > 40.00, intvalue <= 50.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"((VOL-30)*11)+212\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_5\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_LOT_DONOR\", intvalue > 50.00, intvalue <= 60.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"((VOL-40)*14)+322\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_6\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_LOT_DONOR\", intvalue > 60.00, intvalue <= 70.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"((VOL-50)*17)+462\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_7\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_LOT_DONOR\", intvalue > 70.00, intvalue <= 80.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"((VOL-60)*20)+632\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_8\"\n	agenda-group \"initial\"\n	salience 80000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_LOT_DONOR\", intvalue > 80.00, intvalue <= 90.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"((VOL-70)*23)+832\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL5939ba7a:16927ecacfc:-6cc0', '\npackage waterworkscomputation.COMMERCIAL;\nimport waterworkscomputation.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMMERCIAL\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		 waterworks.facts.WaterAccount (  classification matches \"COMMERCIAL\" ) \n		\n		WC: waterworks.facts.WaterConsumption (  VOL:volume ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VOL\", VOL );\n		\n		bindings.put(\"WC\", WC );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"VOL * 23\", bindings)) );\n_p0.put( \"ref\", WC );\naction.execute( \"compute-consumption\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RULa6b099d:eb1f3248b7:-75ed', '\npackage waterworkscomputation.COMPUTATION_FOR_COMMERCIAL;\nimport waterworkscomputation.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTATION_FOR_COMMERCIAL\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		 waterworks.facts.WaterAccount (  classification matches \"COMMERCIAL\" ) \n		\n		WC: waterworks.facts.WaterConsumption (  VOL:volume ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VOL\", VOL );\n		\n		bindings.put(\"WC\", WC );\n		\n	RangeEntry re0 = new RangeEntry(\"COMPUTATION_FOR_COMMERCIAL\");\nre0.setBindings(bindings);\nre0.setIntvalue(VOL);\nre0.getParams().put( \"amount\", 0.0 );\nre0.getParams().put( \"ref\", WC );\ninsert(re0);\n\nend\n\n\n	\nrule \"compute-consumption_0_0\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_COMMERCIAL\", intvalue <= 10.00 )\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"40\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_1\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_COMMERCIAL\", intvalue > 10.00, intvalue <= 20.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"40 + ((VOL-10) * 4.60)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_2\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_COMMERCIAL\", intvalue > 20.00, intvalue <= 30.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"86 + ((VOL-20) * 5.60)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_3\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_COMMERCIAL\", intvalue > 30.00, intvalue <= 40.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"142 + ((VOL-30) * 6.80)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_4\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_COMMERCIAL\", intvalue > 40.00, intvalue <= 50.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"210 + ((VOL-40) * 8.20)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_5\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_COMMERCIAL\", intvalue > 50.00 )\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"292 + ((VOL-50) * 10.00)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RULa6b099d:eb1f3248b7:-7630', '\npackage waterworkscomputation.COMPUTATION_FOR_RESIDENTAIL;\nimport waterworkscomputation.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"COMPUTATION_FOR_RESIDENTAIL\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		 waterworks.facts.WaterAccount (  classification matches \"RESIDENTIAL|GOVERNMENT\" ) \n		\n		WC: waterworks.facts.WaterConsumption (  VOL:volume ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VOL\", VOL );\n		\n		bindings.put(\"WC\", WC );\n		\n	RangeEntry re0 = new RangeEntry(\"COMPUTATION_FOR_RESIDENTAIL\");\nre0.setBindings(bindings);\nre0.setIntvalue(VOL);\nre0.getParams().put( \"amount\", 0.0 );\nre0.getParams().put( \"ref\", WC );\ninsert(re0);\n\nend\n\n\n	\nrule \"compute-consumption_0_0\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_RESIDENTAIL\", intvalue <= 10.00 )\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"20\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_1\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_RESIDENTAIL\", intvalue > 10.00, intvalue <= 20.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"20 + ((VOL-10) * 2.30)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_2\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_RESIDENTAIL\", intvalue > 20.00, intvalue <= 30.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"43 + ((VOL-20) * 2.80)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_3\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_RESIDENTAIL\", intvalue > 30.00, intvalue <= 40.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"71 + ((VOL-30) * 3.40)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_4\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_RESIDENTAIL\", intvalue > 40.00, intvalue <= 50.00 )\n		\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"105 + ((VOL-40) * 4.10)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	\nrule \"compute-consumption_0_5\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		rv: RangeEntry( id==\"COMPUTATION_FOR_RESIDENTAIL\", intvalue > 50.00 )\n		\n		\n	then\n		Map bindings = rv.getBindings();\n		Map params = rv.getParams();\n		params.put( \"amount\", (new ActionExpression(\"146 + ((VOL-50) * 5.00)\", bindings)) );	\n		 \n		action.execute( \"compute-consumption\",params, drools);\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RULbd2aa65:17089d46f09:-7ded', '\npackage waterworksbilling.SET_DUE_DATE;\nimport waterworksbilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_DUE_DATE\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		BILPRD: waterworks.facts.WaterBillingPeriod (  DUEDATE:duedate,YR:year,MON:month ) \n		\n		WBI: waterworks.facts.WaterBillItem (  year == YR,month == MON ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"BILPRD\", BILPRD );\n		\n		bindings.put(\"DUEDATE\", DUEDATE );\n		\n		bindings.put(\"WBI\", WBI );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"MON\", MON );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"billitem\", WBI );\n_p0.put( \"fieldname\", \"duedate\" );\n_p0.put( \"value\", (new ActionExpression(\"DUEDATE\", bindings)) );\naction.execute( \"set-billitem-property\",_p0,drools);\n\nend\n\n\n	');
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_fact
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_fact`;
CREATE TABLE `sys_rule_fact` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `factclass` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `defaultvarname` varchar(25) DEFAULT NULL,
  `dynamic` int(11) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `dynamicfieldname` varchar(50) DEFAULT NULL,
  `builtinconstraints` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `factsuperclass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_fact
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_fact` VALUES ('com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', 'Current Date', 'com.rameses.rules.common.CurrentDate', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SYSTEM', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.Attribute', 'treasury.facts.Attribute', 'Attribute', 'treasury.facts.Attribute', 1, NULL, 'ATT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.BillDate', 'treasury.facts.BillDate', 'Bill Date', 'treasury.facts.BillDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.BillItem', 'treasury.facts.BillItem', 'Bill Item', 'treasury.facts.BillItem', 1, NULL, 'BILLITEM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.CashReceipt', 'treasury.facts.CashReceipt', 'Cash Receipt', 'treasury.facts.CashReceipt', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.CreditBalanceBillItem', 'treasury.facts.CreditBalanceBillItem', 'Credit Balance Bill Item', 'treasury.facts.CreditBalanceBillItem', 1, NULL, 'CBAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.CreditBillItem', 'treasury.facts.CreditBillItem', 'Credit Bill Item', 'treasury.facts.CreditBillItem', 1, NULL, 'CRBILL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.DueDate', 'treasury.facts.DueDate', 'Due Date', 'treasury.facts.DueDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.ExcessPayment', 'treasury.facts.ExcessPayment', 'Excess Payment', 'treasury.facts.ExcessPayment', 5, NULL, 'EXPMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'Holidays', 'treasury.facts.HolidayFact', 1, NULL, 'HOLIDAYS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.MonthEntry', 'treasury.facts.MonthEntry', 'Month Entry', 'treasury.facts.MonthEntry', 1, NULL, 'MONTHENTRY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.Payment', 'treasury.facts.Payment', 'Payment', 'treasury.facts.Payment', 5, NULL, 'PMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.Requirement', 'treasury.facts.Requirement', 'Requirement', 'treasury.facts.Requirement', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'treasury', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarDate', 'treasury.facts.VarDate', 'Variable Date', 'treasury.facts.VarDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarDecimal', 'treasury.facts.VarDecimal', 'Var Decimal', 'treasury.facts.VarDecimal', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarInteger', 'treasury.facts.VarInteger', 'Var Integer', 'treasury.facts.VarInteger', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarString', 'treasury.facts.VarString', 'Var String', 'treasury.facts.VarString', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.Sector', 'waterworks.facts.Sector', 'Waterworks Sector', 'waterworks.facts.Sector', 1, NULL, 'WSEC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATERWORKS', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.Stubout', 'waterworks.facts.Stubout', 'Stubout', 'waterworks.facts.Stubout', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'waterworks', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.WaterAccount', 'waterworks.facts.WaterAccount', 'Water Account', 'waterworks.facts.WaterAccount', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'waterworks', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.WaterBillingPeriod', 'waterworks.facts.WaterBillingPeriod', 'Water Billing Period', 'waterworks.facts.WaterBillingPeriod', 1, NULL, 'BILPRD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.WaterBillItem', 'waterworks.facts.WaterBillItem', 'Water Bill Item', 'waterworks.facts.WaterBillItem', 0, NULL, 'WBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATERWORKS', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.WaterBlockSchedule', 'waterworks.facts.WaterBlockSchedule', 'Water Block Schedule', 'waterworks.facts.WaterBlockSchedule', 1, NULL, 'WBS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATERWORKS', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.WaterConsumption', 'waterworks.facts.WaterConsumption', 'Water Consumption', 'waterworks.facts.WaterConsumption', 1, NULL, 'WC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATERWORKS', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.WaterInstallment', 'waterworks.facts.WaterInstallment', 'Waterworks Installment', 'waterworks.facts.WaterInstallment', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'waterworks', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.WaterMeter', 'waterworks.facts.WaterMeter', 'Water Meter', 'waterworks.facts.WaterMeter', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATERWORKS', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.WaterworksAttribute', 'waterworks.facts.WaterworksAttribute', 'Waterworks Attribute', 'waterworks.facts.WaterworksAttribute', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATERWORKS', NULL);
INSERT INTO `sys_rule_fact` VALUES ('waterworks.facts.Zone', 'waterworks.facts.Zone', 'Waterworks Zone', 'waterworks.facts.Zone', 1, NULL, 'WZON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WATERWORKS', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_fact_field
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_fact_field`;
CREATE TABLE `sys_rule_fact_field` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `multivalued` int(11) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_rule_fact_field_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_fact_field
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.date', 'com.rameses.rules.common.CurrentDate', 'date', 'Date', 'date', 4, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.day', 'com.rameses.rules.common.CurrentDate', 'day', 'Day', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.month', 'com.rameses.rules.common.CurrentDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.qtr', 'com.rameses.rules.common.CurrentDate', 'qtr', 'Qtr', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.year', 'com.rameses.rules.common.CurrentDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.Attribute.name', 'treasury.facts.Attribute', 'name', 'Name', 'string', 1, 'lookup', 'attribute:lookup', 'name', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.date', 'treasury.facts.BillDate', 'date', 'Date', 'date', 1, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.day', 'treasury.facts.BillDate', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.month', 'treasury.facts.BillDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.qtr', 'treasury.facts.BillDate', 'qtr', 'Qtr', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.year', 'treasury.facts.BillDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.account', 'treasury.facts.BillItem', 'account', 'Account', 'string', 3, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'object', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.account.objid', 'treasury.facts.BillItem', 'account.objid', 'Account', 'string', 2, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.amount', 'treasury.facts.BillItem', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.billcode', 'treasury.facts.BillItem', 'billcode', 'Bill code', 'string', 16, 'lookup', 'waterworks_itemaccount:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.billrefid', 'treasury.facts.BillItem', 'billrefid', 'Bill Ref ID', 'string', 7, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.discount', 'treasury.facts.BillItem', 'discount', 'Discount', 'decimal', 8, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.duedate', 'treasury.facts.BillItem', 'duedate', 'Due Date', 'date', 4, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.fromdate', 'treasury.facts.BillItem', 'fromdate', 'From Date', 'date', 14, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.interest', 'treasury.facts.BillItem', 'interest', 'Interest', 'decimal', 11, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.month', 'treasury.facts.BillItem', 'month', 'Month', 'integer', 13, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.org', 'treasury.facts.BillItem', 'org', 'Org', 'string', 10, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'enterprise.facts.Org', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.parentaccount', 'treasury.facts.BillItem', 'parentaccount', 'Parent Account', 'string', 9, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'object', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.paypriority', 'treasury.facts.BillItem', 'paypriority', 'Pay Priority', 'integer', 18, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.refid', 'treasury.facts.BillItem', 'refid', 'Ref ID', 'string', 16, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.remarks', 'treasury.facts.BillItem', 'remarks', 'Remarks', 'string', 17, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.sortorder', 'treasury.facts.BillItem', 'sortorder', 'Sort Order', 'integer', 19, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.surcharge', 'treasury.facts.BillItem', 'surcharge', 'Surcharge', 'decimal', 5, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.tag', 'treasury.facts.BillItem', 'tag', 'Tag', 'string', 20, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.todate', 'treasury.facts.BillItem', 'todate', 'To Date', 'date', 15, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.txntype', 'treasury.facts.BillItem', 'txntype', 'Txn Type', 'string', 6, 'lookup', 'billitem_txntype:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.year', 'treasury.facts.BillItem', 'year', 'Year', 'integer', 12, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.CashReceipt.receiptdate', 'treasury.facts.CashReceipt', 'receiptdate', 'Receipt Date', 'date', 2, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.CashReceipt.txnmode', 'treasury.facts.CashReceipt', 'txnmode', 'Txn Mode', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.CreditBalanceBillItem.amount', 'treasury.facts.CreditBalanceBillItem', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.CreditBalanceBillItem.billcode', 'treasury.facts.CreditBalanceBillItem', 'billcode', 'Bill code', 'string', 2, 'lookup', 'waterworks_itemaccount:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.CreditBillItem.amount', 'treasury.facts.CreditBillItem', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.CreditBillItem.billcode', 'treasury.facts.CreditBillItem', 'billcode', 'Bill code', 'string', 2, 'lookup', 'waterworks_itemaccount:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.date', 'treasury.facts.DueDate', 'date', 'Date', 'date', 1, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.day', 'treasury.facts.DueDate', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.month', 'treasury.facts.DueDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.qtr', 'treasury.facts.DueDate', 'qtr', 'Qtr', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.year', 'treasury.facts.DueDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.ExcessPayment.amount', 'treasury.facts.ExcessPayment', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.HolidayFact.id', 'treasury.facts.HolidayFact', 'id', 'ID', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.duedate', 'treasury.facts.MonthEntry', 'duedate', 'Due date', 'date', 13, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.first', 'treasury.facts.MonthEntry', 'first', 'First', 'boolean', 11, 'boolean', NULL, NULL, NULL, NULL, NULL, NULL, 'boolean', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.fromdate', 'treasury.facts.MonthEntry', 'fromdate', 'From Date', 'date', 4, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.fromday', 'treasury.facts.MonthEntry', 'fromday', 'From Day', 'integer', 6, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.index', 'treasury.facts.MonthEntry', 'index', 'Index', 'integer', 10, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.last', 'treasury.facts.MonthEntry', 'last', 'Last', 'boolean', 12, 'boolean', NULL, NULL, NULL, NULL, NULL, NULL, 'boolean', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.maxdays', 'treasury.facts.MonthEntry', 'maxdays', 'Month Max Days', 'integer', 9, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.month', 'treasury.facts.MonthEntry', 'month', 'Month', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.numdays', 'treasury.facts.MonthEntry', 'numdays', 'No. of Days', 'integer', 8, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.qtr', 'treasury.facts.MonthEntry', 'qtr', 'Qtr', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.todate', 'treasury.facts.MonthEntry', 'todate', 'To Date', 'date', 5, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.today', 'treasury.facts.MonthEntry', 'today', 'To Day', 'integer', 7, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.year', 'treasury.facts.MonthEntry', 'year', 'Year', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.Payment.amount', 'treasury.facts.Payment', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.Requirement.code', 'treasury.facts.Requirement', 'code', 'Code', 'string', 1, 'lookup', 'requirementtype:lookup', 'code', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.Requirement.completed', 'treasury.facts.Requirement', 'completed', 'Completed', 'boolean', 2, 'boolean', NULL, NULL, NULL, NULL, NULL, NULL, 'boolean', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.date', 'treasury.facts.VarDate', 'date', 'Date', 'date', 1, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.day', 'treasury.facts.VarDate', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.month', 'treasury.facts.VarDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.qtr', 'treasury.facts.VarDate', 'qtr', 'Qtr', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.tag', 'treasury.facts.VarDate', 'tag', 'Tag', 'string', 6, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.year', 'treasury.facts.VarDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDecimal.tag', 'treasury.facts.VarDecimal', 'tag', 'Tag', 'string', 2, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDecimal.value', 'treasury.facts.VarDecimal', 'value', 'Value', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarInteger.tag', 'treasury.facts.VarInteger', 'tag', 'Tag', 'string', 2, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarInteger.value', 'treasury.facts.VarInteger', 'value', 'Value', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarString.tag', 'treasury.facts.VarString', 'tag', 'Tag', 'string', 2, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarString.value', 'treasury.facts.VarString', 'value', 'Value', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.Sector.objid', 'waterworks.facts.Sector', 'objid', 'ID', 'string', 1, 'lookup', 'waterworks_sector:lookup', 'objid', 'code', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.Stubout.barangay', 'waterworks.facts.Stubout', 'barangay', 'Barangay', 'string', 3, 'lookup', 'barangay:lookup', 'objid', 'name', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.Stubout.sector', 'waterworks.facts.Stubout', 'sector', 'Sector', 'string', 2, 'lookup', 'waterworks_sector:lookup', 'objid', 'code', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.Stubout.zone', 'waterworks.facts.Stubout', 'zone', 'Zone', 'string', 1, 'lookup', 'waterworks_sector_zone:lookup', 'objid', 'code', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterAccount.barangay', 'waterworks.facts.WaterAccount', 'barangay', 'Barangay', 'string', 3, 'lookup', 'barangay:lookup', 'objid', 'name', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterAccount.classification', 'waterworks.facts.WaterAccount', 'classification', 'Classification', 'string', 1, 'lookup', 'waterworks_classification:lookup', 'objid', 'description', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterAccount.metered', 'waterworks.facts.WaterAccount', 'metered', 'Metered', 'boolean', 6, 'boolean', NULL, NULL, NULL, NULL, NULL, NULL, 'boolean', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterAccount.metersize', 'waterworks.facts.WaterAccount', 'metersize', 'Meter Size', 'string', 2, 'lookup', 'waterworks_metersize:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterAccount.state', 'waterworks.facts.WaterAccount', 'state', 'State', 'string', 5, 'lov', NULL, NULL, NULL, NULL, NULL, NULL, 'string', 'WATERWORKS_ACCOUNT_STATE');
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterAccount.units', 'waterworks.facts.WaterAccount', 'units', 'No. of Units', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillingPeriod.billingduedate', 'waterworks.facts.WaterBillingPeriod', 'billingduedate', 'Billing Due Date', 'date', 7, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillingPeriod.discdate', 'waterworks.facts.WaterBillingPeriod', 'discdate', 'Discount Date', 'date', 8, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillingPeriod.duedate', 'waterworks.facts.WaterBillingPeriod', 'duedate', 'Due Date', 'date', 9, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillingPeriod.fromperiod', 'waterworks.facts.WaterBillingPeriod', 'fromperiod', 'From Period', 'date', 3, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillingPeriod.month', 'waterworks.facts.WaterBillingPeriod', 'month', 'Month', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillingPeriod.readingdate', 'waterworks.facts.WaterBillingPeriod', 'readingdate', 'Reading Date', 'date', 5, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillingPeriod.readingduedate', 'waterworks.facts.WaterBillingPeriod', 'readingduedate', 'Reading Due Date', 'date', 6, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillingPeriod.toperiod', 'waterworks.facts.WaterBillingPeriod', 'toperiod', 'To Period', 'date', 4, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillingPeriod.year', 'waterworks.facts.WaterBillingPeriod', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.account', 'waterworks.facts.WaterBillItem', 'account', 'Account', 'string', 1, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.amount', 'waterworks.facts.WaterBillItem', 'amount', 'Amount', 'decimal', 3, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.amtpaid', 'waterworks.facts.WaterBillItem', 'amtpaid', 'Amt Paid', 'decimal', 17, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.billcode', 'waterworks.facts.WaterBillItem', 'billcode', 'Bill code', 'string', 2, 'lookup', 'waterworks_itemaccount:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.duedate', 'waterworks.facts.WaterBillItem', 'duedate', 'Due Date', 'date', 7, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.fromdate', 'waterworks.facts.WaterBillItem', 'fromdate', 'From Date', 'date', 13, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.frommonth', 'waterworks.facts.WaterBillItem', 'frommonth', 'From Month', 'integer', 10, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.fromyear', 'waterworks.facts.WaterBillItem', 'fromyear', 'From Year', 'integer', 9, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.month', 'waterworks.facts.WaterBillItem', 'month', 'Month', 'integer', 6, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.partialunpaid', 'waterworks.facts.WaterBillItem', 'partialunpaid', 'Partial Unpaid', 'decimal', 18, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.principal', 'waterworks.facts.WaterBillItem', 'principal', 'Principal', 'decimal', 16, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.remarks', 'waterworks.facts.WaterBillItem', 'remarks', 'Remarks', 'string', 15, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.todate', 'waterworks.facts.WaterBillItem', 'todate', 'To Date', 'date', 14, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.tomonth', 'waterworks.facts.WaterBillItem', 'tomonth', 'To Month', 'integer', 12, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.toyear', 'waterworks.facts.WaterBillItem', 'toyear', 'To Year', 'integer', 11, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.txntype', 'waterworks.facts.WaterBillItem', 'txntype', 'Txn Type', 'string', 4, 'lov', NULL, NULL, NULL, NULL, NULL, NULL, 'string', 'WATERWORKS_BILLING_GROUP_OPTION');
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.volume', 'waterworks.facts.WaterBillItem', 'volume', 'Volume', 'integer', 8, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBillItem.year', 'waterworks.facts.WaterBillItem', 'year', 'Year', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterBlockSchedule.id', 'waterworks.facts.WaterBlockSchedule', 'id', 'ID', 'string', 1, 'lookup', 'waterworks_block_schedule:lookup', 'objid', 'objid', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterConsumption.amount', 'waterworks.facts.WaterConsumption', 'amount', 'Amount', 'decimal', 4, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterConsumption.amtdue', 'waterworks.facts.WaterConsumption', 'amtdue', 'Amount Due', 'decimal', 5, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterConsumption.disconnectiondate', 'waterworks.facts.WaterConsumption', 'disconnectiondate', 'Disconnection Date', 'date', 8, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterConsumption.duedate', 'waterworks.facts.WaterConsumption', 'duedate', 'Due Date', 'date', 6, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterConsumption.month', 'waterworks.facts.WaterConsumption', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterConsumption.refid', 'waterworks.facts.WaterConsumption', 'refid', 'Ref Id', 'string', 9, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterConsumption.status', 'waterworks.facts.WaterConsumption', 'status', 'Status', 'string', 7, 'lov', NULL, NULL, NULL, NULL, NULL, NULL, 'string', 'WATERWORKS_BILLING_STATUS');
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterConsumption.volume', 'waterworks.facts.WaterConsumption', 'volume', 'Volume', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterConsumption.year', 'waterworks.facts.WaterConsumption', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterInstallment.amount', 'waterworks.facts.WaterInstallment', 'amount', 'Amount', 'decimal', 3, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterInstallment.month', 'waterworks.facts.WaterInstallment', 'month', 'Month', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterInstallment.refid', 'waterworks.facts.WaterInstallment', 'refid', 'RefId', 'string', 4, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterInstallment.txntype', 'waterworks.facts.WaterInstallment', 'txntype', 'Txn Type', 'string', 5, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterInstallment.year', 'waterworks.facts.WaterInstallment', 'year', 'Year', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterMeter.capacity', 'waterworks.facts.WaterMeter', 'capacity', 'Capacity', 'string', 3, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'WATERWORKS_METER_CAPACITY', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterMeter.sizeid', 'waterworks.facts.WaterMeter', 'sizeid', 'Size', 'string', 1, 'lookup', 'waterworks_metersize:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterMeter.state', 'waterworks.facts.WaterMeter', 'state', 'Status', 'string', 2, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'WATERWORKS_METER_STATE', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.WaterworksAttribute.name', 'waterworks.facts.WaterworksAttribute', 'name', 'Name', 'string', 1, 'lookup', 'waterworks_attribute:lookup', 'name', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.Zone.barangayid', 'waterworks.facts.Zone', 'barangayid', 'Barangay', 'string', 3, 'lookup', 'barangay:lookup', 'objid', 'name', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.Zone.objid', 'waterworks.facts.Zone', 'objid', 'Zone', 'string', 1, 'lookup', 'waterworks_zone:lookup', 'objid', 'code', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('waterworks.facts.Zone.sectorid', 'waterworks.facts.Zone', 'sectorid', 'Sector', 'string', 2, 'lookup', 'waterworks_sector:lookup', 'objid', 'code', NULL, NULL, NULL, 'string', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_rulegroup
-- ----------------------------
DROP TABLE IF EXISTS `sys_rulegroup`;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`ruleset`) USING BTREE,
  KEY `ix_ruleset` (`ruleset`) USING BTREE,
  CONSTRAINT `fk_sys_rulegroup_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rulegroup
-- ----------------------------
BEGIN;
INSERT INTO `sys_rulegroup` VALUES ('account-mapping', 'waterworksbilling', 'Account Mapping', 8);
INSERT INTO `sys_rulegroup` VALUES ('billing', 'waterworksbilling', 'Billing Initial', 1);
INSERT INTO `sys_rulegroup` VALUES ('build-schedule', 'waterworksbilling', 'Build Schedule', 0);
INSERT INTO `sys_rulegroup` VALUES ('computefee', 'waterworksapplication', 'Compute Fee', 1);
INSERT INTO `sys_rulegroup` VALUES ('computefee', 'waterworksbilling', 'Compute Fee', 2);
INSERT INTO `sys_rulegroup` VALUES ('discount', 'waterworksbilling', 'Compute Discount', 3);
INSERT INTO `sys_rulegroup` VALUES ('initial', 'waterworksapplication', 'Initial', 0);
INSERT INTO `sys_rulegroup` VALUES ('initial', 'waterworksbilling', 'Initial', 0);
INSERT INTO `sys_rulegroup` VALUES ('initial', 'waterworksbillingschedule', 'Initial', 0);
INSERT INTO `sys_rulegroup` VALUES ('initial', 'waterworkscomputation', 'Initial', 1);
INSERT INTO `sys_rulegroup` VALUES ('interest', 'waterworksbilling', 'Compute Interest', 5);
INSERT INTO `sys_rulegroup` VALUES ('payment', 'waterworksbilling', 'Payment', 6);
INSERT INTO `sys_rulegroup` VALUES ('post-initial', 'waterworksbillingschedule', 'Post Initial', 1);
INSERT INTO `sys_rulegroup` VALUES ('pre-computation', 'waterworkscomputation', 'Pre-Computation', 0);
INSERT INTO `sys_rulegroup` VALUES ('requirement', 'waterworksapplication', 'Requirements', 5);
INSERT INTO `sys_rulegroup` VALUES ('summary', 'waterworksapplication', 'Summary', 5);
INSERT INTO `sys_rulegroup` VALUES ('summary', 'waterworksbilling', 'Summary', 7);
INSERT INTO `sys_rulegroup` VALUES ('surcharge', 'waterworksbilling', 'Compute Surcharge', 4);
COMMIT;

-- ----------------------------
-- Table structure for sys_ruleset
-- ----------------------------
DROP TABLE IF EXISTS `sys_ruleset`;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `packagename` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ruleset
-- ----------------------------
BEGIN;
INSERT INTO `sys_ruleset` VALUES ('waterworksapplication', 'Water Works Application', 'waterworksapplication', 'WATERWORKS', 'RULE_AUTHOR', NULL);
INSERT INTO `sys_ruleset` VALUES ('waterworksbilling', 'Water Works Billing', 'waterworksbilling', 'WATERWORKS', 'RULE_AUTHOR', NULL);
INSERT INTO `sys_ruleset` VALUES ('waterworksbillingschedule', 'Water Works Billing Schedule', 'waterworksbillingschedule', 'WATERWORKS', 'RULE_AUTHOR', NULL);
INSERT INTO `sys_ruleset` VALUES ('waterworkscomputation', 'Water Works Computation', 'waterworkscomputation', 'WATERWORKS', 'RULE_AUTHOR', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_ruleset_actiondef
-- ----------------------------
DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`actiondef`) USING BTREE,
  KEY `ix_actiondef` (`actiondef`) USING BTREE,
  CONSTRAINT `fk_sys_ruleset_actiondef_actiondef` FOREIGN KEY (`actiondef`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `fk_sys_ruleset_actiondef_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ruleset_actiondef
-- ----------------------------
BEGIN;
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksapplication', 'enterprise.actions.AddRequirement');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'enterprise.actions.PrintTest');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworkscomputation', 'enterprise.actions.ThrowException');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'treasury.actions.AddCreditBillItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'treasury.actions.AddDiscountItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'treasury.actions.AddInterestItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'treasury.actions.AddSurchargeItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'treasury.actions.AddVarDate');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbillingschedule', 'treasury.actions.AddVarDate');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbillingschedule', 'treasury.actions.AddVarDecimal');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbillingschedule', 'treasury.actions.AddVarInteger');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworkscomputation', 'treasury.actions.AddVarInteger');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbillingschedule', 'treasury.actions.AddVarString');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'treasury.actions.ApplyPayment');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksapplication', 'treasury.actions.ComputeFee');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'treasury.actions.RemoveDiscountItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksapplication', 'treasury.actions.SetBillItemAccount');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'treasury.actions.SetBillItemAccount');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'treasury.actions.SetBillItemProperty');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'waterworks.actions.AddRepeatingFee');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'waterworks.actions.AddWaterBillItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworkscomputation', 'waterworks.actions.ComputeConsumption');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbillingschedule', 'waterworks.actions.SetWaterBillingPeriod');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworksbilling', 'waterworks.actions.SetWaterConsumptionProperty');
INSERT INTO `sys_ruleset_actiondef` VALUES ('waterworkscomputation', 'waterworks.actions.SetWaterConsumptionProperty');
COMMIT;

-- ----------------------------
-- Table structure for sys_ruleset_fact
-- ----------------------------
DROP TABLE IF EXISTS `sys_ruleset_fact`;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`rulefact`) USING BTREE,
  KEY `ix_rulefact` (`rulefact`) USING BTREE,
  CONSTRAINT `fk_sys_ruleset_fact_rulefact` FOREIGN KEY (`rulefact`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `fk_sys_ruleset_fact_ruleset` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ruleset_fact
-- ----------------------------
BEGIN;
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'com.rameses.rules.common.CurrentDate');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.BillDate');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksapplication', 'treasury.facts.BillItem');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.BillItem');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.CashReceipt');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.CreditBalanceBillItem');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.CreditBillItem');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.DueDate');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.ExcessPayment');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.HolidayFact');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbillingschedule', 'treasury.facts.HolidayFact');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.MonthEntry');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.Payment');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksapplication', 'treasury.facts.Requirement');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'treasury.facts.VarDate');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbillingschedule', 'treasury.facts.VarDate');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbillingschedule', 'treasury.facts.VarDecimal');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbillingschedule', 'treasury.facts.VarInteger');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworkscomputation', 'treasury.facts.VarInteger');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbillingschedule', 'treasury.facts.VarString');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.Sector');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.Stubout');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.WaterAccount');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworkscomputation', 'waterworks.facts.WaterAccount');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.WaterBillingPeriod');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbillingschedule', 'waterworks.facts.WaterBillingPeriod');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.WaterBillItem');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.WaterBlockSchedule');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbillingschedule', 'waterworks.facts.WaterBlockSchedule');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.WaterConsumption');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworkscomputation', 'waterworks.facts.WaterConsumption');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.WaterInstallment');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworkscomputation', 'waterworks.facts.WaterMeter');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.WaterworksAttribute');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworkscomputation', 'waterworks.facts.WaterworksAttribute');
INSERT INTO `sys_ruleset_fact` VALUES ('waterworksbilling', 'waterworks.facts.Zone');
COMMIT;

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------
BEGIN;
INSERT INTO `sys_sequence` VALUES ('CHANGEINFO202002', 2);
INSERT INTO `sys_sequence` VALUES ('WAPP-032020-00000', 10);
COMMIT;

-- ----------------------------
-- Table structure for sys_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `sys_usergroup`;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `domain` varchar(25) DEFAULT NULL,
  `userclass` varchar(25) DEFAULT NULL,
  `orgclass` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_usergroup
-- ----------------------------
BEGIN;
INSERT INTO `sys_usergroup` VALUES ('WATERWORKS.MASTER', 'WATERWORKS MASTER', 'WATERWORKS', 'usergroup', NULL, 'MASTER');
INSERT INTO `sys_usergroup` VALUES ('WATERWORKS.READER', 'WATERWORKS READER', 'WATERWORKS', 'usergroup', NULL, 'READER');
INSERT INTO `sys_usergroup` VALUES ('WATERWORKS.REPORT', 'WATERWORKS REPORT', 'WATERWORKS', 'usergroup', NULL, 'REPORT');
INSERT INTO `sys_usergroup` VALUES ('WATERWORKS.RULE_AUTHOR', 'WATERWORKS RULE_AUTHOR', 'WATERWORKS', 'usergroup', NULL, 'RULE_AUTHOR');
INSERT INTO `sys_usergroup` VALUES ('WATERWORKS.SHARED', 'WATERWORKS SHARED', 'WATERWORKS', 'usergroup', NULL, 'SHARED');
COMMIT;

-- ----------------------------
-- Table structure for sys_var
-- ----------------------------
DROP TABLE IF EXISTS `sys_var`;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` longtext,
  `description` varchar(255) DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_wf
-- ----------------------------
DROP TABLE IF EXISTS `sys_wf`;
CREATE TABLE `sys_wf` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_wf
-- ----------------------------
BEGIN;
INSERT INTO `sys_wf` VALUES ('waterworks_application', 'Waterworks Application', 'WATERWORKS');
INSERT INTO `sys_wf` VALUES ('waterworks_batch_billing', 'Waterworks Batch Billing', 'WATERWORKS');
COMMIT;

-- ----------------------------
-- Table structure for sys_wf_node
-- ----------------------------
DROP TABLE IF EXISTS `sys_wf_node`;
CREATE TABLE `sys_wf_node` (
  `name` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `nodetype` varchar(10) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `salience` int(11) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `ui` text,
  `properties` text,
  `tracktime` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`processname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_wf_node
-- ----------------------------
BEGIN;
INSERT INTO `sys_wf_node` VALUES ('approval', 'waterworks_application', 'Approval', 'state', 4, NULL, NULL, NULL, '[type:\"state\",fillColor:\"#c0c0c0\",pos:[568,73],size:[146,63]]', '[:]', 1);
INSERT INTO `sys_wf_node` VALUES ('approved', 'waterworks_batch_billing', 'Approved', 'state', 7, 0, 'WATERWORKS', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[748,103],size:[100,50]]', '[show_reading:true]', NULL);
INSERT INTO `sys_wf_node` VALUES ('assessment', 'waterworks_application', 'Assessment', 'state', 3, NULL, NULL, NULL, '[type:\"state\",fillColor:\"#c0c0c0\",pos:[367,69],size:[134,65]]', '[:]', 1);
INSERT INTO `sys_wf_node` VALUES ('draft', 'waterworks_batch_billing', 'Draft', 'state', 2, 0, 'WATERWORKS', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[123,170],size:[109,53]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('end', 'waterworks_application', 'Completed', 'end', 7, NULL, NULL, NULL, '[type:\"end\",fillColor:\"#ff0000\",pos:[756,57],size:[32,32]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('end', 'waterworks_batch_billing', 'Completed', 'end', 8, 0, 'WATERWORKS', NULL, '[fillColor:\"#ff0000\",type:\"end\",pos:[923,260],size:[32,32]]', '[show_reading:true]', NULL);
INSERT INTO `sys_wf_node` VALUES ('for-approval', 'waterworks_batch_billing', 'For Approval', 'state', 6, 0, 'WATERWORKS', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[661,222],size:[100,50]]', '[show_reading:true]', NULL);
INSERT INTO `sys_wf_node` VALUES ('for-reading', 'waterworks_batch_billing', 'For Reading', 'state', 5, 0, 'WATERWORKS', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[576,53],size:[100,50]]', '[show_reading:true]', NULL);
INSERT INTO `sys_wf_node` VALUES ('for-review', 'waterworks_batch_billing', 'For Review', 'state', 4, 0, 'WATERWORKS', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[438,100],size:[100,50]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('payment', 'waterworks_application', 'Payment', 'state', 5, NULL, NULL, NULL, '[type:\"state\",fillColor:\"#c0c0c0\",pos:[340,166],size:[130,67]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('processing', 'waterworks_batch_billing', 'Processing', 'state', 3, 0, 'WATERWORKS', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[249,76],size:[100,50]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('releasing', 'waterworks_application', 'Releasing', 'state', 6, NULL, NULL, NULL, '[type:\"state\",fillColor:\"#c0c0c0\",pos:[573,165],size:[154,69]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('start', 'waterworks_application', 'start', 'start', 1, NULL, NULL, NULL, '[type:\"start\",fillColor:\"#00ff00\",pos:[52,22],size:[32,32]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('start', 'waterworks_batch_billing', 'Start', 'start', 1, 0, 'WATERWORKS', NULL, '[fillColor:\"#00ff00\",type:\"start\",pos:[72,60],size:[32,32]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('verify-requirements', 'waterworks_application', 'Verify Requirements', 'state', 2, NULL, NULL, NULL, '[type:\"state\",fillColor:\"#c0c0c0\",pos:[99,66],size:[160,66]]', '[:]', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_wf_transition
-- ----------------------------
DROP TABLE IF EXISTS `sys_wf_transition`;
CREATE TABLE `sys_wf_transition` (
  `parentid` varchar(50) NOT NULL DEFAULT '',
  `processname` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  `eval` mediumtext,
  `properties` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `ui` text,
  PRIMARY KEY (`parentid`,`processname`,`to`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_wf_transition
-- ----------------------------
BEGIN;
INSERT INTO `sys_wf_transition` VALUES ('approval', 'waterworks_application', 'approve', 'payment', 0, NULL, '[showConfirm:true,confirmMessage:\"You are about to approve this for payment. Proceed?\"]', NULL, 'Approve for Payment', '[points:[568,131,470,169],type:\"arrow\",pos:[470,131],size:[98,38]]');
INSERT INTO `sys_wf_transition` VALUES ('approved', 'waterworks_batch_billing', 'post', 'end', 0, NULL, '[showConfirm:true,confirmMessage:\"You are about to post this to the ledger. Proceed?\"]', NULL, 'Post', '[points:[827,148,934,266],type:\"arrow\",pos:[827,148],size:[107,118]]');
INSERT INTO `sys_wf_transition` VALUES ('approved', 'waterworks_batch_billing', 'revert', 'for-reading', 1, NULL, '[:]', NULL, 'Revert', '[points:[748,103,676,77],type:\"arrow\",pos:[676,77],size:[72,26]]');
INSERT INTO `sys_wf_transition` VALUES ('assessment', 'waterworks_application', 'send-for-approval', 'approval', 0, NULL, '[:]', NULL, 'Send for Approval', '[points:[501,100,568,100],type:\"arrow\",pos:[501,100],size:[67,0]]');
INSERT INTO `sys_wf_transition` VALUES ('draft', 'waterworks_batch_billing', 'submit', 'processing', 0, NULL, '[autostart:true]', NULL, 'Submit for Processing', '[points:[210,170,268,125],type:\"arrow\",pos:[210,125],size:[58,45]]');
INSERT INTO `sys_wf_transition` VALUES ('for-approval', 'waterworks_batch_billing', 'approve', 'approved', 0, NULL, '[:]', NULL, 'Approve', '[points:[712,224,773,149],type:\"arrow\",pos:[712,149],size:[61,75]]');
INSERT INTO `sys_wf_transition` VALUES ('for-approval', 'waterworks_batch_billing', 'revert', 'for-reading', 1, NULL, '[:]', NULL, 'Revert', '[points:[661,222,602,104],type:\"arrow\",pos:[602,104],size:[59,118]]');
INSERT INTO `sys_wf_transition` VALUES ('for-reading', 'waterworks_batch_billing', 'submit', 'for-approval', 0, NULL, '[:]', NULL, 'Submit for Approval', '[points:[635,102,692,220],type:\"arrow\",pos:[635,102],size:[57,118]]');
INSERT INTO `sys_wf_transition` VALUES ('for-review', 'waterworks_batch_billing', 'revert', 'draft', 1, NULL, '[:]', NULL, 'Revert', '[points:[492,150,505,213,377,274,232,217],type:\"arrow\",pos:[232,150],size:[273,124]]');
INSERT INTO `sys_wf_transition` VALUES ('for-review', 'waterworks_batch_billing', 'submit', 'for-reading', 0, NULL, '[showPrompt:true]', NULL, 'Submit for Reading', '[points:[538,107,576,95],type:\"arrow\",pos:[538,95],size:[38,12]]');
INSERT INTO `sys_wf_transition` VALUES ('payment', 'waterworks_application', 'post-payment', 'releasing', 0, NULL, '[visibleWhen:\"#{ false }\"]', NULL, 'Post Payment', '[points:[470,200,499,203,573,204],type:\"arrow\",pos:[470,200],size:[103,4]]');
INSERT INTO `sys_wf_transition` VALUES ('processing', 'waterworks_batch_billing', 'submit', 'for-review', 0, NULL, '[:]', NULL, 'Submit for Review', '[points:[311,126,313,147,366,181,442,133],type:\"arrow\",pos:[311,126],size:[131,55]]');
INSERT INTO `sys_wf_transition` VALUES ('releasing', 'waterworks_application', 'release', 'end', 0, NULL, '[showConfirm:true,confirmMessage:\"You are about to release this document. Proceed?\"]', NULL, 'Release', '[points:[684,165,763,89],type:\"arrow\",pos:[684,89],size:[79,76]]');
INSERT INTO `sys_wf_transition` VALUES ('start', 'waterworks_application', 'start', 'verify-requirements', 0, NULL, '[:]', NULL, 'Start', '[points:[84,46,124,66],type:\"arrow\",pos:[84,46],size:[40,20]]');
INSERT INTO `sys_wf_transition` VALUES ('start', 'waterworks_batch_billing', 'submit', 'draft', 0, NULL, '[autostart:true]', NULL, NULL, '[points:[104,80,160,170],type:\"arrow\",pos:[104,80],size:[56,90]]');
INSERT INTO `sys_wf_transition` VALUES ('verify-requirements', 'waterworks_application', 'send-for-assessment', 'assessment', 0, NULL, '[:]', NULL, 'Send for Assessment', '[points:[259,97,367,96],type:\"arrow\",pos:[259,96],size:[108,1]]');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_account
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_account`;
CREATE TABLE `waterworks_account` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `acctno` varchar(50) DEFAULT NULL,
  `acctinfoid` varchar(50) DEFAULT NULL,
  `dtstarted` date DEFAULT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `remarks` text,
  `ukey` varchar(50) NOT NULL DEFAULT '',
  `seqno` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_acctno` (`acctno`,`ukey`) USING BTREE,
  KEY `ix_acctno` (`acctno`) USING BTREE,
  KEY `ix_applicationid` (`applicationid`) USING BTREE,
  KEY `fk_waterworks_account_acctinfoid` (`acctinfoid`),
  CONSTRAINT `fk_waterworks_account_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `fk_waterworks_account_applicationid` FOREIGN KEY (`applicationid`) REFERENCES `waterworks_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_account
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_account` VALUES ('WACC-28e10a38:16bbe4e8bc2:-7dcf', 'ACTIVE', '13-0000002', 'WACC-28e10a38:16bbe4e8bc2:-7dcf', NULL, NULL, NULL, '', 2);
INSERT INTO `waterworks_account` VALUES ('WACC-51948ad8:1708b70634c:-7d03', 'DRAFT', 'WS-00001', 'WACC-51948ad8:1708b70634c:-7d03', NULL, NULL, 'sample', '', 2);
INSERT INTO `waterworks_account` VALUES ('WACC-557573b1:170eb757f03:-7e08', 'DRAFT', 'WF-0001', 'WACC-557573b1:170eb757f03:-7e08', '2020-03-18', NULL, NULL, '', 4);
INSERT INTO `waterworks_account` VALUES ('WACC2c3dd557:170e7c14df4:-7e8e', 'DRAFT', '888-777', 'WACC2c3dd557:170e7c14df4:-7e8e', '2020-03-17', NULL, 'Test', '', 3);
INSERT INTO `waterworks_account` VALUES ('WACC3ea56ca3:1709e985882:-7de0', 'DRAFT', 'WS-XXX-0001', 'WACC3ea56ca3:1709e985882:-7de0', '2020-03-03', NULL, 'new', '', 1);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:-5e01', 'ACTIVE', '13-0000001', 'WACC754b2f40:16d97f4f0d0:-5e01', NULL, NULL, NULL, '', 1);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:-ca7', 'ACTIVE', '13-0000003', 'WACC754b2f40:16d97f4f0d0:-ca7', NULL, NULL, NULL, '', 3);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:1448', 'ACTIVE', '13-0000004', 'WACC754b2f40:16d97f4f0d0:1448', NULL, NULL, NULL, '', 4);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:1b4b', 'ACTIVE', '13-0000005', 'WACC754b2f40:16d97f4f0d0:1b4b', NULL, NULL, NULL, '', 1);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:2c44', 'ACTIVE', '13-0000006', 'WACC754b2f40:16d97f4f0d0:2c44', NULL, NULL, NULL, '', 2);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:2d8e', 'ACTIVE', '13-0000007', 'WACC754b2f40:16d97f4f0d0:2d8e', NULL, NULL, NULL, '', 3);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:307c', 'ACTIVE', '13-0000008', 'WACC754b2f40:16d97f4f0d0:307c', NULL, NULL, NULL, '', 1);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:323f', 'ACTIVE', '13-0000009', 'WACC754b2f40:16d97f4f0d0:323f', NULL, NULL, NULL, '', 2);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:3cfc', 'ACTIVE', '13-0000010', 'WACC754b2f40:16d97f4f0d0:3cfc', NULL, NULL, NULL, '', 1);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:48e7', 'ACTIVE', '13-0000011', 'WACC754b2f40:16d97f4f0d0:48e7', NULL, NULL, NULL, '', 2);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:4b6f', 'ACTIVE', '13-0000012', 'WACC754b2f40:16d97f4f0d0:4b6f', NULL, NULL, NULL, '', 1);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:51d2', 'ACTIVE', '13-0000013', 'WACC754b2f40:16d97f4f0d0:51d2', NULL, NULL, NULL, '', 2);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:5387', 'ACTIVE', '13-0000014', 'WACC754b2f40:16d97f4f0d0:5387', NULL, NULL, NULL, '', 3);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:5483', 'ACTIVE', '13-0000015', 'WACC754b2f40:16d97f4f0d0:5483', NULL, NULL, NULL, '', 4);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:557f', 'ACTIVE', '13-0000016', 'WACC754b2f40:16d97f4f0d0:557f', NULL, NULL, NULL, '', 5);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:56cb', 'ACTIVE', '13-0000017', 'WACC754b2f40:16d97f4f0d0:56cb', NULL, NULL, NULL, '', 6);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:58d6', 'ACTIVE', '13-0000018', 'WACC754b2f40:16d97f4f0d0:58d6', NULL, NULL, NULL, '', 7);
INSERT INTO `waterworks_account` VALUES ('WACC754b2f40:16d97f4f0d0:59b6', 'ACTIVE', '13-0000019', 'WACC754b2f40:16d97f4f0d0:59b6', NULL, NULL, NULL, '', 8);
INSERT INTO `waterworks_account` VALUES ('WACCT-574da044:170f7edf566:-8000', 'ACTIVE', 'YYY-777-888', 'WACCT-574da044:170f7edf566:-8000', '2020-03-20', NULL, 'sample test', '', 5);
COMMIT;

-- ----------------------------
-- Table structure for waterworks_account_attribute
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_account_attribute`;
CREATE TABLE `waterworks_account_attribute` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `attribute_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_account_attribute
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_account_attribute` VALUES ('WACC-51948ad8:1708b70634c:-7d03-SENIOR', 'WACC-51948ad8:1708b70634c:-7d03', 'SENIOR');
INSERT INTO `waterworks_account_attribute` VALUES ('WACCT-574da044:170f7edf566:-8000-LOT_DONOR', 'WACCT-574da044:170f7edf566:-8000', 'LOT_DONOR');
INSERT INTO `waterworks_account_attribute` VALUES ('WACCT-574da044:170f7edf566:-8000-SENIOR', 'WACCT-574da044:170f7edf566:-8000', 'SENIOR');
INSERT INTO `waterworks_account_attribute` VALUES ('WACCT-574da044:170f7edf566:-8000-SUBDIVISION', 'WACCT-574da044:170f7edf566:-8000', 'SUBDIVISION');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_account_info
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_account_info`;
CREATE TABLE `waterworks_account_info` (
  `objid` varchar(50) NOT NULL,
  `acctname` varchar(255) DEFAULT NULL,
  `owner_objid` varchar(50) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `address_type` varchar(50) DEFAULT NULL,
  `address_barangay_objid` varchar(50) DEFAULT NULL,
  `address_barangay_name` varchar(50) DEFAULT NULL,
  `address_text` varchar(255) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_province` varchar(50) DEFAULT NULL,
  `address_municipality` varchar(50) DEFAULT NULL,
  `address_unitno` varchar(50) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_subdivision` varchar(50) DEFAULT NULL,
  `address_bldgno` varchar(50) DEFAULT NULL,
  `address_bldgname` varchar(50) DEFAULT NULL,
  `address_pin` varchar(50) DEFAULT NULL,
  `meterid` varchar(50) DEFAULT NULL,
  `classificationid` varchar(50) DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `stuboutid` varchar(50) DEFAULT NULL,
  `subareaid` varchar(50) NOT NULL,
  `attributes` varchar(500) DEFAULT NULL,
  `meterstate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `fk_waterworks_account_meter` (`meterid`) USING BTREE,
  KEY `fk_waterworks_account_classification` (`classificationid`) USING BTREE,
  KEY `ix_acctname` (`acctname`) USING BTREE,
  KEY `ix_owner_objid` (`owner_objid`) USING BTREE,
  KEY `ix_meterid` (`meterid`) USING BTREE,
  KEY `fk_waterworks_account_stuboutid` (`stuboutid`),
  KEY `fk_waterworks_account_subareaid` (`subareaid`),
  CONSTRAINT `waterworks_account_info_ibfk_2` FOREIGN KEY (`classificationid`) REFERENCES `waterworks_classification` (`objid`),
  CONSTRAINT `waterworks_account_info_ibfk_3` FOREIGN KEY (`meterid`) REFERENCES `waterworks_meter` (`objid`),
  CONSTRAINT `waterworks_account_info_ibfk_4` FOREIGN KEY (`stuboutid`) REFERENCES `waterworks_stubout` (`objid`),
  CONSTRAINT `waterworks_account_info_ibfk_5` FOREIGN KEY (`subareaid`) REFERENCES `waterworks_subarea` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_account_info
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_account_info` VALUES ('WACC-28e10a38:16bbe4e8bc2:-7dcf', 'LIM, WASHING', 'IND754b2f40:16d97f4f0d0:-144e', 'LIM, WASHING', 'local', '154-03-007', 'COGON', '507,\nCPG AVENUE,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVENUE,', NULL, '507,', NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7e05', 'RESIDENTIAL', 1, 'SO5e5678f:16d2be4e871:-68f1', 'WSZ-63544fa0:16b7b36a655:-3c46', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC-51948ad8:1708b70634c:-7d03', 'NAZARENO, ELMO MANAGASE', 'IND7cc6e6ca:167a19273fa:-7d44', 'NAZARENO, ELMO MANAGASE', 'local', '173-00-002', 'BALUAN', 'U1 BLDG 1\nBALUAN,GENERAL SANTOS CITY', 'GENERAL SANTOS CITY', NULL, NULL, 'U1', NULL, NULL, NULL, 'BLDG 1', NULL, NULL, 'RESIDENTIAL', 1, 'SO-51948ad8:1708b70634c:-7e22', 'WGRP-6aa8a930:1708b56defb:-7e9f', '[\"SENIOR\"]', NULL);
INSERT INTO `waterworks_account_info` VALUES ('WACC-557573b1:170eb757f03:-7e08', 'FLORES, WALTER', 'XITP00501370', 'FLORES, WALTER', 'local', '173-00-002', 'BALUAN', 'B1\nBALUAN,GENERAL SANTOS CITY', 'GENERAL SANTOS CITY', NULL, NULL, NULL, NULL, NULL, 'B1', NULL, NULL, NULL, 'RESIDENTIAL', 1, NULL, 'WGRP-6aa8a930:1708b56defb:-7e9f', '[\"LOT_DONOR\"]', NULL);
INSERT INTO `waterworks_account_info` VALUES ('WACC2c3dd557:170e7c14df4:-7e8e', 'NAZARENO, ELMO MANAGASE', 'IND7cc6e6ca:167a19273fa:-7d44', 'NAZARENO, ELMO MANAGASE', 'local', '173-00-002', 'BALUAN', 'B1\nBALUAN,GENERAL SANTOS CITY', 'GENERAL SANTOS CITY', NULL, NULL, NULL, NULL, NULL, 'B1', NULL, NULL, NULL, 'RESIDENTIAL', 1, NULL, 'WGRP-6aa8a930:1708b56defb:-7e9f', NULL, NULL);
INSERT INTO `waterworks_account_info` VALUES ('WACC3ea56ca3:1709e985882:-7de0', 'NAZARENO, ELMO MANAGASE', 'IND7cc6e6ca:167a19273fa:-7d44', 'NAZARENO, ELMO MANAGASE', 'local', '173-00-002', 'BALUAN', 'U1\nBALUAN,GENERAL SANTOS CITY', 'GENERAL SANTOS CITY', NULL, NULL, NULL, NULL, NULL, NULL, 'U1', NULL, 'WM-19bce13b:16dd834994e:-6c12', 'RESIDENTIAL', 1, 'SO-51948ad8:1708b70634c:-7e22', 'WGRP-6aa8a930:1708b56defb:-7e9f', '[]', 'DEFECTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:-5e01', 'VILLEGAS, MARYDEE', 'IND-5ebcbe5a:163d90771ed:-68f8', 'VILLEGAS, MARYDEE', 'local', '154-03-007', 'COGON', '495-A,\nCPG AVENUE,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVENUE,', NULL, '495-A,', NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7e32', 'RESIDENTIAL', 1, 'SO5e5678f:16d2be4e871:-68f1', 'WSZ-63544fa0:16b7b36a655:-3c46', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:-ca7', 'PEREZ, EVANGELINE', 'IND754b2f40:16d97f4f0d0:-7417', 'PEREZ, EVANGELINE', 'local', '154-03-007', 'COGON', 'CPG AVE.\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7b62', 'RESIDENTIAL', 1, 'SO5e5678f:16d2be4e871:-68f1', 'WSZ-63544fa0:16b7b36a655:-3c46', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:1448', 'DAPAR, NOEL', 'IND46d1d66f:15c5be14848:-79b2', 'DAPAR, NOEL', 'local', '154-03-007', 'COGON', 'CPG AVE.\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.', NULL, NULL, NULL, NULL, 'WM45b1d314:16d955b42c7:-5468', 'RESIDENTIAL', 1, 'SO5e5678f:16d2be4e871:-68f1', 'WSZ-63544fa0:16b7b36a655:-3c46', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:1b4b', 'GUDAY, VINCENT', 'IND2be95266:15edf8a7d4f:-6ec2', 'GUDAY, VINCENT', 'local', '154-03-007', 'COGON', '0471-D,\nAIRPORT ROAD,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'AIRPORT ROAD,', NULL, '0471-D,', NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7dd8', 'RESIDENTIAL', 1, 'SO5e5678f:16d2be4e871:-686d', 'WSZ-63544fa0:16b7b36a655:-3c46', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:2c44', 'PINAR, APOLONIO', 'IND5d99121a:15cc7eb1341:-7351', 'PINAR, APOLONIO', 'local', '154-03-007', 'COGON', '477\nCPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, '477', NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7dab', 'RESIDENTIAL', 1, 'SO5e5678f:16d2be4e871:-686d', 'WSZ-63544fa0:16b7b36a655:-3c46', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:2d8e', 'SAMONTE, MARY MAE', 'IND1d70086c:15a91b101c6:-6c90', 'SAMONTE, MARY MAE', 'local', '154-03-007', 'COGON', '479\nCPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, '479', NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7d7e', 'RESIDENTIAL', 1, 'SO5e5678f:16d2be4e871:-686d', 'WSZ-63544fa0:16b7b36a655:-3c46', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:307c', 'FORTICH, EDWIN', 'IND4c8b5024:15fc7b778d0:-c9c', 'FORTICH, EDWIN', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7d51', 'RESIDENTIAL', 1, 'SO5e5678f:16d2be4e871:-67ea', 'WSZ-63544fa0:16b7b36a655:-3c46', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:323f', 'FORTICH, DAVID', 'IND2a11fa98:163f6706cde:-19e7', 'FORTICH, DAVID', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7d24', 'RESIDENTIAL', 1, 'SO5e5678f:16d2be4e871:-67ea', 'WSZ-63544fa0:16b7b36a655:-3c46', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:3cfc', 'SIA, SAMSON', 'IND-105d0018:15874a74a15:-6101', 'SIA, SAMSON T.', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7cca', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-5783', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:48e7', 'ISUZU CEBU, INC.', 'IND754b2f40:16d97f4f0d0:4a30', 'ISUZU CEBU, INC., BOHOL', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7b8f', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-5783', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:4b6f', 'MOJICA, ANGELICA', 'IND-3192ecbc:1587140a957:-567b', 'MOJICA, ANGELICA DE LEON', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7cf7', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-56af', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:51d2', 'SIA, MANOLITA', 'IND-52f5028e:15a631f62b7:-db9', 'SIA, MANOLITA', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7c9d', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-56af', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:5387', 'TAN, ASCENDINO', 'IND-52f5028e:15a631f62b7:-78ac', 'TAN, ASCENDINO', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7c70', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-56af', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:5483', 'LASTIMOSA, ARTURO', 'IND10fae3d7:1587340435b:9e3', 'LASTIMOSA, ARTURO R.', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7c43', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-56af', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:557f', 'UY, CHRISTOPHER LYNDON', 'IND-9b86315:1606c23fce2:-72a9', 'UY, CHRISTOPHER LYNDON', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7c16', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-56af', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:56cb', 'TAN, MANOL II', 'IND-792305a2:15a39ef9b42:-721c', 'TAN, MANOL II', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7be9', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-56af', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:58d6', 'TAN, MANOL I', 'IND-248a9c7a:15fdbe668f6:-1c45', 'TAN, MANOL I', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7bbc', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-56af', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACC754b2f40:16d97f4f0d0:59b6', 'SAMSON, ESMERALDA', 'IND-7d1ed1e4:15f5b1cced8:-653c', 'SAMSON, ESMERALDA', 'local', '154-03-007', 'COGON', 'CPG AVE.,\nCOGON,TAGBILARAN CITY', 'TAGBILARAN CITY', NULL, NULL, NULL, 'CPG AVE.,', NULL, NULL, NULL, NULL, 'WM-58a703b8:16d94a2ecf7:-7b35', 'RESIDENTIAL', 1, 'SO-339247f7:16d6463f123:-56af', 'WSZ-63544fa0:16b7ba6ef6c:696', NULL, 'ACTIVE');
INSERT INTO `waterworks_account_info` VALUES ('WACCT-574da044:170f7edf566:-8000', 'NAZAIRE, GLEN', 'XITP01537838', 'NAZAIRE, GLEN', 'local', '173-00-002', 'BALUAN', 'B1\nSECOND STREET\nBALUAN,GENERAL SANTOS CITY', 'GENERAL SANTOS CITY', NULL, NULL, NULL, 'SECOND STREET', NULL, 'B1', NULL, NULL, 'WM-19bce13b:16dd834994e:-6c3f', 'RESIDENTIAL', 1, NULL, 'WGRP-6aa8a930:1708b56defb:-7e9f', '[\"SENIOR\",\"SUBDIVISION\",\"LOT_DONOR\"]', 'ACTIVE');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_application
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_application`;
CREATE TABLE `waterworks_application` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `appdate` date DEFAULT NULL,
  `appno` varchar(50) DEFAULT NULL,
  `apptype` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `classificationid` varchar(50) DEFAULT NULL,
  `acctname` varchar(50) DEFAULT NULL,
  `owner_objid` varchar(50) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `address_type` varchar(50) DEFAULT NULL,
  `address_barangay_objid` varchar(50) DEFAULT NULL,
  `address_barangay_name` varchar(50) DEFAULT NULL,
  `address_text` varchar(50) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_province` varchar(50) DEFAULT NULL,
  `address_municipality` varchar(50) DEFAULT NULL,
  `address_unitno` varchar(50) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_subdivision` varchar(50) DEFAULT NULL,
  `address_bldgno` varchar(50) DEFAULT NULL,
  `address_bldgname` varchar(50) DEFAULT NULL,
  `address_pin` varchar(50) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `info` mediumtext,
  `taskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_classificationid` (`classificationid`) USING BTREE,
  KEY `ix_acctname` (`acctname`) USING BTREE,
  KEY `ix_owner_objid` (`owner_objid`) USING BTREE,
  KEY `ix_address_barangay_objid` (`address_barangay_objid`) USING BTREE,
  KEY `fk_waterworks_application_taskid` (`taskid`),
  CONSTRAINT `fk_waterworks_application_taskid` FOREIGN KEY (`taskid`) REFERENCES `waterworks_application_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_application
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_application` VALUES ('WAPP74f530c4:170a9e09104:-8000', 'PENDING', '2020-03-05', 'WAPP-032020-00009', 'DISCONNECTION', 'WACC-51948ad8:1708b70634c:-7d03', NULL, 'NAZARENO, ELMO MANAGASE', 'IND7cc6e6ca:167a19273fa:-7d44', 'NAZARENO, ELMO MANAGASE', 'local', '173-00-002', 'BALUAN', 'U1 BLDG 1\nBALUAN,GENERAL SANTOS CITY', 'GENERAL SANTOS CITY', NULL, NULL, 'U1', NULL, NULL, NULL, 'BLDG 1', NULL, 'USR15e08ef7:16feaa95445:-7e96', 'ELMO M NAZARENO', '[:]', 'WATSK74f530c4:170a9e09104:-7ffe');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_application_bom
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_application_bom`;
CREATE TABLE `waterworks_application_bom` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `item_unit` varchar(10) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `qtyissued` int(11) DEFAULT NULL,
  `item_unitprice` decimal(10,2) DEFAULT NULL,
  `cwdsupplied` int(11) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  KEY `fk_application_bom` (`parentid`) USING BTREE,
  CONSTRAINT `fk_waterworks_application_bom_parentid` FOREIGN KEY (`parentid`) REFERENCES `waterworks_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_application_fee
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_application_fee`;
CREATE TABLE `waterworks_application_fee` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `txntype` varchar(10) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtpaid` decimal(16,2) DEFAULT NULL,
  `installmentid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_application_fee_application` (`parentid`) USING BTREE,
  CONSTRAINT `fk_waterworks_application_fee_parentid` FOREIGN KEY (`parentid`) REFERENCES `waterworks_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_application_requirement
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_application_requirement`;
CREATE TABLE `waterworks_application_requirement` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `complied` tinyint(4) DEFAULT NULL,
  `dtcomplied` datetime DEFAULT NULL,
  `verifier_objid` varchar(50) DEFAULT NULL,
  `verifier_name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `info` longtext,
  `dtissued` date DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_application_task
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_application_task`;
CREATE TABLE `waterworks_application_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  PRIMARY KEY (`taskid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  CONSTRAINT `fk_waterworks_application_task_refid` FOREIGN KEY (`refid`) REFERENCES `waterworks_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_application_task
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_application_task` VALUES ('WATSK74f530c4:170a9e09104:-7ffe', 'WAPP74f530c4:170a9e09104:-8000', NULL, 'verify-requirements', '2020-03-05 16:47:11', NULL, 'USR15e08ef7:16feaa95445:-7e96', 'ELMO M NAZARENO', NULL, NULL, NULL, 'WATSK74f530c4:170a9e09104:-7fff', '2020-03-05 16:47:11');
INSERT INTO `waterworks_application_task` VALUES ('WATSK74f530c4:170a9e09104:-7fff', 'WAPP74f530c4:170a9e09104:-8000', NULL, 'start', '2020-03-05 16:47:11', '2020-03-05 16:47:11', NULL, NULL, 'USR15e08ef7:16feaa95445:-7e96', 'ELMO M NAZARENO', NULL, NULL, '2020-03-05 16:47:11');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_area
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_area`;
CREATE TABLE `waterworks_area` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_area
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_area` VALUES ('42a40865:16a62002559:-67f1', '001');
INSERT INTO `waterworks_area` VALUES ('-27ce138f:17085399485:-8000', '002');
INSERT INTO `waterworks_area` VALUES ('27de008f:1708b6252a4:-8000', 'A');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_attribute
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_attribute`;
CREATE TABLE `waterworks_attribute` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_attribute
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_attribute` VALUES ('LOT_DONOR', 'LOT DONOR');
INSERT INTO `waterworks_attribute` VALUES ('SENIOR', 'SENIOR CITIZEN');
INSERT INTO `waterworks_attribute` VALUES ('SUBDIVISION', 'SUBDIVISION');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_batch_billing
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_batch_billing`;
CREATE TABLE `waterworks_batch_billing` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `subareaid` varchar(50) DEFAULT NULL,
  `dtposted` datetime DEFAULT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(255) DEFAULT NULL,
  `reader_objid` varchar(50) DEFAULT NULL,
  `reader_name` varchar(255) DEFAULT NULL,
  `periodid` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  `month` int(255) DEFAULT NULL,
  `year` int(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_dtcreated` (`dtcreated`) USING BTREE,
  KEY `ix_createdby_objid` (`createdby_objid`) USING BTREE,
  KEY `ix_zoneid` (`subareaid`) USING BTREE,
  KEY `ix_dtposted` (`dtposted`) USING BTREE,
  KEY `ix_postedby_objid` (`postedby_objid`) USING BTREE,
  KEY `ix_reader_objid` (`reader_objid`) USING BTREE,
  KEY `ix_taskid` (`taskid`) USING BTREE,
  KEY `ix_scheduleid` (`periodid`) USING BTREE,
  KEY `ix_readingdate` (`readingdate`) USING BTREE,
  CONSTRAINT `fk_waterworks_batch_billing_periodid` FOREIGN KEY (`periodid`) REFERENCES `waterworks_billing_period` (`objid`),
  CONSTRAINT `fk_waterworks_batch_billing_subareaid` FOREIGN KEY (`subareaid`) REFERENCES `waterworks_subarea` (`objid`),
  CONSTRAINT `fk_waterworks_batch_billing_taskid` FOREIGN KEY (`taskid`) REFERENCES `waterworks_batch_billing_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_batch_billing
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_batch_billing` VALUES ('WBBLOCK_1202003', 'DRAFT', '2020-03-26 17:46:50', 'USR-ADMIN', 'ADMIN . ADMIN', 'WGRP-6aa8a930:1708b56defb:-7e9f', NULL, NULL, NULL, 'USR-ADMIN', 'ADMIN ADMIN', '30-2020-03', 'WWBTCHTASK76532d72:171163cbb09:-7fff', '2020-04-04', 3, 2020);
COMMIT;

-- ----------------------------
-- Table structure for waterworks_batch_billing_task
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_batch_billing_task`;
CREATE TABLE `waterworks_batch_billing_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  CONSTRAINT `fk_waterworks_batch_billing_task_refid` FOREIGN KEY (`refid`) REFERENCES `waterworks_batch_billing` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_batch_billing_task
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_batch_billing_task` VALUES ('WWBTCHTASK76532d72:171163cbb09:-7fff', 'WBBLOCK_1202003', NULL, 'draft', '2020-03-26 17:46:50', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-26 17:46:51', 'WWBTCHTASK76532d72:171163cbb09:-8000');
INSERT INTO `waterworks_batch_billing_task` VALUES ('WWBTCHTASK76532d72:171163cbb09:-8000', 'WBBLOCK_1202003', NULL, 'start', '2020-03-26 17:46:50', '2020-03-26 17:46:50', NULL, NULL, 'USR-ADMIN', 'ADMIN . ADMIN', NULL, '2020-03-26 17:46:50', NULL);
COMMIT;

-- ----------------------------
-- Table structure for waterworks_billing
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_billing`;
CREATE TABLE `waterworks_billing` (
  `objid` varchar(50) NOT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `billno` varchar(50) DEFAULT NULL,
  `consumptionid` varchar(50) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `surcharge` decimal(16,2) DEFAULT NULL,
  `interest` decimal(16,2) DEFAULT NULL,
  `otherfees` decimal(16,2) DEFAULT NULL,
  `credits` decimal(16,2) DEFAULT NULL,
  `arrears` decimal(16,2) DEFAULT NULL,
  `averageconsumption` int(11) DEFAULT NULL,
  `billed` int(11) DEFAULT NULL,
  `unpaidmonths` int(11) DEFAULT NULL,
  `refbillno` varchar(50) DEFAULT NULL,
  `printed` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `errcode` int(11) DEFAULT NULL,
  `adjpayment` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_consumptionid` (`consumptionid`) USING BTREE,
  KEY `ix_batchid` (`batchid`) USING BTREE,
  CONSTRAINT `fk_waterworks_billing_batchid` FOREIGN KEY (`batchid`) REFERENCES `waterworks_batch_billing` (`objid`),
  CONSTRAINT `fk_waterworks_billing_consumptionid` FOREIGN KEY (`consumptionid`) REFERENCES `waterworks_consumption` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_billing
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_billing` VALUES ('WBBLOCK_1202003-0001', 'WBBLOCK_1202003', 'WBBLOCK_1202003-0001', 'WACC3ea56ca3:1709e985882:-7de0-30-2020-03', 'UNBILLED', 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, NULL, 0, NULL, NULL, 0.00);
INSERT INTO `waterworks_billing` VALUES ('WBBLOCK_1202003-0002', 'WBBLOCK_1202003', 'WBBLOCK_1202003-0002', 'WACC-51948ad8:1708b70634c:-7d03-30-2020-03', 'UNBILLED', 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, NULL, 0, NULL, NULL, 0.00);
INSERT INTO `waterworks_billing` VALUES ('WBBLOCK_1202003-0003', 'WBBLOCK_1202003', 'WBBLOCK_1202003-0003', 'WACC2c3dd557:170e7c14df4:-7e8e-30-2020-03', 'UNBILLED', 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, NULL, 0, NULL, NULL, 0.00);
INSERT INTO `waterworks_billing` VALUES ('WBBLOCK_1202003-0004', 'WBBLOCK_1202003', 'WBBLOCK_1202003-0004', 'WACC-557573b1:170eb757f03:-7e08-30-2020-03', 'UNBILLED', 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, NULL, 0, NULL, NULL, 0.00);
INSERT INTO `waterworks_billing` VALUES ('WBBLOCK_1202003-0005', 'WBBLOCK_1202003', 'WBBLOCK_1202003-0005', 'WACCT-574da044:170f7edf566:-8000-30-2020-03', 'UNBILLED', 18.76, 0.00, 0.00, 0.00, 134.00, 0, 1, 0, NULL, 0, NULL, NULL, 0.00);
COMMIT;

-- ----------------------------
-- Table structure for waterworks_billing_period
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_billing_period`;
CREATE TABLE `waterworks_billing_period` (
  `objid` varchar(50) NOT NULL,
  `scheduleid` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `fromperiod` date DEFAULT NULL,
  `toperiod` date DEFAULT NULL,
  `readingdate` date DEFAULT NULL,
  `readingduedate` date DEFAULT NULL,
  `billingduedate` date DEFAULT NULL,
  `discdate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_scheduleid_year_month` (`scheduleid`,`year`,`month`) USING BTREE,
  KEY `ix_schedule_objid` (`scheduleid`) USING BTREE,
  KEY `ix_year` (`year`) USING BTREE,
  KEY `ix_month` (`month`) USING BTREE,
  KEY `ix_readingdate` (`readingdate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_billing_period
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_billing_period` VALUES ('30-2019-01', '30', 2019, 1, '2019-01-01', '2019-01-31', '2019-02-02', '2019-02-04', '2019-02-06', '2019-02-06', '2019-02-21');
INSERT INTO `waterworks_billing_period` VALUES ('30-2019-12', '30', 2019, 12, '2019-12-01', '2019-12-31', '2020-01-02', '2020-01-04', '2020-01-06', '2020-01-06', '2020-01-21');
INSERT INTO `waterworks_billing_period` VALUES ('30-2020-01', '30', 2020, 1, '2020-01-01', '2020-01-31', '2020-02-02', '2020-02-04', '2020-02-06', '2020-02-06', '2020-02-21');
INSERT INTO `waterworks_billing_period` VALUES ('30-2020-02', '30', 2020, 2, '2020-02-01', '2020-02-29', '2020-03-02', '2020-03-04', '2020-03-06', '2020-03-06', '2020-03-21');
INSERT INTO `waterworks_billing_period` VALUES ('30-2020-03', '30', 2020, 3, '2020-03-01', '2020-03-31', '2020-04-02', '2020-04-04', '2020-04-06', '2020-04-06', '2020-04-21');
INSERT INTO `waterworks_billing_period` VALUES ('30-2020-04', '30', 2020, 4, '2020-04-01', '2020-04-30', '2020-05-02', '2020-05-04', '2020-05-06', '2020-05-06', '2020-05-21');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_changelog
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_changelog`;
CREATE TABLE `waterworks_changelog` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `oldvalue` text,
  `newvalue` text,
  `dtfiled` datetime DEFAULT NULL,
  `filedby_name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `controlno` varchar(32) DEFAULT NULL,
  `filedby_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  KEY `ix_reftype` (`reftype`) USING BTREE,
  KEY `ix_action` (`action`) USING BTREE,
  KEY `ix_dtfiled` (`dtfiled`) USING BTREE,
  KEY `ix_controlno` (`controlno`) USING BTREE,
  KEY `ix_filedby_objid` (`filedby_objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_changelog
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_changelog` VALUES ('CHGINFO51d89b4f:1708880f04e:-8000', 'WACC754b2f40:16d97f4f0d0:-5e01', 'waterworks_account', 'update', '[classificationid:\"RES\"]', '[classificationid:\"RESIDENTIAL\"]', '2020-02-28 05:15:16', 'ELM3 M NAZ', '-', 'CI-2020020000000001', 'USR5b13925b:17066eb8fad:-7eac');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_classification
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_classification`;
CREATE TABLE `waterworks_classification` (
  `objid` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_classification
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_classification` VALUES ('BULK', 'BULK');
INSERT INTO `waterworks_classification` VALUES ('COMMERCIAL', 'COMMERCIAL');
INSERT INTO `waterworks_classification` VALUES ('GOVERNMENT', 'GOVERNMENT');
INSERT INTO `waterworks_classification` VALUES ('INDUSTRIAL', 'INDUSTRIAL');
INSERT INTO `waterworks_classification` VALUES ('RESIDENTIAL', 'RESIDENTIAL');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_consumption
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_consumption`;
CREATE TABLE `waterworks_consumption` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  `acctinfoid` varchar(50) NOT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `meterid` varchar(50) DEFAULT NULL,
  `meterstate` varchar(50) DEFAULT NULL,
  `year` int(255) NOT NULL,
  `month` int(255) NOT NULL,
  `reading` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `rate` decimal(16,2) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtpaid` decimal(16,2) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `hold` int(11) NOT NULL DEFAULT '0',
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_acctid_year_month` (`acctid`,`year`,`month`,`meterid`) USING BTREE,
  KEY `fk_waterworks_consumption_batchid` (`batchid`),
  KEY `fk_waterworks_consumption_acctinfoid` (`acctinfoid`),
  KEY `fk_waterworks_consumption_meterid` (`meterid`),
  CONSTRAINT `fk_waterworks_consumption_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`),
  CONSTRAINT `fk_waterworks_consumption_acctinfoid` FOREIGN KEY (`acctinfoid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `fk_waterworks_consumption_batchid` FOREIGN KEY (`batchid`) REFERENCES `waterworks_batch_billing` (`objid`),
  CONSTRAINT `fk_waterworks_consumption_meterid` FOREIGN KEY (`meterid`) REFERENCES `waterworks_meter` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_consumption
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_consumption` VALUES ('WAC-2b2e5427:17101e81744:-7fff', 'WACCT-574da044:170f7edf566:-8000', 'WACCT-574da044:170f7edf566:-8000', NULL, 'CAPTURE', 'WM-19bce13b:16dd834994e:-6c3f', 'ACTIVE', 2020, 2, 160, 20, NULL, 43.00, 0.00, 'POSTED', 0, 0.00);
INSERT INTO `waterworks_consumption` VALUES ('WAC-2b2e5427:17101e81744:-8000', 'WACCT-574da044:170f7edf566:-8000', 'WACCT-574da044:170f7edf566:-8000', NULL, 'CAPTURE', 'WM-19bce13b:16dd834994e:-6c3f', 'ACTIVE', 2020, 1, 140, 10, NULL, 20.00, 0.00, 'POSTED', 0, 0.00);
INSERT INTO `waterworks_consumption` VALUES ('WAC-5f458fbd:170fff104d6:-8000', 'WACCT-574da044:170f7edf566:-8000', 'WACCT-574da044:170f7edf566:-8000', NULL, 'CAPTURE', 'WM-19bce13b:16dd834994e:-6c3f', 'ACTIVE', 2019, 12, 130, 30, NULL, 71.00, 0.00, 'POSTED', 0, 0.00);
INSERT INTO `waterworks_consumption` VALUES ('WAC-7201a905:170ffe3e83e:-8000', 'WACCT-574da044:170f7edf566:-8000', 'WACCT-574da044:170f7edf566:-8000', NULL, 'CAPTURE', 'WM-19bce13b:16dd834994e:-6c3f', 'ACTIVE', 2019, 11, 100, 0, NULL, 0.00, 0.00, 'POSTED', 0, 0.00);
INSERT INTO `waterworks_consumption` VALUES ('WAC405cd13f:17104ebcb19:-8000', 'WACC3ea56ca3:1709e985882:-7de0', 'WACC3ea56ca3:1709e985882:-7de0', NULL, 'CAPTURE', 'WM-19bce13b:16dd834994e:-6c12', 'DEFECTIVE', 2020, 1, 99, 0, NULL, 0.00, 0.00, 'OPEN', 0, 0.00);
INSERT INTO `waterworks_consumption` VALUES ('WACC-51948ad8:1708b70634c:-7d03-30-2020-03', 'WACC-51948ad8:1708b70634c:-7d03', 'WACC-51948ad8:1708b70634c:-7d03', 'WBBLOCK_1202003', 'ONLINE', NULL, NULL, 2020, 3, NULL, 0, 0.00, 0.00, 0.00, 'DRAFT', 0, 0.00);
INSERT INTO `waterworks_consumption` VALUES ('WACC-557573b1:170eb757f03:-7e08-30-2020-03', 'WACC-557573b1:170eb757f03:-7e08', 'WACC-557573b1:170eb757f03:-7e08', 'WBBLOCK_1202003', 'ONLINE', NULL, NULL, 2020, 3, NULL, 0, 0.00, 0.00, 0.00, 'DRAFT', 0, 0.00);
INSERT INTO `waterworks_consumption` VALUES ('WACC2c3dd557:170e7c14df4:-7e8e-30-2020-03', 'WACC2c3dd557:170e7c14df4:-7e8e', 'WACC2c3dd557:170e7c14df4:-7e8e', 'WBBLOCK_1202003', 'ONLINE', NULL, NULL, 2020, 3, NULL, 0, 0.00, 0.00, 0.00, 'DRAFT', 0, 0.00);
INSERT INTO `waterworks_consumption` VALUES ('WACC3ea56ca3:1709e985882:-7de0-30-2020-03', 'WACC3ea56ca3:1709e985882:-7de0', 'WACC3ea56ca3:1709e985882:-7de0', 'WBBLOCK_1202003', 'ONLINE', 'WM-19bce13b:16dd834994e:-6c12', 'ACTIVE', 2020, 3, NULL, 0, 0.00, 0.00, 0.00, 'DRAFT', 0, 0.00);
INSERT INTO `waterworks_consumption` VALUES ('WACCT-574da044:170f7edf566:-8000-30-2020-03', 'WACCT-574da044:170f7edf566:-8000', 'WACCT-574da044:170f7edf566:-8000', 'WBBLOCK_1202003', 'ONLINE', 'WM-19bce13b:16dd834994e:-6c3f', 'ACTIVE', 2020, 3, 160, 0, 0.00, 0.00, 0.00, 'DRAFT', 0, 0.00);
COMMIT;

-- ----------------------------
-- Table structure for waterworks_credit
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_credit`;
CREATE TABLE `waterworks_credit` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `dr` decimal(16,2) DEFAULT NULL,
  `cr` decimal(16,2) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_acctid` (`acctid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_formula
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_formula`;
CREATE TABLE `waterworks_formula` (
  `classificationid` varchar(100) NOT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `expr` longtext,
  PRIMARY KEY (`classificationid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_installment
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_installment`;
CREATE TABLE `waterworks_installment` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `controlno` varchar(100) DEFAULT NULL,
  `doctype` varchar(10) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `downpayment` decimal(16,2) DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `applicationid` varchar(50) DEFAULT NULL,
  `installmentamount` decimal(16,2) DEFAULT NULL,
  `lastbilldate` date DEFAULT NULL,
  `amtbilled` decimal(16,2) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `amtpaid` decimal(16,2) DEFAULT NULL,
  `txntype_objid` varchar(50) DEFAULT NULL,
  `startyear` int(11) DEFAULT NULL,
  `startmonth` int(11) DEFAULT NULL,
  `txntypeid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_acctid` (`acctid`) USING BTREE,
  KEY `ix_applicationid` (`applicationid`) USING BTREE,
  KEY `ix_enddate` (`enddate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_itemaccount
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_itemaccount`;
CREATE TABLE `waterworks_itemaccount` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `item_fund_objid` varchar(50) DEFAULT NULL,
  `sortorder` int(10) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_itemaccount
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_itemaccount` VALUES ('WATER_ADVANCE_PAYMENT', 'WATER ADVANCE PAYMENT', NULL, NULL, NULL, NULL, 200);
INSERT INTO `waterworks_itemaccount` VALUES ('WATER_CLEARANCE', 'WATER CLEARANCE', NULL, NULL, NULL, NULL, 1);
INSERT INTO `waterworks_itemaccount` VALUES ('WATER_DISCOUNT', 'WATER DISCOUNT', NULL, NULL, NULL, NULL, 2);
INSERT INTO `waterworks_itemaccount` VALUES ('WATER_SALES', 'WATER SALES', NULL, NULL, NULL, NULL, 1);
INSERT INTO `waterworks_itemaccount` VALUES ('WATER_SURCHARGE', 'WATER SURCHARGE', NULL, NULL, NULL, NULL, 300);
INSERT INTO `waterworks_itemaccount` VALUES ('WATER_TAX_CREDIT', 'WATER SALES - TAX CREDIT', NULL, NULL, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for waterworks_material
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_material`;
CREATE TABLE `waterworks_material` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `unitprice` decimal(16,2) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `installmentprice` decimal(16,2) DEFAULT NULL,
  `unitcost` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_waterworks_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_meter
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_meter`;
CREATE TABLE `waterworks_meter` (
  `objid` varchar(50) NOT NULL,
  `serialno` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `sizeid` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `stocktype` varchar(50) DEFAULT NULL,
  `state` varchar(32) NOT NULL,
  `currentacctid` varchar(50) DEFAULT NULL,
  `ukey` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_serialno` (`serialno`,`ukey`) USING BTREE,
  KEY `ix_brand` (`brand`) USING BTREE,
  KEY `ix_sizeid` (`sizeid`) USING BTREE,
  KEY `ix_state` (`state`) USING BTREE,
  KEY `ix_currentacctid` (`currentacctid`) USING BTREE,
  CONSTRAINT `fk_waterworks_meter_currentacctid` FOREIGN KEY (`currentacctid`) REFERENCES `waterworks_account_info` (`objid`),
  CONSTRAINT `fk_waterworks_meter_sizeid` FOREIGN KEY (`sizeid`) REFERENCES `waterworks_metersize` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_meter
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6bb8', '10920', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6be5', '1210', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6c12', '29780', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC3ea56ca3:1709e985882:-7de0', '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6c3f', '9671914', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACCT-574da044:170f7edf566:-8000', '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6c6c', '5312', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DEFECTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6c99', '030932602', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6cc6', '5430624', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6cf3', '040308056', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6d20', '091230500', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6d4d', '2405408', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6d7a', '65713', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6da7', '39110', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6dd4', '130200544', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6e01', '1470003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6e2e', '96102401', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DISCONNECTED', 'WACC2c3dd557:170e7c14df4:-7e8e', '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6e5b', '69039', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6e88', '3223', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6eb5', '1470002', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6ee2', '20140703578', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6f0f', '517626', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6f3c', '10908120', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6f69', '94062696', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6f96', '1470001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6fc3', '30600653', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-6ff0', '409352', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-701d', '16587', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-704a', '13992', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7077', '1982', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-70a6', '9624524', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-70d1', '92812312', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-70fe', '060602362', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-712b', '61103140', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7158', '150203018', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7185', '180135164', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-71b2', '94042730', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-71df', '19726273', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-720c', '9160001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7255', '190516259', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-72ba', '16018307', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-72e7', '1007081', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7314', '180136555', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7341', '2005121819', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-736e', '180131866', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-739b', '180136304', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-73c8', '180134386', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-73f5', '9150003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-744c', '96754', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7479', '0257466', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-74bb', '9150002', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-74e8', '9150001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7515', '9350775', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7542', '0504010011', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-756f', '00760', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-759c', '0881432', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-75d0', '080379804', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-77e6', '980402498', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7813', '0801500', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7840', '98078706', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-786d', '961212097', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-789a', '96041306', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-78c7', '94115576', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-78f4', '13071147', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7921', '112603199', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-794e', '081200237', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-797b', '0210011075', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-79a8', '980509537', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-79d5', '343503', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7a02', '92126531', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7a2f', '05050204', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7a5c', '990613426', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7a89', '0902501', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7ab6', '1033263', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7ae3', '140700053', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7b10', '1138630', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7b3d', '1105142', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7b6a', '011705037', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7b97', '991214198', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7bc4', '020917474', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7bf1', '160103365', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7c1e', '160104045', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7c4b', '971209477', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7c7f', '9231271', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DEFECTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7cc2', '0700876', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7cef', '08328388', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7d1c', '0802378', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7d49', '161202478', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7d76', '040710375', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7da3', '040326244', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7dd0', '49230585', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7e04', '030600522', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-19bce13b:16dd834994e:-7e4e', '980508491', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1a0ada62:16bbaff93d7:-7d56', '61103483', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1a0ada62:16bbaff93d7:-7d8a', '10801583', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1a0ada62:16bbaff93d7:-7de9', '1147265', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1a0ada62:16bbaff93d7:-7e18', '20130701606', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1a0ada62:16bbaff93d7:-7e4c', '160901496', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-71f9', '180131852', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7226', '902762', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7253', '140701487', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7280', '160900293', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-72ad', '96111921', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-72da', '1160799', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7307', '05020213', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7334', '161202818', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7361', '94127632', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-738e', '170511044', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-73bb', '190304850', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-73e8', '180815994', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7415', '181150972', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7442', '180822691', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-746f', '20180904172', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-749c', '180714835', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-74c9', '181151284', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-74f6', '1807144838', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7523', '180611677', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7550', '180610896', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-757d', '180611445', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-75aa', '180614086', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-75d7', '20180731404', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7604', '180611552', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7631', '180714741', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-765e', '20180400470', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-768b', '18007533', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-76b8', '170930156', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-76e5', '1505022569', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7712', '150502538', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-773f', '150505504', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-776c', '1708302886', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7799', '150503899', '10-10-19', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-77c6', '150502535', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-77f3', '20180300045', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7820', '180135167', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-784d', '150503896', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-787a', '1570005', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-78a7', '1570004', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-78d4', '020413546', '10-10-19', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7901', '1146936', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-792e', '071901176', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-795b', '990817241', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7988', '090302378', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-79b5', '010901651', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-79e2', '150901651', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7a0f', '990814574', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7a3c', '160303734', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7a69', '0706331', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7a96', '010909461', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7ac3', '0514126', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7af0', '10902282', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7b1d', '86620201210', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7b4a', '010804102', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7b77', '2103059', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7ba4', '6700130873', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7bd1', '0500286', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7bfe', '04141523', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7c2b', '1018102', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7c58', '1018102015', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7c85', '000308761', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7cb2', '0321060162', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7cdf', '0905098', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7d0c', '0045422', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DISCONNECTED', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7d39', '05220949', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7d66', '98050149', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7d93', '08050187', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7dc0', '99074218', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7ded', '160133551', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7e1a', '160129796', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c254eda:16dd1ffff80:-7e4e', '070701189', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7819', '060306044', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7846', '07701917', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7873', '150502836', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-78a0', '0048928', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-78cd', '031205102', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-78fa', '040105150', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7927', '0831799', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7954', '150502402', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7981', '19226507', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-79ae', '000113432', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-79db', '00264524', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7a08', '20180400623', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7a35', '0521574', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7a62', '05', '21892', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7a8f', '091231286', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7abc', '190304604', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7ae9', '160103823', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7b16', '160102834', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7b43', '16102873', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7b70', '160544903', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7b9d', '160102879', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7bca', '160104122', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7bfe', '160103929', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7c2b', '160104144', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7c58', '140105659', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7c85', '110401156', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7cb2', '160104046', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7cdf', '150502612', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7d0c', '1107082', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7d39', '140700445', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7d66', '911134', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7d93', '090307039', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7dc0', '090271987', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7ded', '9776732', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7e1a', '076381', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1c6df1a9:16dc7c9863e:-7e4e', '970006', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-79ac', '0116658', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-79d9', '040329969', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7a06', '160731103', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7a3a', '0504007152', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7a84', '43004', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7b4e', '980509388', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7b7b', '0504004544', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7ba8', '0395662', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7bd5', '150204125', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7c02', '030935213', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7c2f', '43003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7c63', '130170514', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7ca6', '0612152', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7cd3', '97121594', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7d07', '5465912', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7d67', '0415560', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7daa', '980703537', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7dd7', '0417090', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-1fcb2909:16d95bee025:-7e0b', '080801589', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-273a11ec:16bbae722f1:-7e4e', '020105845', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7a0f', '29228658', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7a3c', '040710705', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7a69', '0659071', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7a96', '1108011', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7ac3', '800246045', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7af0', '0829575', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7b1d', '9788251', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7b4a', '9796764', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7b77', '171288646', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7ba4', '980503860', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7bd1', '0416997', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7bfe', '090307204', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7c2b', '090307210', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7c58', '031103124', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7c85', '0106071', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7cb2', '021106786', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7cdf', '20180500282', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7d0c', '171145680', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7d39', '171197682', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7d66', '171147188', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7d93', '180643823', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7dc0', '966905', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7ded', '160103367', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7e1a', '14702133', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-299568ac:16dc82979d7:-7e4e', '110401764', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7a69', '991103855', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7a96', '19226274', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7ac3', '9772980', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7af0', '9774243', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7b1d', '94116087', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7b4a', '0604438', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7b77', '161200417', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7ba4', '990614158', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7bd1', '030712783', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7bfe', '090272697', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7c2b', '033105632', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7c58', '070902593', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7c85', '140700466', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7cb2', '08070248', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7cdf', '504007543', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7d0c', '49230529', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7d39', '0504007158', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7d66', '040608046', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7d93', '080450822', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7dc0', '1204904088', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7ded', '19226318', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7e1a', '161111488', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a22a286:16dd7865d1f:-7e4e', '19226310', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-6ea9', '016430', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-6ed6', '060105056', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-6f03', '050305134', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-6f30', '160845650', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-6f62', '150701836', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-6f8f', '010705085', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-6fc1', '102627', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-6fee', '082121', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-701b', '030829924', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7048', '0007835', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7075', '070800101', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-70a2', '020903776', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-70cf', '0523345', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-70fc', '010906387', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7129', '0194827', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7185', '130200203', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-71b2', '95970', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-71df', '112309811', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-720c', '020903777', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7239', '180822692', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7266', '070300257', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-729a', '95048', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-72c9', '7168857', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-72f6', '0518159', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7323', '0700171', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7350', '100308286', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-737d', '09102471', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-73aa', '070603110', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-73d7', '170930924', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7404', '081501086', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7431', '9762008', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-745e', '180130770', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-748b', '040711651', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-74b8', '21112132', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-74e5', '9344200', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7512', '0121257', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-753f', '060801028', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-756c', '060874', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7599', '110401374', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DEFECTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-75cd', '010902941', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-75ff', '0504011197', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-762c', '21001329', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7659', '021104707', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7686', '160104121', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-76b3', '0205246', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-76e0', '030321245', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-770d', '06270842', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-773a', '080378840', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7767', '80379637', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7794', '04252586', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-77c1', '060202086', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-77ee', '097121616', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-781b', '0130465', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7848', '090307052', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7875', '956295', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-78a2', '50701967', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-78cf', '1191035', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-78fc', '144616', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7929', '599242641', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7956', '05228941', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7983', '1036814', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-79b0', '112104948', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-79dd', '28015778', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7a0a', '160874109', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7a37', '0912055', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7a64', '97111207', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7a91', '78652', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7abe', '030320783', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7aeb', '7621876', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7b18', '0026381', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7b45', '09012961', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7b72', '040712015', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7ba4', '0903001931', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7bd1', '010112873', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7bfe', '0802244', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7c2b', '980506414', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7c58', '0529084657', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7c85', '991105278', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7cb2', '0121434', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7cdf', '030930144', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7d0c', '1107012', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7d39', '91104156', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7d66', '91117664', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7d93', '160538786', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7dc0', '100090410', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7ded', '9310631', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7e1a', '22911154', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-2a720d0b:16dd10c01a6:-7e4e', '19122343', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7b84', '97121691', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7bb1', '07300946', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7bde', '79233676', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7c0b', '69076536', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7c38', '100130961', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7c65', '967150', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7c92', '112704163', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7cbf', '44918633', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7cec', '030933136', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7d19', '7937886', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7d46', '0910909697', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3603b6c4:16da4bd83d3:-7d73', '9791572', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3764d5f4:16dd32ba3eb:-7d85', '0811462', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3764d5f4:16dd32ba3eb:-7db2', '20121139490', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-3764d5f4:16dd32ba3eb:-7de6', '990822581', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-4555834b:16da4ae3334:-7cff', '42003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-4555834b:16da4ae3334:-7d2c', '040107137', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-4555834b:16da4ae3334:-7d59', '0440109', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-4555834b:16da4ae3334:-7d86', '42002', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-4555834b:16da4ae3334:-7db3', '081201060', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-4555834b:16da4ae3334:-7de0', '42001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-4555834b:16da4ae3334:-7e14', '0504011199', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-781b', '180136793', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7848', '190101839', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7875', '190305234', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-78a2', '20181011791', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-78cf', '181168489', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-78fc', '2018040110', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7929', '20180400363', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7956', '180134946', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7983', '20180400309', 'EVER', 'ONE_AND_HALF_INCH', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-79b0', '171182358', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-79df', '160874499', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7a0a', '190100643', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7a37', '971210556', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7a64', '70603047', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7a91', '9057725', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7abe', '966163', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7aeb', '961319', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7b18', '170702470', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7b45', '509603', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7b72', '95129672', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7b9f', '9673058', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7bcc', '140102127', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7bf9', '0032326', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7c26', '70720951', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7c53', '150501568', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7c80', '150501595', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7cad', '00329', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7cda', '504007151', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7d07', '504007156', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7d34', '30714040', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7d61', '1004912', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7d8e', '160104128', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7dc0', '20720434', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7ded', '171266330', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7e1a', '20140600140', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-49b4f8e6:16db269b5f4:-7e4e', '911210370', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7767', '9511110', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7794', '0901023', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-77c1', '001107566', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-77ee', '1000712', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-781b', '10115670', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7848', '1100633', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7875', '160544615', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-78a2', '140109766', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-78cf', '0405437', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-78fc', '20110711517', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7929', '50608063', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7956', '201237563', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7983', '9009480', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-79b0', '20728254', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-79dd', '020742374', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7a0a', '20080930525', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7a37', '9186327', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7a64', '980124128', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7a91', '0800620', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7abe', '0812124', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7aeb', '08240416', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7b18', '0931234', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7b45', '0402799', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7b72', '161001179', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7b9f', '031105294', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7bcc', '6519', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7bf9', '94097293', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7c26', '0601849', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7c53', '01786990', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7c80', '140107595', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7cad', '60103267', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-51ee8f3d:16da807fefb:-7ce1', '20140910062', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7453', '6087477', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7480', '97104646', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DISCONNECTED', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-74ad', '20130119547', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-74da', '1090307208', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7507', '20160701164', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7534', '20100321022', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7561', '171251211', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-758e', '161202685', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-75bb', '100314430', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-75e8', '90736501', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7615', '716008026', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7642', '070602013', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-766f', '1002948', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-769c', '100502062', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-76c9', '61159', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-76f6', '110101954', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7723', '20131002948', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7750', '30320802', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-777d', '30321138', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-77aa', '70601838', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-77d7', '15225', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7804', '20160101011', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7831', '1101355', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-785e', '70401061', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-788b', '990322421', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-78b8', '4000200', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-78e5', '20131101355', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7912', '0800691', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-793f', '130710107', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-796c', '6081761', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7999', '4066913', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-79cb', '20120517170', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-79f8', '40323746', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7a25', '20181013484', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7a52', '971306985', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7a7f', '80381526', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7aac', '504008667', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7ad9', '990822861', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7b06', '17412910', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7b33', '150702799', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7b60', '08030407', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7b92', '170930499', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7bbf', '20090829865', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7bec', '80901205', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7c19', '1501666', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7c46', '150701054', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7c73', '140108295', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7ca0', '20130700883', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7ccd', '100520965', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7cfa', '100304408', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7d27', '100304700', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7d54', '94126486', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7d81', '110550795', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7dae', '20111000861', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7ddb', '40330278', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5349578:16db17fec0a:-7e4e', '408938', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7a9a', '0708010', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7b35', '980607606', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:59b6', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7b62', '171288643', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:-ca7', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7b8f', '171147642', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:48e7', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7bbc', '9604689', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:58d6', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7be9', '9623829', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:56cb', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7c16', '150502910', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:557f', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7c43', '40325934', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:5483', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7c70', '110401725', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:5387', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7c9d', '150702246', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:51d2', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7cca', '160873942', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:3cfc', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7cf7', '130910886', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:4b6f', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7d24', '0504009737', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:323f', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7d51', '1001800', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:307c', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7d7e', '070902612', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:2d8e', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7dab', '070515', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:2c44', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7dd8', '100524887', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:1b4b', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7e05', '060103764', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC-28e10a38:16bbe4e8bc2:-7dcf', '');
INSERT INTO `waterworks_meter` VALUES ('WM-58a703b8:16d94a2ecf7:-7e32', '11040027', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:-5e01', '');
INSERT INTO `waterworks_meter` VALUES ('WM-5aa126d2:16e0065723f:-7dab', '3042978', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5aa126d2:16e0065723f:-7dd8', '20181009348', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5aa126d2:16e0065723f:-7e05', '0624195', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5aa126d2:16e0065723f:-7e4e', '0612370', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b3c7424:16da3f8afc9:-7d39', '430005', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b3c7424:16da3f8afc9:-7d66', '060507018', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b3c7424:16da3f8afc9:-7d93', '125784', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b3c7424:16da3f8afc9:-7dc0', '980601334', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b3c7424:16da3f8afc9:-7ded', '060302339', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b3c7424:16da3f8afc9:-7e1a', '05413132', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b3c7424:16da3f8afc9:-7e4e', '020101548', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-79c5', '030510578', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-79f2', '080901338', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7a1f', '070104596', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7a4c', '030310961', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7a79', '1035467', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7aa6', '0521916', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7ad3', '040619837', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7b00', '040326720', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7b2d', '104041089', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7b5a', '160731134', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7b8e', '976573', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7bd1', '160103333', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7bfe', '070603113', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7c2b', '18111', '2562', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7c58', '040326303', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7c85', '967121', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7cb2', '160875863', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7cdf', '1530004', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7d0c', '170204204', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7d39', '001101592', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7d66', '180815536', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7d93', '070300480', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7dc0', '070300430', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7ded', '660402301', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7e1a', '961211894', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b4d46a:16dcd3ab253:-7e4e', '1530003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7a79', '0700460', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7aa6', '29160', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7ad3', '0812458', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7b00', '100131535', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7b2d', '1530001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7b5a', '0830858', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7b87', '030950255', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7bb4', '9021892', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7be1', '0761668', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7c0e', '0602033', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7c3b', '1103208', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7c68', '021002345', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7c95', '9688411', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7cc9', '031107502', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7d0c', '001104382', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7d39', '97105969', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7d66', '00110299', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DISCONNECTED', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7d93', '17126987', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7dc0', '889101100', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7ded', '090301936', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7e1a', '070301487', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-5b99d42c:16dc946e01f:-7e4e', '161109086', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-784d', '090307057', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-787a', '4421076', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-78a7', '4436073', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-78d4', '0504011191', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7901', '0529087135', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-792e', '160538109', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-795b', '020711417', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7988', '080265369', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-79b5', '9761367', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-79e2', '181168479', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7a0f', '181168477', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7a3c', '129125752', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7a69', '20181011816', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7a96', '040205011', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7ac3', '0803039', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7af0', '990922146', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7b1d', '000803129', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7b4a', '010402793', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7b77', '967149', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7ba4', '967596', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7bd1', '07000313', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7bfe', '020929960', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7c2b', '010701206', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7c58', '1001824', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7c85', '0715481', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7cb2', '08378747', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7cdf', '6789210', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7d0c', '010700213', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7d39', '0601325', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7d66', '070303277', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7d93', '16003768', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7dc0', '030709948', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7ded', '0529224', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7e1a', '0802256', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-666d4600:16dd7546ed5:-7e4e', '010110685', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-796b', '280608378', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-799f', '140106135', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-79e2', '1570003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7a0f', '980701888', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7a3c', '1570002', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7a69', '090307936', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7a96', '021003871', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7ac3', '09270740', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7af0', '010108243', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7b1d', '001006815', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7b4a', '990817514', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7b77', '1570001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7ba4', '080378394', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7bd1', '961454', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7bfe', '901284275', '2637', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7c2b', '030930007', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7c58', '70601612', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7c85', '030010510', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7cb2', '1007084', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7cdf', '971212823', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7d0c', '140107064', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7d39', '141000271', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7d66', '1102884', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7d93', '664004541', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7dc0', '140107065', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7ded', '16991103208', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7e1a', '160538716', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-696c46a:16dcdcad8c9:-7e4e', '0403058', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72604fdc:16dfb2eef8c:-7e4e', '1460006', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7c2b', '0244725', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7c58', '083102097', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7c85', '040619340', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7cb2', '040105018', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7cdf', '100102473', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7d0c', '050073', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7d39', '0605759', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7d66', '100540100', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7d93', '060378078', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7dc0', '090303914', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7ded', '010110148', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7e1a', '081102821', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-72e5c809:16dce0657df:-7e4e', '020414263', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-756bb1ca:16df70e554d:-7cdf', '161202324', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DEFECTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-756bb1ca:16df70e554d:-7d0c', '955752', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-756bb1ca:16df70e554d:-7d39', '040323747', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-756bb1ca:16df70e554d:-7d66', '99343775', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-756bb1ca:16df70e554d:-7d93', '911361', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-756bb1ca:16df70e554d:-7dc0', '39466052', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-756bb1ca:16df70e554d:-7ded', '990611980', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-756bb1ca:16df70e554d:-7e1a', '1460001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-756bb1ca:16df70e554d:-7e4e', '43779', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7603597f:16bbe41f21f:-7e33', '123456', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-78a2', '09220029', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-78cf', '100502066', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-78fc', '0604006', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7929', '0703211', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7956', '130170520', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7983', '080000394', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-79b0', '040105955', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-79dd', '94043552', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7a0a', '7949', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7a37', '0504007159', 'EVER', 'ONE_AND_HALF_INCH', 10000, 'STOCK', 'DISCONNECTED', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7a64', '0518416', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7a91', '150904251', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7abe', '200906013', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7af0', '06930407', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7b1d', '94117193', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7b4a', '180131038', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7b77', '160103855', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7ba4', '0715493', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7bd1', '10403331', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7bfe', '110550388', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7c2b', '93042776', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7c58', '0435144', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7c85', '0301508', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7cb2', '181273299', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7cdf', '140610167', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7d0c', '949242095', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7d39', '0101138', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7d66', '0435040', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7d93', '6130', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7dc0', '0605243', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7ded', '9774235', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7e1a', '140103478', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-773c34b:16da855fc90:-7e4e', '30123673', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-741f', '01050021', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-744c', '0703022108', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7479', '9100004', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-74a6', '0302715', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-74d3', '19225314', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7500', '9100003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-752d', '956854', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-755a', '070003797', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7587', '080000485', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-75b4', '060801704', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-75e1', '0412736', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-760e', '0402782', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-763b', '1002818', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7668', '000114418', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7696', '0763502', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-76c3', '160760358', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-76f0', '031105300', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-771d', '110704096', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-774a', '1147034', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7777', '9763256', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-77a4', '990304702', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-77d1', '05220082', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7805', '9100001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-785d', '161202821', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-788a', '0604029', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-78b7', '98047457', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-78e4', '08240905', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7911', '020171903', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-793e', '150910315', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-796b', '1138542', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7998', '021001690', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-79c5', '0119687', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-79f2', '021001691', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7a1f', '14081208', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7a4c', '040710233', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7a79', '150704218', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7aa6', '960200549', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7ad3', '090300171', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7b00', '0504477', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7b2d', '0503843', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7b5a', '08240903', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7b87', '0626784', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7bb4', '0627374', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7be1', '7915146497', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7c0e', '160303739', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7c3d', '140700496', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7c68', '0519476', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7c9c', '140700424', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7cdf', '010600500', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7d0c', '031103078', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7d39', '030931373', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7d66', '079465', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7d93', '0522006', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7dc0', '110400375', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7ded', '94124610', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7e1a', '0703456', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-776047da:16dc8baa506:-7e4e', '0401404', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-75ce', '43007', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7611', '980607609', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7645', '171145050', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7688', '150909634', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-76b5', '0700206077', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-76e2', '141001911', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-770f', '070708031', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-773c', '081603124', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7769', '150701113', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7796', '150503757', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-77c3', '030600124', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-77f0', '060407179', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-781d', '954113', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-784a', '0506011326', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7877', '69343021', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-78a4', '979644', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-78d1', '160103860', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-78fe', '150701899', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-792b', '140103338', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7958', '640506', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7985', '110508', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-79b2', '20180903398', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-79df', '100523103', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7a0c', '070308048', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7a39', '0101973', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7a66', '967434', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7a93', '050808023', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7ac0', '00026222', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7aed', '0301717', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7b1a', '170510649', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7b47', '980255162', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7b7b', '160128382', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7bea', '040208210', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7c17', '020415354', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7c4b', '030600193', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7cc2', '030660136', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7cef', '0701372', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7d1c', '1100217', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7d49', '10052285', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7d76', '0408244', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7da3', '4562339', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7dd0', '070701023', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7dfd', '062003213', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-7f88791:16da4015272:-7e31', '43006', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-787a', '20120521837', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-78a7', '20120301765', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-78d4', '9793539', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7901', '140102974', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-792e', '100520586', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-795b', '1480001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7988', '110401913', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-79b5', '180715416', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-79e2', '20130120914', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7a0f', '140102074', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7a3c', '20130117335', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7a69', '090303919', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7a96', '90303917', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7ac3', '0504007678', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7af0', '090303917', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7b1d', '21111589', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7b4a', '010800628', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7b77', '010110713', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7ba4', '000902454', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7bd1', '161000563', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7bfe', '050410011', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7c2b', '160131188', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7c58', '16911195', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7c85', '968529', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7cb2', '9056190', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7cdf', '4205', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7d0c', '20060716041', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7d39', '010800474', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7d66', '030825370', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7d93', '20140704760', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7dc0', '020931235', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7ded', '180822786', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7e1a', '0791752', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-a445eee:16df612b62f:-7e4e', '110400833', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-d464787:16da49a5514:-7ddb', '9703049', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM-d464787:16da49a5514:-7e4e', '020425780', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7c95', '112203812', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7cc9', '31208003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7d0c', '31208089', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7d39', '81208091', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7d66', '61108113', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7d93', '93042914', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7dc0', '70605182', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7ded', '40301034', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7e1a', '70602378', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1a797f74:16bbb987757:-7e4e', '990922486', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6db4', '0434986', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6de1', '180100138', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6e0e', '94051109', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6e3b', '9471167', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6e68', '97102181', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6e95', '010326486', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6ec2', '130201021', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6eef', '053003042', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6f1c', '9786616', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6f49', '110401660', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6f76', '170305908', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6fa3', '516190', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6fd0', '140702120', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-6ffd', '040709058', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-702a', '000118311', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7057', '020804182', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7084', '5249203', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-70b6', '030126792', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-70e3', '0504004547', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7110', '952780', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-713d', '040329071', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-716a', '20190400345', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7197', '05040097', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-71c4', '040702333', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-71f1', '0504007157', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-721e', '050301114', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-724b', '070324102', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7278', '000329037', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-72a5', '140103332', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-72d2', '010902442', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-72ff', '20180402079', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-732c', '9346172', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7359', '050400455', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7386', '150544961', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-73b3', '080150318', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-73e0', '150131342', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-740d', '1108028', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-743a', '040700754', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7467', '030409212', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7494', '96701995', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-74c8', '94116486', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-752d', '171235270', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-755a', '57001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7587', '94041191', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-75b4', '160871384', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-75e1', '97113246', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-760e', '9591291', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-763b', '030931592', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7668', '1139273', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7695', '130200308', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-76c2', '080151615', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-76f0', '5211952', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-771d', '1035492', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-774a', '070903874', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7777', '94023577', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-77ab', '0625333', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-77ee', '180715498', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-781b', '190304918', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7848', '180317086', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7875', '170936918', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-78a2', '150500697', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-78cf', '980603776', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-78fc', '9230183', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7929', '040700142', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7956', '100130362', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7983', '040700025', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-79b0', '1102567', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-79dd', '1140024', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7a0a', '92091', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7a37', '1102043', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7a64', '49189676', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7a91', '100314502', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7abe', '39466868', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7aeb', '160508464', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7b1d', '001105008', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7b4a', '040325014', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7b77', '9766634', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7ba4', '040329258', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7bd1', '436871', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7bfe', '110401354', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7c2b', '010113727', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7c58', '081607134', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7c85', '010112970', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7cb2', '102201071', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7cdf', '00056', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7d0c', '010704121', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7d39', '0074790', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7d66', '180131851', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7d93', '20109051', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7dc0', '0763409', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7ded', '9906612656', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7e1a', '1000122', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM1f42aabc:16da8be9215:-7e4e', '030930209', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-784d', '94063206', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-787a', '140102909', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-78a7', '1960708', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-78d4', '9411662', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7901', '020104638', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-792e', '20104638', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-795b', '140106748', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7988', '20140705001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-79b5', '52903100', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-79e2', '70003513', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7a0f', '0521811', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7a3c', '990622185', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7a69', '94117198', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7a96', '150701264', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7ac3', '80603826', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7af0', '0330201', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7b1d', '1006695', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7b4a', '180508326', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7b77', '20110118900', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7ba4', '20105792', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7bd1', '20105755', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7bfe', '2648231', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7c2b', '10800405', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7c58', '180316251', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7c85', '961207390', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7cb2', '140805428', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7cdf', '0700323', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7d0c', '0716216', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7d39', '0008200708', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7d66', '1106140', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7d93', '991238244', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7dc0', '5221704', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7ded', '040205211', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7e1a', '101507206', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM25e0fbb:16dac117c49:-7e4e', '030126725', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2cf44946:16db3b3d742:-7d66', '0087789', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2cf44946:16db3b3d742:-7d93', '0604011102', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2cf44946:16db3b3d742:-7dc0', '020438662', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2cf44946:16db3b3d742:-7ded', '39229760', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2cf44946:16db3b3d742:-7e1a', '0812270', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2cf44946:16db3b3d742:-7e4e', '161202813', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7a18', '004403257', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7a45', '161003813', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7a72', '0907120', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7a9f', '070301383', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7acc', '071806199', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7af9', '060403304', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7b26', '020408820', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7b5a', '971210714', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7bf9', '190305232', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7c26', '190305374', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7c53', '180130761', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7c80', '1140000', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7cad', '980214', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7cda', '85466', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7d07', '130710408', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7d34', '070510673', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7d61', '180336044', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7d8e', '040401032', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7dd0', '9100005', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7dfd', '06087475', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2ea9fe4a:16dc9299f05:-7e31', '799119', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7b61', '0623481', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7b8e', '1034500', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7bbb', '170501541', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7bfd', '1460005', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7c2a', '06020114', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7c57', '1480007', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7c84', '110413712', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7cb1', '140702102', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7cde', '438689', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7d0b', '021287', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7d38', '20120300043', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7d66', '862', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7d93', '400963', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7dc0', '081101064', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7ded', '94115116', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7e1a', '97102148', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM2fbb6479:16df737ded9:-7e4e', '102102008', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM305c8147:16da4d1dc54:-7cf6', '100522415', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM305c8147:16da4d1dc54:-7d39', '1509902125', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM305c8147:16da4d1dc54:-7d66', '20160122537', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM305c8147:16da4d1dc54:-7d93', '0708050486', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM305c8147:16da4d1dc54:-7dc0', '000903318', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM305c8147:16da4d1dc54:-7ded', '038869', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM305c8147:16da4d1dc54:-7e1a', '42004', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM305c8147:16da4d1dc54:-7e4e', '98020216', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7ba4', '100502065', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7bd1', '160102860', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7bfe', '9764518', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7c2b', '79226744', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7c58', '119024', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7c85', '017417', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7cb2', '20167865', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7cdf', '070402624', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7d0c', '160876565', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7d39', '04709061', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7d66', '06085999', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7d93', '20180500263', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7dc0', '080378627', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7ded', '0605745', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7e1a', '0605304', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM30ed6daa:16daa435053:-7e4e', '150502570', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7726', '160538697', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7753', '0506148', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7780', '990616817', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-77b7', '080378403', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-77e4', '11459974', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7816', '070101043', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7843', '0316735', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7870', '4562629', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-789d', '0911115065', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-78ca', '0202214', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-78f7', '050508240', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7924', '070602502', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7951', '071809007', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-797e', '040605052', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-79ab', '400475', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-79d8', '96113348', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7a05', '140102520', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7a32', '140102512', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7a5f', '060702039', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7a8c', '100524764', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7ab9', '409645894', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7aeb', '160129434', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7b18', '020601160', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7b45', '010800801', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7b72', '112203955', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DISCONNECTED', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7b9f', '0578369', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7bcc', '033007988', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7bfe', '150503750', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7c2b', '1150200770', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7c58', '0173458', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7c85', '49715', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7cb2', '100313298', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7cdf', '0300951', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7d0c', '140102976', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7d39', '070300406', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7d66', '981001374', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7d93', '100309603', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7dc0', '080902157', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7ded', '010326581', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7e1a', '040329965', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM3ff84889:16dd537648c:-7e4e', '010807714', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7a54', '990617060', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7a81', '080378143', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7aae', '180611379', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7af0', '180133016', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7b1d', '080378351', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7b4a', '171145044', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7b77', '100521146', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7ba4', '501554', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7bd1', '600226', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7bfe', '502495', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7c2b', '602230', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7c58', '20180400048', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7c85', '9687521', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7cb2', '171147630', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7cdf', '100130283', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7d0c', '14014394', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7d39', '180714855', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7d66', '170202412', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7d93', '25289', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7dc0', '060885099', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7ded', '19226278', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7e1a', '990402582', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM40153fb9:16df636f134:-7e4e', '170510613', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-747d', '161202892', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-74aa', '080378536', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-74d7', '160103470', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7504', '030931221', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7531', '071603034', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-755e', '9763072', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-758b', '5275686', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-75b8', '140700200', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-75e5', '08240572', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7612', '160848052', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-763f', '0120473', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-766c', '07000818', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7699', '02271000', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-76c6', '080578870', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-76f3', '06230068', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7720', '20180300718', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-774d', '171254363', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-777a', '91128527', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-77a7', '110550333', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-77d4', '100314657', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7801', '0146167', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7835', '19226266', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-78a0', '970001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-78cd', '1139057', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-78fa', '093038876', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7927', '001102039', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7954', '0522053', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7981', '991230733', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-79ae', '9762512', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-79db', '780314591', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7a08', '980604448', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7a5f', '950001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7a8c', '180136533', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7ab9', '2394205', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7aeb', '001111620', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7b1d', '0117594', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7b4a', '180132267', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7b77', '020434704', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7ba4', '97121183', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7bd1', '9051531', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7bfe', '140700151', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7c2b', '020928763', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7c58', '0467575', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7c85', '8018896', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7cb2', '943712', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7cdf', '1140149', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7d0c', '020104304', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7d39', '0520359', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7d66', '9900303734', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7d93', '71229084', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7dc0', '170510625', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7ded', '971209797', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7e1a', '910001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM440ab8dc:16daf2e5dee:-7e4e', '109356479', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5468', '0703010', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', 'WACC754b2f40:16d97f4f0d0:1448', '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5d46', '9623863', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5d7a', '180714673', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5de6', '100304343', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5e13', '43002', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5e40', '180818385', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5ec1', '050401065', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5eee', '0716031', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5f1b', '0102247', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5f48', '1000111', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5f75', '1000701', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5fa2', '1002869', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5fcf', '20181013583', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-5ffc', '150702529', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6029', '010602247', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6056', '109355619', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6083', '140106630', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-60b0', '1037024', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-60dd', '0929860', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-610a', '150701874', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6137', '150702189', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6164', '0317101', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6191', '990821763', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-61be', '070602889', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-61eb', '97104748', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6218', '0178303', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6245', '1100907', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6272', '0501733', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-629f', '300625', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-62cc', '180613470', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6300', '0905097', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-632d', '39229044', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-635a', '39229080', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6387', '11053797', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-63b4', '150131040', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-63e1', '9673577', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-640e', '43001', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-643b', '070302717', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6468', '150702925', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6497', '021004003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-64c2', '010113842', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-64ef', '1145625', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-651c', '07120', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6549', '20180731441', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6576', '08800644', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-65aa', '081607095', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-65f3', '100520502', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6620', '180613319', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-664d', '971005852', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-667a', '0804919', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-66a7', '1116405', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-66d4', '20180731461', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6701', '20180727183', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-672e', '070701021', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-675b', '0318408', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-679f', '980504878', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-67cc', '003038705', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-67f9', '25925807', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6826', '0400707', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6853', '09345006', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6880', '160864470', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-68ad', '358', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-68da', '781', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6907', '584', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6934', '6820', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6961', '7527', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-698e', '180130768', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-69bb', '180609433', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-69e8', '95010303', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6a15', '9798108', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6a49', '905996', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM45b1d314:16d955b42c7:-6a66', '9807058797', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM464e1220:16da9fc42c5:-7d66', '150500570', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM464e1220:16da9fc42c5:-7d95', '20180904398', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM464e1220:16da9fc42c5:-7dc0', '9766270', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM464e1220:16da9fc42c5:-7ded', '011200547', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM464e1220:16da9fc42c5:-7e1a', '0799409', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM464e1220:16da9fc42c5:-7e4e', '600902175', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-74c4', '160103465', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-74f1', '090307055', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-751e', '081608094', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-754b', '1000154', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7578', '69845593', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-75a5', '70307882', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-75d2', '021101601', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-75ff', '30935349', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-762c', '020107168', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7659', '080607061', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7686', '02084365', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-76b3', '050103805', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-76e0', '130915342', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-770d', '040710896', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-773a', '105032', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7767', '00000460', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7794', '2469781', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-77c1', '160100106', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-77ee', '40807699', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-781b', '05211872', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7848', '0502853', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7875', '20413580', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-78a2', '10620480', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-78cf', '040608082', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-78fc', '160103830', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7929', '103001343', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7956', '9292797', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7983', '160103401', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-79b0', '140106153', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-79dd', '100130968', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7a0a', '0504007154', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7a3c', '181272910', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7a69', '00048', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DISCONNECTED', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7a96', '0504905', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7ac3', '10522535', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7af0', '41203', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7b1d', '052903840', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7b4a', '080379169', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7b77', '08240607', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7ba4', '1142890', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7bd1', '150701345', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7bfe', '160104005', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7c2b', '0801978', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7c58', '9791329', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7c85', '79346045', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7cb2', '160103369', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7cdf', '1140210', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7d0c', '010903067', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7d39', '965780', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7d66', '0008886', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7d93', '971207426', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7dc0', '160654319', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7ded', '020724097', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7e1a', '962322', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM4c21a2c2:16dcc144b8e:-7e4e', '809234796', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-723f', '140610132', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-726c', '70302637', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7299', '990304600', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-72c6', '31102815', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-72f3', '140807661', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7320', '0802809', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7352', '180134965', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7380', '40329549', 'EVER', 'ONE_AND_HALF_INCH', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-73ad', '20150802802', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-73da', '030930497', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7407', '140103713', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7434', '061103062', 'EVER', 'ONE_AND_HALF_INCH', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7461', '40328628', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-748e', '0400753', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-74bb', '05220777', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-74e8', '95124482', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7515', '91103068', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7542', '031301039', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-756f', '0703918', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-759c', '30602510', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-75c9', '081301039', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-75f6', '20160703918', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7623', '180714854', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7650', '9409026', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-767d', '0804526', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-76d4', '033105079', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7701', '20150804526', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-772e', '171251783', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-775b', '94124722', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7788', '0000995', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-77b5', '150201616', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-77e2', '200917128', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-780f', '5221319', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7846', '6870653', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7873', '91230351', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-78a0', '93036402', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-78cd', '31403063', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-78fa', '20090812500', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7927', '96102700', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7954', '110403369', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7981', '10704858', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-79ae', '9511940', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-79db', '9308792', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7a08', '70002680', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7a35', '60405173', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7a62', '160104127', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7a8f', '97106497', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7abc', '9712107010', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7ae9', '43637', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7b16', '6221809', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7b43', '0022306', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7b70', '70100364', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7b9d', '50605008', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7bca', '50408669', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7bf7', '111656', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7c24', '112678', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7c51', '96121874', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7c7e', '0401107', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7cab', '9598324', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7cd8', '2011000097', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7d05', '20160514212', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7d32', '401114', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7d5f', '150502295', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7d93', '20160400174', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7dc0', '1130', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7ded', '160538409', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7e1a', '706134269', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM585ffcad:16dac5cc768:-7e4e', '70602064', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7baa', '171266449', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7bec', '1480006', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7c19', '1480005', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7c46', '1480004', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7c73', '20181001079', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7ca0', '1480003', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7ce2', '1480002', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7d24', '140109488', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7d51', '010904093', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7d7e', '100700196', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7dab', '20160301075', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7dd8', '20150802779', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7e05', '20150800695', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM5b19112c:16df65c347b:-7e4e', '140109489', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-63f6', '190407233', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6424', '20181012067', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6451', '181270507', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-647e', '181275382', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-64ab', '190305089', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-64d8', '190305037', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6505', '181152414', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6532', '181272719', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-655f', '181164523', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-658c', '180815614', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-65b9', '180609145', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-65e6', '20180902132', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6613', '181153102', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6640', '20180909544', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-666d', '180816088', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-669a', '20180904798', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-66c7', '180613500', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-66f4', '20180502502', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6721', '20180404403', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-674e', '180820600', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-677b', '150503278', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-67a8', '18004047', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-67d5', '180136042', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6802', '1695', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-682f', '20180400823', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-685c', '1304064', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6889', '052903308', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-68b6', '070601822', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-68e3', '0464893', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6910', '030321121', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-693d', '160732943', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-696a', '0479697', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6997', '161003761', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-69c4', '001108128', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-69f1', '001108611', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6a1e', '040710957', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6a4b', '0500268', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6a78', '040711763', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6aa5', '140701298', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6ad2', '52413041', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6aff', '990816260', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6b2c', '01070189', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6b59', '100302591', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6b86', '010108447', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6bb3', '130501539', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6be0', '0700463', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6c0d', '103522102', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6c3a', '001101521', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6c67', '160900378', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6c94', '160875716', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6cc1', '150917021', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6cee', '001108938', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6d1b', '1100562', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6d48', '140106636', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6d76', '001108928', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6da3', '080378123', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6dd0', '0293806', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DISCONNECTED', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6dfd', '040326644', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6e2a', '010103710', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6e57', '040327002', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6e84', '9987921869', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6eb1', '150917010', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6ede', '09066094', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6f0b', '000308298', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6f38', '24069788', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6f65', '160655607', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-6f99', '0514563', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7028', '100130136', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7055', '101805079', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7082', '150502422', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-70af', '140101896', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-70dc', '070101459', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7109', '160201838', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7136', '004104231', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7163', '130201456', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-71ac', '16031393', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7207', '160539697', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7234', '140610274', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7261', '1146300', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-728e', '001006810', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-72bb', '001010', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-72e8', '101402048', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7315', '07021831449', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7342', '030123116', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-736f', '100310740', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-739c', '030320910', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-73c9', '100523393', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-73f6', '160100114', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7423', '150910789', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7450', '0802375', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-747d', '0504007401', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-74aa', '010111444', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-74dc', '0803208', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7509', '020441831', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7536', '0514014', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7563', '140701476', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7590', '021002075', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-75bd', '0549797', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-75ea', '082403208', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7617', '0880538', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7644', '001103344', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7671', '0298266', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-769e', '140106680', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-76cb', '080603839', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-76f8', '030713773', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7725', '021001952', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7752', '05221144', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-777f', '102903040', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-77ac', '060502075', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-77d9', '08240483', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7806', '069503259', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7833', '990921378', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7860', '030933265', 'EVER', 'ONE_AND_HALF_INCH', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-788d', '101801173', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-78ba', '0802092', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-78e7', '060005114', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7914', '0903008', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7941', '130201477', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DISCONNECTED', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-796e', '08240797', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'DISCONNECTED', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-799b', '150913861', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-79c8', '1002525', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-79f5', '060320185', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7a22', '980509216', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7a4f', '0810128', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7a7c', '080150823', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7aa9', '070601255', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7ad6', '061103413', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7b03', '030308900', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7b30', '070404517', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7b5d', '052903413', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7b8a', '070300461', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7bb7', '090300723', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7be4', '0604008668', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7c11', '040206291', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7c3e', '0604802', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7c6b', '161002636', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7c9f', '100130138', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7cda', '1020726651', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7d07', '0504004545', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7d34', '02100080', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7d61', '050506091', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7d8e', '010508142', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7dbb', '031305145', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7ded', '038562', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7e1a', '1320340', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM6134f89:16d98a5b438:-7e4e', '990918131', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-77a9', '0101431', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-77d6', '0831757', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7803', '010701493', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7830', '06885698', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-785d', '0800383', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-788a', '0715312', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-78b7', '0415477', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-78e4', '050402095', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7911', '010114534', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-793e', '100130366', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-796b', '171260149', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7998', '2013040036', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-79c5', '100130331', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-79f2', '070602016', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7a21', '112203690', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7a4c', '1123265', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7a79', '944845', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7aad', '090914775', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7af0', '070404657', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7b1d', '5704065', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7b4a', '110401756', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7b77', '9404608', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7ba4', '28012859', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7bd1', '030713771', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7bfe', '1102195', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7c2b', '28011947', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7c58', '03060309', '9-27-19', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7c85', '0007435', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7cb2', '040770551', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7cdf', '9900919514', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7d0c', '150704236', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7d39', '967599', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7d66', '1144378', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7d93', '112504693', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7dc0', '053105751', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7ded', '070301263', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7e1a', '150502460', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM70649108:16da5117bf3:-7e4e', '970877', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM81e8a73:16dc7aba47d:-7dd0', '109354880', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM81e8a73:16dc7aba47d:-7dfd', '0830311', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
INSERT INTO `waterworks_meter` VALUES ('WM81e8a73:16dc7aba47d:-7e31', '011203441', 'EVER', 'ONE_HALF', 10000, 'STOCK', 'ACTIVE', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_metersize
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_metersize`;
CREATE TABLE `waterworks_metersize` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_metersize
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_metersize` VALUES ('FOUR_INCH', '4\"');
INSERT INTO `waterworks_metersize` VALUES ('ONE_AND_HALF_INCH', '1 1/2\"');
INSERT INTO `waterworks_metersize` VALUES ('ONE_HALF', '1/2\"');
INSERT INTO `waterworks_metersize` VALUES ('ONE_INCH', '1\"');
INSERT INTO `waterworks_metersize` VALUES ('SIX_INCH', '6\"');
INSERT INTO `waterworks_metersize` VALUES ('THREE_FOURTH_INCH', '3/4\"');
INSERT INTO `waterworks_metersize` VALUES ('THREE_INCH', '3\"');
INSERT INTO `waterworks_metersize` VALUES ('TWO_INCH', '2\"');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_mobile_header
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_mobile_header`;
CREATE TABLE `waterworks_mobile_header` (
  `batchid` varchar(50) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`batchid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_mobile_info
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_mobile_info`;
CREATE TABLE `waterworks_mobile_info` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `acctno` varchar(50) DEFAULT NULL,
  `acctname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `serialno` varchar(50) DEFAULT NULL,
  `sectorid` varchar(50) DEFAULT NULL,
  `sectorcode` varchar(50) DEFAULT NULL,
  `lastreading` int(11) DEFAULT NULL,
  `classificationid` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `period` varchar(50) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `discodate` date DEFAULT NULL,
  `rundate` datetime DEFAULT NULL,
  `items` longtext,
  `info` longtext,
  `itemaccountid` varchar(50) DEFAULT NULL,
  `stuboutid` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_itemaccountid` (`itemaccountid`) USING BTREE,
  KEY `ix_batchid` (`batchid`) USING BTREE,
  KEY `ix_classificationid` (`classificationid`) USING BTREE,
  KEY `ix_stuboutid` (`stuboutid`) USING BTREE,
  KEY `ix_sectorid` (`sectorid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_otherfee
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_otherfee`;
CREATE TABLE `waterworks_otherfee` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) NOT NULL,
  `item_code` varchar(25) DEFAULT NULL,
  `item_title` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `amtpaid` decimal(16,4) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_acctid` (`acctid`) USING BTREE,
  KEY `ix_item_objid` (`item_objid`) USING BTREE,
  KEY `ix_year` (`year`) USING BTREE,
  KEY `ix_month` (`month`) USING BTREE,
  KEY `fk_waterworks_otherfee_batchid` (`batchid`),
  CONSTRAINT `fk_waterworks_otherfee_batchid` FOREIGN KEY (`batchid`) REFERENCES `waterworks_batch_billing` (`objid`),
  CONSTRAINT `fk_waterworks_otherfee_itemobjid` FOREIGN KEY (`item_objid`) REFERENCES `waterworks_itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_otherfee
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_otherfee` VALUES ('WAC69bfcc9:1708b8eac8b:-7e34', 'WACC-51948ad8:1708b70634c:-7d03', NULL, 'WATER_CLEARANCE', NULL, 'WATER CLEARANCE', 2019, 1, 100.0000, 0.0000, '-', 0.00);
COMMIT;

-- ----------------------------
-- Table structure for waterworks_payment
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_payment`;
CREATE TABLE `waterworks_payment` (
  `objid` varchar(50) NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `discount` decimal(16,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `year` int(255) DEFAULT NULL,
  `month` int(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  KEY `ix_refno` (`refno`) USING BTREE,
  KEY `ix_refdate` (`refdate`) USING BTREE,
  KEY `fk_waterworks_payment_acctid` (`acctid`) USING BTREE,
  CONSTRAINT `fk_waterworks_payment_acctid` FOREIGN KEY (`acctid`) REFERENCES `waterworks_account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_payment_item
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_payment_item`;
CREATE TABLE `waterworks_payment_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `surcharge` decimal(10,2) DEFAULT NULL,
  `interest` decimal(10,2) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_refid` (`refid`) USING BTREE,
  KEY `ix_reftype` (`reftype`) USING BTREE,
  CONSTRAINT `fk_waterworks_payment_item_parentid` FOREIGN KEY (`parentid`) REFERENCES `waterworks_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waterworks_schedule_group
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_schedule_group`;
CREATE TABLE `waterworks_schedule_group` (
  `objid` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_schedule_group
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_schedule_group` VALUES ('-', 'No customer accounts as of this time');
INSERT INTO `waterworks_schedule_group` VALUES ('07', 'Due every 7th of the month');
INSERT INTO `waterworks_schedule_group` VALUES ('15', 'Due every 15th of the month');
INSERT INTO `waterworks_schedule_group` VALUES ('21', 'Due every 21st of the month');
INSERT INTO `waterworks_schedule_group` VALUES ('30', 'Due every 30th of the month');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_stubout
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_stubout`;
CREATE TABLE `waterworks_stubout` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `subareaid` varchar(50) NOT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_zoneid` (`subareaid`) USING BTREE,
  KEY `ix_barangay_objid` (`barangay_objid`) USING BTREE,
  CONSTRAINT `fk_waterworks_stubout_subareaid` FOREIGN KEY (`subareaid`) REFERENCES `waterworks_subarea` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_stubout
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-106f', '38', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-10f2', '37', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1175', '36', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-11f8', '35', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-127b', '34', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-12fe', '33', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1381', '32', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1404', '31', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1487', '30', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-150a', '29', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-158d', '28', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1610', '27', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1693', '26', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1716', '25', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-173', '21', 'P. Buhion St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1799', '24', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-181c', '23', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-189f', '22', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1a5e', '21', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1ae1', '20', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1b64', '19', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1be9', '18', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1c6c', '17', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1cef', '16', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1d72', '15', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1df5', '14', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1e78', '13', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1efb', '12', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1f6', '20', 'P. Buhion St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-1f7e', '11', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-2002', '10', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-2121', '09', 'A. Ugat St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-2233', '08', 'A. Ugat St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-22b6', '07', 'A. Ugat St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-2339', '06', 'A. Ugat St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-23bc', '05', 'A. Ugat St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-243f', '04', 'A. Ugat St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-24c2', '03', 'A. Ugat St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-2545', '02', 'A. Ugat St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-279', '19', 'P. Buhion St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-2813', '01', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-2fc', '18', 'P. Buhion St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-37f', '17', 'P. Buhion St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-402', '16', 'P. Buhion St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4269', '15', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-42ec', '14', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-436f', '13', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-43f2', '12', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4475', '11', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-44f8', '10', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-457b', '09', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-45fe', '08', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4682', '07', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-477c', '06', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-47ab', '05', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-47da', '04', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4809', '03', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4838', '02', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-485', '15', 'Esabo Rd.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4868', '01', 'F. Dagohoy Circum. Rd.', 'WSZ-19c5e4d8:16e134adbd7:-4939', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4ae9', '01', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4bb8', '43', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4c3b', '42', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4cbe', '41', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4d41', '40', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4dc4', '39', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4e47', '38', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4eca', '37', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4f4d', '36', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-4fd0', '35', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-5056', '34', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-508', '14', 'Esabo Rd.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-50d9', '33', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-515c', '32', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-51df', '31', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-5262', '30', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-52e5', '29', 'J.A Clarin St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-5368', '28', 'P. Buhion St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-53eb', '27', 'P. Buhion  St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-546e', '26', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-54f1', '25', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-5574', '24', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-58b', '13', 'Esabo Rd.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-5e25', '18', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-5ea8', '21', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-5f2b', '20', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-5fae', '22', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-6031', '19', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-60b4', '23', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-60e', '12', 'Esabo Rd.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-6137', '17', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-61ba', '16', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-623d', '15', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-62c0', '14', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-6343', '13', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-63c6', '12', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-6449', '11', 'R. Lumantao St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-64cc', '10', 'R. Alfarero St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-654f', '09', 'R. Alfarero St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-65d2', '08', 'R. Alfarero St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-6655', '07', 'R. Alfarero St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-66d8', '06', 'R. Alfarero St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-675b', '05', 'R. Alfarero St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-67de', '04', 'R. Alfarero St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-6861', '03', 'R. Alfarero St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-68ea', '02', 'R. Alfarero St.', 'WSZ-63544fa0:16b7b36a655:-19d8', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-691', '11', 'Esabo Rd.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-714', '10', 'Esabo Rd.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-797', '09', 'Esabo Rd.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-81a', '08', 'R. Alfarero St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-89d', '07', 'R. Alfarero St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-920', '06', 'R. Alfarero St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-9a5', '05', 'R. Alfarero St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-a83', '04', 'R. Alfarero St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-ab2', '03', 'R. Alfarero St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-ae1', '02', 'R. Alfarero St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-b12', '01', 'R. Alfarero St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-f0', '22', 'P. Buhion St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-f69', '40', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:-fec', '39', 'R. Alfarero St.', 'WSZ-19c5e4d8:16e134adbd7:-294e', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:106c', '04', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:794a', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:10ef', '05', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:794a', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:129', '25', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:1ac', '26', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:21', '23', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:22f', '27', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:2b2', '28', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:335', '29', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:3b8', '30', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:43b', '31', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:4be', '32', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:541', '33', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:5c4', '34', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:88a', '01', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:920', '02', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:9a5', '03', 'J.A Clarin St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:a28', '04', 'P. Buhion St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:a6', '24', 'R. Lumantao St.', 'WSZ-63544fa0:16b7ba6ef6c:78a3', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:aab', '05', 'P. Buhion St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:b2e', '06', 'P. Buhion St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:bb1', '07', 'P. Buhion St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:c34', '08', 'P. Buhion St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:cb7', '09', 'P. Buhion St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:d3a', '10', 'P. Buhion St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:dbd', '11', 'P. Buhion St.', 'WSZ-19c5e4d8:16e134adbd7:66f', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:ee2', '01', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:794a', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:f66', '02', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:794a', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-19c5e4d8:16e134adbd7:fe9', '03', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:794a', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-5e6c', '15', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-703f', '14', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-70c2', '13', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-7145', '12', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-71c9', '11', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-7321', '10', 'Kauswagan St.', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-73a4', '09', 'Kauswagan St.', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-7427', '08', 'Kauswagan St.', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-752d', '06', 'Manga Drive (Elley Hill Road)', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-75b0', '05', 'Manga Drive (Elley Hill Road)', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-7633', '04', 'Manga Drive (Elley Hill Road)', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-76b6', '03', 'Manga Drive (Elley Hill Road)\n', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-7739', '02', 'Manga Drive (Elley Hill Road)', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-77bf', '01', 'Manga Drive (Elley Hill Road)', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-266da48e:16b88289db7:-77cc', '07', 'Kauswagan St.', 'WSZ-63544fa0:16b7ba6ef6c:5340', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-157e', '34', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-162a', '33', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-16d6', '32', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-17d6', '31', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-19fd', '29', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-1aa9', '30', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-1be1', '28', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-2075', '27', 'Lower Sto. Niño', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-2149', '26', 'Lower Sto. Niño', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-21f5', '25', 'Lower Sto. Niño', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-22a1', '24', 'Lower Sto. Niño', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-239d', '23', 'Lower Sto. Niño', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-254c', '22', 'Lower Sto. Niño', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-2d81', '21', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-31a5', '20', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-32f0', '19', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-33c3', '18', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-346e', '17', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-3519', '16', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-36b4', '15', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-375f', '14', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-3882', '13', 'Estaca Drive', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-3955', '12', 'Estaca Drive', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-39d8', '11', 'Estaca Drive', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-3b37', '10', 'Estaca Drive', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-3c5a', '09', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-3e95', '08', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-3f40', '07', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-3feb', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4096', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4142', '04', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-41ed', '03', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-434c', '02', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-43f7', '01', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-8c4', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4740', '16', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4814', '15', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-48c0', '14', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4994', '13', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4b59', '12', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4c05', '11', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4cb1', '10', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4d5d', '09', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4e09', '08', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4eb5', '07', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-4f62', '06', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5086', '05', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5132', '04', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-51de', '03', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-52b2', '02', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-535e', '01', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-405c', '154-02-005', 'BOOY');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-56af', '14', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5783', '13', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5858', '12', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5904', '11', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5a28', '10', 'CPG North Ave.,', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5ad4', '09', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5bd0', '08', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5ca4', '07', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-5fb2', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-655d', '05', 'CPG North Ave.,', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-66a8', '04', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-677c', '03', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-689f', '02', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-339247f7:16d6463f123:-7147', '01', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:696', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1059', '36', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-10dc', '35', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-115f', '34', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-11e2', '33', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1265', '32', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-12e8', '31', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-136b', '30', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-13ee', '29', 'Lower Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1471', '28', 'Lower Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-14f4', '27', 'Lower Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1577', '26', 'Lower Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-15fa', '25', 'Lower Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-167d', '24', 'Lower Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1700', '23', 'Lower Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1784', '22', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-18bd', '21', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1940', '20', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-19c3', '19', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1a46', '18', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1ac9', '17', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1b4c', '16', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1bcf', '15', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1c52', '14', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1cd5', '13', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1d58', '12', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1ddb', '11', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1e5e', '10', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1ee1', '09', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1f64', '08', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-1fe7', '07', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-206a', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-20ed', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2170', '04', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-21f4', '03', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-22a', '61', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2329', '02', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2359', '01', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-24bf', '32', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2542', '31', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-25c5', '30', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2648', '29', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-26cb', '28', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-274e', '27', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-27d1', '26', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2854', '25', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-28d7', '24', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-29', '62', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-295a', '23', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-29de', '22', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2ad', '60', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2b67', '21', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2bea', '20', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2c6d', '19', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2cf0', '18', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2d73', '17', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2df6', '16', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2e79', '15', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2efc', '14', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-2f7f', '13', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3002', '12', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3085', '11', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3108', '10', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-318b', '09', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-320e', '08', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3291', '07', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3314', '06', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3397', '05', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-341a', '04', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-349d', '03', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3520', '02', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-35a4', '01', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7dd7', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-35b', '59', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-36e1', '16', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3764', '15', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-37e7', '14', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-386a', '13', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-38ed', '12', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3970', '11', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-39f3', '10', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3a76', '09', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3af9', '08', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3b4', '58', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3b7c', '07', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3bff', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3c82', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3d05', '04', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3d88', '03', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3e0b', '02', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-3e8f', '01', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:7d2f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-437', '57', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-44c1', '48', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4544', '47', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-45c7', '46', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-464a', '45', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-46cd', '44', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4750', '43', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-47d3', '42', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-48e4', '41', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4967', '40', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-49ea', '39', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4a6e', '38', 'Dote St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4ba', '56', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4ce2', '37', 'Capt. Francisco Salazar St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4d65', '36', 'Capt. Francisco Salazar St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4de8', '35', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4e6b', '34', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4eee', '33', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4f71', '32', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-4ff4', '31', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5077', '30', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-50fa', '29', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-517d', '28', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5200', '27', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5283', '26', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5306', '25', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5389', '24', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-540c', '23', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-548f', '22', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5660', '21', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-567', '55', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-56e3', '20', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5766', '19', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-57e9', '18', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-58f8', '17', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-597b', '16', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-59fe', '15', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5a81', '14', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5b04', '13', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5b87', '12', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5c0a', '11', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5c8d', '10', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5d10', '09', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5d93', '08', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-5ea', '54', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-643', '53', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-6534', '07', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-674b', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-67ce', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-6851', '04', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-68d6', '03', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-6959', '02', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-69de', '01', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-18e0', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-6c6', '52', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-749', '51', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-7cc', '50', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-851', '49', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-8d4', '48', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-957', '47', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-9da', '46', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-a87', '45', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-ae0', '44', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-b63', '43', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-d47', '41', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-df4', '42', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-e4d', '40', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-ed0', '39', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-f53', '38', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:-fd6', '37', 'Peñaflor St.', 'WSZ-63544fa0:16b7ba6ef6c:7e7d', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:1efe', '03', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7cfe', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:1f82', '04', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7cfe', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2005', '05', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7cfe', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2088', '06', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7cfe', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:210b', '07', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7cfe', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:211', '01', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2164', '08', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7cfe', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:21e7', '09', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7cfe', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2457', '01', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7bdc', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:24da', '02', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7bdc', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:255d', '03', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7bdc', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:25e0', '04', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7bdc', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2663', '05', 'Barol St.', 'WSZ-63544fa0:16b7c2385ac:-7bdc', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:26bc', '06', 'Barol St.', 'WSZ-63544fa0:16b7c2385ac:-7bdc', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2769', '07', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7bdc', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:27ec', '08', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7bdc', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:286f', '09', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7bdc', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2e26', '01', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7b38', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2eaa', '02', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7b38', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2f03', '03', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7b38', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:2f5c', '04', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7b38', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3033', '05', 'Gapac St.', 'WSZ-63544fa0:16b7c2385ac:-7b38', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:30b6', '06', 'Gapac St.', 'WSZ-63544fa0:16b7c2385ac:-7b38', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3139', '07', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7b38', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:31bc', '08', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7b38', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:323f', '09', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7b38', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:33a4', '01', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7a93', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3428', '02', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7a93', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:34ab', '03', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7a93', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:352e', '04', 'Zamora St.', 'WSZ-63544fa0:16b7c2385ac:-7a93', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3587', '05', 'Zamora St.', 'WSZ-63544fa0:16b7c2385ac:-7a93', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3635', '06', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7a93', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:36b8', '07', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7a93', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:386d', '01', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-79ec', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:38f1', '02', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-79ec', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:394a', '03', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-79ec', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:39cd', '04', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-79ec', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3a7a', '05', 'Dote St.', 'WSZ-63544fa0:16b7c2385ac:-79ec', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3afd', '06', 'Dote St.', 'WSZ-63544fa0:16b7c2385ac:-79ec', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3b80', '07', 'Dote St.', 'WSZ-63544fa0:16b7c2385ac:-79ec', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3c03', '08', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-79ec', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:3c86', '09', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-79ec', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:410b', '01', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4190', '02', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4213', '03', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:426c', '04', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4319', '05', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:439c', '06', 'F. Pelias St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:441f', '07', 'F. Pelias St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:44a2', '08', 'F. Pelias St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4525', '09', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:457e', '02', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:462b', '03', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:46ae', '10', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4731', '11', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:47b4', '12', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4837', '13', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:48ba', '14', 'Oroc St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:493d', '15', 'Oroc St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:49c0', '16', 'Oroc St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4a43', '17', 'Oroc St.', 'WSZ-63544fa0:16b7c2385ac:-7945', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4c48', '01', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-789f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4ccc', '02', 'Ubujan-Taloto Road', 'WSZ-63544fa0:16b7c2385ac:-789f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4d4f', '03', 'Oroc St.', 'WSZ-63544fa0:16b7c2385ac:-789f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4dd2', '04', 'Oroc St.', 'WSZ-63544fa0:16b7c2385ac:-789f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4e55', '05', 'Oroc St.', 'WSZ-63544fa0:16b7c2385ac:-789f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4ed8', '06', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-789f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4f5b', '07', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-789f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:4fb4', '08', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-789f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:5061', '09', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-789f', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:51ef', '01', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-77fa', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:5273', '02', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-77fa', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:52cc', '03', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-77fa', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:5379', '04', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-77fa', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:561f', '01', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-772a', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:56a3', '02', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-772a', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:5726', '03', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-772a', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:57a9', '04', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-772a', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:5802', '05', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-772a', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:58af', '06', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-772a', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:5932', '07', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-772a', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:59b5', '08', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-772a', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:5ac', '02', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:62f', '03', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:6b2', '04', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:70b', '05', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:78e', '06', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:811', '07', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:8be', '08', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:941', '09', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:99a', '10', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:a47', '11', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:aca', '12', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:b4d', '13', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:bd1', '14', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:c2a', '15', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:cd7', '16', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:d5a', '17', 'Peñaflor St.', 'WSZ-63544fa0:16b7b36a655:-17e9', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:f44', '01', 'Barol St.', 'WSZ-63544fa0:16b7c2385ac:-7cfe', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-340ead1f:16da87accc4:fc8', '02', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7cfe', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-109d', '10', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-10f6', '09', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-11a3', '08', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-11fc', '07', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-127f', '06', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-1302', '05', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-1386', '04', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-1720', '03', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-174f', '02', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-177f', '01', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-21f4', '47', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2277', '46', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2324', '45', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-237d', '44', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2400', '43', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2484', '42', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-25ce', '41', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-25fd', '40', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-26aa', '39', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2757', '38', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-27b0', '37', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-285d', '36', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-28b6', '35', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2963', '34', 'Cabisea St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2992', '33', 'Cabisea St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2a15', '32', 'Cabisea St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2a98', '31', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2b1b', '30', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2bc8', '29', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2c4b', '28', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2ca4', '27', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2d28', '26', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2dab', '25', 'Manga-Ubujan Boundary Drive', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2e2e', '24', 'Manga-Ubujan Boundary Drive', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2eb1', '23', 'Manga-Ubujan Boundary Drive', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2f34', '22', 'Manga-Ubujan Boundary Drive', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-2fb8', '21', 'Manga-Ubujan Boundary Drive', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3103', '20', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3186', '19', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3209', '18', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-328c', '17', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-330f', '16', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3392', '15', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3415', '14', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3498', '13', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3545', '12', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-359e', '11', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3621', '10', 'Juan Gondong St.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-36a4', '09', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3727', '08', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-37d4', '07', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-382d', '06', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-38da', '05', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3933', '04', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-39e0', '03', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3a39', '02', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3abd', '01', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1331', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3c24', '11', 'Cabisea St.', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3ca7', '10', 'Cabisea St.', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3d2b', '09', 'Cabisea St.', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-3e59', '08', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-42a4', '06', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4327', '05', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-43ab', '07', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4558', '04', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4587', '03', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-45b6', '02', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-45e6', '01', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:128d', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4822', '32', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-487b', '31', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-48fe', '30', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4981', '29', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4a2e', '28', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4a87', '27', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4b0a', '26', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4b8d', '25', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4c10', '24', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4c94', '23', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4ea2', '22', 'Ubujan-Taloto Road', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4f25', '21', 'Capt. Francisco Salazar St.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-4fa8', '20', 'Capt. Francisco Salazar St.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-502b', '19', 'Capt. Francisco Salazar St.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-50ae', '18', 'Capt. Francisco Salazar St.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-5131', '17', 'Capt. Francisco Salazar St.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-51b4', '16', 'Capt. Francisco Salazar St.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-5237', '15', 'Capt. Francisco Salazar St.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-52ba', '14', 'Capt. Francisco Salazar St.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-533d', '13', 'Capt. Francisco Salazar St.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-53c0', '12', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-5443', '11', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-54c6', '10', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-5549', '09', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-55cc', '08', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-564f', '07', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-56fc', '06', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-5755', '05', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-57d8', '04', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-585b', '03', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-58de', '02', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-5961', '01', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1143', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-644d', '10', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-64d0', '09', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6553', '08', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-65d6', '07', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6659', '06', 'Capt. Francisco Salazar St.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-66dc', '05', 'Capt. Francisco Salazar St.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-675f', '04', 'Capt. Francisco Salazar St.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-67e2', '03', 'Capt. Francisco Salazar St.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6865', '02', 'Capt. Francisco Salazar St.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6a0c', '01', 'Capt. Francisco Salazar St.', 'WSZ-63544fa0:16b7b36a655:-1625', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6c67', '08', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7539', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6cea', '07', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7539', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6d43', '06', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7539', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6dc6', '05', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7539', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6e49', '04', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7539', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6ecc', '03', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7539', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6f4f', '02', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7539', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-6fd3', '01', 'T. Cloma Ave.', 'WSZ-63544fa0:16b7c2385ac:-7539', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-7110', '04', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-75de', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-7193', '03', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-75de', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-7216', '02', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-75de', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-729a', '01', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-75de', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-7477', '06', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7685', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-74fa', '05', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7685', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-757d', '04', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7685', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-7600', '03', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7685', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-7683', '02', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7685', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-7708', '01', 'T. Escobilla St.', 'WSZ-63544fa0:16b7c2385ac:-7685', '154-02-013', 'TALOTO');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-a9b', '08', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:14eb', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-b1e', '07', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:14eb', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-ba1', '06', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:14eb', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-bfa', '05', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:14eb', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-ca7', '04', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:14eb', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-d00', '03', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:14eb', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-dad', '02', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:14eb', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-e07', '01', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:14eb', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-f6d', '12', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-382f7090:16dac1be4ad:-ff0', '11', 'T. Escobilla St.', 'WSZf8d5454:16b8b1109f0:141e', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5955', '14', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-59d8', '13', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5a5b', '12', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5ade', '11', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5b61', '10', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5be4', '09', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5c67', '08', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5cea', '07', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5d6d', '06', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5df0', '05', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5e73', '04', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5ef6', '03', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5f79', '02', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-5ffc', '01', 'Banat-i Hillside Rd.', 'WSZ-4b815399:16dfed14677:-60b2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-649d', '07', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-211d', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6520', '06', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-211d', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-65a3', '05', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-211d', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6626', '04', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-211d', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-66a9', '03', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-211d', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-672c', '02', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-211d', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-67ae', '01', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-211d', NULL, NULL);
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-69f7', '21', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6a7a', '20', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6afd', '19', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6b80', '18', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6c03', '17', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6c86', '16', 'Bool-Dampas Circum. Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6d09', '15', 'Banat-i Hillside Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6d8c', '14', 'Banat-i Hillside Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6e0f', '13', 'Banat-i Hillside Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6e92', '12', 'Banat-i Hillside Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6f15', '11', 'Banat-i Hillside Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-6f98', '10', 'Banat-i Hillside Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-701b', '09', 'Banat-i Hillside Rd.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-709f', '08', 'Banat-i Hillside Rd.\n', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-71df', '14', 'Pilayre St.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-7262', '13', 'Pilayre St.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-72e5', '12', 'Pilayre St.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-7369', '11', 'Pilayre St.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-73ec', '10', 'Pilayre St.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-746f', '09', 'Pilayre St.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-74f3', '08', 'Pilayre St.\n', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-79c7', '07', 'Banat-i Hillside Rd.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-7a4a', '06', 'Banat-i Hillside Rd.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-7acd', '05', 'Banat-i Hillside Rd.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-7b50', '04', 'Banat-i Hillside Rd.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-7bd3', '03', 'Banat-i Hillside Rd.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-7c56', '02', 'Banat-i Hillside Rd.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4b815399:16dfed14677:-7ce7', '01', 'Banat-i Hillside Rd.', 'WSZ40ab4823:16b7b19c4b0:-78f9', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-6d2b', '16', 'Manga Coastal Road', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-6dae', '15', 'Claro St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-6e31', '14', 'Claro St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-6eb4', '13', 'Claro St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-6f37', '12', 'Magsaysay St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-6fba', '11', 'Magsaysay St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-703d', '10', 'Magsaysay St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-70c0', '09', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-7143', '08', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-71c6', '07', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-7249', '06', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-72cd', '05', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-774e', '04', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-77d2', '03', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-78f6', '02', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4dbd7d7e:16b7b323675:-7b1a', '01', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-4f496392:16b79336c2a:-5952', '01', 'Sulague St.', 'WSZ-63544fa0:16b7ba6ef6c:-3b7d', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-51948ad8:1708b70634c:-7e22', 'XSTUB0UT1', 'first stubout', 'WGRP-6aa8a930:1708b56defb:-7e9f', '173-00-019', 'BATOMELONG');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-1085', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:529b', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-112b', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:529b', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-11d1', '04', 'Kauswagan St.', 'WSZ-63544fa0:16b7ba6ef6c:529b', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-1277', '03', 'Kauswagan St.', 'WSZ-63544fa0:16b7ba6ef6c:529b', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-132d', '02', 'Kauswagan St.', 'WSZ-63544fa0:16b7ba6ef6c:529b', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-13fb', '01', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:529b', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-2e27', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-31af', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-2ecd', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-31af', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-2f73', '04', 'Kauswagan St.', 'WSZ-63544fa0:16b7b36a655:-31af', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-3019', '03', 'Kauswagan St.', 'WSZ-63544fa0:16b7b36a655:-31af', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-30bf', '02', 'Kauswagan St.', 'WSZ-63544fa0:16b7b36a655:-31af', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-318d', '01', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-31af', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5779', '14', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-58c5', '13', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-596b', '12', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5a11', '11', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5ab7', '10', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5b5d', '09', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5c03', '08', 'Pandan St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5ca9', '07', 'Pandan St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5d4f', '06', 'Pandan St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5df5', '05', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5e9b', '04', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-5f69', '03', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-62a9', '02', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:-6377', '01', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3663', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:22ae', '01', 'Holy Trinity St.', 'WSZ-63544fa0:16b7ba6ef6c:-43bd', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:2331', '02', 'Holy Trinity St.', 'WSZ-63544fa0:16b7ba6ef6c:-43bd', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:23b4', '03', 'Holy Trinity St.', 'WSZ-63544fa0:16b7ba6ef6c:-43bd', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:2437', '04', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-43bd', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:24ba', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-43bd', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:253d', '06', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-43bd', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:25c0', '07', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-43bd', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:2643', '08', 'Sulague St.', 'WSZ-63544fa0:16b7ba6ef6c:-43bd', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:760', '01', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:6a22', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:7e4', '02', 'Jumamil St.', 'WSZ-63544fa0:16b7b36a655:6a22', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:867', '03', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:6a22', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:8ea', '04', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:6a22', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:96d', '05', 'Holy Trinity St.', 'WSZ-63544fa0:16b7b36a655:6a22', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:9f0', '06', 'Holy Trinity St.', 'WSZ-63544fa0:16b7b36a655:6a22', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-528b217c:16b877f050d:a73', '07', 'Sulague St.', 'WSZ-63544fa0:16b7b36a655:6a22', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1001', '39', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-105a', '38', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-10b', '01', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-10dd', '37', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1161', '36', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-120e', '35', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1267', '34', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-12ea', '33', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-136d', '32', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-13f0', '31', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1473', '30', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-14f6', '29', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1579', '28', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-15fe', '27', 'F. Toledo St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1811', '26', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-18be', '25', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1941', '24', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-19c4', '23', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1a1e', '22', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1b3e', '21', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1bc1', '20', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1c1a', '19', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1c9d', '18', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1d20', '17', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1dcd', '16', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1e50', '15', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1ea9', '14', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1f80', '13', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-1fd9', '12', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-2032', '11', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-20df', '10', 'H. Zamora St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-2162', '09', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-21e5', '08', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-223e', '07', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-22c1', '06', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-2344', '05', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-23f1', '04', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-244b', '03', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-2669', '02', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-269a', '01', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-3a2d', '43', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-3ab0', '42', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-3ce6', '41', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-3d69', '40', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-3dec', '39', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-3e99', '38', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-3ef2', '37', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-3f75', '36', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-3ff9', '35', 'H. Zamora St.\n\n', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-40a6', '34', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-40ff', '33', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4182', '32', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4205', '31', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-42b2', '30', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4335', '29', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-43b8', '28', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-443b', '27', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-44be', '26', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4517', '25', 'H. Zamora St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-459a', '24', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4647', '23', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-46a0', '22', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-492a', '21', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4983', '20', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-49dd', '19', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4a8a', '18', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4b0d', '17', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4b90', '16', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4be9', '15', 'F. Toledo St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4c96', '14', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4d19', '13', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4d72', '12', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4df5', '11', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4e78', '10', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4f4f', '09', 'J.A. Clarin St.\n', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-4fa8', '08', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-502b', '07', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-5084', '06', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-5107', '05', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-518a', '04', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-520d', '03', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-527', '59', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-5290', '02', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-5314', '01', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7b36a655:-358d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-5aa', '58', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-62d', '57', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-6b0', '56', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-733', '55', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-7b6', '54', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-839', '53', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-8bc', '52', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-93f', '51', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-9ec', '50', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-a45', '49', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-ac8', '48', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-b75', '47', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-bf8', '46', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-c51', '45', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-d28', '44', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-d57', '43', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-db', '02', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-ddb', '42', 'RROW (J.A. Clarin St. to H. Zamora St.)', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-ed1', '41', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:-f54', '40', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:399f', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1013', '09', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:10a2', '10', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:10fb', '11', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:11a8', '12', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:122b', '13', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:12ae', '14', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1331', '15', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:13b4', '16', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:140d', '17', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:143', '03', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:14ba', '18', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:153d', '19', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:15c0', '20', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1643', '21', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1789', '22', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:17e3', '23', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1890', '24', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1913', '25', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1996', '26', 'Private Road (C. Darunday St.)', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1a19', '27', 'Private Road (C. Darunday St.)', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1a9c', '28', 'Private Road (C. Darunday St.)', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1b1f', '29', 'Private Road (C. Darunday St.)', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1ba2', '30', 'Private Road (C. Darunday St.)', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1c25', '31', 'Private Road (C. Darunday St.)', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1c8', '04', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1eb2', '01', 'Salazar St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:1f85', '02', 'Salazar St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2008', '03', 'Salazar St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:208b', '04', 'Salazar St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:210e', '05', 'Salazar St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2191', '06', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2214', '07', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2297', '08', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:231a', '09', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2373', '10', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2420', '11', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:24a3', '12', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:24b', '05', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:24fc', '13', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:257f', '14', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:262c', '15', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:26af', '16', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2732', '17', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:27b5', '18', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2838', '19', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:28bb', '20', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2914', '21', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2aae', '22', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2b32', '23', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2b8b', '24', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2c38', '25', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2cbb', '26', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2ce', '06', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2d3e', '27', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2dc1', '28', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2e44', '29', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2ec7', '30', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2f4a', '31', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:2fa3', '32', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3026', '33', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:30d3', '34', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:312c', '35', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:31af', '36', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:325c', '37', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:32b5', '38', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3338', '39', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3391', '40', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3468', '41', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:351', '07', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:35d6', '42', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3659', '43', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:36dc', '44', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:375f', '45', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:37e2', '46', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3865', '47', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:38e8', '48', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:396b', '49', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:39ee', '50', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3a47', '51', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3aca', '52', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3b77', '53', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3bfa', '54', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3c7d', '55', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3d00', '56', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3d83', '57', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3e06', '58', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3e5f', '59', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3ee2', '60', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:3f8f', '61', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:419d', '62', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:4220', '63', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:42a3', '64', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:4326', '65', 'Interior area near Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3e0d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:457', '08', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:4da', '09', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:533', '10', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:5b6', '11', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:663', '12', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:6bc', '13', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:769', '14', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:79f', '15', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:84a', '16', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:8cd', '17', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3b0b', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:bf9', '01', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:c7d', '02', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:cd6', '03', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:d83', '04', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:ddc', '05', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:e89', '06', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:f0c', '07', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-60230eda:16db7b0b7ee:f8f', '08', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:3c79', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-2c62', '21', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-2d82', '20', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-2e05', '19', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-2e88', '18', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-2ee1', '17', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-2f8e', '16', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3011', '15', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3094', '14', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3117', '13', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3170', '12', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-31f3', '11', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-32ca', '10', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-32f9', '09', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-33a6', '08', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3429', '07', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-34ac', '06', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-352f', '05', 'Salazar Road', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3588', '04', 'CPG North Ave.', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-371a', '03', 'CPG North Ave.', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3749', '02', 'CPG North Ave.', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3779', '01', 'CPG North Ave.', 'WSZ-64710a95:16db14d8fd5:-3821', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3b00', '63', 'Uptown Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3b83', '62', 'Uptown Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3d43', '61', 'Uptown Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3dc6', '60', 'Uptown Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3e49', '59', 'Uptown Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3ea2', '58', 'Uptown Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3f25', '57', 'Acacia Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-3fa8', '56', 'Acacia Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-402b', '55', 'Acacia Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-40ae', '54', 'Uptown Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4136', '53', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-41b9', '52', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-423c', '51', 'Talisay Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-42e9', '50', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4342', '49', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-43ef', '48', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4472', '47', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-44f5', '46', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-454e', '45', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-45fb', '44', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-467e', '43', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-46d7', '42', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-49d8', '41', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4a31', '40', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4ab4', '39', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4b3c', '38', 'Marietta Homes', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4bbf', '37', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4c42', '36', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4cc5', '35', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4d48', '34', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4dcb', '33', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-4e4f', '32', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5182', '31', 'Narra St.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-54ac', '30', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5559', '29', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-55dc', '28', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5635', '27', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-56e2', '26', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-573b', '25', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-57e8', '24', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5841', '23', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-58c4', '22', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5947', '21', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5b55', '20', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5bd8', '19', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5c5b', '18', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5cdf', '17', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5d62', '16', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5de5', '15', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5e68', '14', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5eeb', '13', 'Salazar Road', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5f6e', '12', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-5ff1', '11', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-6074', '10', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-60f7', '09', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-617a', '08', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-6227', '07', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-62aa', '06', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-6303', '05', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-6386', '04', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-6409', '03', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-648d', '02', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-64710a95:16db14d8fd5:-6512', '01', 'CPG North Ave.', 'WSZf8d5454:16b8b1109f0:1590', '154-02-015', 'UBUJAN');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-6a9e', '23', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-6b23', '22', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-6d27', '21', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-6daa', '20', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-6e2f', '19', 'F. Dagohoy Road (Manga-Tiptip Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-6eb2', '18', 'F. Dagohoy Road (Manga-Tiptip Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-6f35', '17', 'F. Dagohoy Road (Manga-Tiptip Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-6fb8', '16', 'F. Dagohoy Road (Manga-Tiptip Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-703b', '15', 'F. Dagohoy Road (Manga-Tiptip Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-70be', '14', 'F. Dagohoy Road (Manga-Tiptip Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-7141', '13', 'F. Dagohoy Road (Manga-Tiptip Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-71c4', '12', 'Manga Drive (Elly Hill Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-7247', '11', 'Manga Drive (Elly Hill Road)\n', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-72ca', '10', 'Manga Drive (Elly Hill Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-734d', '09', 'Manga Drive (Elly Hill Road)', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-73d0', '08', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-7453', '07', 'Manga-Tiptip-Cabawan Road\n', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-74d6', '06', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-7559', '05', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-75dc', '04', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-765f', '03', 'Manga Drive', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-76e2', '02', 'Manga Drive\n', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-694f2604:16b7bf67a6c:-7767', '01', 'Manga Drive', 'WSZ-63544fa0:16b7ba6ef6c:53e6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-9d767de:16b788ae4d7:-74e2', '13', 'Pandan St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-9d767de:16b788ae4d7:-7588', '12', 'Pandan St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-9d767de:16b788ae4d7:-762e', '11', 'Pandan St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-9d767de:16b788ae4d7:-76fc', '10', 'Matuod St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1060', '18', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1166', '17', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-11e9', '16', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-126c', '15', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-12ef', '14', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1372', '13', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-13cb', '12', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1478', '11', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-14d1', '10', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-157e', '09', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1601', '08', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1684', '07', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1707', '06', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-178a', '05', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-17e4', '04', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1a7a', '03', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1aa9', '02', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1ada', '01', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1d47', '60', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1da0', '59', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1e23', '58', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1ea6', '57', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1f29', '56', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-1fac', '55', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-202f', '54', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-20dc', '53', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-215f', '52', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-21b8', '51', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-223b', '50', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-22be', '49', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2341', '48', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-23ee', '47', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2471', '46', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-24f4', '45', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2577', '44', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-25fa', '43', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2653', '42', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-27c2', '41', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-286f', '40', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-28c8', '39', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2975', '38', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-29f8', '37', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2a51', '36', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2ad4', '35', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2b57', '34', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2c04', '33', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2c87', '32', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2d0a', '31', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2d8d', '30', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2e10', '29', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2e69', '28', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2f16', '27', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-2f6f', '26', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3117', '25', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-31c4', '24', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-321d', '23', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-32a0', '22', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3323', '21', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-34fe', '20', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3581', '19', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-35da', '18', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3687', '17', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-370a', '16', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3763', '15', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3810', '14', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3869', '13', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-38ec', '12', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-396f', '11', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-39f2', '10', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3a9f', '09', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3b22', '08', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3ba5', '07', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3bfe', '06', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3c81', '05', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3d06', '04', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3ef4', '03', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3f24', '02', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-3f54', '01', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-7211', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4221', '34', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-42ce', '33', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4327', '32', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-43d4', '31', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4457', '30', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-44b0', '29', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4533', '28', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-45b6', '27', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4663', '26', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-46e6', '25', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4769', '24', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-47c2', '23', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4847', '22', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4a05', '21', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4ab2', '20', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4b0b', '19', 'Dagohoy Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4bb8', '18', 'San Roque Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4c1b', '17', 'San Roque Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4c9c', '16', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4d1d', '15', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4dc8', '14', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4e1f', '13', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4ea0', '12', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4f21', '11', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-4fa2', '10', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-5023', '09', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-50a4', '08', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-5125', '07', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-51a6', '06', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-5227', '05', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-52a9', '04', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-53c1', '03', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-53ee', '02', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-541c', '01', 'Elly Hill Road', 'WSZ-63544fa0:16b7b36a655:-16f5', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-5bb3', '26', 'F. Toledo St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-5c36', '25', 'F. Toledo St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-5c8f', '24', 'F. Toledo St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-5d13', '23', 'F. Toledo St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-5ef9', '22', 'F. Toledo St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-5fa6', '21', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6029', '20', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-60ac', '19', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-612f', '18', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6188', '17', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-620b', '16', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-62b8', '15', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6311', '14', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-63be', '13', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6417', '12', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-64c4', '11', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-651d', '10', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-65a0', '09', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-664d', '08', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-66a6', '07', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6729', '06', 'H. Zamora St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-67ac', '05', 'J.A. Clarin St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6830', '04', 'J.A. Clarin St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-68fa', '03', 'J.A. Clarin St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6929', '02', 'J.A. Clarin St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6959', '01', 'J.A. Clarin St.', 'WSZ-daa8f25:16dd03aaa19:-6cfa', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6f0f', '24', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6f68', '23', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-6fec', '22', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-724a', '21', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-72f7', '20', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7350', '19', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-73d3', '18', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7456', '17', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-74d9', '16', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7586', '15', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-75df', '14', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-768c', '13', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-770f', '12', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7768', '11', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7815', '10', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7898', '09', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-78f1', '08', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7974', '07', 'H. Zamora St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-79f7', '06', 'F. Toledo St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7a7a', '05', 'F. Toledo St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7b27', '04', 'F. Toledo St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7b80', '03', 'F. Toledo St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7c03', '02', 'F. Toledo St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-7cae', '01', 'F. Toledo St.', 'WSZ5ad2bf8f:16dcb53b97a:1997', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-ead', '21', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-f5a', '20', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd03aaa19:-fdd', '19', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-10b1', '52', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1134', '51', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-11e1', '50', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-123a', '49', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-12bd', '48', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1340', '47', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-13ed', '46', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-14', '29', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-144', '27', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1446', '45', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-14f3', '44', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-154c', '43', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-15d0', '42', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1709', '41', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-17b6', '40', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1837', '39', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-18bc', '38', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1915', '37', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-19c2', '36', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1a45', '35', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1a9e', '34', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1b4b', '33', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1bce', '32', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1c51', '31', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1c7', '26', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1cd4', '30', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1d57', '29', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1dda', '28', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1e33', '27', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1ee0', '26', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1f39', '25', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-1fbc', '24', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-203f', '23', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-20c3', '22', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-21d4', '21', 'Esabo Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2257', '20', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2304', '19', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-235d', '18', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-240a', '17', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2463', '16', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-24a', '25', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2510', '15', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2593', '14', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2616', '13', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-266f', '12', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-26f2', '11', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-279f', '10', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-27f8', '09', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-28a5', '08', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-28fe', '07', 'Casa Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2981', '06', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2a05', '05', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2af7', '04', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2b26', '03', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2b55', '02', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2b85', '01', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-70c7', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2cc2', '36', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2cd', '24', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2d45', '35', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2dc8', '34', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2e4b', '33', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2ece', '32', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2f7b', '31', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-2fd4', '30', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-3057', '29', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-3166', '28', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-31e9', '27', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-3296', '26', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-32ef', '25', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-3372', '24', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-33f5', '23', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-3479', '22', 'Manga-Tiptip-Cabawan Road', 'WSZ-63544fa0:16b7c2385ac:-716c', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-350', '23', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-3aa', '22', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-50b', '21', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-58e', '20', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-611', '19', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-6be', '18', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-741', '17', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-7c4', '16', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-81d', '15', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-8a0', '14', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-94d', '13', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-97', '28', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-9d0', '12', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-a29', '11', 'Kinampay Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-ad6', '10', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-b2f', '09', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-bdc', '08', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-c5f', '07', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-ce2', '06', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-d3b', '05', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-dbf', '04', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-ec5', '03', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-ef4', '02', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:-f24', '01', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:138d', '01', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1494', '02', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:14c', '32', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:14ed', '03', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:159a', '04', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:161d', '05', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1676', '06', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:16f9', '07', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:177c', '08', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:17ff', '09', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1882', '10', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:192f', '11', 'C. Darunday St.', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1988', '12', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1a35', '13', 'San Roque Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1ab8', '14', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1b11', '15', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1bbe', '16', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1c41', '17', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1c9a', '18', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1cf', '33', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1ecf', '19', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1f53', '20', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:1fd6', '21', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:2123', '22', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:217c', '23', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:21ff', '24', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:2282', '25', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:2305', '26', 'Dagohoy Road', 'WSZ-63544fa0:16b7c2385ac:-6f7b', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:252', '34', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:2ff', '35', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:382', '36', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:3db', '37', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:45e', '38', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:4e1', '39', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:58e', '40', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:611', '41', 'Pasan Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:6f', '30', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:722', '42', 'Pasan Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:7a6', '43', 'Pasan Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:829', '44', 'Pasan Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:8ac', '45', 'Pasan Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:905', '46', 'Pasan Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:9b2', '47', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:a0b', '48', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:a8e', '49', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:b11', '50', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:bbe', '51', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:c41', '52', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:c8', '31', 'Esabo Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:c9a', '53', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:d1d', '54', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:dca', '55', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO-daa8f25:16dd12b8b0b:e4d', '56', 'Dagohoy Road', 'WSZf8d5454:16b8b1109f0:17fb', '154-04-014', 'TIPTIP');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-37b6', '14', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3839', '13', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-38bc', '12', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-393f', '11', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-39c2', '10', 'Jumamil St.\n', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3a45', '09', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3ac8', '08', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3b4b', '07', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3bcf', '06', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3d00', '05', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3e30', '04', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3eb3', '03', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3f36', '02', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-3fba', '01', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:548e', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-69eb', '13', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-6a91', '12', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-6b37', '11', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-6bdd', '10', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-6c83', '09', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-6d29', '08', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-6dcf', '07', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-6e9d', '06', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-719d', '05', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-7243', '04', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-7311', '03', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-7655', '02', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO1fb31548:16b78a776cf:-7723', '01', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:5535', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-600b', '13', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6090', '11', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6113', '10', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6196', '09', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6219', '08', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-629c', '07', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-631f', '06', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-63a2', '05', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6425', '04', 'Claro St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-64a8', '03', 'Claro St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-652d', '02', 'Claro St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-65b1', '01', 'Claro St.', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6940', '16', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-69c3', '15', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6a46', '14', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6aca', '13', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6de9', '12', 'Manga Coastal Road\n', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6e6c', '11', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6eef', '10', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6f72', '09', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-6ff5', '08', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-7078', '07', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-7107', '06', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-718a', '05', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-720d', '04', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-7291', '03', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-76e2', '23', 'Manga Coastal Road', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-78c9', '22', 'Manga Coastal Road', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-794d', '21', 'Manga Coastal Road', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-79d0', '20', 'Manga Coastal Road\n', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-7a53', '19', 'Manga Coastal Road', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-7ad6', '18', 'Manga Coastal Road', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO2149d7ac:16b7bb0e336:-7b5a', '17', 'Manga Coastal Road', 'WSZ-63544fa0:16b7b36a655:-6afa', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO248f354b:16b7871ab23:-6a29', '09', 'Matuod St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO248f354b:16b7871ab23:-6acf', '08', 'Matuod St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO248f354b:16b7871ab23:-6b75', '07', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO248f354b:16b7871ab23:-6c1b', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO248f354b:16b7871ab23:-6cc1', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO248f354b:16b7871ab23:-6d67', '04', 'San Miguel St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO248f354b:16b7871ab23:-6e0d', '03', 'San Miguel St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO248f354b:16b7871ab23:-6eb3', '02', 'San Miguel St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO248f354b:16b7871ab23:-6f81', '01', 'San Miguel St.', 'WSZ-63544fa0:16b7b36a655:6902', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO285774b1:16dfec58ecd:-78c0', '07', 'Pilayre St.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO285774b1:16dfec58ecd:-7943', '06', 'Pilayre St.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO285774b1:16dfec58ecd:-79f0', '05', 'Pilayre St.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO285774b1:16dfec58ecd:-7a49', '04', 'Pilayre St.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO285774b1:16dfec58ecd:-7acc', '03', 'Pilayre St.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO285774b1:16dfec58ecd:-7b4f', '02', 'Pilayre St.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO285774b1:16dfec58ecd:-7bd3', '01', 'Pilayre St.', 'WSZ-63544fa0:16b7ba6ef6c:-26a2', '154-01-004', 'BOOL');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-102b', '05', 'Aray St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-10ff', '04', 'Aray St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-13db', '03', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-14af', '02', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-160f', '01', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-17c5', '04', 'Aray St.', 'WSZ-63544fa0:16b7ba6ef6c:-3a5f', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-1899', '03', 'Sulague St.', 'WSZ-63544fa0:16b7ba6ef6c:-3a5f', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-18d', '08', 'Saco St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-196d', '02', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3a5f', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-1b09', '01', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3a5f', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-1d48', '06', 'Aray St.', 'WSZ-63544fa0:16b7ba6ef6c:-3b7d', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-1e44', '05', 'Aray St.', 'WSZ-63544fa0:16b7ba6ef6c:-3b7d', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-21f6', '04', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3b7d', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-22cd', '03', 'Sulague St.', 'WSZ-63544fa0:16b7ba6ef6c:-3b7d', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-23a1', '02', 'Sulague St.', 'WSZ-63544fa0:16b7ba6ef6c:-3b7d', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-262', '07', 'Saco St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-30e', '06', 'Saco St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-40b', '05', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-4df', '04', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-654', '03', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-750', '02', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-824', '01', 'Jumamil St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-91', '09', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-98a', '13', 'Saco St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-a5e', '12', 'Saco St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-b32', '11', 'Saco St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-c56', '10', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-d2a', '09', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-dff', '08', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-eab', '07', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:-f57', '06', 'Aray St.', 'WSZ-63544fa0:16b7ba6ef6c:-3969', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:167', '11', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:3b98', '01', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:3c6c', '02', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:3d18', '03', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:3e3c', '04', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:3f60', '05', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:400c', '06', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:40b8', '07', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:418c', '08', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:4260', '09', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:43', '10', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:435c', '10', 'Matuod St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:4570', '11', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:4644', '12', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:46b', '12', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:46f0', '13', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:4891', '14', 'Sarigumba St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:4bbd', '15', 'Sarigumba St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:4c91', '16', 'Sarigumba St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:4d65', '17', 'Sarigumba St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:4e39', '18', 'Sarigumba St.', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:4f35', '19', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:5009', '20', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:50de', '21', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-34f6', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:5e0', '13', 'San Miguel St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:5ea9', '12', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-33a4', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:704', '14', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:800', '15', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5469734b:16d69820ad1:924', '16', 'Magsaysay St.', 'WSZ-63544fa0:16b7ba6ef6c:-3759', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO58c2e808:16b8ab264a4:-43f0', '02', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO58c2e808:16b8ab264a4:-4420', '01', 'Manga Coastal Road', 'WSZ-63544fa0:16b7ba6ef6c:-3825', '154-02-010', 'MANGA');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-102b', '37', 'N. Solijon St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1084', '36', 'N. Solijon St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1107', '35', 'N. Solijon St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-118a', '34', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-120d', '33', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-124', '61', 'Brunel St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1291', '32', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1314', '31', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1397', '30', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-141a', '29', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-149d', '28', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1520', '27', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-15cd', '26', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1626', '25', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-16a9', '24', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1756', '23', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-17b0', '22', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-19c0', '21', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1a43', '20', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1ac6', '19', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1b49', '18', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1bcc', '17', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1c4f', '16', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1cd2', '15', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1d1', '60', 'Brunel St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1d55', '14', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1dd8', '13', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1e85', '12', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1ede', '11', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1f61', '10', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-1fe4', '09', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2067', '08', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2114', '07', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2197', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-21f0', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-229d', '04', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-22a', '59', 'Brunel St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-22f6', '03', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-23a3', '02', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-23fd', '01', 'CPG North Ave.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-26f2', '08', 'N. Solijon St.', 'WSZ-63544fa0:16b7ba6ef6c:4f62', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-279f', '07', 'N.Solijon St.', 'WSZ-63544fa0:16b7ba6ef6c:4f62', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2822', '06', 'N.Solijon St.', 'WSZ-63544fa0:16b7ba6ef6c:4f62', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-28a5', '05', 'N.Solijon St.', 'WSZ-63544fa0:16b7ba6ef6c:4f62', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-28fe', '04', 'N.Solijon St.', 'WSZ-63544fa0:16b7ba6ef6c:4f62', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-29ab', '03', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:4f62', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2a04', '02', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:4f62', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2a88', '01', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:4f62', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2ad', '58', 'Brunel St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2dc4', '09', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:406d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2e47', '08', 'Simbit St.', 'WSZ-63544fa0:16b7ba6ef6c:406d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2eca', '07', 'Simbit St.', 'WSZ-63544fa0:16b7ba6ef6c:406d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2f4d', '06', 'Simbit St.', 'WSZ-63544fa0:16b7ba6ef6c:406d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-2fd0', '05', 'Simbit St.', 'WSZ-63544fa0:16b7ba6ef6c:406d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-3053', '04', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:406d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-30d6', '03', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:406d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-3159', '02', 'C. Darunday St.', 'WSZ-63544fa0:16b7ba6ef6c:406d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-31dd', '01', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:406d', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-376c', '08', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3f51', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-37ef', '07', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3f51', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-3872', '06', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3f51', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-38f5', '05', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3f51', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-3978', '04', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3f51', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-39fb', '03', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:3f51', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-3a7e', '02', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3f51', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-3b02', '01', 'Cornell St.', 'WSZ-63544fa0:16b7ba6ef6c:3f51', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-3eb', '57', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-444', '56', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-4f1', '55', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-54a', '54', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-5cd', '53', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-67a', '52', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-6d3', '51', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-756', '50', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-7d9', '49', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-85c', '48', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-8df', '47', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-98c', '46', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-a0f', '45', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-a92', '44', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-aeb', '43', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-b6f', '42', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-e1f', '41', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-e78', '40', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-efb', '39', 'J.A. Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:-f7e', '38', 'N. Solijon St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:101c', '25', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:1075', '26', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:10f8', '27', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:117b', '28', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:1228', '29', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:1281', '30', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:1304', '31', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:1387', '32', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:140a', '33', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:14b7', '34', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:1510', '35', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:15bd', '36', 'Sto. Niño St.\n\n', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:1ac', '65', 'Brunel St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:22', '62', 'Brunel St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:339', '01', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:369', '02', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:398', '03', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:47d', '04', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:4d7', '05', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:55a', '06', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:5dd', '07', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:68a', '08', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:70d', '09', 'Pacifico Castillo St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:790', '10', 'Simbit St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:7c', '63', 'Brunel St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:7e9', '11', 'Simbit St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:896', '12', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:919', '13', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:99c', '14', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:a1f', '15', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:a78', '16', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:afb', '17', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:b54', '18', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:c2b', '19', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:c84', '20', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:d31', '21', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:e92', '22', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:eec', '23', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:f99', '24', 'Sto. Niño St.', 'WSZ-63544fa0:16b7ba6ef6c:50ff', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5ad2bf8f:16dcb53b97a:ff', '64', 'Brunel St.', 'WSZ-63544fa0:16b7ba6ef6c:500a', '154-04-009', 'DAO');
INSERT INTO `waterworks_stubout` VALUES ('SO5e5678f:16d2be4e871:-67ea', '06', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-3c46', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO5e5678f:16d2be4e871:-686d', '05', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-3c46', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO5e5678f:16d2be4e871:-68f1', '04', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-3c46', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO5e5678f:16d2be4e871:-6a44', '03', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-3c46', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO5e5678f:16d2be4e871:-6ac8', '02', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-3c46', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO5e5678f:16d2be4e871:-6c96', '01', 'CPG North Ave.', 'WSZ-63544fa0:16b7b36a655:-3c46', '154-03-007', 'COGON');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-304c', '30', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-30cf', '29', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3152', '28', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-31d5', '27', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3258', '26', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-32db', '25', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-335e', '24', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-33e1', '23', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3464', '22', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-34e7', '21', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-356a', '20', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-35ed', '19', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3670', '18', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-36f3', '17', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3776', '16', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-37f9', '15', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-387d', '14', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-394e', '13', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-397d', '12', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-39ac', '11', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-39db', '10', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3a0a', '09', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3a39', '08', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3a68', '07', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3a97', '06', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3ac6', '05', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3af5', '04', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3b24', '03', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3b53', '02', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3b83', '01', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:7b3d', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3d6e', '46', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3df1', '45', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-3e76', '44', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-400c', '43', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-408f', '42', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-4112', '41', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-4195', '40', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-4218', '39', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-429b', '38', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-431e', '37', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-43a1', '36', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-4424', '35', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-44a7', '34', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-452a', '33', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-45b7', '32', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-463a', '31', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-46bd', '30', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-4741', '29', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-4fbe', '28', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5041', '27', 'D. Neri St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-50c4', '26', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5147', '25', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-51ca', '24', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-524f', '23', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-52d3', '22', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-53bc', '21', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-543f', '20', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-54c2', '19', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5545', '18', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-55c8', '17', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-564b', '16', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-56ce', '15', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5752', '14', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-57d5', '13', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5858', '12', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-58db', '11', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-595e', '10', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-59e1', '09', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5a64', '08', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5ae7', '07', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5b6b', '06', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5c14', '05', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5c43', '04', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5c72', '03', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5ca1', '02', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-5cd2', '01', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:7a96', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-604d', '41', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-60d0', '40', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6153', '39', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-61d6', '38', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6259', '37', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-62dc', '36', 'Binayran Rd.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-635f', '35', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-63e2', '34', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6465', '33', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-64e8', '32', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-656b', '31', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-65ee', '30', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6671', '29', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-66f5', '28', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6858', '27', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-68db', '26', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-695e', '25', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-69e1', '24', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6a64', '23', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6ae7', '22', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6b6a', '21', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6bed', '20', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6c70', '19', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6cf3', '18', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6d76', '17', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6df9', '16', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6e7c', '15', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6eff', '14', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-6f82', '13', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-7005', '12', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-7088', '11', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-710b', '10', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-718e', '09', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-7211', '08', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-7294', '07', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-7317', '06', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-739a', '05', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-741d', '04', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-74a0', '03', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-7523', '02', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-75a7', '01', 'J.A Clarin St.', 'WSZ-63544fa0:16b7ba6ef6c:79f1', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-79c9', '08', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:794a', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-7a4c', '07', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:794a', '154-04-012', 'SAN ISIDRO');
INSERT INTO `waterworks_stubout` VALUES ('SO6f0d290a:16e193ded5e:-7ad1', '06', 'A. Budlong St.', 'WSZ-63544fa0:16b7ba6ef6c:794a', '154-04-012', 'SAN ISIDRO');
COMMIT;

-- ----------------------------
-- Table structure for waterworks_subarea
-- ----------------------------
DROP TABLE IF EXISTS `waterworks_subarea`;
CREATE TABLE `waterworks_subarea` (
  `objid` varchar(50) NOT NULL,
  `areaid` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `schedulegroupid` varchar(50) DEFAULT NULL,
  `nextperiod_year` int(255) DEFAULT NULL,
  `nextperiod_month` int(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_waterworks_subarea_areaid` (`areaid`),
  KEY `fk_waterworks_subarea_schedulegroupid` (`schedulegroupid`),
  CONSTRAINT `fk_waterworks_subarea_areaid` FOREIGN KEY (`areaid`) REFERENCES `waterworks_area` (`objid`),
  CONSTRAINT `fk_waterworks_subarea_schedulegroupid` FOREIGN KEY (`schedulegroupid`) REFERENCES `waterworks_schedule_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waterworks_subarea
-- ----------------------------
BEGIN;
INSERT INTO `waterworks_subarea` VALUES ('WGRP-6aa8a930:1708b56defb:-7e9f', '27de008f:1708b6252a4:-8000', 'BLOCK_1', 'BLOCK 1', '30', 2020, 4);
INSERT INTO `waterworks_subarea` VALUES ('WGRP6e921dba:1709aa8c38a:-7782', '27de008f:1708b6252a4:-8000', 'BLOCK2', 'BLOCK 2', NULL, NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-19c5e4d8:16e134adbd7:-294e', '42a40865:16a62002559:-67f1', '220203', 'SAN ISIDRO B2', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-19c5e4d8:16e134adbd7:-4939', '42a40865:16a62002559:-67f1', '220103', 'SAN ISIDRO B1', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-19c5e4d8:16e134adbd7:66f', '42a40865:16a62002559:-67f1', '220503', 'SAN ISIDRO B5', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-4b815399:16dfed14677:-60b2', '42a40865:16a62002559:-67f1', '100402', 'BOOL B4', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-1625', '42a40865:16a62002559:-67f1', '260101', 'UBUJAN', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-16f5', '42a40865:16a62002559:-67f1', '250103', 'TIPTIP B1', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-17e9', '42a40865:16a62002559:-67f1', '240104', 'TALOTO9 B1', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-18e0', '42a40865:16a62002559:-67f1', '230101', 'TALOTO8 B1', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-19d8', '42a40865:16a62002559:-67f1', '220303', 'SAN ISIDRO B3', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-1aa4', '42a40865:16a62002559:-67f1', '210100', 'POBLACION3 B1', '-', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-1bb2', '42a40865:16a62002559:-67f1', '200100', 'POBLACION2 B1', '-', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-2b9b', '42a40865:16a62002559:-67f1', '190100', 'POBLACION1 B1', '-', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-2d63', '42a40865:16a62002559:-67f1', '180100', 'MANSASA', '-', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-31af', '42a40865:16a62002559:-67f1', '160103', 'MANGA6 B1', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-358d', '42a40865:16a62002559:-67f1', '150101', 'DAO B1', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-372d', '42a40865:16a62002559:-67f1', '140100', 'DAMPAS', '-', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-3c46', '42a40865:16a62002559:-67f1', '130603', 'COGON B6', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-3ee5', '42a40865:16a62002559:-67f1', '120103', 'CABAWAN B1', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-405c', '42a40865:16a62002559:-67f1', '110202', 'BOOY B2', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:-6afa', '42a40865:16a62002559:-67f1', '171104', 'MANGA7 B11', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:6902', '42a40865:16a62002559:-67f1', '170701', 'MANGA7 B7', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7b36a655:6a22', '42a40865:16a62002559:-67f1', '170101', 'MANGA7 B1', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-11', '42a40865:16a62002559:-67f1', '120503', 'CABAWAN B5', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-12d', '42a40865:16a62002559:-67f1', '120403', 'CABAWAN B4', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-211d', '42a40865:16a62002559:-67f1', '100302', 'BOOL B3', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-249', '42a40865:16a62002559:-67f1', '120303', 'CABAWAN B3', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-26a2', '42a40865:16a62002559:-67f1', '100202', 'BOOL B2', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-33a4', '42a40865:16a62002559:-67f1', '171002', 'MANGA7 B10', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-34f6', '42a40865:16a62002559:-67f1', '170903', 'MANGA7 B9', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-3663', '42a40865:16a62002559:-67f1', '170801', 'MANGA7 B8', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-3759', '42a40865:16a62002559:-67f1', '170601', 'MANGA7 B6', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-3825', '42a40865:16a62002559:-67f1', '171202', 'MANGA7 B12', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-3969', '42a40865:16a62002559:-67f1', '170501', 'MANGA7 B5', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-3a5f', '42a40865:16a62002559:-67f1', '170401', 'MANGA7 B4', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-3b7d', '42a40865:16a62002559:-67f1', '170301', 'MANGA7 B3', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-43bd', '42a40865:16a62002559:-67f1', '170201', 'MANGA7 B2', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:-8c4', '42a40865:16a62002559:-67f1', '110304', 'BOOY B3', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:399f', '42a40865:16a62002559:-67f1', '150202', 'DAO B2', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:3b0b', '42a40865:16a62002559:-67f1', '150302', 'DAO B3', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:3c79', '42a40865:16a62002559:-67f1', '150402', 'DAO B4', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:3e0d', '42a40865:16a62002559:-67f1', '150502', 'DAO B5', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:3f51', '42a40865:16a62002559:-67f1', '150604', 'DAO B6', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:406d', '42a40865:16a62002559:-67f1', '150704', 'DAO B7', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:4f62', '42a40865:16a62002559:-67f1', '150804', 'DAO B8', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:500a', '42a40865:16a62002559:-67f1', '150901', 'DAO B9', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:50ff', '42a40865:16a62002559:-67f1', '151002', 'DAO B10', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:529b', '42a40865:16a62002559:-67f1', '160203', 'MANGA6 B2', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:5340', '42a40865:16a62002559:-67f1', '160303', 'MANGA6 B3', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:53e6', '42a40865:16a62002559:-67f1', '160402', 'MANGA6 B4', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:548e', '42a40865:16a62002559:-67f1', '160502', 'MANGA6 B5', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:5535', '42a40865:16a62002559:-67f1', '160602', 'MANGA6 B6', '15', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:696', '42a40865:16a62002559:-67f1', '131103', 'COGON B11', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:78a3', '42a40865:16a62002559:-67f1', '220403', 'SAN ISIDRO B4', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:794a', '42a40865:16a62002559:-67f1', '220603', 'SAN ISIDRO B6', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:79f1', '42a40865:16a62002559:-67f1', '220703', 'SAN ISIDRO B7', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:7a96', '42a40865:16a62002559:-67f1', '220803', 'SAN ISIDRO B8', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:7b3d', '42a40865:16a62002559:-67f1', '220903', 'SAN ISIDRO B9', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:7d2f', '42a40865:16a62002559:-67f1', '230201', 'TALOTO8 B2', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:7dd7', '42a40865:16a62002559:-67f1', '230301', 'TALOTO8 B3', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:7e7d', '42a40865:16a62002559:-67f1', '230403', 'TALOTO8 B4', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7ba6ef6c:e3', '42a40865:16a62002559:-67f1', '120603', 'CABAWAN B6', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-6d91', '42a40865:16a62002559:-67f1', '250801', 'TIPTIP B8', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-6ed6', '42a40865:16a62002559:-67f1', '250701', 'TIPTIP B7', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-6f7b', '42a40865:16a62002559:-67f1', '250604', 'TIPTIP B6', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7020', '42a40865:16a62002559:-67f1', '250504', 'TIPTIP B5', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-70c7', '42a40865:16a62002559:-67f1', '250403', 'TIPTIP B4', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-716c', '42a40865:16a62002559:-67f1', '250303', 'TIPTIP B3', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7211', '42a40865:16a62002559:-67f1', '250203', 'TIPTIP B2', '30', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7539', '42a40865:16a62002559:-67f1', '241601', 'TALOTO9 B16', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-75de', '42a40865:16a62002559:-67f1', '241503', 'TALOTO9 B15', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7685', '42a40865:16a62002559:-67f1', '241403', 'TALOTO9 B14', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-772a', '42a40865:16a62002559:-67f1', '241303', 'TALOTO9 B13', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-77fa', '42a40865:16a62002559:-67f1', '241203', 'TALOTO9 B12', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-789f', '42a40865:16a62002559:-67f1', '241103', 'TALOTO9 B11', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7945', '42a40865:16a62002559:-67f1', '241004', 'TALOTO9 B10', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-79ec', '42a40865:16a62002559:-67f1', '240904', 'TALOTO9 B9', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7a93', '42a40865:16a62002559:-67f1', '240804', 'TALOTO9 B8', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7b38', '42a40865:16a62002559:-67f1', '240704', 'TALOTO9 B7', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7bdc', '42a40865:16a62002559:-67f1', '240604', 'TALOTO9 B6', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7cfe', '42a40865:16a62002559:-67f1', '240504', 'TALOTO9 B5', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7e48', '42a40865:16a62002559:-67f1', '240303', 'TALOTO9 B3', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-63544fa0:16b7c2385ac:-7eed', '42a40865:16a62002559:-67f1', '240203', 'TALOTO9 B2', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-64710a95:16db14d8fd5:-3821', '42a40865:16a62002559:-67f1', '260801', 'UBUJAN', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ-daa8f25:16dd03aaa19:-6cfa', '42a40865:16a62002559:-67f1', '151201', 'DAO B12', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ40ab4823:16b7b19c4b0:-78f9', '42a40865:16a62002559:-67f1', '100102', 'BOOL B1', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZ5ad2bf8f:16dcb53b97a:1997', '42a40865:16a62002559:-67f1', '151102', 'DAO B11', '21', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZf8d5454:16b8b1109f0:1143', '42a40865:16a62002559:-67f1', '260201', 'UBUJAN', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZf8d5454:16b8b1109f0:128d', '42a40865:16a62002559:-67f1', '260304', 'UBUJAN', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZf8d5454:16b8b1109f0:1331', '42a40865:16a62002559:-67f1', '260404', 'UBUJAN', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZf8d5454:16b8b1109f0:141e', '42a40865:16a62002559:-67f1', '260504', 'UBUJAN', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZf8d5454:16b8b1109f0:14eb', '42a40865:16a62002559:-67f1', '260604', 'UBUJAN', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZf8d5454:16b8b1109f0:1590', '42a40865:16a62002559:-67f1', '260702', 'UBUJAN', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZf8d5454:16b8b1109f0:1635', '42a40865:16a62002559:-67f1', '260704', 'UBUJAN', '07', NULL, NULL);
INSERT INTO `waterworks_subarea` VALUES ('WSZf8d5454:16b8b1109f0:17fb', '42a40865:16a62002559:-67f1', '250503', 'TIPTIP B5', '30', NULL, NULL);
COMMIT;

-- ----------------------------
-- View structure for vw_report_billing_summary
-- ----------------------------
DROP VIEW IF EXISTS `vw_report_billing_summary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_report_billing_summary` AS select `wbs`.`year` AS `year`,`wbs`.`month` AS `month`,`ws`.`barangay_objid` AS `barangay_objid`,`ws`.`barangay_name` AS `barangay_name`,`wz`.`objid` AS `zone_objid`,`wz`.`code` AS `zone_code`,`ws`.`description` AS `zone_title`,(case when ((`cl`.`objid` = 'RESIDENTIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then 1 else 0 end) AS `res_metered`,(case when ((`cl`.`objid` = 'RESIDENTIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`volume` else 0 end) AS `res_meteredvol`,(case when ((`cl`.`objid` = 'RESIDENTIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`amount` else 0 end) AS `res_meteredamt`,(case when ((`cl`.`objid` = 'RESIDENTIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then 1 else 0 end) AS `res_defective`,(case when ((`cl`.`objid` = 'RESIDENTIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`volume` else 0 end) AS `res_defectivevol`,(case when ((`cl`.`objid` = 'RESIDENTIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`amount` else 0 end) AS `res_defectiveamt`,(case when ((`cl`.`objid` = 'RESIDENTIAL') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then 1 else 0 end) AS `res_unmetered`,(case when ((`cl`.`objid` = 'RESIDENTIAL') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`volume` else 0 end) AS `res_unmeteredvol`,(case when ((`cl`.`objid` = 'RESIDENTIAL') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`amount` else 0 end) AS `res_unmeteredamt`,(case when ((`cl`.`objid` = 'COMMERCIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then 1 else 0 end) AS `com_metered`,(case when ((`cl`.`objid` = 'COMMERCIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`volume` else 0 end) AS `com_meteredvol`,(case when ((`cl`.`objid` = 'COMMERCIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`amount` else 0 end) AS `com_meteredamt`,(case when ((`cl`.`objid` = 'COMMERCIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then 1 else 0 end) AS `com_defective`,(case when ((`cl`.`objid` = 'COMMERCIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`volume` else 0 end) AS `com_defectivevol`,(case when ((`cl`.`objid` = 'COMMERCIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`amount` else 0 end) AS `com_defectiveamt`,(case when ((`cl`.`objid` = 'COMMERCIAL') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then 1 else 0 end) AS `com_unmetered`,(case when ((`cl`.`objid` = 'COMMERCIAL') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`volume` else 0 end) AS `com_unmeteredvol`,(case when ((`cl`.`objid` = 'COMMERCIAL') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`amount` else 0 end) AS `com_unmeteredamt`,(case when ((`cl`.`objid` = 'INDUSTRIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then 1 else 0 end) AS `ind_metered`,(case when ((`cl`.`objid` = 'INDUSTRIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`volume` else 0 end) AS `ind_meteredvol`,(case when ((`cl`.`objid` = 'INDUSTRIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`amount` else 0 end) AS `ind_meteredamt`,(case when ((`cl`.`objid` = 'INDUSTRIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then 1 else 0 end) AS `ind_defective`,(case when ((`cl`.`objid` = 'INDUSTRIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`volume` else 0 end) AS `ind_defectivevol`,(case when ((`cl`.`objid` = 'INDUSTRIAL') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`amount` else 0 end) AS `ind_defectiveamt`,(case when ((`cl`.`objid` = 'INDUSTRIAL') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then 1 else 0 end) AS `ind_unmetered`,(case when ((`cl`.`objid` = 'INDUSTRIAL') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`volume` else 0 end) AS `ind_unmeteredvol`,(case when ((`cl`.`objid` = 'INDUSTRIAL') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`amount` else 0 end) AS `ind_unmeteredamt`,(case when ((`cl`.`objid` = 'GOVERNMENT') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then 1 else 0 end) AS `gov_metered`,(case when ((`cl`.`objid` = 'GOVERNMENT') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`volume` else 0 end) AS `gov_meteredvol`,(case when ((`cl`.`objid` = 'GOVERNMENT') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`amount` else 0 end) AS `gov_meteredamt`,(case when ((`cl`.`objid` = 'GOVERNMENT') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then 1 else 0 end) AS `gov_defective`,(case when ((`cl`.`objid` = 'GOVERNMENT') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`volume` else 0 end) AS `gov_defectivevol`,(case when ((`cl`.`objid` = 'GOVERNMENT') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`amount` else 0 end) AS `gov_defectiveamt`,(case when ((`cl`.`objid` = 'GOVERNMENT') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then 1 else 0 end) AS `gov_unmetered`,(case when ((`cl`.`objid` = 'GOVERNMENT') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`volume` else 0 end) AS `gov_unmeteredvol`,(case when ((`cl`.`objid` = 'GOVERNMENT') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`amount` else 0 end) AS `gov_unmeteredamt`,(case when ((`cl`.`objid` = 'BULK') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then 1 else 0 end) AS `bulk_metered`,(case when ((`cl`.`objid` = 'BULK') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`volume` else 0 end) AS `bulk_meteredvol`,(case when ((`cl`.`objid` = 'BULK') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'ACTIVE')) then `wc`.`amount` else 0 end) AS `bulk_meteredamt`,(case when ((`cl`.`objid` = 'BULK') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then 1 else 0 end) AS `bulk_defective`,(case when ((`cl`.`objid` = 'BULK') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`volume` else 0 end) AS `bulk_defectivevol`,(case when ((`cl`.`objid` = 'BULK') and (`wa`.`state` = 'ACTIVE') and (`wm`.`state` = 'DEFECTIVE')) then `wc`.`amount` else 0 end) AS `bulk_defectiveamt`,(case when ((`cl`.`objid` = 'BULK') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then 1 else 0 end) AS `bulk_unmetered`,(case when ((`cl`.`objid` = 'BULK') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`volume` else 0 end) AS `bulk_unmeteredvol`,(case when ((`cl`.`objid` = 'BULK') and (`wa`.`state` = 'ACTIVE') and isnull(`wm`.`objid`)) then `wc`.`amount` else 0 end) AS `bulk_unmeteredamt` from (((((((`waterworks_billing_schedule` `wbs` join `waterworks_consumption` `wc` on((`wc`.`scheduleid` = `wbs`.`objid`))) join `waterworks_account` `wa` on((`wa`.`objid` = `wc`.`acctid`))) join `waterworks_stubout_node` `wsn` on((`wsn`.`objid` = `wa`.`stuboutnodeid`))) join `waterworks_stubout` `ws` on((`ws`.`objid` = `wsn`.`stuboutid`))) join `waterworks_zone` `wz` on((`wz`.`objid` = `ws`.`zoneid`))) join `waterworks_classification` `cl` on((`cl`.`objid` = `wa`.`classificationid`))) left join `waterworks_meter` `wm` on((`wm`.`objid` = `wa`.`meterid`)));

-- ----------------------------
-- View structure for vw_waterworks_account
-- ----------------------------
DROP VIEW IF EXISTS `vw_waterworks_account`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_waterworks_account` AS select `wa`.`objid` AS `objid`,`wa`.`state` AS `state`,`wa`.`acctno` AS `acctno`,`wa`.`acctinfoid` AS `acctinfoid`,`wa`.`dtstarted` AS `dtstarted`,`wa`.`applicationid` AS `applicationid`,`wa`.`remarks` AS `remarks`,`wa`.`ukey` AS `ukey`,`wa`.`seqno` AS `seqno`,`ai`.`acctname` AS `acctname`,`ai`.`owner_objid` AS `owner_objid`,`ai`.`owner_name` AS `owner_name`,`ai`.`address_type` AS `address_type`,`ai`.`address_text` AS `address_text`,`ai`.`address_barangay_objid` AS `address_barangay_objid`,`ai`.`address_barangay_name` AS `address_barangay_name`,`ai`.`address_city` AS `address_city`,`ai`.`address_province` AS `address_province`,`ai`.`address_municipality` AS `address_municipality`,`ai`.`address_unitno` AS `address_unitno`,`ai`.`address_street` AS `address_street`,`ai`.`address_subdivision` AS `address_subdivision`,`ai`.`address_bldgno` AS `address_bldgno`,`ai`.`address_bldgname` AS `address_bldgname`,`ai`.`address_pin` AS `address_pin`,`ai`.`stuboutid` AS `stuboutid`,`ai`.`subareaid` AS `subareaid`,`ai`.`meterid` AS `meterid`,`ai`.`classificationid` AS `classificationid`,`ai`.`units` AS `units`,`ai`.`attributes` AS `attributes`,`ai`.`meterstate` AS `meterstate` from ((`waterworks_account` `wa` join `waterworks_account_info` `ai` on((`wa`.`acctinfoid` = `ai`.`objid`))) left join `waterworks_meter` `wm` on((`ai`.`meterid` = `wm`.`objid`)));

-- ----------------------------
-- View structure for vw_waterworks_billing
-- ----------------------------
DROP VIEW IF EXISTS `vw_waterworks_billing`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_waterworks_billing` AS select `wb`.`objid` AS `objid`,`wb`.`batchid` AS `batchid`,`wb`.`billno` AS `billno`,`wb`.`consumptionid` AS `consumptionid`,`wb`.`state` AS `state`,`wb`.`surcharge` AS `surcharge`,`wb`.`interest` AS `interest`,`wb`.`otherfees` AS `otherfees`,`wb`.`credits` AS `credits`,`wb`.`arrears` AS `arrears`,`wb`.`averageconsumption` AS `averageconsumption`,`wb`.`billed` AS `billed`,`wb`.`unpaidmonths` AS `unpaidmonths`,`wb`.`refbillno` AS `refbillno`,`wb`.`printed` AS `printed`,`wb`.`remarks` AS `remarks`,`wb`.`errcode` AS `errcode`,`wb`.`adjpayment` AS `adjpayment`,`wbb`.`year` AS `year`,`wbb`.`month` AS `month`,`bs`.`fromperiod` AS `fromperiod`,`bs`.`toperiod` AS `toperiod`,`wbb`.`readingdate` AS `readingdate`,`bs`.`discdate` AS `discdate`,`bs`.`duedate` AS `duedate`,((`bs`.`year` * 12) + `bs`.`month`) AS `periodindexno`,`wc`.`acctid` AS `acctid`,`wc`.`acctno` AS `acctno`,`wc`.`state` AS `acctstate`,`wc`.`acctname` AS `acctname`,`wc`.`address_text` AS `address_text`,`wc`.`classificationid` AS `classificationid`,`wc`.`reading` AS `reading`,`wc`.`volume` AS `volume`,`wc`.`amount` AS `amount`,`wc`.`amtpaid` AS `amtpaid`,`wc`.`rate` AS `rate`,`wc`.`hold` AS `hold`,`wc`.`seqno` AS `seqno`,`wc`.`meterid` AS `meterid`,`wc`.`meterstate` AS `meterstate`,`wc`.`prevreading` AS `prevreading`,`wc`.`prevmonth` AS `prevmonth`,`wc`.`prevyear` AS `prevyear`,`wc`.`subareaid` AS `subareaid`,`wc`.`stuboutid` AS `stuboutid`,((((`wb`.`arrears` + `wb`.`otherfees`) + `wb`.`surcharge`) + `wb`.`interest`) - `wb`.`credits`) AS `subtotal` from (((`waterworks_billing` `wb` join `waterworks_batch_billing` `wbb` on((`wbb`.`objid` = `wb`.`batchid`))) join `waterworks_billing_period` `bs` on((`bs`.`objid` = `wbb`.`periodid`))) join `vw_waterworks_consumption` `wc` on((`wc`.`objid` = `wb`.`consumptionid`)));

-- ----------------------------
-- View structure for vw_waterworks_billing_period
-- ----------------------------
DROP VIEW IF EXISTS `vw_waterworks_billing_period`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_waterworks_billing_period` AS select `bs`.`objid` AS `objid`,`bs`.`scheduleid` AS `scheduleid`,`bs`.`year` AS `year`,`bs`.`month` AS `month`,`bs`.`fromperiod` AS `fromperiod`,`bs`.`toperiod` AS `toperiod`,`bs`.`readingdate` AS `readingdate`,`bs`.`readingduedate` AS `readingduedate`,`bs`.`billingduedate` AS `billingduedate`,`bs`.`discdate` AS `discdate`,`bs`.`duedate` AS `duedate`,((`bs`.`year` * 12) + `bs`.`month`) AS `periodindexno` from `waterworks_billing_period` `bs`;

-- ----------------------------
-- View structure for vw_waterworks_consumption
-- ----------------------------
DROP VIEW IF EXISTS `vw_waterworks_consumption`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_waterworks_consumption` AS select `wc`.`objid` AS `objid`,`wc`.`acctid` AS `acctid`,`wc`.`acctinfoid` AS `acctinfoid`,`wc`.`batchid` AS `batchid`,`wc`.`txnmode` AS `txnmode`,`wc`.`meterid` AS `meterid`,`wc`.`meterstate` AS `meterstate`,`wc`.`year` AS `year`,`wc`.`month` AS `month`,`wc`.`reading` AS `reading`,`wc`.`volume` AS `volume`,`wc`.`rate` AS `rate`,`wc`.`amount` AS `amount`,`wc`.`amtpaid` AS `amtpaid`,`wc`.`state` AS `state`,`wc`.`hold` AS `hold`,`wc`.`discount` AS `discount`,`prev`.`reading` AS `prevreading`,`prev`.`month` AS `prevmonth`,`prev`.`year` AS `prevyear`,`a`.`acctno` AS `acctno`,`ai`.`acctname` AS `acctname`,`a`.`state` AS `acctstate`,`a`.`seqno` AS `seqno`,((`wc`.`amount` - `wc`.`amtpaid`) - `wc`.`discount`) AS `balance`,`ai`.`subareaid` AS `subareaid`,`ai`.`address_text` AS `address_text`,`ai`.`classificationid` AS `classificationid`,`ai`.`stuboutid` AS `stuboutid` from (((`waterworks_consumption` `wc` join `waterworks_account` `a` on((`a`.`objid` = `wc`.`acctid`))) join `waterworks_account_info` `ai` on((`wc`.`acctinfoid` = `ai`.`objid`))) left join `waterworks_consumption` `prev` on(((`prev`.`acctid` = `wc`.`acctid`) and (`prev`.`meterid` = `wc`.`meterid`) and (((`prev`.`year` * 12) + `prev`.`month`) = (((`wc`.`year` * 12) + `wc`.`month`) - 1)))));

SET FOREIGN_KEY_CHECKS = 1;
