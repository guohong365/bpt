package com.uc.bpg.service.impl;

import com.uc.bpg.forms.ExamineQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.ExamineListService;
import com.uc.web.persistence.Example;

public class ExamineListServiceImpl extends BusinessListServiceBase<ExamineQueryForm> implements ExamineListService {
	@Override
	public boolean prepareExample(ExamineQueryForm queryFormType, Example example) {
		
		return true;
	}

}
