package com.uc.bpg.domain;

import com.uc.web.domain.EntityBase;
import com.uc.web.tools.annotation.AutoGenerateEntity;
import com.uc.web.tools.annotation.FormField;
import com.uc.web.tools.annotation.ListColumn;

@AutoGenerateEntity(value="房间信息", 
	buttons={"查看|view|btn-info|fa fa-search",
			"修改|modify|btn-warning|fa fa-edit", 
			"删除|delete|btn-danger|fa fa-trash-o",})
public class Room  extends EntityBase {
	@FormField(hidden=true, id=true)
	@ListColumn(show=false, id=true)
	private Long id;
	private String uuid;	
	private Long hotel;	
	@FormField(value="楼层",order=0)
	@ListColumn(value="楼层",order=0)
	private Integer storey;
	@FormField(value="房间号",order=1)
	@ListColumn(value="房间号",order=1)
	private String roomNo;
	private Long device;
	private Boolean valid;
	@ListColumn(value="酒店",order=2)
	private String hotelName;
	@ListColumn(value="设备名称",order=3)
	private String deviceName;
	@ListColumn(value="设备编号",order=4)
	private String deviceSerial;
	@ListColumn(value="设备状态",order=5)
	private Integer deviceStatus;
	public String getDeviceStatusString(){
		return DeviceStatusDecode.decode(getDeviceStatus());
	}
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
	public Integer getStorey() {
		return storey;
	}
	public void setStorey(Integer storey) {
		this.storey = storey;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public Long getDevice() {
		return device;
	}
	public void setDevice(Long device) {
		this.device = device;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
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
	public Boolean getValid() {
		return valid;
	}
	public void setValid(Boolean valid) {
		this.valid = valid;
	}
	public Integer getDeviceStatus() {
		return deviceStatus;
	}
	public void setDeviceStatus(Integer deviceStatus) {
		this.deviceStatus = deviceStatus;
	}
	
	
	
}