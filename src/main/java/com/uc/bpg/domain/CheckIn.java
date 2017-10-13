package com.uc.bpg.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.uc.web.domain.EntityBase;
import com.uc.web.domain.WithLongId;

public class CheckIn extends EntityBase implements WithLongId{
	private Long id;
	private String uuid;
	private Long hotel;
	private Long room;
	private String roomNo;
	private Date checkInTime;
	private Long checkInReceptionist;
	private String checkInReceptionistName;
	private Date checkOutTime;
	private Long checkOutReceptionist;
	private String checkOutReceptionistName;
	private Integer useTimes;
	private BigDecimal charging;
	private BigDecimal chargeStandard;
	private BigDecimal charge;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
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
	public Date getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(Date checkInTime) {
		this.checkInTime = checkInTime;
	}
	public Long getCheckInReceptionist() {
		return checkInReceptionist;
	}
	public void setCheckInReceptionist(Long checkInReceptionist) {
		this.checkInReceptionist = checkInReceptionist;
	}
	public Date getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(Date checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public Long getCheckOutReceptionist() {
		return checkOutReceptionist;
	}
	public void setCheckOutReceptionist(Long checkOutReceptionist) {
		this.checkOutReceptionist = checkOutReceptionist;
	}
	public Integer getUseTimes() {
		return useTimes;
	}
	public void setUseTimes(Integer useTimes) {
		this.useTimes = useTimes;
	}
	public BigDecimal getChargeStandard() {
		return chargeStandard;
	}
	public void setChargeStandard(BigDecimal chargeStandard) {
		this.chargeStandard = chargeStandard;
	}
	public BigDecimal getCharge() {
		return charge;
	}
	public void setCharge(BigDecimal charge) {
		this.charge = charge;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getCheckInReceptionistName() {
		return checkInReceptionistName;
	}
	public void setCheckInReceptionistName(String checkInReceptionistName) {
		this.checkInReceptionistName = checkInReceptionistName;
	}
	public String getCheckOutReceptionistName() {
		return checkOutReceptionistName;
	}
	public void setCheckOutReceptionistName(String checkOutReceptionistName) {
		this.checkOutReceptionistName = checkOutReceptionistName;
	}
	public BigDecimal getCharging() {
		return charging;
	}
	public void setCharging(BigDecimal charging) {
		this.charging = charging;
	}
	
}