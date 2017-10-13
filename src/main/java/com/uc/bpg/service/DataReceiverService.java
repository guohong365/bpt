package com.uc.bpg.service;

import com.uc.bpg.domain.BpData;
import com.uc.bpg.domain.DeviceStatus;
import com.uc.web.service.Service;

public interface DataReceiverService extends Service{
	void insertUsage(String mac, BpData data, DeviceStatus statusDetail);
	void insertStatus(String mac, DeviceStatus detial);
}
