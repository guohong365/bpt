package com.uc.bpg.service.impl;

import org.springframework.util.StringUtils;

import com.uc.bpg.forms.RoomQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.RoomListService;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.QueryCondition;


public class RoomListServiceImpl extends BusinessListServiceBase<RoomQueryForm> implements RoomListService{
	@Override
	public boolean prepareExample(RoomQueryForm queryForm, Example example) {
		QueryCondition condition=example.or();
		if(queryForm.getQueryHotel()!=null){
			condition.andFieldEqualTo("HOTEL", queryForm.getQueryHotel());
		}
		if(queryForm.getQueryStorey()!=null && queryForm.getQueryStorey() >0){
			condition.andFieldEqualTo("STOREY", queryForm.getQueryStorey());
		} else {
			queryForm.setQueryStorey(null);
		}
		if(!StringUtils.isEmpty(queryForm.getQueryRoomNo())){
			condition.andFieldLike("ROOM_NO", queryForm.getQueryRoomNo() + "%");
		} else {
			queryForm.setQueryRoomNo(null);
		}
		if(queryForm.getQueryAll()==null || !queryForm.getQueryAll()){
			queryForm.setQueryAll(false);
			condition.andFieldEqualTo("VALID", true);
		} else {
			queryForm.setQueryAll(true);
		}		
		return true;
	}
}
