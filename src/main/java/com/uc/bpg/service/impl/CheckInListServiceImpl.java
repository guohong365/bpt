package com.uc.bpg.service.impl;

import java.util.Date;

import com.uc.bpg.forms.CheckInQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.CheckInListService;
import com.uc.web.persistence.Example;

public class CheckInListServiceImpl extends BusinessListServiceBase<CheckInQueryForm> implements CheckInListService {
	@Override
	public boolean prepareExample(CheckInQueryForm queryForm, Example example) {
		super.prepareExample(queryForm, example);
		queryForm.setQueryNow(new Date());
		return true;
	}
}
