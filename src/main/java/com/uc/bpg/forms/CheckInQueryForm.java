package com.uc.bpg.forms;

import java.util.Date;


public class CheckInQueryForm  extends QueryFormBase {
	private String queryRoomNo;
	private Date queryCheckInTimeFrom;
	private Date queryCheckInTimeTo;
	private Date queryCheckOutTimeFrom;
	private Date queryCheckOutTimeTo;
	private String queryCheckInReceptionistName;
	private String queryCheckOutReceptionistName;
	private Date queryNow;
	public String getQueryRoomNo() {
		return queryRoomNo;
	}
	public void setQueryRoomNo(String queryRoomNo) {
		this.queryRoomNo = queryRoomNo;
	}
	public Date getQueryCheckInTimeFrom() {
		return queryCheckInTimeFrom;
	}
	public void setQueryCheckInTimeFrom(Date queryCheckInTimeFrom) {
		this.queryCheckInTimeFrom = queryCheckInTimeFrom;
	}
	public Date getQueryCheckInTimeTo() {
		return queryCheckInTimeTo;
	}
	public void setQueryCheckInTimeTo(Date queryCheckInTimeTo) {
		this.queryCheckInTimeTo = queryCheckInTimeTo;
	}
	public Date getQueryCheckOutTimeFrom() {
		return queryCheckOutTimeFrom;
	}
	public void setQueryCheckOutTimeFrom(Date queryCheckOutTimeFrom) {
		this.queryCheckOutTimeFrom = queryCheckOutTimeFrom;
	}
	public Date getQueryCheckOutTimeTo() {
		return queryCheckOutTimeTo;
	}
	public void setQueryCheckOutTimeTo(Date queryCheckOutTimeTo) {
		this.queryCheckOutTimeTo = queryCheckOutTimeTo;
	}
	public String getQueryCheckInReceptionistName() {
		return queryCheckInReceptionistName;
	}
	public void setQueryCheckInReceptionistName(String queryCheckInReceptionistName) {
		this.queryCheckInReceptionistName = queryCheckInReceptionistName;
	}
	public String getQueryCheckOutReceptionistName() {
		return queryCheckOutReceptionistName;
	}
	public void setQueryCheckOutReceptionistName(String queryCheckOutReceptionistName) {
		this.queryCheckOutReceptionistName = queryCheckOutReceptionistName;
	}
	public Date getQueryNow() {
		return queryNow;
	}
	public void setQueryNow(Date queryNow) {
		this.queryNow = queryNow;
	}
	
}