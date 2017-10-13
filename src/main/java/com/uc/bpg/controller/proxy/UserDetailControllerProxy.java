package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.controller.UserDetailController;
import com.uc.bpg.domain.UserImpl;
import com.uc.web.controller.AbstractDetailControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.user}")
public class UserDetailControllerProxy extends AbstractDetailControllerProxy<Long, UserImpl> implements UserDetailController{

	@Value(value="${controller.proxy.uri.user}") 
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.detail.user}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
}
