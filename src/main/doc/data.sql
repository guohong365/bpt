LOCK TABLES `t_device` WRITE;
ALTER TABLE `t_device` DISABLE KEYS;
INSERT INTO `t_device` 
   (`UUID`, `SERIAL_NO`, `TYPE`, `INPUTER`, `INPUT_TIME`) 
   VALUES 
   ('fa76d35d-32b0-46cc-aa09-010591cdba99','D44E72363E22',2,1,now()),
   ('b4845349-f5e8-48cf-8a16-f0de09b65185','32083E6B65D6',2,1,now()),
   ('dafe624a-52ea-4461-8d58-333b82e47b52','E24856C10E38',2,1,now()),
   ('13f48d8c-bca9-4060-b4cf-a32bb27129cc','4FA3162FD2F5',2,1,now()),
   ('0fe32f42-c0af-45ea-ad54-0b18b3778a01','FFBF4EBA7D62',2,1,now()),
   ('4e71b838-b16c-45e6-8020-86cfc12e07a3','3F356E49A30A',2,1,now()),
   ('3f758e61-efb2-4019-8d04-2ae83eec34b1','9C83FACC1E46',2,1,now()),
   ('f690d836-39bd-4509-ace9-2730fcc6ce99','F8FB3698C5C1',2,1,now()),
   ('5e7aa1d7-0c61-4304-9a5c-9dcd9c2e4ccc','6C407C0D214F',2,1,now()),
   ('83f596e9-7144-40be-a726-7a01798ad968','C364AE319C60',2,1,now()),
   ('1b98d61b-fb6d-42b5-bb80-f99c8d344ab1','08CC32E27247',2,1,now()),
   ('b5e75bf0-5d6e-467d-a5eb-fc7edb2e1cfb','8E45556F9B07',2,1,now()),
   ('f719b755-7f2c-495d-bbc1-07ce89c908e5','D5008F1C1F89',2,1,now()),
   ('ac11b989-ed27-4fa4-9d4b-ebfd2799aced','4FB2F52B768B',2,1,now()),
   ('ee4d5fcf-f256-4bfa-b754-6352e4575d04','73F249022BA5',2,1,now()),
   ('0840ac7e-8d2e-42e4-a7bf-b6e8987d539f','75392969BBF0',2,1,now());
ALTER TABLE `t_device` ENABLE KEYS;
UNLOCK TABLES;

--
--  data for table `t_function`
--

LOCK TABLES `t_function` WRITE;
ALTER TABLE `t_function` DISABLE KEYS;
INSERT INTO `t_function` 
(`ID`, `UUID`, `NAME`, `URI`, `DESCRIPTION`, `VALID`, `URI_PATTERN`)
VALUES 
(1,'USER_MGR','用户管理','system/user/list','建立、修改、注销用户。赋予、取消用户角色',1,'/system/user/**'),
(2,'ROLE_MGR','角色管理','system/role/list','建立、修改、注销角色。赋予、取消角色功能',1,'/system/role/**'),
(3,'TYPE_MGR','设备型号维护','mgr/types/list','建立、修改、设备型号',1,'/mgr/types/**'),
(4,'STRATEGE_MGR','收费政策维护','mgr/stratege/detail?action=view&selected=1','查看、修改公司默认收费政策',1,'/mgr/stratege/**'),
(5,'DEVICE_MGR','设备管理','mgr/device/list','建立、修改、报废设备。给酒店分配设备',1,'/mgr/device/**'),
(6,'HOTEL_MGR','酒店管理','mgr/hotel/list','建立、修改、注销酒店信息',1,'/mgr/hotel/**'),
(7,'ACCOUNT','账务管理','mgr/account/list','建立、修改、确认账单',1,'/mgr/account/**'),
(8,'ACCOUNT_MGR','账务查询','mgr/stat/account/list','查询账务相关信息',1,'/mgr/stat/account/**'),
(9,'HOTEL_DEV_MGR','酒店设备管理','hotel/device/list','查询设备状态，酒店分配设备到房间',1,'/hotel/device/**'),
(10,'HOTEL_ROOM_MGR','酒店房间管理','hotel/room/list','配置酒店房间信息，查看房间状态',1,'/hotel/room/**'),
(11,'HOTEL_ACCOUNT','酒店账务管理','hotel/account/list','建立、修改账单。确认收款等',1,'/hotel/stat/account/**'),
(12,'HOTEL_ACCOUNT_MGR','酒店账务查询','hotel/stat/account/list','查询账单相关信息',1,'/hotel/stat/account/**'),
(13,'HOTEL_RECEPTION','酒店前台','hotel/reception/list','酒店前台入住、退房登记',1,'/hotel/reception/**'),
(14,'HOTEL_CHECKIN','酒店入住记录','hotel/checkin/list','酒店入住记录查看',1,'/hotel/checkin/**'),
(15, 'DEMO', '演示', 'demo/demo', '演示辅助功能',1,'/demo/demo/**'),
(16, 'FACTORY_EXAMINE', '生产检测', 'examine/list', '', 1, '/examine/**');
ALTER TABLE `t_function` ENABLE KEYS;
UNLOCK TABLES;

--
-- data for table `t_menu`
--

LOCK TABLES `t_menu` WRITE;
ALTER TABLE `t_menu` DISABLE KEYS;
INSERT INTO `t_menu`
(`ID`,`UUID`, `FUNC`, `PARENT`, `NAME`, `ORDER`, `LEVEL`, `ICON`)
VALUES 
(1,'SYSTEM',NULL,NULL,'系统管理',1000,0,'fa fa-cog'),
(2,'SYSTEM-USER',1,1,'用户管理',1100,1,'fa fa-cog'),
(3,'SYSTEM-ROLE',2,1,'角色管理',1200,1,'fa fa-cog'),
(4,'BACKGROUND',NULL,NULL,'后台管理',2000,0,'fa fa-cog'),
(5,'BACK_TYPES_MGR',3,4,'型号管理',2100,1,'fa fa-cog'),
(6,'BACK_STRATEGE_MGR',4,4,'收费政策管理',2200,1,'fa fa-cog'),
(7,'BACK_DEV_MGR',5,4,'设备管理',2300,1,'fa fa-cog'),
(8,'BACK_HOTEL_MGR',6,4,'酒店管理',2400,1,'fa fa-cog'),
(9,'BACK_ACCOUNT_MGR',7,4,'账务管理',2500,1,'fa fa-cog'),
(10,'BACK_BIIL_SEARCH',8,4,'账务单查询',2600,1,'fa fa-cog'),
(11,'HOTEL_SUBSYSTEM',NULL,NULL,'酒店子系统',4000,0,'fa fa-cog'),
(12,'HOTEL_DEV_MGR',9,11,'酒店设备管理',4100,1,'fa fa-cog'),
(13,'HOTEL_ROOM_MGR',10,11,'酒店房间管理',4200,1,'fa fa-cog'),
(14,'HOTEL_ACCOUNT',11,11,'酒店账务管理',4300,1,'fa fa-cog'),
(15,'HOTEL_ACCOUNT_MGR',12,11,'酒店账务查询',4400,1,'fa fa-cog'),
(16,'HOTEL_RECEPTION',13,11,'酒店前台',4500,1,'fa fa-cog'),
(17,'HOTEL_CHECK_IN',14,11,'酒店入住记录',4210,1,'fa fa-cog'),
(18,'DEMO', 15, NULL, '演示数据', 5000, 0, 'fa fa-cog');
ALTER TABLE `t_menu` ENABLE KEYS;
UNLOCK TABLES;

--
-- data for table `t_orgnization`
--

LOCK TABLES `t_orgnization` WRITE;
ALTER TABLE `t_orgnization` DISABLE KEYS ;
INSERT INTO `t_orgnization` 
VALUES 
(1,'root',NULL,'xxxx公司','','','','血压计租赁管理公司',1,0,'2017-04-02 23:26:25','公司',NULL,NULL,0,0,0.000,0.000,0.000,NULL,NULL,NULL),
(2,'0f425a98-aa6c-4b4c-865e-193c6cd2e19d',NULL,'新龙门客栈','电影里','12345678','张三','电影里的酒店',1,1,'2017-04-03 01:16:41','酒店',NULL,NULL,20,1,1.000,1.000,0.500,'季',1,1),
(3,'1739dd62-c9b0-4256-af54-606ed60fb898',NULL,'香格里拉酒店','香格里拉','87654321','李四','想去去不了',1,1,'2017-04-03 01:16:41','酒店',NULL,NULL,5,1,1.000,2.000,0.400,'月',NULL,9),
(4,'17eb1a74-ec46-4354-b561-f006e31f47f6',NULL,'昆明饭店','昆明市白塔路','88888888','王五','蛋糕很好吃',1,1,'2017-04-03 01:16:41','酒店',NULL,NULL,5,1,1.000,1.000,0.600,'周',5,6),
(5,'1f5ace0f-d35c-46f8-bea9-7584e42e4ac1',NULL,'金龙饭店','昆明市环城南路','99999999','赵六','没落了',1,1,'2017-04-03 01:16:41','酒店',NULL,NULL,5,1,1.000,1.000,0.200,'年',1,10),
(6,'147af50d-770a-4564-a436-d2bf3a636b4e',NULL,'站点','','','','',0,1,'2017-04-04 02:34:50','酒店',1,'2017-04-13 01:24:17',5,1,1.000,1.000,0.400,'周',3,NULL);
ALTER TABLE `t_orgnization` ENABLE KEYS ;
UNLOCK TABLES;

--
-- data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
ALTER TABLE `t_role` DISABLE KEYS ;
INSERT INTO `t_role` 
VALUES 
(1,'ADMIN','系统管理员','系统管理，维护系统基础信息，管理用户等',1,1),
(2,'DEVICE_MGR','设备管理','负责管理设备。录入设备信息，给酒店分配设备等',1,1),
(3,'HOTEL_MGR','酒店管理','负责酒店信息管理，建立酒店档案，维护酒店政策',1,1),
(4,'ACCOUNT','公司财务管理','负责生成账单',1,1),
(5,'ACCOUNT_MGR','公司财务主管','查询账务',1,1),
(6,'HOTEL_DEV_MGR','酒店管理员','负责维护酒店相关基础信息，向房间分配设备，查看设备状态等',1,1),
(7,'HOTEL_ACCOUNT','酒店财务','负责付款，确认就收发票等',1,1),
(8,'HOTEL_ACCOUNT_MGR','酒店财务主管','查询账务',1,1),
(9,'HOTEL_RECEPTION','酒店前台','负责前台入住、退房登记，收款等',1,1),
(10,'DEMO','演示','生成演示数据', 1,1),
(11, 'FACTORY_EXAMINE', '生产测试', '查看生产测试数据', 1, 1);
ALTER TABLE `t_role` ENABLE KEYS ;
UNLOCK TABLES;

--
-- data for table `t_role_func`
--

LOCK TABLES `t_role_func` WRITE;
ALTER TABLE `t_role_func` DISABLE KEYS;
INSERT INTO `t_role_func` (`ROLE`, `FUNC`)
VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(3,6),(4,7),(5, 8),(6,9),(6,10),(6,14),(7,11),(8,12),(9,13),(10,15),(11, 16);
ALTER TABLE `t_role_func` ENABLE KEYS;
UNLOCK TABLES;

--
-- data for table `t_stratege`
--

LOCK TABLES `t_stratege` WRITE;
ALTER TABLE `t_stratege` DISABLE KEYS ;
INSERT INTO `t_stratege` VALUES (1,'root',1.000,1.000,0.500,'月',0,7,1,'2017-04-08 18:44:13');
ALTER TABLE `t_stratege` ENABLE KEYS ;
UNLOCK TABLES;

--
-- data for table `t_type`
--

LOCK TABLES `t_type` WRITE;
ALTER TABLE `t_type` DISABLE KEYS ;
INSERT INTO `t_type` 
VALUES 
(1,'1','血压计','WIFI-I型',1,1),
(2,'2','血压计','WIFI-II型',1,2),
(3,'3','血压计','WIFI-III型',1,3),
(4,'4','血压计','WIFI-IV型',1,4),
(5,'5','血压计','WIFI-V型',1,5);
ALTER TABLE `t_type` ENABLE KEYS ;
UNLOCK TABLES;

--
-- data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
ALTER TABLE `t_user` DISABLE KEYS ;
INSERT INTO `t_user` 
VALUES 
(1,'admin','c0cb5f0fcf239ab3d9c1fcd31fff1efc','系统管理员','8888888','admin@company.com',1,1,'2017-04-02 23:26:25',1,1,NULL,NULL,'系统管理员'),
(2,'xl1','96e79218965eb72c92a549dd5a330112','张三','','',0,2,'2017-04-03 01:25:12',1,1,NULL,NULL,''),
(3,'xl2','96e79218965eb72c92a549dd5a330112','李四','','',0,2,'2017-04-03 01:29:42',1,1,NULL,NULL,''),
(4,'xl3','96e79218965eb72c92a549dd5a330112','王二麻子','','',0,2,'2017-04-03 01:47:55',1,1,NULL,NULL,''),
(5,'xl4','96e79218965eb72c92a549dd5a330112','赵六','','',0,2,'2017-04-03 01:56:51',1,0,'2017-04-04 21:58:45',1,''),
(6,'xl5','96e79218965eb72c92a549dd5a330112','刘七','','',0,2,'2017-04-03 02:03:21',1,0,'2017-04-03 05:25:26',1,''),
(7,'tester', uuid(), '生产检测', '','', 1, 1, now(), 1,1, NULL, NULL, '');
ALTER TABLE `t_user` ENABLE KEYS ;
UNLOCK TABLES;

--
-- data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
ALTER TABLE `t_user_role` DISABLE KEYS;
INSERT INTO `t_user_role` (`USER`, `ROLE`) VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,10),(7, 11);
ALTER TABLE `t_user_role` ENABLE KEYS; 
UNLOCK TABLES;
