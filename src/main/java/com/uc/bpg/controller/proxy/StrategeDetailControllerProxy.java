package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.controller.StrategeDetailController;
import com.uc.bpg.domain.Stratege;
import com.uc.web.controller.AbstractDetailControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.stratege}")
public class StrategeDetailControllerProxy extends AbstractDetailControllerProxy<Long,Stratege> implements StrategeDetailController{

	@Value(value="${controller.proxy.uri.stratege}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.detail.stratege}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
}
