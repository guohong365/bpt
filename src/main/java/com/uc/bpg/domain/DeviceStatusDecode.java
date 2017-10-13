package com.uc.bpg.domain;

import com.uc.web.domain.EntityBase;

public class DeviceStatusDecode extends EntityBase {
	public static String decode(Integer status){
		if(status==null) return "未知"; 
		switch(status){
		case 0:return "正常";
		case 1:return "传感器信号异常";
		case 2:return "测量不出结果";
		case 3:return "测量结果异常";
		case 4:return "腕带过松或漏气";
		case 5:return "腕带过紧或气路堵塞";
		case 6:return "测量中压力干扰严重";
		case 7:return "压力超300";
		case 8:return "标定数据异常或存储IC异常";
		case 15:return "电量低，需要充电";
        default:
        	return "未知错误";
		}
	}    
	public static boolean isOk(int status){
		return status==0;
	}
	public static boolean isWarning(int status) {
		return status==15;
	}
	public static boolean isError(int status){
		return status!=0&&status!=15;
	}
	
	public static String decodeBattery(Integer bettery){
		if(bettery==null) return "未知";
		return String.format("%d%%", bettery);
	}
}
