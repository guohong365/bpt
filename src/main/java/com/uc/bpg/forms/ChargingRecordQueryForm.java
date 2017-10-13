package com.uc.bpg.forms;

import java.math.BigDecimal;
import java.util.Date;

public class ChargingRecordQueryForm extends QueryFormBase {
	private Long strategy;
	private Long checkInRecord;
	private BigDecimal chagre;
	private BigDecimal chargingStandard;
	private BigDecimal ratio;
	private Long receptionist;
	private Date chargingTime;
	public Long getStrategy() {
		return strategy;
	}
	public void setStrategy(Long strategy) {
		this.strategy = strategy;
	}
	public Long getCheckInRecord() {
		return checkInRecord;
	}
	public void setCheckInRecord(Long checkInRecord) {
		this.checkInRecord = checkInRecord;
	}
	public BigDecimal getChagre() {
		return chagre;
	}
	public void setChagre(BigDecimal chagre) {
		this.chagre = chagre;
	}
	public BigDecimal getChargingStandard() {
		return chargingStandard;
	}
	public void setChargingStandard(BigDecimal chargingStandard) {
		this.chargingStandard = chargingStandard;
	}
	public BigDecimal getRatio() {
		return ratio;
	}
	public void setRatio(BigDecimal ratio) {
		this.ratio = ratio;
	}
	public Long getReceptionist() {
		return receptionist;
	}
	public void setReceptionist(Long receptionist) {
		this.receptionist = receptionist;
	}
	public Date getChargingTime() {
		return chargingTime;
	}
	public void setChargingTime(Date chargingTime) {
		this.chargingTime = chargingTime;
	}

}