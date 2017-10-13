package com.uc.bpg.domain;

import java.util.Date;

import com.uc.web.domain.EntityBase;
import com.uc.web.domain.WithLongId;

public class BpData  extends EntityBase implements WithLongId {	
	private Long id;
	private Long device;
	private Integer highPressure;
	private Integer lowPressure;
	private Integer heartBeatRate;
	private Integer heartBeatAnnotation;
	private Date examineTime;
	public BpData(){
		
	}
	public BpData(int hi, int low, int hb, int hba, Date et){
		highPressure=hi;
		lowPressure=low;
		heartBeatRate=hb;
		heartBeatAnnotation=hba;
		setExamineTime(et);
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
	public Integer getHighPressure() {
		return highPressure;
	}
	public void setHighPressure(Integer highPressure) {
		this.highPressure = highPressure;
	}
	public Integer getLowPressure() {
		return lowPressure;
	}
	public void setLowPressure(Integer lowPressure) {
		this.lowPressure = lowPressure;
	}
	public Integer getHeartBeatRate() {
		return heartBeatRate;
	}
	public void setHeartBeatRate(Integer heartBeatRate) {
		this.heartBeatRate = heartBeatRate;
	}
	public Integer getHeartBeatAnnotation() {
		return heartBeatAnnotation;
	}
	public void setHeartBeatAnnotation(Integer heartBeatAnnotation) {
		this.heartBeatAnnotation = heartBeatAnnotation;
	}
	public Date getExamineTime() {
		return examineTime;
	}
	public void setExamineTime(Date examineTime) {
		this.examineTime = examineTime;
	}

}
