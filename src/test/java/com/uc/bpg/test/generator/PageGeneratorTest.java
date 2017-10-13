package com.uc.bpg.test.generator;

import java.io.IOException;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.uc.bpg.domain.Hotel;
import com.uc.web.tools.generator.EntityDescriptor;
import com.uc.web.tools.generator.EntityParser;
import com.uc.web.tools.generator.PageGenerator;

@ContextConfiguration(locations={"classpath:page-generator.xml"})
public class PageGeneratorTest extends AbstractJUnit4SpringContextTests {
	@Resource(name="listPageGenerator")
	PageGenerator listGenerator;
	
	@Resource(name="detailModifyPageGenerator")
	PageGenerator modifyGenerator;
	
	@Resource(name="detailViewPageGenerator")
	PageGenerator viewGenerator;
	
	@Test
	public void test() throws IOException{
		EntityDescriptor descriptor=EntityParser.parse(Hotel.class);
		StringBuilder builder=new StringBuilder();
		System.out.println("=================================");
		viewGenerator.generateString(descriptor, builder);
			
		System.out.println(builder.toString());
		System.out.println("=================================");
		builder.setLength(0);
		modifyGenerator.generateString(descriptor, builder);
			
		System.out.println(builder.toString());
		System.out.println("=================================");
		
		
		builder.setLength(0);
		listGenerator.generateString(descriptor, builder);
			
		System.out.println(builder.toString());
		System.out.println("=================================");
		
		
	}
}
