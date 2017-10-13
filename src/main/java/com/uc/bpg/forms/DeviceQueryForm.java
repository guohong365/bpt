package com.uc.bpg.forms;

public class DeviceQueryForm extends QueryFormBase{
	private Long queryHotel;
	private String querySerialNo;
	private String queryName;
	private Long queryType;
	private String queryHotelName;
	
	private Boolean queryPublicUsage;
	private Integer queryStatus;
	
	public Long getQueryHotel() {
		return queryHotel;
	}
	public void setQueryHotel(Long queryHotel) {
		this.queryHotel = queryHotel;
	}
	public String getQuerySerialNo() {
		return querySerialNo;
	}
	public void setQuerySerialNo(String querySerialNo) {
		this.querySerialNo = querySerialNo;
	}
	public String getQueryName() {
		return queryName;
	}
	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}
	public Long getQueryType() {
		return queryType;
	}
	public void setQueryType(Long queryType) {
		this.queryType = queryType;
	}
	public String getQueryHotelName() {
		return queryHotelName;
	}
	public void setQueryHotelName(String queryHotelName) {
		this.queryHotelName = queryHotelName;
	}
	public Boolean getQueryPublicUsage() {
		return queryPublicUsage;
	}
	public void setQueryPublicUsage(Boolean queryPublicUsage) {
		this.queryPublicUsage = queryPublicUsage;
	}
	public Integer getQueryStatus() {
		return queryStatus;
	}
	public void setQueryStatus(Integer queryStatus) {
		this.queryStatus = queryStatus;
	}
	static final String ORDER_BY_COLUMN_NAME = "名称";
	static final String ORDER_BY_COLUMN_TYPE="型号";
	static final String ORDER_BY_COLUMN_SERIAL="序列号";
	static final String ORDER_BY_COLUMN_HOTEL="酒店";
	static final String ORDER_BY_COLUMN_ROOM="房间";
	static final String ORDER_BY_COLUMN_STATUS="状态"; 
	@Override
	protected void buildOrderByColumnMap() {
		getColumnMap().put(ORDER_BY_COLUMN_NAME, "NAME");
		getColumnMap().put(ORDER_BY_COLUMN_TYPE, "TYPE_NAME");
		getColumnMap().put(ORDER_BY_COLUMN_HOTEL, "HOTEL_NAME");
		getColumnMap().put(ORDER_BY_COLUMN_ROOM, "ROOM_NO");
		getColumnMap().put(ORDER_BY_COLUMN_SERIAL, "SERIAL_NO");
		getColumnMap().put(ORDER_BY_COLUMN_STATUS, "STATUS");
	}
	
}