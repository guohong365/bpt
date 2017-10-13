package com.uc.bpg.forms;

import java.util.Date;


public class DeviceUsageQueryForm extends DetailListQueryFormImpl {
	private Date queryUseTimeFrom;
	private Date queryUseTimeTo;
	private String queryHotelName;
	private Boolean queryPayed;
	private Boolean queryInBill;
	private String queryRoomNo;
	public Date getQueryUseTimeFrom() {
		return queryUseTimeFrom;
	}
	public void setQueryUseTimeFrom(Date queryUseTimeFrom) {
		this.queryUseTimeFrom = queryUseTimeFrom;
	}
	public Date getQueryUseTimeTo() {
		return queryUseTimeTo;
	}
	public void setQueryUseTimeTo(Date queryUseTimeTo) {
		this.queryUseTimeTo = queryUseTimeTo;
	}
	public String getQueryHotelName() {
		return queryHotelName;
	}
	public void setQueryHotelName(String queryHotelName) {
		this.queryHotelName = queryHotelName;
	}
	public Boolean getQueryPayed() {
		return queryPayed;
	}
	public void setQueryPayed(Boolean queryPayed) {
		this.queryPayed = queryPayed;
	}
	public Boolean getQueryInBill() {
		return queryInBill;
	}
	public void setQueryInBill(Boolean queryInBill) {
		this.queryInBill = queryInBill;
	}
	public String getQueryRoomNo() {
		return queryRoomNo;
	}
	public void setQueryRoomNo(String queryRoomNo) {
		this.queryRoomNo = queryRoomNo;
	}
	
}