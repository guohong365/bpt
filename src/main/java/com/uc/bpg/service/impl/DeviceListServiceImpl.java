package com.uc.bpg.service.impl;

import org.springframework.util.StringUtils;

import com.uc.bpg.forms.DeviceQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.DeviceListService;
import com.uc.utils.IntegerUtils;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.QueryCondition;

public class DeviceListServiceImpl extends BusinessListServiceBase<DeviceQueryForm> implements DeviceListService {

	@Override
	public boolean prepareExample(DeviceQueryForm queryForm, Example example) {
		super.prepareExample(queryForm, example);
		QueryCondition condition=example.or();
		if(!IntegerUtils.isEmpty(queryForm.getQueryType())){
			condition.andFieldEqualTo("TYPE", queryForm.getQueryType());
		} else {
			queryForm.setQueryType(null);
		}
		
		if(!IntegerUtils.isEmpty(queryForm.getQueryHotel())){
			condition.andFieldEqualTo("HOTEL", queryForm.getQueryHotel());
		} else {
			queryForm.setQueryHotel(null);
		}
		if(queryForm.getQueryAll()==null || !queryForm.getQueryAll()){
			condition.andFieldEqualTo("VALID", true);
			queryForm.setQueryAll(false);
		} else{
			queryForm.setQueryAll(true);
		}
		if(queryForm.getQueryPublicUsage()!=null){
			if(queryForm.getQueryPublicUsage()){
				condition.andFieldEqualTo("PUBLIC_USAGE", true);
			}else {
				condition.andFieldEqualTo("PUBLIC_USAGE", false);
			}
		}
		if(!StringUtils.isEmpty(queryForm.getQueryHotelName())){
			condition.andFieldLike("HOTEL_NAME", queryForm.getQueryHotelName()+"%");
		} else {
			queryForm.setQueryHotelName(null);
		}
		if(!StringUtils.isEmpty(queryForm.getQueryName())){
			condition.andFieldLike("NAME", queryForm.getQueryName() +"%");
		} else {
			queryForm.setQueryName(null);
		}
		
		if(!StringUtils.isEmpty(queryForm.getQuerySerialNo())){
			condition.andFieldLike("SERIAL_NO", queryForm.getQuerySerialNo()+"%");
		}
		if(!IntegerUtils.isEmpty(queryForm.getQueryStatus())){
			switch(queryForm.getQueryStatus()){
			case 1: 
				condition.andFieldEqualTo("STATUS", 0);
				break;
			case 2:
				condition.andFieldEqualTo("STATUS", 15);
				break;
			case 3:
				condition.andFieldBetween("STATUS", 1, 8);
				break;
			case 4:
				condition.andFieldNotBetween("STATUS", 0, 8)
				.andFieldNotEqualTo("STATUS", 15);
				break;
			}
		} else {
			queryForm.setQueryStatus(null);
		}
		return true;
	}
}
