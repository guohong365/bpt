package com.uc.bpg.controller.impl;

import com.uc.bpg.controller.BusinessListControllerBase;
import com.uc.bpg.controller.DeviceUsageRecordListController;
import com.uc.bpg.forms.DeviceUsageQueryForm;

public class DeviceUsageRecordListControllerImpl 
	extends BusinessListControllerBase<DeviceUsageQueryForm> 
	implements DeviceUsageRecordListController{

	@Override
	protected DeviceUsageQueryForm onCreateQueryForm() {
		return new DeviceUsageQueryForm();
	}

}
