package com.uc.bpg.domain;

import java.util.Date;

import com.uc.web.domain.EntityBase;
import com.uc.web.domain.WithLongId;

public class Examine extends EntityBase implements WithLongId {
	private Long id;
	private String mac;
	private Integer status;
	private String data;
	private Date recvTime;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public Date getRecvTime() {
		return recvTime;
	}
	public void setRecvTime(Date recvTime) {
		this.recvTime = recvTime;
	}
}
