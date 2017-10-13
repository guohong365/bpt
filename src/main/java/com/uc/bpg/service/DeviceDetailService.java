package com.uc.bpg.service;

import java.util.List;

import com.uc.bpg.domain.Device;
import com.uc.bpg.domain.Hotel;
import com.uc.bpg.domain.Room;
import com.uc.web.service.AppDetailService;

public interface DeviceDetailService extends AppDetailService {
	void insertBatchAdd(List<Device> details);
	boolean selectExistsSerial(String serial);
	Hotel selectHotel(Long hotel);
	void updateBatchAllot(List<Device> devices);
	void updateBatchWithdraw(List<Device> devices);
	void updateBatchScrap(List<Device> devices);
	void updateAllot(Device device, String operatoion);
	List<Room> selectAllocableRooms(Long hotelId);
	boolean selectAlreadyAllot(String serial, Long hotel);
	int randomAllot(Long modifier, Long hotel);
	int updateWithdrawAll(Long modifier, Long hotel);
}
