package com.uc.bpg.persistence;

import com.uc.bpg.domain.BpData;
import com.uc.bpg.domain.DeviceStatus;
import com.uc.bpg.domain.DeviceUsage;

public interface ReceiverMapper {

	void insertUsage(DeviceUsage detail);

	void insetBpData(BpData data);

	void insertStatus(DeviceStatus detial);

}
