package com.uc.bpg.test.mapper;

import javax.annotation.Resource;

import org.junit.Test;
import com.uc.bpg.persistence.RoleFunctionDefineMapper;
import com.uc.bpg.test.TestBase;

public class RoleFunctionDefineMapperTest extends TestBase {
	
   @Resource(name="roleFunctionDefineMapper")
   RoleFunctionDefineMapper mapper;
   
	@Test
	public void test(){		
		mapper.selectFunction(null);
		
		mapper.selectRoleFunctionDefines();
		
	}

}
