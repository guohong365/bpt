package com.uc.bpg.controller.impl;

import java.util.List;
import java.util.Map;

import com.uc.bpg.constant.CODES;
import com.uc.bpg.controller.BusinessListControllerBase;
import com.uc.bpg.controller.DeviceListController;
import com.uc.bpg.forms.DeviceQueryForm;
import com.uc.bpg.service.CodesService;
import com.uc.web.domain.Code;
import com.uc.web.domain.security.UserProfile;

public class DeviceListControllerImpl extends BusinessListControllerBase<DeviceQueryForm> implements DeviceListController{
	
	CodesService codesService;
	
	public CodesService getCodesService() {
		return codesService;
	}
	
	public void setCodesService(CodesService codesService) {
		this.codesService = codesService;
	}
	
	@Override
	protected Map<String, List<Code>> onGetListPageCodes(UserProfile user) {
		Map<String, List<Code>> map= super.onGetListPageCodes(user);
		map.put(CODES.DEVICE_TYPE, getCodesService().selectTypes(true));
		return map;
	}
	
	@Override
	protected DeviceQueryForm onCreateQueryForm() {
		return new DeviceQueryForm();
	}
}
