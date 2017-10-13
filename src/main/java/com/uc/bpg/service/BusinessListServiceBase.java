package com.uc.bpg.service;

import com.uc.bpg.Constant;
import com.uc.bpg.domain.UserProfileImpl;
import com.uc.bpg.forms.IQueryFormBase;
import com.uc.web.forms.ListQueryForm;
import com.uc.web.persistence.Example;
import com.uc.web.service.AppWebListServiceBase;

public class BusinessListServiceBase<QueryFormType extends IQueryFormBase> 
	extends AppWebListServiceBase {

	@SuppressWarnings("unchecked")
	@Override
	public boolean prepareExample(ListQueryForm queryForm, Example example) {
		super.prepareExample(queryForm, example);
		return prepareExample((QueryFormType)queryForm, example);
	}
	
	public boolean prepareExample(QueryFormType queryForm, Example example) {
		Object limit= ((UserProfileImpl) queryForm.getUser()).getLimits(Constant.LIMIT_NAME_HOTEL);
		if(limit!=null){
			queryForm.setQueryHotel(Long.parseLong(limit.toString()));
		}
		return true;
	}

}
