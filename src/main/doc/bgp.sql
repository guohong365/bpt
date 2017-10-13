CREATE DATABASE  IF NOT EXISTS `bpg` DEFAULT CHARACTER SET utf8 ;
USE `bpg`;

--
-- Table structure for table `t_allot_history`
--

DROP TABLE IF EXISTS `t_allot_history`;

CREATE TABLE `t_allot_history` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `OPERATION` enum('新增','分配','收回','作为公用','解除公用','报废') NOT NULL COMMENT '操作',
  `DEVICE` int(10) unsigned NOT NULL COMMENT '设备',
  `HOTEL` int(10) unsigned DEFAULT NULL COMMENT '酒店',
  `ROOM` int(10) unsigned DEFAULT NULL COMMENT '房间',
  `OPERATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `OPERATOR` int(10) unsigned NOT NULL COMMENT '操作人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_DEVICE` (`DEVICE`),
  KEY `I_HOTEL` (`HOTEL`),
  KEY `I_ROOM` (`ROOM`),
  KEY `I_OPERATOR` (`OPERATOR`)
) ENGINE=InnoDB AUTO_INCREMENT=758 DEFAULT CHARSET=utf8 COMMENT='设备分配历史';

--
-- Table structure for table `t_bill`
--

DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `HOTEL` int(10) unsigned NOT NULL COMMENT '酒店',
  `INCOME` decimal(10,3) NOT NULL COMMENT '酒店收入，源自酒店定价',
  `BASIC_CHARGE` decimal(10,3) NOT NULL COMMENT '分成基准，源自公司定价',
  `RENT`  decimal(10,3) NOT NULL COMMENT '分成金额=累计（每次使用应分成收入x当时分成比例）',
  `STATE` enum('未付款','已付款','确认收款') NOT NULL COMMENT '未付 已付 （酒店操作，通知公司已付款）确认收款（公司操作）',
  `GENERATED_TIME` datetime NOT NULL DEFAULT TIMESTAMP COMMENT '账单生成时间',
  `PAY_TIME` datetime DEFAULT NULL COMMENT '付款时间',
  `PAYER` int(10) unsigned DEFAULT NULL COMMENT '付款操作人',
  `VERIFY_TIME` datetime DEFAULT NULL COMMENT '付款确认时间',
  `VERIFIER` int(10) unsigned DEFAULT NULL COMMENT '确认操作人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_PAYER` (`PAYER`),
  KEY `I_VERIFIER` (`VERIFIER`),
  KEY `I_HOTEL` (`HOTEL`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='账单';

--
-- Table structure for table `t_bp_data`
--

DROP TABLE IF EXISTS `t_bp_data`;
CREATE TABLE `t_bp_data` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DEVICE` int(10) unsigned NOT NULL COMMENT '设备ID',
  `EXAMINE_TIME` datetime NOT NULL COMMENT '检查时间，设备时间',
  `HI_PRESSURE` int(11) NOT NULL COMMENT '高压',
  `LOW_PRESSURE` int(11) NOT NULL COMMENT '低压',
  `HEART_BEAT_RATE` int(11) NOT NULL COMMENT '心率',
  `HEART_BEAT_ANNOTATION` int(11) NOT NULL COMMENT '心率是否正常',
  PRIMARY KEY (`ID`),
  KEY `I_DEVICE` (`DEVICE`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COMMENT='设备使用数据，即血压测量数据';

--
-- Table structure for table `t_charging`
--

DROP TABLE IF EXISTS `t_charging`;
CREATE TABLE `t_charging` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `HOTEL` int(10) unsigned NOT NULL COMMENT '酒店',
  `CHECK_IN` int(10) unsigned NOT NULL COMMENT '入住记录',
  `CHARGE` decimal(10,3) NOT NULL COMMENT '应付款（酒店方收款标准，冗余收费策略）',
  `CHARGE_STANDARD` decimal(10,3) NOT NULL COMMENT '付款标准（公司方收款标准，冗余收费策略）',
  `RENT` decimal(10,3) NOT NULL COMMENT '分成金额，本次入住分成',
  `RECEPTIONIST` int(10) unsigned NOT NULL COMMENT '付款操作人（与入住记录里相同，冗余）',
  `CHARGING_TIME` datetime NOT NULL COMMENT '付款时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_HOTEL` (`HOTEL`),
  KEY `I_CHECK_IN` (`CHECK_IN`),
  KEY `I_RECEPTIONIST` (`RECEPTIONIST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费记录';

--
-- Table structure for table `t_check_in`
--

DROP TABLE IF EXISTS `t_check_in`;
CREATE TABLE `t_check_in` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `HOTEL` int(10) unsigned NOT NULL COMMENT '酒店(冗余)',
  `ROOM` int(10) unsigned NOT NULL COMMENT '房间',
  `CHECK_IN_TIME` datetime NOT NULL COMMENT '入住时间',
  `CHECK_IN_RECEPTIONIST` int(10) unsigned NOT NULL COMMENT '入住登记操作人',
  `CHECK_OUT_TIME` datetime DEFAULT NULL COMMENT '退房时间',
  `CHECK_OUT_RECEPTIONIST` int(10) unsigned DEFAULT NULL COMMENT '退房登记操作人（收费记录中，收费人与此处同）',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_HOTEL` (`HOTEL`),
  KEY `I_ROOM` (`ROOM`),
  KEY `I_CHECK_IN_RECEPTIONIST` (`CHECK_IN_RECEPTIONIST`),
  KEY `I_CHECK_OUT_RECEPTIONIST` (`CHECK_OUT_RECEPTIONIST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房间入住记录';

--
-- Table structure for table `t_device`
--

DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `SERIAL_NO` varchar(100) NOT NULL COMMENT '设备序列号， 唯一',
  `VALID` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用（状态置为不可用时，应是无分配的设备）',
  `TYPE` int(10) unsigned NOT NULL COMMENT '设备型号',
  `HOTEL` int(10) unsigned DEFAULT NULL COMMENT '酒店',
  `ROOM` int(10) unsigned DEFAULT NULL COMMENT '房间',
  `PUBLIC_USAGE` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被用于公用用途',
  `INPUTER` int(10) unsigned NOT NULL COMMENT '录入人',
  `INPUT_TIME` datetime NOT NULL COMMENT '录入时间',
  `MODIFIER` int(10) unsigned DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SERIAL_NO` (`SERIAL_NO`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_TYPE` (`TYPE`),
  KEY `I_HOTEL` (`HOTEL`),
  KEY `I_ROOM` (`ROOM`),
  KEY `I_INPUTER` (`INPUTER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备表';

--
-- Table structure for table `t_device_status`
--

DROP TABLE IF EXISTS `t_device_status`;
CREATE TABLE `t_device_status` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DEVICE` int(10) unsigned NOT NULL COMMENT '设备ID',
  `SERIAL_NO` varchar(100) NOT NULL COMMENT '设备编号',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BATTERY` int(11) NOT NULL COMMENT '电量',
  `REPORT_TIME` datetime NOT NULL COMMENT '报告时间',
  PRIMARY KEY (`ID`),
  KEY `I_DEVICE` (`DEVICE`),
  KEY `I_SERILA_NO` (`SERIAL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备状态';

--
-- Table structure for table `t_device_usage`
--

DROP TABLE IF EXISTS `t_device_usage`;
CREATE TABLE `t_device_usage` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `DEVICE` int(10) unsigned NOT NULL COMMENT '设备',
  `USE_TIME` datetime NOT NULL COMMENT '使用时间',
  `ROOM` int(10) unsigned DEFAULT NULL COMMENT '固化使用地点，简化其他关联数据变化带来的复杂度',
  `HOTEL` int(10) unsigned DEFAULT NULL COMMENT '固化使用地点，简化其他关联数据变化带来的复杂度',
  `CHARGING` int(10) unsigned DEFAULT NULL COMMENT '合并收费记录明细后须引入外键，收费时填写',
  `PAYED` tinyint(1) NOT NULL DEFAULT '0' COMMENT '冗余收费记录ID，收费记录ID为空也可判断',
  `CHARGE_STANDARD` decimal(10,3) NOT NULL COMMENT '公司收费标准，固化收费数据，简化计算和数据查询',
  `CHARGE` decimal(10,3) NOT NULL COMMENT '酒店收费标准，固化收费数据，简化计算和数据查询',
  `RATIO` decimal(10,3) NOT NULL COMMENT '分成比例，固化收费数据，简化计算和数据查询',
  `RENT`  decimal(10,3) NOT NULL COMMENT '分成金额=公司收费标准x分成比例',
  `BILL` int(10) unsigned DEFAULT NULL COMMENT '替代账单明细后，需引入的外键，账单生成时填写',
  `IN_BILL` tinyint(1) DEFAULT '0' COMMENT '记录是否已被用于生成账单，冗余，BILL为空也能判断',
  `PUBLIC_USAGE` tinyint(1) DEFAULT '0' COMMENT '设备为公用时，置为true',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_DEVICE` (`DEVICE`),
  KEY `I_CHARGING` (`CHARGING`),
  KEY `I_HOTEL` (`HOTEL`),
  KEY `I_ROOM` (`ROOM`),
  KEY `I_BIIL` (`BILL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `t_function`
--

DROP TABLE IF EXISTS `t_function`;
CREATE TABLE `t_function` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `URI` varchar(2000) NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `VALID` tinyint(1) NOT NULL DEFAULT '1',
  `URI_PATTERN` varchar(2000) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `FUNC` int(10) unsigned DEFAULT NULL,
  `PARENT` int(10) unsigned DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `ORDER` int(11) NOT NULL,
  `LEVEL` int(10) unsigned NOT NULL,
  `ICON` varchar(100) DEFAULT NULL,
  `VALID` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_FUNC` (`FUNC`),
  KEY `I_PARENT` (`PARENT`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Table structure for table `t_orgnization`
--

DROP TABLE IF EXISTS `t_orgnization`;
CREATE TABLE `t_orgnization` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `PARENT` int(10) unsigned DEFAULT NULL COMMENT '上级单位ID',
  `NAME` varchar(1000) NOT NULL COMMENT '单位名称',
  `ADDRESS` varchar(2000) DEFAULT NULL COMMENT '地址',
  `TELE` varchar(40) DEFAULT NULL COMMENT '电话',
  `LINKMAN` varchar(100) DEFAULT NULL COMMENT '联系人',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `VALID` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `CREATER` int(10) unsigned NOT NULL COMMENT '建档人',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '建档时间',
  `TYPE` enum('公司','酒店') DEFAULT NULL COMMENT '单位类型',
  `CANCELATER` int(10) unsigned DEFAULT NULL COMMENT '注销操作人',
  `CANCEL_TIME` datetime DEFAULT NULL COMMENT '注销时间',
  `TOTAL_DEVICE` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '签约设备总数',
  `PUBLIC_USAGE` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '可用于公共区域的设备总数',
  `CHARGE_STANDARD` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '公司收费标准，按此标准计算分成',
  `CHARGE` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '酒店定价的收费标准',
  `RATIO` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '分成比例',
  `BILLING_CYCLE_TYPE` enum('周','月','季','年') DEFAULT NULL COMMENT '结算周期类型',
  `BILLING_DATE_PARAM1` int(11) DEFAULT NULL COMMENT '结算周期日期参数1. 类型为 周：1-7 代表每周周一至周日；月： 1-31 代表每月1-31日；季：1-4 代表 1-4季度；年：1-12 代表1-12月',
  `BILLING_DATE_PARAM2` int(11) DEFAULT NULL COMMENT '结算周期日期参数2. 类型为 周：无意义；月：无意义；季：1-31 代表 1-31日；年：1-31 代表1-31日',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_NAME` (`NAME`),
  KEY `I_PARENT` (`PARENT`),
  KEY `I_CREATER` (`CREATER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `VALID` tinyint(1) NOT NULL DEFAULT '1',
  `INTERNAL` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `t_role_func`
--

DROP TABLE IF EXISTS `t_role_func`;
CREATE TABLE `t_role_func` (
  `ROLE` int(10) unsigned NOT NULL,
  `FUNC` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ROLE`,`FUNC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `t_room`
--

DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `HOTEL` int(10) unsigned NOT NULL COMMENT '酒店',
  `STOREY` int(10) unsigned NOT NULL COMMENT '楼层',
  `ROOM_NO` varchar(100) NOT NULL COMMENT '房间号',
  `VALID` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_HOTEL` (`HOTEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房间';

--
-- Table structure for table `t_stratege`
--

DROP TABLE IF EXISTS `t_stratege`;
CREATE TABLE `t_stratege` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `CHARGE_STANDARD` decimal(10,3) NOT NULL COMMENT '公司收费标准，按此标准计算分成',
  `CHARGE` decimal(10,3) NOT NULL COMMENT '酒店定价的收费标准',
  `RATIO` decimal(10,3) NOT NULL COMMENT '分成比例',
  `BILLING_CYCLE` enum('周','月','季','年') NOT NULL COMMENT '结算周期类型',
  `BILLING_DATE_PARAM1` int(11) NOT NULL COMMENT '结算周期日期参数1. 类型为 周：1-7 代表每周周一至周日；月： 1-31 代表每月1-31日；季：1-4 代表 1-4季度；年：1-12 代表1-12月',
  `BILLING_DATE_PARAM2` int(11) NOT NULL DEFAULT '0' COMMENT '结算周期日期参数2. 类型为 周：无意义；月：无意义；季：1-31 代表 1-31日；年：1-31 代表1-31日',
  `CREATER` int(10) unsigned NOT NULL COMMENT '策略创建操作人，当修改策略时，当前记录作为历史保留，新建一条记录作为当前策略。即后一条记录的创建人是前一条记录的修改人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_CREATER` (`CREATER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费策略';

--
-- Table structure for table `t_stratege_history`
--

DROP TABLE IF EXISTS `t_stratege_history`;
CREATE TABLE `t_stratege_history` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `HOTEL` int(10) unsigned NOT NULL COMMENT '酒店ID,为空时表示公司默认政策',
  `TOTAL_DEVICE` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '签约设备总数',
  `PUBLIC_USAGE` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '可用于公共区域的设备总数',
  `CHARGE_STANDARD` decimal(10,3) NOT NULL COMMENT '公司收费标准，按此标准计算分成',
  `CHARGE` decimal(10,3) NOT NULL COMMENT '酒店定价的收费标准',
  `RATIO` decimal(10,3) NOT NULL COMMENT '分成比例',
  `BILLING_CYCLE` enum('周','月','季','年') NOT NULL COMMENT '结算周期类型',
  `BILLING_DATE_PARAM1` int(11) NOT NULL COMMENT '结算周期日期参数1. 类型为 周：1-7 代表每周周一至周日；月： 1-31 代表每月1-31日；季：1-4 代表 1-4季度；年：1-12 代表1-12月',
  `BILLING_DATE_PARAM2` int(11) NOT NULL DEFAULT '0' COMMENT '结算周期日期参数2. 类型为 周：无意义；月：无意义；季：1-31 代表 1-31日；年：1-31 代表1-31日',
  `CREATER` int(10) unsigned NOT NULL COMMENT '策略创建操作人，当修改策略时，当前记录作为历史保留，新建一条记录作为当前策略。即后一条记录的创建人是前一条记录的修改人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFIER` int(10) unsigned NOT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_HOTEL` (`HOTEL`),
  KEY `I_CREATER` (`CREATER`),
  KEY `I_MODIFIER` (`MODIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存公司收费政策修改历史';

--
-- Table structure for table `t_type`
--

DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UUID` char(36) NOT NULL,
  `PRODUCT` varchar(100) NOT NULL COMMENT '产品名称',
  `NAME` varchar(100) NOT NULL COMMENT '型号名称',
  `VALID` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `SHOW_ORDER` int(10) unsigned NOT NULL COMMENT '显示顺序',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_UUID` (`UUID`),
  KEY `I_PRODUCT` (`PRODUCT`),
  KEY `I_NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备型号';


--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LOGIN_ID` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `TELE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `ADMIN_FLAG` tinyint(1) DEFAULT '0',
  `ORG` int(10) unsigned NOT NULL,
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `CREATER` int(10) unsigned NOT NULL,
  `VALID` tinyint(1) DEFAULT '0',
  `CANCEL_TIME` datetime DEFAULT NULL,
  `CANCELATER` int(10) unsigned DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_LONGIN_ID` (`LOGIN_ID`),
  KEY `I_NAME` (`NAME`),
  KEY `I_ORG` (`ORG`),
  KEY `I_CREATER` (`CREATER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `ROLE` int(10) unsigned NOT NULL,
  `USER` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ROLE`,`USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
