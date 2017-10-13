package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.controller.DeviceTypeListController;
import com.uc.bpg.forms.DeviceTypeQueryForm;
import com.uc.web.controller.AbstractListControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.device.type}")
public class DeviceTypeListControllerProxy extends AbstractListControllerProxy<DeviceTypeQueryForm> implements DeviceTypeListController {
	
	@Value(value="${controller.proxy.uri.device.type}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.list.device.type}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}

}
