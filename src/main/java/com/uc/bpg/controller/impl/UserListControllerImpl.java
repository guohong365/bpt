package com.uc.bpg.controller.impl;

import com.uc.bpg.controller.UserListController;
import com.uc.bpg.forms.UserQueryForm;
import com.uc.web.controller.AbstractListController;

public class UserListControllerImpl extends AbstractListController<UserQueryForm> implements UserListController{

	@Override
	protected UserQueryForm onCreateQueryForm() {
		UserQueryForm queryForm=new UserQueryForm();
		queryForm.setQueryValid(true);
		queryForm.setQueryAll(false);
		return queryForm;
	}

}
