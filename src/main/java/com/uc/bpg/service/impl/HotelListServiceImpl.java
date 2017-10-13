package com.uc.bpg.service.impl;

import org.springframework.util.StringUtils;

import com.uc.bpg.forms.HotelQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.HotelListService;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.QueryCondition;

public class HotelListServiceImpl extends BusinessListServiceBase<HotelQueryForm> implements HotelListService{

	@Override
	public boolean prepareExample(HotelQueryForm queryForm, Example example) {
		QueryCondition condition=example.or();
		if(queryForm.getQueryAll()==null || !queryForm.getQueryAll()){
			queryForm.setQueryAll(false);
			condition.andFieldEqualTo("VALID", true);			
		} else {
			queryForm.setQueryAll(true);
		}
		if(queryForm.getQueryPublicUsageFrom()!=null){
			condition.andFieldGreaterThanOrEqualTo("PUBLIC_USAGE", queryForm.getQueryPublicUsageFrom());
		} 
		if(queryForm.getQueryPublicUsageTo()!=null){
			condition.andFieldLessThanOrEqualTo("PUBLIC_USAGE", queryForm.getQueryPublicUsageTo());
		}
		if(queryForm.getQueryTotalDeviceFrom()!=null){
			condition.andFieldGreaterThanOrEqualTo("TOTAL_DEVICE", queryForm.getQueryTotalDeviceFrom());
		}
		if(queryForm.getQueryTotalDeviceTo()!=null){
			condition.andFieldLessThanOrEqualTo("TOTAL_DEVICE", queryForm.getQueryTotalDeviceTo());
		}
		if(!StringUtils.isEmpty(queryForm.getQueryName())){
			condition.andFieldLike("NAME", queryForm.getQueryName()+"%");
		} else {
			queryForm.setQueryName(null);
		}
		if(queryForm.getQueryOwnedDeviceFrom()!=null){
			condition.andFieldGreaterThanOrEqualTo("OWNED_DEVICE", queryForm.getQueryOwnedDeviceFrom());
		}
		if(queryForm.getQueryOwnedDeviceTo()!=null){
			condition.andFieldLessThanOrEqualTo("OWNED_DEVICE", queryForm.getQueryOwnedDeviceTo());
		}
		return true;
	}

}
