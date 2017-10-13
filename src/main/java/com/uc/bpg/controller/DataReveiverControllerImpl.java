package com.uc.bpg.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uc.bpg.domain.BpData;
import com.uc.bpg.domain.DeviceStatus;
import com.uc.bpg.service.DataReceiverService;
import com.uc.utils.LoggerSupportorImpl;

@Controller
@RequestMapping(value="/data")
public class DataReveiverControllerImpl extends LoggerSupportorImpl {
	private static final String TEST_REQUEST="0";
	
	@Resource(name="${service.receiver}")
	private DataReceiverService servcie;
	
	public void setServcie(DataReceiverService servcie) {
		this.servcie = servcie;
	}
	
	public DataReceiverService getServcie() {
		return servcie;
	}

	@RequestMapping(value="/recv", method=RequestMethod.GET, produces="text/plain")
	@ResponseBody
	public String ReveiveExamineData(
			@RequestParam(value="User", required=true)
			String user,
			@RequestParam(value="Sts", required=false)
			String status,
			@RequestParam(value="Bat", required=false)
			String battery,
			@RequestParam(value="Sys", required=false)
			String highPressure,
			@RequestParam(value="Dia", required=false)
			String lowPressure,
			@RequestParam(value="Pul", required=false)
			String heartBeatRate,
			@RequestParam(value="Ano", required=false)
			String heartBeatAnnottation,
			@RequestParam(value="Time", required=false)
			String examineTime,
			@RequestParam(value="Mac", required=false)
			String mac){		
		if(getLogger().isTraceEnabled()){
			System.err.println(String.format("user=[%s] status=[%s] battery=[%s] hp=[%s] lp=[%s] hb=[%s] ha=[%s] examineTime=[%s] mac=[%s]",
				                          user,     status,     battery,     highPressure, lowPressure, heartBeatRate, heartBeatAnnottation, examineTime, mac));
		}
		if(!TEST_REQUEST.equals(user)){			
		    SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		    Date useTime=Calendar.getInstance().getTime();
		    try {
				useTime=format.parse(examineTime);
			} catch (ParseException e) {
				e.printStackTrace();
				getLogger().warn("接收数据时，时间解析错误[{}, mac=[{}]], 使用服务器当前时间。",examineTime, mac);
				useTime=Calendar.getInstance().getTime();
			}		    
		    BpData data=new BpData(Integer.parseInt(highPressure), Integer.parseInt(lowPressure), Integer.parseInt(heartBeatRate), Integer.parseInt(heartBeatAnnottation), useTime);
		    DeviceStatus statusDetail=new DeviceStatus(mac, Integer.parseInt(status), Integer.parseInt(battery), new Date());		    
		    getServcie().insertUsage(mac, data, statusDetail);			    
		}
		return getReturnString();		
	}
	
	private String getReturnString(){
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		Date current=Calendar.getInstance().getTime();
		StringBuilder builder=new StringBuilder();
		builder.append("{\"statusCode\":0,\"serverTime\":\"").append(format.format(current)).append("\"}");
		return builder.toString();
	}
	
	@RequestMapping(value="/hb", method=RequestMethod.GET, produces="text/plain")
	@ResponseBody
	public String ReceiveHeartBeat(
			@RequestParam(value="Mac", required=true)
			String mac,
			@RequestParam(value="Bat", required=true)
			String battery,
			@RequestParam(value="Sts", required=true)
			String status){
		DeviceStatus detial=new DeviceStatus(mac, Integer.parseInt(status), Integer.parseInt(battery), new Date());
		
		getServcie().insertStatus(mac,detial);		
		return getReturnString();
	}
	
	
	
}
