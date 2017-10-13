package com.uc.bpg.controller.hotel.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.domain.Device;
import com.uc.web.controller.AbstractDetailControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping("${controller.proxy.uri.hotel.device}")
public class ForeDeviceDetailControllerProxy extends AbstractDetailControllerProxy<Long, Device> {
	@Value("${controller.proxy.uri.hotel.device}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.detail.hotel.device}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
}
