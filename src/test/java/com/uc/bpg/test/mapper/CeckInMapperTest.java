package com.uc.bpg.test.mapper;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.uc.bpg.domain.CheckIn;
import com.uc.bpg.forms.CheckInQueryForm;
import com.uc.bpg.persistence.CheckInMapper;
import com.uc.bpg.test.TestBase;

public class CeckInMapperTest extends TestBase {
	@Autowired
	CheckInMapper mapper;
	
	@SuppressWarnings({ "unused", "unchecked" })
	@Test
	public void test(){
		CheckInQueryForm queryForm=null;
		Long count=mapper.selectCountOptimized(queryForm);
		
		List<CheckIn> list=(List<CheckIn>) mapper.selectOptimized(queryForm, 0, count);
		
		queryForm=new CheckInQueryForm();
		
		count=mapper.selectCountOptimized(queryForm);
		
		list=(List<CheckIn>) mapper.selectOptimized(queryForm, 0, count);
		
		queryForm.setQueryHotel(2L);
		queryForm.setQueryRoomNo("83");
		Calendar calendar=Calendar.getInstance();
		calendar.add(Calendar.MONTH, -2);
		queryForm.setQueryCheckInTimeFrom(calendar.getTime());
		queryForm.setQueryCheckInTimeTo(new Date());
		queryForm.setQueryCheckOutTimeFrom(calendar.getTime());
		queryForm.setQueryCheckOutTimeTo(new Date());
		queryForm.setQueryCheckInReceptionistName("李");
		queryForm.setQueryCheckInReceptionistName("李");
		count=mapper.selectCountOptimized(queryForm);
		list=(List<CheckIn>) mapper.selectOptimized(queryForm, 0, count);
		
	}
}
