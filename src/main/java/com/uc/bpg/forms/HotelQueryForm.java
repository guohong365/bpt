package com.uc.bpg.forms;

public class HotelQueryForm extends OrgnizationQueryForm  {
	private Long queryTotalDeviceFrom;
	private Long queryTotalDeviceTo;
	private Long queryPublicUsageFrom;
	private Long queryPublicUsageTo;
	private Integer queryOwnedDeviceFrom;
	private Integer queryOwnedDeviceTo;
	private String queryBillingCycleType;
	
    static final String ORDER_BY_COLUMN_NAME="酒店名称";          
    static final String ORDER_BY_COLUMN_TOTAL_DEVICES="设备总数";
    static final String ORDER_BY_COLUMN_PUBLIC_USAGE="公用设备总数";
    static final String ORDER_BY_COLUMN_OWNED="已拥有";
    static final String ORDER_BY_COLUMN_CHARGE_STANDARD="结算标准";
    static final String ORDER_BY_COLUMN_RATIO="分成比例";
    static final String ORDER_BY_COLUMN_CHARGE="酒店收费";
    
    @Override
    protected void buildOrderByColumnMap() {
    	getColumnMap().put(ORDER_BY_COLUMN_NAME, "NAME");
    	getColumnMap().put(ORDER_BY_COLUMN_TOTAL_DEVICES, "TOTAL_DEVICE");
    	getColumnMap().put(ORDER_BY_COLUMN_PUBLIC_USAGE, "PUBLIC_USAGE");
    	getColumnMap().put(ORDER_BY_COLUMN_OWNED, "OWNED_DEVICE");
    	getColumnMap().put(ORDER_BY_COLUMN_CHARGE_STANDARD, "CHARGE_STANDARD");
    	getColumnMap().put(ORDER_BY_COLUMN_RATIO, "RATIO");
    	getColumnMap().put(ORDER_BY_COLUMN_CHARGE, "CHARGE");
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
	public Integer getQueryOwnedDeviceFrom() {
		return queryOwnedDeviceFrom;
	}
	public void setQueryOwnedDeviceFrom(Integer queryOwnedDeviceFrom) {
		this.queryOwnedDeviceFrom = queryOwnedDeviceFrom;
	}
	public Integer getQueryOwnedDeviceTo() {
		return queryOwnedDeviceTo;
	}
	public void setQueryOwnedDeviceTo(Integer queryOwnedDeviceTo) {
		this.queryOwnedDeviceTo = queryOwnedDeviceTo;
	}
	public String getQueryBillingCycleType() {
		return queryBillingCycleType;
	}
	public void setQueryBillingCycleType(String queryBillingCycleType) {
		this.queryBillingCycleType = queryBillingCycleType;
	}
	
}