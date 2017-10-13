package com.uc.bpg.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.uc.web.domain.EntityBase;
import com.uc.web.domain.WithLongId;
import com.uc.web.tools.annotation.AutoGenerateEntity;
import com.uc.web.tools.annotation.ComponentType;
import com.uc.web.tools.annotation.ListColumn;
import com.uc.web.tools.annotation.QueryField;

@AutoGenerateEntity(value="设备使用明细")
public class DeviceUsage  extends EntityBase implements WithLongId {
	@ListColumn(show=false, id=true)
	private Long id;
	private String uuid;
	private Long device;
	@ListColumn(value="使用时间", order=0)
	@QueryField(value="使用时间", range=true, component=ComponentType.DATE_RANGE, order=0)
	private Date useTime;	
	private Long room;
	private Long hotel;	
	private Long charging;
	@ListColumn(value="已结账", order=8)
	private Boolean payed;
	@ListColumn(value="结算标准", order=2)
	private BigDecimal chargeStandard;
	@ListColumn(value="酒店收款", order=1)
	private BigDecimal charge;
	private BigDecimal ratio;
	@ListColumn(value="分成", order=3)
	private BigDecimal rent;	
	private Long bill;
	private Boolean inBill;
	private Boolean publicUsage;
	@ListColumn(value="设备名称", order=6)
	private String deviceName;
	@ListColumn(value="序列号", order=7)
	@QueryField(value="序列号", order=2)
	private String deviceSerial;
	@ListColumn(value="房间", order=5)
	@QueryField(value="房间", order=1)
	private String roomNo;
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
	public Long getDevice() {
		return device;
	}
	public void setDevice(Long device) {
		this.device = device;
	}
	public Date getUseTime() {
		return useTime;
	}
	public void setUseTime(Date useTime) {
		this.useTime = useTime;
	}
	public Long getRoom() {
		return room;
	}
	public void setRoom(Long room) {
		this.room = room;
	}
	public Long getHotel() {
		return hotel;
	}
	public void setHotel(Long hotel) {
		this.hotel = hotel;
	}

	public Boolean getPayed() {
		return payed;
	}
	public void setPayed(Boolean payed) {
		this.payed = payed;
	}
	public BigDecimal getCharge() {
		return charge;
	}
	public void setCharge(BigDecimal charge) {
		this.charge = charge;
	}
	public Long getBill() {
		return bill;
	}
	public void setBill(Long bill) {
		this.bill = bill;
	}
	public Boolean getInBill() {
		return inBill;
	}
	public void setInBill(Boolean inBill) {
		this.inBill = inBill;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public String getDeviceSerial() {
		return deviceSerial;
	}
	public void setDeviceSerial(String deviceSerial) {
		this.deviceSerial = deviceSerial;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public Long getCharging() {
		return charging;
	}
	public void setCharging(Long charging) {
		this.charging = charging;
	}
	public BigDecimal getChargeStandard() {
		return chargeStandard;
	}
	public void setChargeStandard(BigDecimal chargeStandard) {
		this.chargeStandard = chargeStandard;
	}
	public BigDecimal getRatio() {
		return ratio;
	}
	public void setRatio(BigDecimal ratio) {
		this.ratio = ratio;
	}
	public BigDecimal getRent() {
		return rent;
	}
	public void setRent(BigDecimal rent) {
		this.rent = rent;
	}
	public Boolean getPublicUsage() {
		return publicUsage;
	}
	public void setPublicUsage(Boolean publicUsage) {
		this.publicUsage = publicUsage;
	}

	

}