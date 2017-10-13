package com.uc.bpg.forms;

import java.util.Date;

public class AllotHisQueryForm extends DetailListQueryFormImpl  {
	private String queryOperation;
	private String queryRoom;
	private Date queryOperateTimeFrom;
	private Date queryOperateTimeTo;
	private String queryOperaterName;
	private String queryHotelName;
	public String getQueryOperation() {
		return queryOperation;
	}
	public void setQueryOperation(String queryOperation) {
		this.queryOperation = queryOperation;
	}
	public String getQueryRoom() {
		return queryRoom;
	}
	public void setQueryRoom(String queryRoom) {
		this.queryRoom = queryRoom;
	}
	public Date getQueryOperateTimeFrom() {
		return queryOperateTimeFrom;
	}
	public void setQueryOperateTimeFrom(Date queryOperateTimeFrom) {
		this.queryOperateTimeFrom = queryOperateTimeFrom;
	}
	public Date getQueryOperateTimeTo() {
		return queryOperateTimeTo;
	}
	public void setQueryOperateTimeTo(Date queryOperateTimeTo) {
		this.queryOperateTimeTo = queryOperateTimeTo;
	}
	public String getQueryOperaterName() {
		return queryOperaterName;
	}
	public void setQueryOperaterName(String queryOperaterName) {
		this.queryOperaterName = queryOperaterName;
	}
	public String getQueryHotelName() {
		return queryHotelName;
	}
	public void setQueryHotelName(String queryHotelName) {
		this.queryHotelName = queryHotelName;
	}

}