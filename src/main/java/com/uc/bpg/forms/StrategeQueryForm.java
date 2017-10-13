package com.uc.bpg.forms;

import java.util.Date;

public class StrategeQueryForm extends DetailListQueryFormImpl {
	private String queryName;
	private Long queryTotalDeviceFrom;
	private Long queryTotalDeviceTo;
	private Long queryPublicUsageFrom;
	private Long queryPublicUsageTo;
	private Date querySigningDateFrom;
	private Date querySigningDateTo;
	private Boolean queryValid;
	private String queryHotelName;
	private Date queryBeginTimeFrom;
	private Date queryBeginTimeTo;
	private Date queryEndTimeFrom;
	private Date queryEndTimeTo;
	private Boolean queryCurrent;
	@Override
	protected void buildOrderByColumnMap() {
		// TODO Auto-generated method stub
		
	}
	public String getQueryName() {
		return queryName;
	}
	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}
	public Long getQueryTotalDeviceFrom() {
		return queryTotalDeviceFrom;
	}
	public void setQueryTotalDeviceFrom(Long queryTotalDeviceFrom) {
		this.queryTotalDeviceFrom = queryTotalDeviceFrom;
	}
	public Long getQueryTotalDeviceTo() {
		return queryTotalDeviceTo;
	}
	public void setQueryTotalDeviceTo(Long queryTotalDeviceTo) {
		this.queryTotalDeviceTo = queryTotalDeviceTo;
	}
	public Long getQueryPublicUsageFrom() {
		return queryPublicUsageFrom;
	}
	public void setQueryPublicUsageFrom(Long queryPublicUsageFrom) {
		this.queryPublicUsageFrom = queryPublicUsageFrom;
	}
	public Long getQueryPublicUsageTo() {
		return queryPublicUsageTo;
	}
	public void setQueryPublicUsageTo(Long queryPublicUsageTo) {
		this.queryPublicUsageTo = queryPublicUsageTo;
	}
	public Date getQuerySigningDateFrom() {
		return querySigningDateFrom;
	}
	public void setQuerySigningDateFrom(Date querySigningDateFrom) {
		this.querySigningDateFrom = querySigningDateFrom;
	}
	public Date getQuerySigningDateTo() {
		return querySigningDateTo;
	}
	public void setQuerySigningDateTo(Date querySigningDateTo) {
		this.querySigningDateTo = querySigningDateTo;
	}
	public Boolean getQueryValid() {
		return queryValid;
	}
	public void setQueryValid(Boolean queryValid) {
		this.queryValid = queryValid;
	}
	public String getQueryHotelName() {
		return queryHotelName;
	}
	public void setQueryHotelName(String queryHotelName) {
		this.queryHotelName = queryHotelName;
	}
	public Date getQueryBeginTimeFrom() {
		return queryBeginTimeFrom;
	}
	public void setQueryBeginTimeFrom(Date queryBeginTimeFrom) {
		this.queryBeginTimeFrom = queryBeginTimeFrom;
	}
	public Date getQueryBeginTimeTo() {
		return queryBeginTimeTo;
	}
	public void setQueryBeginTimeTo(Date queryBeginTimeTo) {
		this.queryBeginTimeTo = queryBeginTimeTo;
	}
	public Date getQueryEndTimeFrom() {
		return queryEndTimeFrom;
	}
	public void setQueryEndTimeFrom(Date queryEndTimeFrom) {
		this.queryEndTimeFrom = queryEndTimeFrom;
	}
	public Date getQueryEndTimeTo() {
		return queryEndTimeTo;
	}
	public void setQueryEndTimeTo(Date queryEndTimeTo) {
		this.queryEndTimeTo = queryEndTimeTo;
	}
	public Boolean getQueryCurrent() {
		return queryCurrent;
	}
	public void setQueryCurrent(Boolean queryCurrent) {
		this.queryCurrent = queryCurrent;
	}
	
	}