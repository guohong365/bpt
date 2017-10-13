package com.uc.bpg.persistence;

import com.uc.web.persistence.AppInsertMapper;
import com.uc.web.persistence.AppOptimizedMapper;
import com.uc.web.persistence.AppSelectByKeyMapper;
import com.uc.web.persistence.AppUpdateMapper;

public interface DeviceTypeMapper extends AppInsertMapper, AppSelectByKeyMapper, AppUpdateMapper, AppOptimizedMapper{

	Long selectNextOrder();
}
