package com.uc.bpg.controller.hotel.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.domain.CheckIn;
import com.uc.web.controller.AbstractDetailControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.hotel.checkin}")
public class ForeCheckInDetailControllerProxy extends AbstractDetailControllerProxy<Long, CheckIn> {
	@Value("${controller.proxy.uri.hotel.checkin}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.detail.hotel.checkin}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
}
