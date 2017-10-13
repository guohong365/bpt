package com.uc.bpg.controller;

import com.uc.bpg.domain.UserProfileImpl;
import com.uc.web.controller.AbstractDetailListController;
import com.uc.web.forms.DetailListQueryForm;

public class BusinessDetailListControllerBase<DetailType, ChildQueryType extends DetailListQueryForm, ChildDetailType> 
	extends AbstractDetailListController<Long, DetailType, ChildQueryType> {
	private boolean foreground;
	
	@Override
	protected String getNewPageName() {
		return getModifyPageName();
	}
	@Override
	protected String getCancelatePageName() {
		return getViewPageName();
	}
	@Override
	protected String getReactivePageName() {
		return getViewPageName();
	}
	@Override
	protected String getDeletePageName() {
		return getDeletePageName();
	}
	public boolean isForeground() {
		return foreground;
	}
	public void setForeground(boolean foreground) {
		this.foreground = foreground;
	}
	@Override
	public UserProfileImpl getUser(){
		return (UserProfileImpl) getUser();
	}
}
