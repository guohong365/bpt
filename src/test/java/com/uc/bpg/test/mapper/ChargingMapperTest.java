package com.uc.bpg.test.mapper;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.uc.bpg.persistence.ChargingMapper;
import com.uc.bpg.test.TestBase;

public class ChargingMapperTest extends TestBase {
	
	@Autowired
	ChargingMapper mapper;
	
	@Test
	public void test(){
		List<Long> ids=Arrays.asList(new Long[]{1L,2L,3L,4L,5L});
		BigDecimal sum= mapper.selectChargingStandard(ids);
		System.err.println(sum);
	}

}
