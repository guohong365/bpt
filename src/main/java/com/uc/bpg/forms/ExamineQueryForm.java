package com.uc.bpg.forms;

import java.util.Date;

public class ExamineQueryForm extends QueryFormBase{
	private Integer queryStatus;
	private String queryMac;
	private Date queryFrom;
	private Date queryTo;
	public Integer getQueryStatus() {
		return queryStatus;
	}
	public void setQueryStatus(Integer queryStatus) {
		this.queryStatus = queryStatus;
	}
	public String getQueryMac() {
		return queryMac;
	}
	public void setQueryMac(String queryMac) {
		this.queryMac = queryMac;
	}
	public Date getQueryFrom() {
		return queryFrom;
	}
	public void setQueryFrom(Date queryFrom) {
		this.queryFrom = queryFrom;
	}
	public Date getQueryTo() {
		return queryTo;
	}
	public void setQueryTo(Date queryTo) {
		this.queryTo = queryTo;
	}
	
	@Override
	protected void buildOrderByColumnMap() {
		super.buildOrderByColumnMap();
		getColumnMap().put(COLUMN_MAC, COLUMN_MAC_NAME);
		getColumnMap().put(COLUMN_STATUS, COLUMN_STATUS_NAME);
		getColumnMap().put(COLUMN_RECV_TIME, COLUMN_RECV_TIME_NAME);
	}
	
	private static final String COLUMN_MAC="MAC";
	private static final String COLUMN_STATUS="STATUS";
	private static final String COLUMN_RECV_TIME="RECV_TIME";
	private static final String COLUMN_MAC_NAME="MAC";
	private static final String COLUMN_STATUS_NAME="状态";
	private static final String COLUMN_RECV_TIME_NAME="接收时间";
}
