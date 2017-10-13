package com.uc.bpg.service.impl;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import com.uc.bpg.Constant;
import com.uc.bpg.domain.Bill;
import com.uc.bpg.domain.Device;
import com.uc.bpg.domain.DeviceStatus;
import com.uc.bpg.domain.DeviceUsage;
import com.uc.bpg.domain.Hotel;
import com.uc.bpg.persistence.BillMapper;
import com.uc.bpg.persistence.DeviceMapper;
import com.uc.bpg.persistence.DeviceUsageMapper;
import com.uc.bpg.persistence.HotelMapper;
import com.uc.bpg.persistence.ReceiverMapper;
import com.uc.bpg.service.DemoService;
import com.uc.utils.LoggerSupportorImpl;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.ExampleImpl;

public class DemoServiceImpl extends LoggerSupportorImpl implements DemoService {
	
	private DeviceMapper deviceMapper;
	private ReceiverMapper receiverMapper;
	private BillMapper billMapper;
	private HotelMapper hotelMapper;
	private DeviceUsageMapper usageMapper;
	
	public void setDeviceMapper(DeviceMapper deviceMapper) {
		this.deviceMapper = deviceMapper;
	}
	public DeviceMapper getDeviceMapper() {
		return deviceMapper;
	}
	public void setReceiverMapper(ReceiverMapper receiverMapper) {
		this.receiverMapper = receiverMapper;
	}
	public ReceiverMapper getReceiverMapper() {
		return receiverMapper;
	}
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
	
	public void setUsageMapper(DeviceUsageMapper usageMapper) {
		this.usageMapper = usageMapper;
	}
	public DeviceUsageMapper getUsageMapper() {
		return usageMapper;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void insertStatus(Long hotel) {
		Random random=new Random(Calendar.getInstance().getTimeInMillis());
		Example example=new ExampleImpl();
		example.or()
		.andFieldEqualTo("VALID", true)
		.andFieldEqualTo("HOTEL", hotel)
		.andFieldIsNotNull("ROOM");
		List<Device> devices=(List<Device>) getDeviceMapper().selectByExample(example, 0, 1000);
		DeviceStatus status=new DeviceStatus();
		for(Device device:devices){
			status.setBattery(random.nextInt(10));
			status.setDevice(device.getId());
			status.setReportTime(new Date());
			status.setStatus(random.nextInt(8));
			status.setMac(device.getSerialNo());
			getReceiverMapper().insertStatus(status);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public void insertUsages(Long hotel, int times) {
		Example example=new ExampleImpl();
		example.or()
		.andFieldEqualTo("VALID", true)
		.andFieldEqualTo("HOTEL", hotel)
		.andFieldIsNotNull("ROOM");
		List<Device> devices=(List<Device>) getDeviceMapper().selectByExample(example, 0, 1000);
		DeviceUsage usage=new DeviceUsage();
		for(Device device:devices){
			for(int i=0; i< times; i++){
			usage.setUuid(UUID.randomUUID().toString());
			usage.setDevice(device.getId());
			usage.setHotel(device.getHotel());
			usage.setRoom(device.getRoom());
			usage.setUseTime(new Date());
			getReceiverMapper().insertUsage(usage);
			try {
				Thread.sleep(3000L);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			}
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public void insertBills(Long hotelId) {
		Hotel hotel=(Hotel) getHotelMapper().selectById(hotelId);		
		Example example=new ExampleImpl();
		example.or()
		.andFieldEqualTo("HOTEL", hotel)
		.andFieldEqualTo("IN_BILL", false);	
		List<DeviceUsage> usages=(List<DeviceUsage>) getUsageMapper().selectByExample(example, 0, 1000);
		BigDecimal income=new BigDecimal("0");
		BigDecimal payable=new BigDecimal("0");
		for(DeviceUsage usage:usages){
			income=income.add(usage.getCharge());
			payable=payable.add(usage.getChargeStandard());
		}				
		getLogger().trace("total income[{}], need pay distribute[{}]...", income.toString(), payable.toString());				
		Bill bill=new Bill();
		bill.setGeneratedTime(Calendar.getInstance().getTime());
		bill.setUuid(UUID.randomUUID().toString());
		bill.setHotel(hotel.getId());
		bill.setIncome(income);
		bill.setBasicCharge(payable);
		bill.setRent(new BigDecimal("0"));
		bill.setState(Constant.BILL_STATE_UNPAYED);
		getBillMapper().insertGeneratedBill(bill, usages);		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Hotel> selectHotels() {
		Example example=new ExampleImpl();
		example.or()
		.andFieldEqualTo("VALID", true)
		.andFieldEqualTo("TYPE", Constant.ORG_TYPE_HOTEL)
		.andFieldGreaterThan("OWNED_DEVICE", 0);
		return (List<Hotel>) getHotelMapper().selectByExample(example, 0, 1000);
	}
	
	

}
