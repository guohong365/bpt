package com.uc.bpg.service.impl;

import org.springframework.util.StringUtils;

import com.uc.bpg.forms.DeviceTypeQueryForm;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.bpg.service.DeviceTypeListService;
import com.uc.web.forms.ListQueryForm;

public class DeviceTypeListServiceImpl extends BusinessListServiceBase<DeviceTypeQueryForm> implements DeviceTypeListService{
	@Override
	public boolean prepareQueryForm(ListQueryForm queryForm) {
		super.prepareQueryForm(queryForm);
		DeviceTypeQueryForm deviceTypeQueryForm=(DeviceTypeQueryForm) queryForm;
		if(StringUtils.isEmpty(deviceTypeQueryForm.getQueryName())){
			deviceTypeQueryForm.setQueryName(null);
		}
		if(StringUtils.isEmpty(deviceTypeQueryForm.getQueryProduct())){
			deviceTypeQueryForm.setQueryProduct(null);
		} 
		if(deviceTypeQueryForm.getQueryAll()==null || !deviceTypeQueryForm.getQueryAll()){
			deviceTypeQueryForm.setQueryAll(false);
		} else {
			deviceTypeQueryForm.setQueryAll(true);
		}
		
		return true;
	}

}
