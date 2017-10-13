package com.uc.bpg.test.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.UUID;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.uc.bpg.domain.DeviceType;
import com.uc.bpg.forms.DeviceTypeQueryForm;
import com.uc.bpg.persistence.DeviceTypeMapper;
import com.uc.bpg.test.TestBase;
import com.uc.web.persistence.AppOptimizedMapper;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@Transactional
public class DeviceTypeMapperTest extends TestBase {
	
	@Autowired(required=true)
	protected DeviceTypeMapper mapper;
	
	@Test
	public void test01_selectByQueryForm(){
		
		assertTrue(mapper instanceof AppOptimizedMapper);
		
		long count = mapper.selectCountOptimized(null);
		assertTrue(count>0);		
		
		List<?> list= mapper.selectOptimized(null, 0, count);
		
		assertNotNull(list);
		assertEquals(count, list.size());
		
		DeviceTypeQueryForm query=new DeviceTypeQueryForm();
		
		list= mapper.selectOptimized(query, 0, count);
		assertNotNull(list);
		assertEquals(count, list.size());
		
		query.setQueryAll(true);
		list= mapper.selectOptimized(query, 0, count);
		assertNotNull(list);
		assertEquals(count, list.size());
		
		query.setQueryAll(false);
		list= mapper.selectOptimized(query, 0, count);
		assertNotNull(list);
		assertEquals(count, list.size());
		
		query.setQueryHotel(2L);
		list=mapper.selectOptimized(query, 0, count);
		assertNotNull(list);
		assertEquals(count, list.size());
		
		query.setQueryOrderByClause("NAME DESC");
		list=mapper.selectOptimized(query, 0, count);
		assertNotNull(list);
		assertEquals(count, list.size());
		
		query.setQueryOrderBy("NAME");
		query.setQueryOrder(null);
		query.setQueryAll(null);
		
		list=mapper.selectOptimized(query, 0, count);
		assertNotNull(list);
		assertEquals(count, list.size());
	}
	
	@Test
	@Rollback(value=true)
	public void test02(){
		DeviceType type=new DeviceType();
		type.setName("ABC");
		type.setProduct("OOO");
		type.setUuid(UUID.randomUUID().toString());		
		mapper.insertDetail(type);
		
		mapper.selectOptimized(null, 0, 10);		
	}
}
