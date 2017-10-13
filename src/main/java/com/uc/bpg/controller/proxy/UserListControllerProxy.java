package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.controller.UserListController;
import com.uc.bpg.forms.UserQueryForm;
import com.uc.web.controller.AbstractListControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.user}")
public class UserListControllerProxy extends AbstractListControllerProxy<UserQueryForm> implements UserListController{

	@Value(value="${controller.proxy.uri.user}") 
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.list.user}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}

}
