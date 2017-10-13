package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.domain.Hotel;
import com.uc.web.controller.AbstractDetailControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.background.hotel}")
public class HotelDetailControllerProxy extends AbstractDetailControllerProxy<Long, Hotel> {

	@Value(value="${controller.proxy.uri.background.hotel}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.detail.background.hotel}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}

}
