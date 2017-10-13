package com.uc.bpg.controller.impl;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.ui.Model;

import com.uc.bpg.controller.BusinessDetailControllerBase;
import com.uc.bpg.controller.HotelDetailController;
import com.uc.bpg.domain.Hotel;
import com.uc.bpg.domain.StrategeFormatHelper;
import com.uc.web.controller.WebAction;
import com.uc.web.domain.Code;
import com.uc.web.domain.security.UserProfile;

public class HotelDetailControllerImpl extends BusinessDetailControllerBase<Hotel> implements HotelDetailController {
	private static final String CODE_NAME_WEEK_DAYS = "_WEEK_DAYS";
	private static final String CODE_NAME_MONTH_DAYS = "_MONTH_DAYS";
	private static final String CODE_NAME_QUARTER_MONTHS = "_QUARTER_MONTHS";
	private static final String CODE_NAME_MONTHS = "_MONTHS";
	private static final String CODE_NAME_BILLING_CYCLE_TYPES="_BILLING_CYCLE_TYPES";
	@Override
	protected Hotel onCreateEntity() {
		return new Hotel();
	}
	
	@Override
	protected Map<String, List<Code>> onGetNewCodes(UserProfile user) {
		Map<String, List<Code>> map= super.onGetNewCodes(user);
		map.put(CODE_NAME_MONTHS, StrategeFormatHelper.getMonths());
		map.put(CODE_NAME_MONTH_DAYS, StrategeFormatHelper.getMonthDays());
		map.put(CODE_NAME_QUARTER_MONTHS, StrategeFormatHelper.getQuarterMonths());
		map.put(CODE_NAME_WEEK_DAYS, StrategeFormatHelper.getWeekDays());
		return map;
	}
	
	@Override
	protected Map<String, List<Code>> onGetModifyCodes(UserProfile user, Object detail) {
		return onGetNewCodes(user);
	}
	
	@Override
	public String getDetailPage(String action, Long recordId, Model model) {
		switch (action) {
		case WebAction.NEW:
		case WebAction.MODIFY:
			model.addAttribute(CODE_NAME_BILLING_CYCLE_TYPES, StrategeFormatHelper.getCyleTypes());			
			break;
		default:
			break;
		}
		return super.getDetailPage(action, recordId, model);
	}
	
	@Override
	protected void saveNew(Object entity) {
		Hotel detail=(Hotel) entity;
		detail.setUuid(UUID.randomUUID().toString());
		detail.setCreater((Long) getUser().getUser().getId());
		detail.setCreateTime(Calendar.getInstance().getTime());		
		super.saveNew(detail);
	}
	
	void enableHotel(Hotel detail, boolean enabled){
		Hotel hotel=new Hotel();
		hotel.setId(detail.getId());
		hotel.setCancelater(enabled? null:(Long) getUser().getUser().getId());
		hotel.setCancelTime(enabled? null:Calendar.getInstance().getTime());
		hotel.setValid(enabled);
		getService().updateSelective(hotel);
	}
	
	@Override
	protected void saveModify(Object detail) {		
		getService().updateSelective(detail);
	}
	
	@Override
	protected void saveCancelate(Object detail) {
		enableHotel((Hotel) detail, false);
	}
	
	@Override
	protected void saveReactive(Object detail) {
		enableHotel((Hotel) detail, true);
	}
	
}
