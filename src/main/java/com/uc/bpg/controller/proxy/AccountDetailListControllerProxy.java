package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.controller.AccountDetailListController;
import com.uc.bpg.domain.Bill;
import com.uc.bpg.domain.DeviceUsage;
import com.uc.bpg.forms.DeviceUsageQueryForm;
import com.uc.web.controller.AbstractDetailListControllerProxy;
import com.uc.web.controller.ControllerBase;
@Controller
@RequestMapping("${controller.proxy.uri.background.account}")
public class AccountDetailListControllerProxy 
	extends AbstractDetailListControllerProxy<Long, Bill, DeviceUsageQueryForm, DeviceUsage> implements AccountDetailListController{
	
	@Value(value="${controller.proxy.uri.background.account}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	
	@Resource(name="${controller.impl.detail.background.account}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}

}
