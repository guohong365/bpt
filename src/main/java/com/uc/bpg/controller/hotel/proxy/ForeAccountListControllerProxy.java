package com.uc.bpg.controller.hotel.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.forms.BillQueryForm;
import com.uc.web.controller.AbstractListControllerProxy;
import com.uc.web.controller.ControllerBase;
@Controller
@RequestMapping("${controller.proxy.uri.hotel.account}")
public class ForeAccountListControllerProxy extends AbstractListControllerProxy<BillQueryForm> {

	@Value("${controller.proxy.uri.hotel.account}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.list.hotel.account}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
	
}
