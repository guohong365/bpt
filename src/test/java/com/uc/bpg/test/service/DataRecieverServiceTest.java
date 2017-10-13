package com.uc.bpg.test.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.uc.bpg.domain.BpData;
import com.uc.bpg.domain.Device;
import com.uc.bpg.domain.DeviceStatus;
import com.uc.bpg.service.DataReceiverService;
import com.uc.bpg.service.DeviceDetailService;
import com.uc.bpg.test.TestBase;
import com.uc.web.persistence.AppListMapper;

public class DataRecieverServiceTest extends TestBase {
	@Resource(name="dataReceiverService")
	DataReceiverService service;
	
	@Resource(name="deviceDetailService")
	DeviceDetailService deviceService;
	
	@Resource(name="deviceMapper")
	AppListMapper listMapper;
	
	@SuppressWarnings("unchecked")
	@Test
	public void test(){
		List<Device> devices=(List<Device>) listMapper.selectByExample(null, 0, 20);
		Date date=Calendar.getInstance().getTime();
		BpData data=new BpData(110, 75, 65, 0, date);
		
		for(Device device:devices){
			DeviceStatus statusDetail=new DeviceStatus(device.getSerialNo(), 0, 20, date);
			service.insertUsage(device.getSerialNo(), data, statusDetail);
		}		
	}
}
