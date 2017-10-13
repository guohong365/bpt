package com.uc.bpg.test.mapper;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.uc.bpg.domain.Hotel;
import com.uc.bpg.persistence.HotelMapper;
import com.uc.bpg.test.TestBase;

public class HotelMapperTest extends TestBase {
	
	@Autowired
	HotelMapper mapper;
	
	@SuppressWarnings("unchecked")
	@Test
	public void test01(){
		assertNotNull(mapper);
		
		Long count=mapper.selectCountByExample(null);
		
		List<Hotel> list=(List<Hotel>) mapper.selectByExample(null, 0, count);
		
	    assertTrue(list.size()>0);
		
	}
}
