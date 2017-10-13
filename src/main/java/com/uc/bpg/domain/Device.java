package com.uc.bpg.domain;

import java.util.Date;

import com.uc.web.domain.EntityBase;
import com.uc.web.domain.WithLongId;
import com.uc.web.tools.annotation.AutoGenerateEntity;
import com.uc.web.tools.annotation.ComponentType;
import com.uc.web.tools.annotation.FormField;

@AutoGenerateEntity
public class Device  extends EntityBase implements WithLongId {
	@FormField(hidden=true)
	private Long id;
	private String uuid;
	@FormField(value="设备编号")
	private String serialNo;
	@FormField(value="设备名称")
	private String name;
	@FormField(value="有效")
	private Boolean valid;
	@FormField(value="设备型号", component=ComponentType.SELECT)
	private Long type;
	private Long hotel;
	private Long room;
	@FormField(value="公用", component=ComponentType.STATIC)
	private Boolean publicUsage;
	private Long inputer;
	@FormField(value="录入时间", component=ComponentType.STATIC)
	private Date inputTime;
	
	private Long modifier;
	@FormField(value="修改时间", component=ComponentType.STATIC)
	private Date modifyTime;
	@FormField(value="录入人", component=ComponentType.STATIC)
	private String inputerName;
	@FormField(value="修改人", component=ComponentType.STATIC)
	private String modifierName;
	@FormField(value="型号", component=ComponentType.STATIC)
	private String typeName;
	@FormField(value="酒店", component=ComponentType.STATIC)
	private String hotelName;
	@FormField(value="房间", component=ComponentType.STATIC)
	private String roomNo;
	@FormField(value="状态", component=ComponentType.STATIC)
	private Integer status;
	private Boolean canAllotPublic;
	
	public String getStatusDetail(){
		return DeviceStatusDecode.decode(getStatus());
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
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getValid() {
		return valid;
	}
	public void setValid(Boolean valid) {
		this.valid = valid;
	}
	public Long getType() {
		return type;
	}
	public void setType(Long type) {
		this.type = type;
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
	public Boolean getPublicUsage() {
		return publicUsage;
	}
	public void setPublicUsage(Boolean publicUsage) {
		this.publicUsage = publicUsage;
	}
	public Long getInputer() {
		return inputer;
	}
	public void setInputer(Long inputer) {
		this.inputer = inputer;
	}
	public Date getInputTime() {
		return inputTime;
	}
	public void setInputTime(Date inputTime) {
		this.inputTime = inputTime;
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
	public String getInputerName() {
		return inputerName;
	}
	public void setInputerName(String inputerName) {
		this.inputerName = inputerName;
	}
	public String getModifierName() {
		return modifierName;
	}
	public void setModifierName(String modifierName) {
		this.modifierName = modifierName;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Boolean getCanAllotPublic() {
		return canAllotPublic;
	}
	public void setCanAllotPublic(Boolean canAllotPublic) {
		this.canAllotPublic = canAllotPublic;
	}
}