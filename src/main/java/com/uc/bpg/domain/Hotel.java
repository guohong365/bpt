package com.uc.bpg.domain;

import java.math.BigDecimal;
import com.uc.web.tools.annotation.AutoGenerateEntity;
import com.uc.web.tools.annotation.ComponentType;
import com.uc.web.tools.annotation.FormField;

@AutoGenerateEntity
public class Hotel extends OrgnizationImpl  {
	
	private Integer ownedDevice;
	@FormField(value="设备总数", required=true, order=20)
	private Long totalDevice;
	@FormField(value="公用数", required=true, order=21)
	private Long publicUsage;
	@FormField(value="收费标准", required=true, order=22)
	private BigDecimal chargeStandard;
	@FormField(value="酒店收费", required=true, order=23)
	private BigDecimal charge;
	@FormField(value="分成比例", required=true, order=24)
	private BigDecimal ratio;
	private Boolean canCancel;
	@FormField(value="结算周期", required=true, component=ComponentType.SELECT, order=25)
	private String billingCycle;
	@FormField(value="参数1", component=ComponentType.SELECT, order=26)
	private Integer billingDateParam1;
	@FormField(value="参数2", component=ComponentType.SELECT, order=27)
	private Integer billingDateParam2;
	
	public String getBillingCycleString(){
		return StrategeFormatHelper.getBillingCycleString(getBillingCycle(), getBillingDateParam1(), getBillingDateParam2());
	}
	
	public Integer getOwnedDevice() {
		return ownedDevice;
	}
	public void setOwnedDevice(Integer ownedDevice) {
		this.ownedDevice = ownedDevice;
	}
	public Long getTotalDevice() {
		return totalDevice;
	}
	public void setTotalDevice(Long totalDevice) {
		this.totalDevice = totalDevice;
	}
	public Long getPublicUsage() {
		return publicUsage;
	}
	public void setPublicUsage(Long publicUsage) {
		this.publicUsage = publicUsage;
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
	public Boolean getCanCancel() {
		return canCancel;
	}
	public void setCanCancel(Boolean canCancel) {
		this.canCancel = canCancel;
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
	
	
}