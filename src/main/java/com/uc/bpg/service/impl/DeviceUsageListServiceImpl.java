package com.uc.bpg.service.impl;

import org.springframework.util.StringUtils;

import com.uc.bpg.forms.DeviceUsageQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.DeviceUsageListService;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.QueryCondition;

public class DeviceUsageListServiceImpl extends BusinessListServiceBase<DeviceUsageQueryForm>
	implements DeviceUsageListService{
	
	@Override
	public boolean prepareExample(DeviceUsageQueryForm queryForm, Example example) {
		if(super.prepareExample(queryForm, example)){
			QueryCondition condition= example.or();
			if(queryForm.getQueryMainId()!=null){
				condition.andFieldEqualTo("BILL", queryForm.getQueryMainId());
			}
			if(!StringUtils.isEmpty(queryForm.getQueryHotelName())){
				condition.andFieldLike("HOTEL_NAME", queryForm.getQueryHotelName() + "%");
			} else {
				queryForm.setQueryHotelName(null);
			}
			if(queryForm.getQueryUseTimeFrom()!=null){
				condition.andFieldGreaterThanOrEqualTo("USE_TIME", queryForm.getQueryUseTimeFrom());
			} 
			if(queryForm.getQueryUseTimeTo()!=null){
				condition.andFieldLessThanOrEqualTo("USE_TIME", queryForm.getQueryUseTimeTo());
			}
			if(queryForm.getQueryPayed()!=null){
				if(queryForm.getQueryPayed()){
					condition.andFieldEqualTo("PAYED", true);
				}else {
					condition.andFieldEqualTo("PAYED", false);
				}
			}			
			return true;
		} else {
			return false;
		}
	}

}
