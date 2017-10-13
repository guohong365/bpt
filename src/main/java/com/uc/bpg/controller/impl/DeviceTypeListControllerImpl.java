package com.uc.bpg.controller.impl;

import com.uc.bpg.controller.DeviceTypeListController;
import com.uc.bpg.forms.DeviceTypeQueryForm;
import com.uc.web.controller.AbstractListController;

public class DeviceTypeListControllerImpl extends AbstractListController<DeviceTypeQueryForm> implements DeviceTypeListController{

	@Override
	protected DeviceTypeQueryForm onCreateQueryForm() {
		return new DeviceTypeQueryForm();
	}

}
