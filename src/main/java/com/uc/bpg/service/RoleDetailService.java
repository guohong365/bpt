package com.uc.bpg.service;

import java.util.List;

import com.uc.bpg.domain.FunctionAvailable;
import com.uc.web.service.AppDetailService;

public interface RoleDetailService extends AppDetailService{

	List<FunctionAvailable> seletctFunctions();

}
