package com.uc.bpg.controller.hotel.impl;

import com.uc.bpg.controller.BusinessListControllerBase;
import com.uc.bpg.controller.RoomListController;
import com.uc.bpg.forms.RoomQueryForm;


public class RoomListControllerImpl extends BusinessListControllerBase<RoomQueryForm> implements RoomListController{
	@Override
	protected RoomQueryForm onCreateQueryForm() {
		RoomQueryForm queryForm=new RoomQueryForm();
		return queryForm;
	}
}
