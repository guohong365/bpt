package com.uc.bpg.service.impl;

import java.util.List;

import com.uc.bpg.persistence.CodesMapper;
import com.uc.bpg.service.CodesService;
import com.uc.web.domain.Code;
import com.uc.web.forms.MenuTreeItem;
import com.uc.web.service.ServiceBase;

public class CodesServiceImpl extends ServiceBase implements CodesService {

	@Override
	public CodesMapper getMapper() {
		return (CodesMapper) super.getMapper();
	}
	
	@Override
	public List<Code> selectTypes(boolean forEdit) {
		return getMapper().selectTypes(forEdit);
	}

	@Override
	public List<MenuTreeItem> selectAllMenus() {
		return getMapper().selectAllMenus();
	}

	@Override
	public List<Code> selectOrgCodes(String type, boolean forEdit) {
		return getMapper().selectOrgCodes(type, forEdit);		
	}

	@Override
	public List<Code> selectAllocableHotelCodes() {
		return getMapper().selectAllocableHotelCodes();
	}

}
