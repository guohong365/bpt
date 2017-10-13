package com.uc.bpg.service;

import java.util.List;

import com.uc.web.domain.Code;
import com.uc.web.forms.MenuTreeItem;
import com.uc.web.service.Service;

public interface CodesService extends Service {
	List<Code> selectTypes(boolean forEdit);
	
	List<MenuTreeItem> selectAllMenus();

	List<Code> selectOrgCodes(String type, boolean forEdit);

	List<Code> selectAllocableHotelCodes();
	

}
