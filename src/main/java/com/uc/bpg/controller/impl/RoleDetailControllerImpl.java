package com.uc.bpg.controller.impl;

import java.util.List;
import java.util.UUID;

import com.uc.bpg.controller.BusinessDetailControllerBase;
import com.uc.bpg.controller.RoleDetailController;
import com.uc.bpg.domain.FunctionAvailable;
import com.uc.bpg.domain.RoleImpl;
import com.uc.bpg.service.RoleDetailService;
import com.uc.web.domain.WithId;

public class RoleDetailControllerImpl extends BusinessDetailControllerBase<RoleImpl> implements RoleDetailController{

	public RoleDetailService getService(){
		return (RoleDetailService)super.getService();
	}

	@Override
	protected RoleImpl onCreateEntity() {
		RoleImpl detail=new RoleImpl();
		detail.setInternal(false);
		detail.setValid(true);
		List<FunctionAvailable> functions=getService().seletctFunctions();
		detail.setFunctions(functions);
		return detail;
	}
	
	@Override
	protected void saveNew(Object entity) {
		RoleImpl detail=(RoleImpl) entity;
		detail.setUuid(UUID.randomUUID().toString());
		detail.setInternal(false);
		super.saveNew(detail);
	}
	
	protected void enableRole(Object entity, boolean enabled){
		RoleImpl detail=new RoleImpl();
		detail.setId(((WithId)entity).getId());
		detail.setValid(enabled);
		getService().updateSelective(detail);
	}
	@Override
	protected void saveCancelate(Object detail) {
		enableRole(detail, false);
	}
	
	@Override
	protected void saveReactive(Object detail) {
		enableRole(detail, true);
	}
	@Override
	protected void saveDisable(Object detail) {
		enableRole(detail, false);
	}
	@Override
	protected void saveDelete(Object detail) {
	}	
	
}
