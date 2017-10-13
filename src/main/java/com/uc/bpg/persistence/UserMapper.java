package com.uc.bpg.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uc.bpg.domain.RoleAvailable;
import com.uc.bpg.domain.UserImpl;
import com.uc.web.forms.MenuTreeItem;
import com.uc.web.persistence.AppMapper;
import com.uc.web.persistence.AppOptimizedMapper;
import com.uc.web.persistence.AppUuidMapper;

public interface UserMapper extends AppMapper, AppUuidMapper, 
	AppOptimizedMapper {
	List<RoleAvailable> selectUserRoles(
			@Param("userId")
			Long userId,
			@Param("isAll")
			boolean isAll);	
	int updateUserRoles(UserImpl userDetail);
	
	List<MenuTreeItem> selectUserMenuItems(Long userId);
}