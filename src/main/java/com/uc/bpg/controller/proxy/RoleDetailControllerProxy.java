package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.domain.RoleImpl;
import com.uc.web.controller.AbstractDetailControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.role}")
public class RoleDetailControllerProxy extends AbstractDetailControllerProxy<Long, RoleImpl> {

	@Value(value="${controller.proxy.uri.role}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.detail.role}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}

}
