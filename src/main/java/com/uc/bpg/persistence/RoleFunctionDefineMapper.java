package com.uc.bpg.persistence;

import java.util.List;

import com.uc.bpg.domain.FunctionImpl;
import com.uc.bpg.domain.RoleImpl;
import com.uc.web.domain.security.RoleFunctionDefine;

public interface RoleFunctionDefineMapper {
   public List<RoleFunctionDefine> selectRoleFunctionDefines();
   public FunctionImpl selectFunction(String funcId);
   public RoleImpl selectRole(String roleId);
    
}