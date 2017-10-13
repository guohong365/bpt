package com.uc.bpg.domain;

import java.math.BigDecimal;
import java.sql.Date;

import com.uc.web.domain.EntityBase;

public class RoomDetail  extends EntityBase{
	private Long id;
	private Integer storey;
	private String roomNo;
	private Date checkInTime;
	private Date checkOutTime;
	private BigDecimal charge;
	private int useTimes;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public Date getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(Date checkInTime) {
		this.checkInTime = checkInTime;
	}
	public Date getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(Date checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public BigDecimal getCharge() {
		return charge;
	}
	public void setCharge(BigDecimal charge) {
		this.charge = charge;
	}
	public int getUseTimes() {
		return useTimes;
	}
	public void setUseTimes(int useTimes) {
		this.useTimes = useTimes;
	}
	public Integer getStorey() {
		return storey;
	}
	public void setStorey(Integer storey) {
		this.storey = storey;
	}
}
