package com.uc.bpg.test.mapper;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.uc.bpg.domain.Room;
import com.uc.bpg.persistence.DeviceMapper;
import com.uc.bpg.test.TestBase;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class DeviceMapperTest extends TestBase {
	
	@Autowired
	DeviceMapper mapper;
	
	@Test
	public void test01(){
		//mapper.selectByExample(null, 0, 10);		
		
		List<Room> rooms= mapper.selectAllocableRooms(2L);
		
		for(Room room : rooms){
			System.err.println(room.toString());
		}
	}

}
