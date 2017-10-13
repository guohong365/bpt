package com.uc.bpg.test.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.uc.bpg.domain.Stratege;
import com.uc.bpg.persistence.StrategeMapper;
import com.uc.bpg.test.TestBase;

public class StrategeMapperTest extends TestBase {
	@Autowired
	StrategeMapper mapper;
	
	@Test
	public void test01(){
		Stratege stratege=(Stratege) mapper.selectByUuid("root");
		assertNotNull(stratege);
		
		String text=stratege.getBillingCycle();
		getLogger().trace("----{}----", text);
	}
}
