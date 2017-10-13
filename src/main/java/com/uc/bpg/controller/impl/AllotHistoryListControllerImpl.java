package com.uc.bpg.controller.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.uc.bpg.controller.AllotHistoryListController;
import com.uc.bpg.forms.AllotHisQueryForm;
import com.uc.bpg.forms.DetailListQueryFormImpl;
import com.uc.bpg.service.DeviceDetailService;
import com.uc.web.controller.AbstractListController;
import com.uc.web.controller.DetailListController;
import com.uc.web.domain.Code;
import com.uc.web.domain.CodeImpl;
import com.uc.web.forms.ListQueryForm;

public class AllotHistoryListControllerImpl extends AbstractListController<AllotHisQueryForm> implements AllotHistoryListController{
	private static final String[] OPERATIONS={"分配", "收回","成为公用","报废"};
	private static final String CODE_OPT_NAME = "_OPTS";
	
	private DeviceDetailService deviceService;
	
	public void setDeviceService(DeviceDetailService deviceService) {
		this.deviceService = deviceService;
	}
	public DeviceDetailService getDeviceService() {
		return deviceService;
	}
	
	@Override
	protected String onGetListPage(Model model) {
		List<Code> codes=new ArrayList<>();
		for(String opt:OPERATIONS){
			codes.add(new CodeImpl(opt, opt));
		}
		model.addAttribute(CODE_OPT_NAME, codes);
		return super.onGetListPage(model);
	}
	
	@Override
	protected AllotHisQueryForm onCreateQueryForm() {		
		return new AllotHisQueryForm();
	}
	
	@Override
	protected Map<String, Object> prepareExportOptions(ListQueryForm query, List<?> data) {
		DetailListQueryFormImpl queryForm=(DetailListQueryFormImpl) query;
		Map<String, Object> options= super.prepareExportOptions(queryForm, data);
		if(queryForm.getQueryMainId()!=null && queryForm.getQueryMainId()>0 && getDeviceService()!=null){
			options.put(DetailListController.EXPORTOR_OPTION_DETAIL_DATA, getDeviceService().selectById(queryForm.getQueryMainId()));
		}
		return options;
	}
	
}
