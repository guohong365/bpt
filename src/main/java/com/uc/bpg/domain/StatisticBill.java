package com.uc.bpg.domain;

import java.math.BigDecimal;

import com.uc.web.domain.EntityBase;

public class StatisticBill extends EntityBase {
	private String groupName;
	private int groupKey;	
	private int chargedUseTimes;
	private int publicUseTimes;	
	private int hotel;
	private String hotelName;
	private BigDecimal income;
	private BigDecimal basicCharge;
	private BigDecimal rent;
	
	public int getChargedUseTimes() {
		return chargedUseTimes;
	}
	public void setChargedUseTimes(int chargedUseTimes) {
		this.chargedUseTimes = chargedUseTimes;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public BigDecimal getIncome() {
		return income;
	}
	public void setIncome(BigDecimal income) {
		this.income = income;
	}
	public BigDecimal getBasicCharge() {
		return basicCharge;
	}
	public void setBasicCharge(BigDecimal basicCharge) {
		this.basicCharge = basicCharge;
	}
	public BigDecimal getRent() {
		return rent;
	}
	public void setRent(BigDecimal rent) {
		this.rent = rent;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getGroupKey() {
		return groupKey;
	}
	public void setGroupKey(int groupKey) {
		this.groupKey = groupKey;
	}
	public int getPublicUseTimes() {
		return publicUseTimes;
	}
	public void setPublicUseTimes(int publicUseTimes) {
		this.publicUseTimes = publicUseTimes;
	}
	public int getHotel() {
		return hotel;
	}
	public void setHotel(int hotel) {
		this.hotel = hotel;
	}
	
	
}
