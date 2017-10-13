package com.uc.bpg.controller.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.ui.Model;

import com.uc.bpg.controller.BusinessDetailControllerBase;
import com.uc.bpg.controller.StrategeDetailController;
import com.uc.bpg.domain.Stratege;
import com.uc.bpg.domain.StrategeFormatHelper;
import com.uc.bpg.domain.StrategeHistory;
import com.uc.bpg.service.StrategeDetailService;
import com.uc.web.controller.WebAction;
import com.uc.web.domain.Code;
import com.uc.web.domain.WithId;
import com.uc.web.domain.security.UserProfile;
import com.uc.web.utils.SystemConfig;

public class StrategeDetailControllerImpl extends BusinessDetailControllerBase<Stratege> implements StrategeDetailController {
	
	private static final String CODE_NAME_WEEK_DAYS = "_weekDays";
	private static final String CODE_NAME_MONTH_DAYS = "_monthDays";
	private static final String CODE_NAME_QUARTER_MONTHS = "_quarterMonths";
	private static final String CODE_NAME_MONTHS = "_months";
	
	public StrategeDetailService getService(){
		return (StrategeDetailService) super.getService();
	}
		
	@Override
	protected Map<String, List<Code>> onGetModifyCodes(UserProfile user, Object detail) {		
		Map<String, List<Code>> map= super.onGetModifyCodes(user, detail);
		map.put(CODE_NAME_WEEK_DAYS, StrategeFormatHelper.getWeekDays());		
		map.put(CODE_NAME_MONTH_DAYS, StrategeFormatHelper.getMonthDays());
		map.put(CODE_NAME_QUARTER_MONTHS, StrategeFormatHelper.getQuarterMonths());
		map.put(CODE_NAME_MONTHS, StrategeFormatHelper.getMonths());
		return map;
	}
	
	@Override
	protected String onGetDetailPage(String action, Object selectedId, Model model) {		
		return super.onGetDetailPage(action, getService().selectId(), model);
	}
	
	@Override
	protected void onBeforSaveDetail(UserProfile user, String action, Object entity) throws Exception {
		super.onBeforSaveDetail(user, action, entity);
		Stratege detail = (Stratege) entity;
		if(WebAction.MODIFY.equals(action)){			
			Stratege old=(Stratege) getService().selectById(((WithId)detail).getId());
			StrategeHistory history=new StrategeHistory();
			
			history.setUuid(UUID.randomUUID().toString());
			history.setBillingCycle(old.getBillingCycle());
			history.setBillingDateParam1(old.getBillingDateParam1());
			history.setBillingDateParam2(old.getBillingDateParam2());
			history.setCharge(old.getCharge());
			history.setChargeStandard(old.getChargeStandard());
			history.setRatio(old.getRatio());
			history.setCreater(old.getCreater());
			history.setCreateTime(old.getCreateTime());
			history.setHotel(null);
			history.setTotalDevice(0L);
			history.setPublicUsage(0L);
			history.setModifyTime(new Date());			
			detail.setCreateTime(new Date());
			
			if(!SystemConfig.noLogin()){
				history.setModifier((Long) getUser().getUser().getId());
				detail.setCreater((Long) getUser().getUser().getId());
			} else {
				history.setModifier(1L);
				detail.setCreater(1L);
			}
			
		}
	}

	@Override
	protected Stratege onCreateEntity() {
		return null;
	}
		
}
