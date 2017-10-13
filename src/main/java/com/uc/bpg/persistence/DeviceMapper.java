package com.uc.bpg.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uc.bpg.domain.Device;
import com.uc.bpg.domain.Room;
import com.uc.web.persistence.AppMapper;

public interface DeviceMapper extends AppMapper {

	void insertBatchAdd(
			@Param("devices")
			List<Device> devices);

	Long selectIdBySerial(String mac);
	Device selectBySerial(String serial);

	boolean selectExistsSerial(
			@Param("serial")
			String serial);
	boolean selectAlreadyAllot(@Param("serial")String serial, @Param("hotel")Long hotel);
	
	void updateBatchAllot(
			@Param("devices")
			List<Device> devices);
	void updateBatchWithdraw(
			@Param("devices")
			List<Device> devices);
	void updateBatchScrap(
			@Param("devices")
			List<Device> devices);

	List<Room> selectAllocableRooms(Long hotelId);
	
	boolean selectCanAllotPublic(Long hotel);

	int updateAllot(
			@Param("device")
			Device device,
			@Param("operation")
			String operatoin);

	int updateWithdrawAll(
			@Param("devices")
			List<Device> devices);

}