package com.uc.bpg.controller.impl;

import org.springframework.ui.Model;

import com.uc.bpg.controller.AccountDetailListController;
import com.uc.bpg.controller.BusinessDetailListControllerBase;
import com.uc.bpg.domain.Bill;
import com.uc.bpg.domain.DeviceUsage;
import com.uc.bpg.forms.DeviceUsageQueryForm;
import com.uc.bpg.service.AccountDetailService;
import com.uc.web.controller.WebAction;

public class AccountDetailControllerImpl 
	extends BusinessDetailListControllerBase<Bill, DeviceUsageQueryForm, DeviceUsage> implements AccountDetailListController {
	private static final String ACTION_PAY = "pay";
	private static final String ACTION_VERIFY = "verify";
	private static final String ACTION_VIEW_DETAIL = "viewDetail";
	private static final String ACTION_NAME_PAY = "付款";
	private static final String ACTION_NAME_VERIFY = "收款确认";

	public AccountDetailService  getService() {
		return (AccountDetailService) super.getService();
	}
	
	@Override
	protected Bill onCreateEntity() {
		return new Bill();
	}
	
	@Override
	protected String onGetDetailPage(String action, Object selectedId, Model model) {
		switch(action){
		case ACTION_VIEW_DETAIL:
			
			return onGetViewDetailPage(selectedId, model);
		case ACTION_PAY:
		case ACTION_VERIFY:
			super.onGetDetailPage(WebAction.VIEW, selectedId, model);
			model.addAttribute(PARAM_NAME_ACTION, action);
			model.addAttribute(PARAM_NAME_ACTION_NAME, ACTION_PAY.equals(action) ? ACTION_NAME_PAY:ACTION_NAME_VERIFY);
			return getPayPage();
		}
		return super.onGetDetailPage(action, selectedId, model);
	}

	private String getPayPage() {
		return getPageBasePath() + "/pay";
	}

	private String onGetViewDetailPage(Object selectedId, Model model) {
		super.onGetDetailPage(WebAction.VIEW, selectedId, model);		
		return getBillDetailPage();
	}
	
	private String getBillDetailPage() {
		return "common/usage/list";
	}

	@Override
	protected String onPostDetailPage(String action, Object detail) {
		switch(action){
		case ACTION_PAY:			
		case ACTION_VERIFY:
			return onPostPay(action, (Bill)detail);
		}
		return super.onPostDetailPage(action, detail);
	}

	private String onPostPay(String action, Bill detail) {				
		switch(action){
		case ACTION_PAY:
			detail.setPayer((Long)getUser().getUser().getId());
			getService().pay(detail);
			break;
		case ACTION_VERIFY:
			detail.setVerifier((Long)getUser().getUser().getId());
			getService().verify(detail);
			break;
		}
		return "OK";
	}
}
