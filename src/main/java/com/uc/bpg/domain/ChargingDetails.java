package com.uc.bpg.domain;

import java.util.List;

public class ChargingDetails extends Charging {
	private CheckIn checkInRecord;
	private List<DeviceUsage> usages;
	public List<DeviceUsage> getUsages() {
		return usages;
	}
	public void setUsages(List<DeviceUsage> usages) {
		this.usages = usages;
	}
	public CheckIn getCheckInRecord() {
		return checkInRecord;
	}
	public void setCheckInRecord(CheckIn checkInRecord) {
		this.checkInRecord = checkInRecord;
	}
}
