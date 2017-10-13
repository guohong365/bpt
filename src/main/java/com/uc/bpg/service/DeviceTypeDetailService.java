package com.uc.bpg.service;

import com.uc.web.service.AppDetailService;

public interface DeviceTypeDetailService extends AppDetailService{
	Long selectNextShowOrder();
}
