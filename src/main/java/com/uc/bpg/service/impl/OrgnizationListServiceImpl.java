package com.uc.bpg.service.impl;

import com.uc.bpg.forms.OrgnizationQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.OrgnizationListService;
import com.uc.web.persistence.Example;

public class OrgnizationListServiceImpl extends BusinessListServiceBase<OrgnizationQueryForm> implements OrgnizationListService{

	@Override
	public boolean prepareExample(OrgnizationQueryForm queryForm, Example example) {
		// TODO Auto-generated method stub
		return false;
	}


}
