package com.uc.bpg.service.impl;

import com.uc.web.service.AppDetailServiceBase;
import java.util.List;

import com.uc.bpg.domain.Room;
import com.uc.bpg.persistence.RoomMapper;
import com.uc.bpg.service.RoomDetailService;


public class RoomDetailServiceImpl extends AppDetailServiceBase implements RoomDetailService{
	public RoomMapper getRoomMapper() {
		return (RoomMapper)getMapper();
	}
	
	@Override
	public boolean selectExistsRoom(Long hotel, Integer storey, String roomNo) {
		return getRoomMapper().selectExistsRoom(hotel, storey, roomNo);
	}

	@Override
	public void insertBatch(List<Room> rooms) {
		getRoomMapper().insertBatch(rooms);
	}
}
