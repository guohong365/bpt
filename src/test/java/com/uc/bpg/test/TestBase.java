package com.uc.bpg.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration(locations={
		"classpath*:root-context.xml",
		"classpath*:mapper-beans.xml",
		"classpath*:service-beans.xml"		
})
public abstract class TestBase extends AbstractJUnit4SpringContextTests {
	private Logger logger;
	public Logger getLogger() {
		return logger;
	}
	
	public TestBase() {
		logger=LoggerFactory.getLogger(this.getClass());
	}

}
