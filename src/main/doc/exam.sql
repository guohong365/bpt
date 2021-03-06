DROP TABLE IF EXISTS `t_examine`;
CREATE TABLE `t_examine`
(
  `ID`                   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `MAC`                  VARCHAR(100) NOT NULL COMMENT '设备MAC地址',
  `STATUS`               INT NOT NULL COMMENT '状态',
  `DATA`                 VARCHAR(2000) COMMENT '接收到的数据',
  `RECV_TIME`            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY  `K_ID` (`ID`),
  KEY `I_MAC` (`MAC`)  
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '厂家测试数据';