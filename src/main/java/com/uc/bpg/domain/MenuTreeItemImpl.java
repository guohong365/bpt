package com.uc.bpg.domain;

import com.uc.web.domain.AbstractMenu;
import com.uc.web.forms.MenuTreeItem;

public class MenuTreeItemImpl extends AbstractMenu implements MenuTreeItem{
	private String icon;

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}	
}
