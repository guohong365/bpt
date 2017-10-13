package com.uc.bpg.service;

import java.math.BigDecimal;
import java.util.List;

import com.uc.bpg.domain.Charging;
import com.uc.bpg.domain.ChargingDetails;
import com.uc.bpg.domain.CheckIn;
import com.uc.bpg.uitls.OptResult;
import com.uc.web.service.Service;

public interface ReceptionService extends Service{

	int insertCheckIn(CheckIn checkIn);
	int insertCheckOut(Charging charging, List<Long> ids);
	ChargingDetails selectChargingDetails(Long room);
	boolean selectRoomCanCheckIn(Long room);
	OptResult<ChargingDetails> selectRoomCheckOut(Long id, String room);
	OptResult<CheckIn> selectRoomLastCheckIn(Long hotel, String roomNo);
	BigDecimal selectChargingStandard(List<Long> ids);
}
