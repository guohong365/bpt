package com.uc.bpg.domain;

import java.util.List;

public class HotelRoomInfo {
	private List<Integer> storeys;
	private List<RoomDetail> rooms;
	public List<Integer> getStoreys() {
		return storeys;
	}
	public void setStoreys(List<Integer> storeys) {
		this.storeys = storeys;
	}
	public List<RoomDetail> getRooms() {
		return rooms;
	}
	public void setRooms(List<RoomDetail> rooms) {
		this.rooms = rooms;
	}
	
}
