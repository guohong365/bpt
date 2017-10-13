package com.uc.bpg.test.service;

import static org.junit.Assert.assertNotNull;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.uc.bpg.domain.Device;
import com.uc.bpg.forms.DeviceQueryForm;
import com.uc.bpg.persistence.DeviceMapper;
import com.uc.bpg.service.DeviceDetailService;
import com.uc.bpg.service.DeviceListService;
import com.uc.bpg.test.TestBase;
import com.uc.bpg.uitls.DeviceBatchFile;
import com.uc.bpg.uitls.DeviceBatchFileParser;
import com.uc.bpg.uitls.DeviceBatchFileParserImpl;
import com.uc.web.forms.ui.componet.PageCtrlImpl;

@Transactional
public class DeviceServiceTest extends TestBase {
	
	@Resource(name="deviceDetailService")
	DeviceDetailService service;
	
	@Resource(name="deviceMapper")
	DeviceMapper mapper;
	
	@Resource(name="deviceListService")
	DeviceListService listService;
	
	@Test
	public void test01(){
		listService.select(new DeviceQueryForm(), new PageCtrlImpl());		
	}
	@Ignore
	@Test
	@Rollback(value=true)
	public void test02() throws Exception{
		String filePath="E:/stsWorkspace/bpg/src/main/doc";
		String fileName="batch_add.txt";
		
		String fullName=filePath + "/" + fileName;
		DeviceBatchFileParser parser=new DeviceBatchFileParserImpl();
		File file=new File(fullName);
		byte[] fileBytes=new byte[(int) file.length()];
		FileInputStream stream=new FileInputStream(file);
		stream.read(fileBytes);
		stream.close();
		DeviceBatchFile batchFile=parser.parser(fileBytes);
		batchFile.setParam(2L);
		List<Device> devices=new ArrayList<>();
		for(String serial: batchFile.getItems()){
			Device device=new Device();
			device.setUuid(UUID.randomUUID().toString());
			device.setType(batchFile.getParam());
			device.setSerialNo(serial);
			device.setInputer(1L);
			device.setInputTime(Calendar.getInstance().getTime());
			devices.add(device);
			Thread.sleep(50L);						
		}
		
		service.insertBatchAdd(devices);
		
		for(String serial: batchFile.getItems()){
			Device device=mapper.selectBySerial(serial);
			assertNotNull(device);
		}
		
		for(Device device:devices){
			device.setHotel(3L);
			device.setModifier(1L);
			device.setModifyTime(Calendar.getInstance().getTime());
		}
		
		service.updateBatchAllot(devices);
		
		service.updateBatchWithdraw(devices);
		
		service.updateBatchScrap(devices);
		
	}

}
