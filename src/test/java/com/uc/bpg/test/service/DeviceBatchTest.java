package com.uc.bpg.test.service;

import javax.annotation.Resource;

import org.junit.Test;

import com.uc.bpg.persistence.DeviceMapper;
import com.uc.bpg.test.TestBase;

public class DeviceBatchTest extends TestBase {
	
	@Resource(name="deviceMapper")
	DeviceMapper mapper;
	
	@SuppressWarnings("unused")
	@Test
	public void test(){
		
		boolean is=mapper.selectExistsSerial("e24856c10e38");
		
		//assertFalse(is);
	}

}
