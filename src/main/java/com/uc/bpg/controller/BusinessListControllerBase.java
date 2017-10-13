package com.uc.bpg.controller;

import com.uc.bpg.domain.UserProfileImpl;
import com.uc.bpg.forms.IQueryFormBase;
import com.uc.web.controller.AbstractListController;

public class BusinessListControllerBase<QureyFormType extends IQueryFormBase> 
    extends AbstractListController<QureyFormType> {
	
	private boolean foreground;

	public boolean isForeground() {
		return foreground;
	}

	public void setForeground(boolean foreground) {
		this.foreground = foreground;
	}
	
	
	protected void onSetUserQueryLimits(QureyFormType queryForm) {
		if(isForeground()){
			queryForm.setQueryHotel((Long) getUser().getOrgnization().getId());
		}
	}
	@Override
	public UserProfileImpl getUser(){
		return (UserProfileImpl)super.getUser();
	}
}
