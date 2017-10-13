package com.uc.bpg.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.uc.web.domain.EntityBase;
import com.uc.web.domain.WithLongId;


public class Charging  extends EntityBase implements WithLongId {
	private Long id;
	private String uuid;
	private Long hotel;
	private Long checkIn;
	private BigDecimal charge;
	private BigDecimal chargeStandard;
	private BigDecimal rent;
	private Long receptionist;
	private Date chargingTime;
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
	
	public Long getReceptionist() {
		return receptionist;
	}
	public void setReceptionist(Long receptionist) {
		this.receptionist = receptionist;
	}
	public Date getChargingTime() {
		return chargingTime;
	}
	public void setChargingTime(Date chargingTime) {
		this.chargingTime = chargingTime;
	}
	public Long getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Long checkIn) {
		this.checkIn = checkIn;
	}
	public BigDecimal getCharge() {
		return charge;
	}
	public void setCharge(BigDecimal charge) {
		this.charge = charge;
	}
	public Long getHotel() {
		return hotel;
	}
	public void setHotel(Long hotel) {
		this.hotel = hotel;
	}
	public BigDecimal getChargeStandard() {
		return chargeStandard;
	}
	public void setChargeStandard(BigDecimal chargeStandard) {
		this.chargeStandard = chargeStandard;
	}
	public BigDecimal getRent() {
		return rent;
	}
	public void setRent(BigDecimal rent) {
		this.rent = rent;
	}
}