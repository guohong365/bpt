package com.uc.bpg.controller.hotel.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.domain.Bill;
import com.uc.bpg.domain.DeviceUsage;
import com.uc.bpg.forms.DeviceUsageQueryForm;
import com.uc.web.controller.AbstractDetailListControllerProxy;
import com.uc.web.controller.ControllerBase;
@Controller
@RequestMapping("${controller.proxy.uri.hotel.account}")
public class ForeAccountDetailListControllerProxy 
	extends AbstractDetailListControllerProxy<Long, Bill, DeviceUsageQueryForm, DeviceUsage> {
	
	@Value(value="${controller.proxy.uri.hotel.account}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	
	@Resource(name="${controller.impl.detail.hotel.account}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
	

}
