package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.controller.DeviceTypeDetailController;
import com.uc.bpg.domain.DeviceType;
import com.uc.web.controller.AbstractDetailControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.device.type}")
public class DeviceTypeDetailControllerProxy extends AbstractDetailControllerProxy<Long, DeviceType> implements DeviceTypeDetailController {

	@Value(value="${controller.proxy.uri.device.type}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.detail.device.type}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
}
