package com.uc.bpg.controller.impl;

import java.util.UUID;

import com.uc.bpg.controller.BusinessDetailControllerBase;
import com.uc.bpg.controller.DeviceTypeDetailController;
import com.uc.bpg.domain.DeviceType;
import com.uc.bpg.service.DeviceTypeDetailService;

public class DeviceTypeDetailControllerImpl extends BusinessDetailControllerBase<DeviceType> implements DeviceTypeDetailController {

	@Override
	protected DeviceType onCreateEntity() {
		DeviceType detail= new DeviceType();
		detail.setValid(true);
		detail.setUuid(UUID.randomUUID().toString());
		return detail;
	}
	
	public DeviceTypeDetailService getService(){
		return (DeviceTypeDetailService) super.getService();
	}
	
	@Override
	protected void saveNew(Object entity) {
		DeviceType detail=(DeviceType) entity;
		if(detail.getShowOrder()==null){
			Long order= getService().selectNextShowOrder();
			detail.setShowOrder(order);
		}
		super.saveNew(detail);
	}

}
