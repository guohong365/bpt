package com.uc.bpg.service.impl;

import com.uc.bpg.forms.StrategeQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.StrategeHistoryListService;
import com.uc.web.persistence.Example;


public class StrategeHistoryListServiceImpl extends BusinessListServiceBase<StrategeQueryForm> implements StrategeHistoryListService{

	@Override
	public boolean prepareExample(StrategeQueryForm queryForm, Example example) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
