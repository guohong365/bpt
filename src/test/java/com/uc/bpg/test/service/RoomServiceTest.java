package com.uc.bpg.test.service;

import javax.annotation.Resource;

import org.junit.Test;

import com.uc.bpg.forms.RoomQueryForm;
import com.uc.bpg.service.RoomListService;
import com.uc.bpg.test.TestBase;
import com.uc.web.forms.ui.componet.PageCtrlImpl;

public class RoomServiceTest extends TestBase {
	
	@Resource(name="roomListService")
	RoomListService listService;
	
	@Test
	public void test(){
		listService.select(new RoomQueryForm(), new PageCtrlImpl());
	}

}
