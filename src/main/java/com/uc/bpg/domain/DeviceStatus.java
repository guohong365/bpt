package com.uc.bpg.domain;

import java.util.Date;

import com.uc.web.domain.EntityBase;
import com.uc.web.domain.WithLongId;

public class DeviceStatus  extends EntityBase implements WithLongId {
    private Long id;
    private Long device;
    private String mac;
    private Integer status;
    private Integer battery;
    private Date reportTime;
    
    public DeviceStatus() {
	}
    
    public DeviceStatus(String mac, Integer status, Integer battery, Date reportTime){
    	this.mac=mac;
    	this.status=status;
    	this.battery=battery;
    	this.reportTime=reportTime;
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getDevice() {
		return device;
	}

	public void setDevice(Long device) {
		this.device = device;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getBattery() {
		return battery;
	}

	public void setBattery(Integer battery) {
		this.battery = battery;
	}

	public Date getReportTime() {
		return reportTime;
	}

	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}
    
	
}
