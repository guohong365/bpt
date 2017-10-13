package com.uc.bpg.service.impl;

import java.util.List;

import com.uc.bpg.Constant;
import com.uc.bpg.domain.Bill;
import com.uc.bpg.domain.DeviceUsage;
import com.uc.bpg.domain.Hotel;
import com.uc.bpg.persistence.BillMapper;
import com.uc.bpg.persistence.DeviceUsageMapper;
import com.uc.bpg.persistence.HotelMapper;
import com.uc.bpg.service.BillGeneratorSevice;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.ExampleImpl;
import com.uc.web.service.ServiceBase;

public class BillGeneratorServiceImpl extends ServiceBase implements BillGeneratorSevice{
	private BillMapper billMapper;
	private HotelMapper hotelMapper;
	private DeviceUsageMapper usageMapper;
	
	public void setBillMapper(BillMapper billMapper) {
		this.billMapper = billMapper;
	}
	
	public BillMapper getBillMapper() {
		return billMapper;
	}
	
	public void setHotelMapper(HotelMapper hotelMapper) {
		this.hotelMapper = hotelMapper;
	}
	
	public HotelMapper getHotelMapper() {
		return hotelMapper;
	}
	
	public DeviceUsageMapper getUsageMapper() {
		return usageMapper;
	}
	public void setUsageMapper(DeviceUsageMapper usageMapper) {
		this.usageMapper = usageMapper;
	}
	@SuppressWarnings("unchecked")
	@Override
	public
	List<Hotel> selectHotels(){
		Example example=new ExampleImpl();
		example.or()
		.andFieldEqualTo("VALID", true)
		.andFieldEqualTo("TYPE", Constant.ORG_TYPE_HOTEL)
		.andFieldGreaterThan("OWNED_DEVICE", 0);
		long count=getHotelMapper().selectCountByExample(example);
		return (List<Hotel>) getHotelMapper().selectByExample(example, 0, count);
	}
	@SuppressWarnings("unchecked")
	@Override
	public
	List<DeviceUsage> selectUnbilledUsage(Long hotel){
		Example example=new ExampleImpl();
		example.or()
		.andFieldEqualTo("HOTEL", hotel)
		.andFieldEqualTo("IN_BILL", false);		
		long count=getUsageMapper().selectCountByExample(example);
		return (List<DeviceUsage>) getUsageMapper().selectByExample(example, 0, count);
	}
	@Override
	public
	void insertGeneratedBill(Bill bill, List<DeviceUsage> usages){
		getBillMapper().insertGeneratedBill(bill, usages);
		
		
	}
}
