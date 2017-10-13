package com.uc.bpg.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uc.bpg.domain.Charging;
import com.uc.bpg.domain.ChargingDetails;
import com.uc.bpg.domain.CheckIn;
import com.uc.bpg.domain.DeviceUsage;

public interface ReceptionMapper {
	
	List<DeviceUsage> selectUsageByCheckIn(Long checkInId);

	boolean selectRoomCanCheckIn(Long room);

	ChargingDetails selectChargingDetails(Long checkInId);
	int insertCheckOutCharging(
			@Param("charging")
			Charging charging,
			@Param("ids")
			List<Long> ids);

	CheckIn selectRoomLastCheckIn(
			@Param("hotel")
			Long hotel,
			@Param("roomNo")
			String roomNo);

	int updateUsages(
			@Param("chargingUuid")
			String chargingUuid,
			@Param("ids")
			List<Long> ids);
}
