package com.uc.bpg.test.eval;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.uc.bpg.domain.Device;
import com.uc.bpg.domain.DeviceUsage;
import com.uc.bpg.domain.Hotel;
import com.uc.bpg.persistence.DeviceMapper;
import com.uc.bpg.persistence.DeviceUsageMapper;
import com.uc.bpg.persistence.HotelMapper;
import com.uc.bpg.persistence.ReceiverMapper;
import com.uc.bpg.test.TestBase;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.ExampleImpl;

public class GenUsages extends TestBase {

	@Autowired
	DeviceMapper deviceMapper;
	@Autowired
	DeviceUsageMapper usageMapper;
	@Autowired
	HotelMapper hotelMapper;
	@Autowired
	ReceiverMapper receiverMapper;

	List<Device> devices;
	List<Hotel> hotels;

	private Hotel findHotel(List<Hotel> hotels, Long id) {
		for (Hotel hotel : hotels) {
			if (hotel.getId().equals(id)) {
				return hotel;
			}
		}
		return null;
	}

	static final int USE_COUNT = 10;
	static final long USE_INTERVAL = 10000;

	@SuppressWarnings("unchecked")
	@Test
	public void test1() {
		Example example = new ExampleImpl();
		example.or().andFieldIsNotNull("HOTEL");
		devices = (List<Device>) deviceMapper.selectByExample(example, 0, 1000);
				
		//example.clear();
		//example.or().andFieldEqualTo("TYPE", Constant.ORG_TYPE_HOTEL);
		hotels = (List<Hotel>) hotelMapper.selectByExample(null, 0, 1000);

		for (Device device : devices) {
			Hotel hotel = findHotel(hotels, device.getHotel());
			if (hotel == null)
				continue;
			DeviceUsage usage = new DeviceUsage();
			usage.setDevice(device.getId());
			usage.setHotel(device.getHotel());
			usage.setRoom(device.getRoom());
			usage.setInBill(false);
			usage.setPayed(false);
			
			for (int i = 0; i < USE_COUNT; i++) {
				usage.setUseTime(new Date());
				usage.setUuid(UUID.randomUUID().toString());
				receiverMapper.insertUsage(usage);
				try {
					Thread.sleep(USE_INTERVAL);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}

	}

}
