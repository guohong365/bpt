package com.uc.bpg.forms;

import java.math.BigDecimal;
import java.util.Date;

import com.uc.web.tools.annotation.AutoGenerateEntity;
import com.uc.web.tools.annotation.ComponentType;
import com.uc.web.tools.annotation.FormField;

@AutoGenerateEntity(value="", buttons={"新建|new|btn-success|fa fa-pencil"})
public class BillQueryForm extends QueryFormBase {	
	@FormField(value="酒店", order=-1 )
	private String queryHotelName;
	@FormField(value="应付款",order=0, field="queryPayable", range=true)
	private BigDecimal queryPayableFrom;
	private BigDecimal queryPayableTo;
	@FormField(value="酒店收入",order=1, field="queryIncome", range=true)
	private BigDecimal queryIncomeFrom;
	private BigDecimal queryIncomeTo;
	@FormField(value="付款状态",order=2, component=ComponentType.SELECT)
	private String queryState;
	@FormField(value="生成时间",order=3, field= "queryGeneratedTime", range=true)
	private Date queryGeneratedTimeFrom;
	private Date queryGeneratedTimeTo;
	@FormField(value="付款时间",order=4, field="queryPayTime", range=true)
	private Date queryPayTimeFrom;
	private Date queryPayTimeTo;
	@FormField(value="付款人", order=5)
	private String queryPayerName;
	@FormField(value="确认时间",order=6, field="queryVerifyTime", range=true)
	private Date queryVerifyTimeFrom;
	private Date queryVerifyTimeTo;
	@FormField(value="确认人", order=7)
	private String queryVerifierName;
	
	static final String ORDER_BY_COLUMN_GENERATED_TIME="生成时间";
	static final String ORDER_BY_COLUMN_HOTEL_NAME="酒店";
	static final String ORDER_BY_COLUMN_INCOME="酒店收入";
	static final String ORDER_BY_COLUMN_PAYABLE="应付款";
	static final String ORDER_BY_COLUMN_RATIO="分成比例";
	static final String ORDER_BY_COLUMN_STATE="状态";
	static final String ORDER_BY_COLUMN_PAY_TIME="付款时间";
	static final String ORDER_BY_COLUMN_PAYER="付款人";
	static final String ORDER_BY_COLUMN_VERIFY_TIME="确认时间";
	static final String ORDER_BY_COLUMN_VERIFIER="确认人";
	
	@Override
	protected void buildOrderByColumnMap() {
		getColumnMap().put(ORDER_BY_COLUMN_GENERATED_TIME, "GENERATED_TIME");
		getColumnMap().put(ORDER_BY_COLUMN_HOTEL_NAME, "HOTEL_NAME");
		getColumnMap().put(ORDER_BY_COLUMN_INCOME, "INCOME");
		getColumnMap().put(ORDER_BY_COLUMN_PAYABLE, "PAYABLE");
		getColumnMap().put(ORDER_BY_COLUMN_RATIO, "RATIO");
		getColumnMap().put(ORDER_BY_COLUMN_STATE, "STATE");
		getColumnMap().put(ORDER_BY_COLUMN_PAY_TIME, "PAY_TIME");
		getColumnMap().put(ORDER_BY_COLUMN_PAYER, "PAYER_NAME");
		getColumnMap().put(ORDER_BY_COLUMN_VERIFY_TIME, "VERIFY_TIME");
		getColumnMap().put(ORDER_BY_COLUMN_VERIFIER, "VERIFIER_NAME");
	}
	
	
	public String getQueryHotelName() {
		return queryHotelName;
	}
	public void setQueryHotelName(String queryHotelName) {
		this.queryHotelName = queryHotelName;
	}
	public BigDecimal getQueryPayableFrom() {
		return queryPayableFrom;
	}
	public void setQueryPayableFrom(BigDecimal queryPayableFrom) {
		this.queryPayableFrom = queryPayableFrom;
	}
	public BigDecimal getQueryPayableTo() {
		return queryPayableTo;
	}
	public void setQueryPayableTo(BigDecimal queryPayableTo) {
		this.queryPayableTo = queryPayableTo;
	}
	public BigDecimal getQueryIncomeFrom() {
		return queryIncomeFrom;
	}
	public void setQueryIncomeFrom(BigDecimal queryIncomeFrom) {
		this.queryIncomeFrom = queryIncomeFrom;
	}
	public BigDecimal getQueryIncomeTo() {
		return queryIncomeTo;
	}
	public void setQueryIncomeTo(BigDecimal queryIncomeTo) {
		this.queryIncomeTo = queryIncomeTo;
	}
	public String getQueryState() {
		return queryState;
	}
	public void setQueryState(String queryState) {
		this.queryState = queryState;
	}
	public Date getQueryGeneratedTimeFrom() {
		return queryGeneratedTimeFrom;
	}
	public void setQueryGeneratedTimeFrom(Date queryGeneratedTimeFrom) {
		this.queryGeneratedTimeFrom = queryGeneratedTimeFrom;
	}
	public Date getQueryGeneratedTimeTo() {
		return queryGeneratedTimeTo;
	}
	public void setQueryGeneratedTimeTo(Date queryGeneratedTimeTo) {
		this.queryGeneratedTimeTo = queryGeneratedTimeTo;
	}
	public Date getQueryPayTimeFrom() {
		return queryPayTimeFrom;
	}
	public void setQueryPayTimeFrom(Date queryPayTimeFrom) {
		this.queryPayTimeFrom = queryPayTimeFrom;
	}
	public Date getQueryPayTimeTo() {
		return queryPayTimeTo;
	}
	public void setQueryPayTimeTo(Date queryPayTimeTo) {
		this.queryPayTimeTo = queryPayTimeTo;
	}
	public String getQueryPayerName() {
		return queryPayerName;
	}
	public void setQueryPayerName(String queryPayerName) {
		this.queryPayerName = queryPayerName;
	}
	public Date getQueryVerifyTimeFrom() {
		return queryVerifyTimeFrom;
	}
	public void setQueryVerifyTimeFrom(Date queryVerifyTimeFrom) {
		this.queryVerifyTimeFrom = queryVerifyTimeFrom;
	}
	public Date getQueryVerifyTimeTo() {
		return queryVerifyTimeTo;
	}
	public void setQueryVerifyTimeTo(Date queryVerifyTimeTo) {
		this.queryVerifyTimeTo = queryVerifyTimeTo;
	}
	public String getQueryVerifierName() {
		return queryVerifierName;
	}
	public void setQueryVerifierName(String queryVerifierName) {
		this.queryVerifierName = queryVerifierName;
	}
	
}