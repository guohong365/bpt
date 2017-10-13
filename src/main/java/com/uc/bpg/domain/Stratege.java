package com.uc.bpg.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.uc.web.domain.EntityBase;

public class Stratege  extends EntityBase {
	private Long id;
	private String uuid;
	private BigDecimal chargeStandard;
	private BigDecimal charge;
	private BigDecimal ratio;
	private String billingCycle;
	private Integer billingDateParam1;
	private Integer billingDateParam2;
	private Long creater;
	private Date createTime;
	private String createrName;
	private StrategeHistory history;
	
	public String getBillingCycleString(){
		return StrategeFormatHelper.getBillingCycleString(getBillingCycle(), getBillingDateParam1(), getBillingDateParam2());
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public BigDecimal getChargeStandard() {
		return chargeStandard;
	}
	public void setChargeStandard(BigDecimal chargeStandard) {
		this.chargeStandard = chargeStandard;
	}
	public BigDecimal getCharge() {
		return charge;
	}
	public void setCharge(BigDecimal charge) {
		this.charge = charge;
	}
	public BigDecimal getRatio() {
		return ratio;
	}
	public void setRatio(BigDecimal ratio) {
		this.ratio = ratio;
	}
	public String getBillingCycle() {
		return billingCycle;
	}
	public void setBillingCycle(String billingCycle) {
		this.billingCycle = billingCycle;
	}
	public Integer getBillingDateParam1() {
		return billingDateParam1;
	}
	public void setBillingDateParam1(Integer billingDateParam1) {
		this.billingDateParam1 = billingDateParam1;
	}
	public Integer getBillingDateParam2() {
		return billingDateParam2;
	}
	public void setBillingDateParam2(Integer billingDateParam2) {
		this.billingDateParam2 = billingDateParam2;
	}
	public Long getCreater() {
		return creater;
	}
	public void setCreater(Long creater) {
		this.creater = creater;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getCreaterName() {
		return createrName;
	}
	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}

	public StrategeHistory getHistory() {
		return history;
	}

	public void setHistory(StrategeHistory history) {
		this.history = history;
	}
	
	
}
