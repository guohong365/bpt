package com.uc.bpg.uitls;

import com.uc.web.domain.EntityBase;

public class OptResult<DataType> extends EntityBase {
	private boolean ok;
	private String reason;
	private Long hotel;
	private Long room;
	private String roomNo;
	private DataType data;
	
	public OptResult(Long hotel, String roomNo){
		this.hotel=hotel;
		this.setRoomNo(roomNo);
		this.ok=false;
	}
	
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Long getHotel() {
		return hotel;
	}
	public void setHotel(Long hotel) {
		this.hotel = hotel;
	}
	public Long getRoom() {
		return room;
	}
	public void setRoom(Long room) {
		this.room = room;
	}

	public DataType getData() {
		return data;
	}

	public void setData(DataType data) {
		this.data = data;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
}
