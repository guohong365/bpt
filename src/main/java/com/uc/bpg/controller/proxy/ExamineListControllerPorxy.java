package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.forms.ExamineQueryForm;
import com.uc.web.controller.AbstractListControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.examine}")
public class ExamineListControllerPorxy extends AbstractListControllerProxy<ExamineQueryForm> {
	
	@Value(value="${controller.proxy.uri.examine}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.list.examine}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}

}
