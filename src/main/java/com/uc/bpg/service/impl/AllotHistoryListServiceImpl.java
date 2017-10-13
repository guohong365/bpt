package com.uc.bpg.service.impl;

import org.springframework.util.StringUtils;

import com.uc.bpg.forms.AllotHisQueryForm;
import com.uc.bpg.service.AllotHistoryListService;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.QueryCondition;

public class AllotHistoryListServiceImpl extends BusinessListServiceBase<AllotHisQueryForm> implements AllotHistoryListService {
	
	public boolean prepareExample(AllotHisQueryForm queryForm, Example example) {
		QueryCondition condition=example.or();
		if(queryForm.getQueryHotel()!=null && queryForm.getQueryHotel()>0){
			condition.andFieldEqualTo("HOTEL", queryForm.getQueryHotel());
		} else {
			queryForm.setQueryHotel(null);
		}
		if(!StringUtils.isEmpty(queryForm.getQueryHotelName())){
			condition.andFieldLike("HOTEL_NAME", queryForm.getQueryHotelName());
		} else {
			queryForm.setQueryHotelName(null);
		}
		if(!StringUtils.isEmpty(queryForm.getQueryOperaterName())){
			condition.andFieldLike("OPERATER_NAME", queryForm.getQueryOperaterName() +"%");
		} else {
			queryForm.setQueryOperaterName(null);
		}
		if(!StringUtils.isEmpty(queryForm.getQueryRoom())){
			condition.andFieldLike("ROOM_NO", queryForm.getQueryRoom());
		} else {
			queryForm.setQueryRoom(null);
		}
		if(queryForm.getQueryMainId()!=null && queryForm.getQueryMainId()>0){
			condition.andFieldEqualTo("DEVICE", queryForm.getQueryMainId());
		} else {
			queryForm.setQueryMainId(null);
		}
		if(queryForm.getQueryOperateTimeFrom()!=null){
			condition.andFieldGreaterThanOrEqualTo("OPERATE_TIME", queryForm.getQueryOperateTimeFrom());
		}
		if(queryForm.getQueryOperateTimeTo()!=null){
			condition.andFieldLessThanOrEqualTo("OPERATE_TIIME", queryForm.getQueryOperateTimeTo());
		}		
		if(!StringUtils.isEmpty(queryForm.getQueryOperation())){
			condition.andFieldEqualTo("OPERATION", queryForm.getQueryOperation());
		} else {
			queryForm.setQueryOperation(null);
		}
		return true;
	}
	
	

}
