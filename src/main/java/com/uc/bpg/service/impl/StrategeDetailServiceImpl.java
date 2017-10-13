package com.uc.bpg.service.impl;

import com.uc.bpg.service.StrategeDetailService;
import com.uc.web.service.AppDetailServiceBase;

public class StrategeDetailServiceImpl extends AppDetailServiceBase implements StrategeDetailService {
	
	@Override
	public Long selectId() {
		return (Long) getUuidMapper().selectIdByUuid("root");
	}
}
