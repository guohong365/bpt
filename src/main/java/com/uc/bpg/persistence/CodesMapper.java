package com.uc.bpg.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uc.web.domain.Code;
import com.uc.web.forms.MenuTreeItem;
import com.uc.web.persistence.Mapper;

public interface CodesMapper extends Mapper{
	List<Code> selectTypes(
			@Param("forEdit")
			boolean forEdit);
	List<MenuTreeItem> selectAllMenus();
	List<Code> selectOrgCodes(
			@Param("type")
			String type,
			@Param("forEdit")
			boolean forEdit);
	List<Code> selectAllocableHotelCodes();
}
