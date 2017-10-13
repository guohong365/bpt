package com.uc.bpg.controller.impl;

import com.uc.bpg.controller.StatisticBillListController;
import com.uc.bpg.forms.StatisticBillQueryForm;
import com.uc.web.controller.AbstractListController;

public class StatisticBillListControllerImpl extends AbstractListController<StatisticBillQueryForm> 
	implements StatisticBillListController{
	
	@Override
	public StatisticBillQueryForm createQueryForm() {
		return new StatisticBillQueryForm();
	}

}
