package com.uc.bpg.controller.impl;

import com.uc.bpg.controller.RoleListController;
import com.uc.bpg.forms.RoleQueryForm;
import com.uc.web.controller.AbstractListController;

public class RoleListControllerImpl extends AbstractListController<RoleQueryForm> implements RoleListController {

	@Override
	protected RoleQueryForm onCreateQueryForm() {
		return new RoleQueryForm();
	}

}
