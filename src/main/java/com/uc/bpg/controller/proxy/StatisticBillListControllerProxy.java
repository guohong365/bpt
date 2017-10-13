package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.forms.StatisticBillQueryForm;
import com.uc.web.controller.AbstractListControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping(value="${controller.proxy.uri.background.statistic.bill}")
public class StatisticBillListControllerProxy extends AbstractListControllerProxy<StatisticBillQueryForm> {
	
	@Value(value="${controller.proxy.uri.background.statistic.bill}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.list.background.statistic.bill}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
	

}
