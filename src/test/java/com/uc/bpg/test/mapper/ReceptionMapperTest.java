package com.uc.bpg.test.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.uc.bpg.domain.ChargingDetails;
import com.uc.bpg.domain.CheckIn;
import com.uc.bpg.persistence.ReceptionMapper;
import com.uc.bpg.test.TestBase;

public class ReceptionMapperTest extends TestBase{
	
	@Autowired
	ReceptionMapper mapper;
	
	@Test
	public void test(){
		
		CheckIn checkIn=mapper.selectRoomLastCheckIn(2L, "8303");
		assertNotNull(checkIn);
		
		checkIn.setRoomNo("8301");
		System.err.println(checkIn.toString());
		
		ChargingDetails charging=mapper.selectChargingDetails(checkIn.getId());
		charging.setCheckInRecord(checkIn);
		assertNotNull(charging);
		
		System.err.println(charging.toString());
	}
}
