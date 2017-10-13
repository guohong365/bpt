package com.uc.bpg.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.uc.web.domain.EntityBase;
import com.uc.web.domain.WithLongId;
import com.uc.web.tools.annotation.AutoGenerateEntity;
import com.uc.web.tools.annotation.FormField;
import com.uc.web.tools.annotation.ListColumn;

@AutoGenerateEntity(value="账单信息", buttons={"确认收款|comfirm|btn-danger|fa fa-edit","查看|view|btn-primary|fa fa-search"})
public class Bill extends EntityBase implements WithLongId {
	@FormField(value="",order=0,hidden=true, id=true)
	@ListColumn(value="", show=false, id=true)
	private Long id;
	@FormField(value="",order=0,hidden=true)
	private String uuid;
	@ListColumn(value="生成时间",order=0)
	@FormField(value="生成时间",order=0)
	private Date generatedTime;
	@ListColumn(value = "酒店", order = 1)
	@FormField(value = "酒店", order = 1)
	private String hotelName;
	@ListColumn(value="酒店收入", order=2)
	@FormField(value="酒店收入", order=2)
	private BigDecimal income;
	@ListColumn(value="分成基准",order=3)
	@FormField(value="分成基准",order=3)
	private BigDecimal basicCharge;
	@ListColumn(value="分成",order=4)
	@FormField(value="分成",order=4)
	private BigDecimal rent;
	@ListColumn(value="状态",order=5)
	@FormField(value="状态",order=5)
	private String state;
	@ListColumn(value="付款时间",order=6)
	@FormField(value="付款时间",order=6)
	private Date payTime;	
	@ListColumn(value="付款人",order=7)
	@FormField(value="付款人",order=7)
	private String payerName;
	@ListColumn(value="确认时间",order=8)
	@FormField(value="确认时间",order=8)
	private Date verifyTime;
	@ListColumn(value="确认人",order=9)
	@FormField(value="确认人",order=9)
	private String verifierName;
	private Long verifier;
	private Long payer;	
	Long hotel;
	
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
	public Date getGeneratedTime() {
		return generatedTime;
	}
	public void setGeneratedTime(Date generatedTime) {
		this.generatedTime = generatedTime;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public BigDecimal getIncome() {
		return income;
	}
	public void setIncome(BigDecimal income) {
		this.income = income;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	public String getPayerName() {
		return payerName;
	}
	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}
	public Date getVerifyTime() {
		return verifyTime;
	}
	public void setVerifyTime(Date verifyTime) {
		this.verifyTime = verifyTime;
	}
	public String getVerifierName() {
		return verifierName;
	}
	public void setVerifierName(String verifierName) {
		this.verifierName = verifierName;
	}
	public Long getVerifier() {
		return verifier;
	}
	public void setVerifier(Long verifier) {
		this.verifier = verifier;
	}
	public Long getPayer() {
		return payer;
	}
	public void setPayer(Long payer) {
		this.payer = payer;
	}
	public Long getHotel() {
		return hotel;
	}
	public void setHotel(Long hotel) {
		this.hotel = hotel;
	}
	public BigDecimal getRent() {
		return rent;
	}
	public void setRent(BigDecimal rent) {
		this.rent = rent;
	}
	public BigDecimal getBasicCharge() {
		return basicCharge;
	}
	public void setBasicCharge(BigDecimal basicCharge) {
		this.basicCharge = basicCharge;
	}


}