package com.uc.bpg.service.impl;

import org.springframework.util.StringUtils;

import com.uc.bpg.forms.ExamineQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.ExamineListService;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.QueryCondition;

public class ExamineListServiceImpl extends BusinessListServiceBase<ExamineQueryForm> implements ExamineListService {
	@Override
	public boolean prepareExample(ExamineQueryForm queryFormType, Example example) {
		QueryCondition condition=example.or();
		if(!StringUtils.isEmpty(queryFormType.getQueryMac())){
			condition.andFieldLike("MAC", queryFormType.getQueryMac() + "%");
		} 
		if(queryFormType.getQueryStatus()!=null){
			condition.andFieldEqualTo("STATUS", queryFormType.getQueryStatus());
		}
		if(queryFormType.getQueryFrom()!=null){
			condition.andFieldGreaterThanOrEqualTo("RECV_TIME", queryFormType.getQueryFrom());
		}
		if(queryFormType.getQueryTo()!=null){
			condition.andFieldLessThanOrEqualTo("RECV_TIME", queryFormType.getQueryTo());
		}
		example.setOrderByClause("RECV_TIME desc");
		return true;
	}

}
