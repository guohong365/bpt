package com.uc.bpg.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.uc.bpg.domain.Charging;
import com.uc.bpg.domain.ChargingDetails;
import com.uc.bpg.domain.CheckIn;
import com.uc.bpg.persistence.ChargingMapper;
import com.uc.bpg.persistence.CheckInMapper;
import com.uc.bpg.persistence.ReceptionMapper;
import com.uc.bpg.service.ReceptionService;
import com.uc.bpg.uitls.OptResult;
import com.uc.web.service.ServiceBase;

public class ReceptionServiceImpl extends ServiceBase implements ReceptionService {
	private ReceptionMapper receptionMapper;
	private CheckInMapper checkInMapper;
	private ChargingMapper chargingMapper;
	
	public ReceptionServiceImpl(){
	}
	
	
	
	public ReceptionMapper getReceptionMapper() {
		return receptionMapper;
	}
	
	public void setReceptionMapper(ReceptionMapper receptionMapper) {
		this.receptionMapper = receptionMapper;
	}
	
	public void setCheckInMapper(CheckInMapper checkInMapper) {
		this.checkInMapper = checkInMapper;
	}
	public CheckInMapper getCheckInMapper() {
		return checkInMapper;
	}
	public void setChargingMapper(ChargingMapper chargingMapper) {
		this.chargingMapper = chargingMapper;
	}
	public ChargingMapper getChargingMapper() {
		return chargingMapper;
	}

	@Override
	public int insertCheckIn(CheckIn checkIn) {
		return getCheckInMapper().insertDetail(checkIn);
	}

	@Override
	public int insertCheckOut(Charging charging, List<Long> ids) {
		return getReceptionMapper().insertCheckOutCharging(charging, ids);
		/*
		getChargingMapper().insertDetail(charging);
		CheckIn checkIn=new CheckIn();
		checkIn.setId(charging.getCheckIn());
		checkIn.setCheckOutReceptionist(charging.getReceptionist());
		checkIn.setCheckOutTime(charging.getChargingTime());
		getCheckInMapper().updateDetailSelective(checkIn);		
		if(ids!=null && !ids.isEmpty()){
			getReceptionMapper().updateUsages(charging.getUuid(), ids);
		}
		return 1;
		*/
	}

	@Override
	public boolean selectRoomCanCheckIn(Long room) {
		return getReceptionMapper().selectRoomCanCheckIn(room);
	}

	@Override
	public ChargingDetails selectChargingDetails(Long room) {
		return getReceptionMapper().selectChargingDetails(room);
	}

	@Override
	public OptResult<ChargingDetails> selectRoomCheckOut(Long hotel, String roomNo) {
		CheckIn roomCheckIn=getReceptionMapper().selectRoomLastCheckIn(hotel, roomNo);
		OptResult<ChargingDetails> result=new OptResult<>(hotel, roomNo);
		if(roomCheckIn==null){
			result.setOk(false);
			result.setReason("房间不存在！");
		} else if(roomCheckIn.getId()==null || roomCheckIn.getCheckOutTime()!=null){
			result.setOk(false);
			result.setReason("房间没有入住记录！");
		} else {
			roomCheckIn.setRoomNo(roomNo);
			ChargingDetails charging=getReceptionMapper().selectChargingDetails(roomCheckIn.getId());			
			result.setData(charging);
			result.setOk(true);
		}
		return result;
	}

	@Override
	public OptResult<CheckIn> selectRoomLastCheckIn(Long hotel, String roomNo) {
		OptResult<CheckIn> result=new OptResult<>(hotel, roomNo);
		CheckIn checkIn=getReceptionMapper().selectRoomLastCheckIn(hotel, roomNo);		
		if(checkIn!=null){
			getLogger().debug(checkIn.toString());
			result.setData(checkIn);
			result.setRoom(checkIn.getRoom());
			if(checkIn.getId()==null || checkIn.getCheckOutTime()!=null){
				result.setReason("");
				result.setOk(true);
			} else {
				result.setOk(false);
				result.setReason("房间已入住！");
			}
		} else {
			result.setData(null);
			result.setOk(false);
			result.setReason("房间不存在！");
		}
		return result;
	}

	@Override
	public BigDecimal selectChargingStandard(List<Long> ids) {
		return getChargingMapper().selectChargingStandard(ids);
	}
	
}
