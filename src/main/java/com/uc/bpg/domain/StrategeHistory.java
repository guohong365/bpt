package com.uc.bpg.domain;

import java.util.Date;

public class StrategeHistory extends Stratege {
	private Long hotel;
	private Long totalDevice;
	private Long publicUsage;
	private Long modifier;
	private Date modifyTime;
	private String modifierName;
	private String hotelName;
	public Long getHotel() {
		return hotel;
	}
	public void setHotel(Long hotel) {
		this.hotel = hotel;
	}
	public Long getTotalDevice() {
		return totalDevice;
	}
	public void setTotalDevice(Long totalDevice) {
		this.totalDevice = totalDevice;
	}
	public Long getPublicUsage() {
		return publicUsage;
	}
	public void setPublicUsage(Long publicUsage) {
		this.publicUsage = publicUsage;
	}
	public Long getModifier() {
		return modifier;
	}
	public void setModifier(Long modifier) {
		this.modifier = modifier;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getModifierName() {
		return modifierName;
	}
	public void setModifierName(String modifierName) {
		this.modifierName = modifierName;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	

}