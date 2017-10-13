package com.uc.bpg.service.impl;

import java.util.UUID;

import com.uc.bpg.domain.BpData;
import com.uc.bpg.domain.Device;
import com.uc.bpg.domain.DeviceStatus;
import com.uc.bpg.domain.DeviceUsage;
import com.uc.bpg.domain.Examine;
import com.uc.bpg.persistence.DeviceMapper;
import com.uc.bpg.persistence.ExamineMapper;
import com.uc.bpg.persistence.ReceiverMapper;
import com.uc.bpg.service.DataReceiverService;
import com.uc.web.service.ServiceBase;

public class DataReceiverServiceImpl extends ServiceBase implements DataReceiverService {

	private DeviceMapper deviceMapper;
	private ReceiverMapper receiverMapper;
	private ExamineMapper examineMapper;

	public void setReceiverMapper(ReceiverMapper receiverMapper) {
		this.receiverMapper = receiverMapper;
	}

	public void setDeviceMapper(DeviceMapper deviceMapper) {
		this.deviceMapper = deviceMapper;
	}
	
	public void setExamineMapper(ExamineMapper examineMapper) {
		this.examineMapper = examineMapper;
	}

	public DeviceMapper getDeviceMapper() {
		return deviceMapper;
	}

	public ReceiverMapper getReceiverMapper() {
		return receiverMapper;
	}
	
	public ExamineMapper getExamineMapper() {
		return examineMapper;
	}
	
	Examine buildExameData(String mac, BpData data, int status){
		Examine examine=new Examine();
		examine.setMac(mac);
		examine.setStatus(status);
		if(data!=null){
			examine.setData(data.toString());
		} else {
			examine.setData("状态报告");
		}
		return examine;
	}

	@Override
	public void insertUsage(String mac, BpData data, DeviceStatus status) {	
		getExamineMapper().insertDetail(buildExameData(mac, data, status.getStatus()));
		Device device = getDeviceMapper().selectBySerial(mac);
		if (device != null) {
			if (status.getStatus() == 0) {
				DeviceUsage usage = new DeviceUsage();
				usage.setDevice(device.getId());
				usage.setDeviceSerial(device.getSerialNo());
				usage.setHotel(device.getHotel());
				usage.setRoom(device.getRoom());
				usage.setUuid(UUID.randomUUID().toString());
				usage.setUseTime(data.getExamineTime());
				usage.setPublicUsage(device.getPublicUsage());				
				data.setDevice(device.getId());
				getReceiverMapper().insetBpData(data);
				getReceiverMapper().insertUsage(usage);
			}
			status.setDevice(device.getId());
			status.setMac(mac);			
			getReceiverMapper().insertStatus(status);
		} else {
			// 系统外设备，抛弃也可以的.....
			// TODO: error logs
		}
	}

	@Override
	public void insertStatus(String mac, DeviceStatus status) {
		getExamineMapper().insertDetail(buildExameData(mac, null, status.getStatus()));
		Device device = getDeviceMapper().selectBySerial(mac);
		if (device != null) {
			status.setDevice(device.getId());
			getReceiverMapper().insertStatus(status);
		} else {
			// TODO: error logs
		}
	}
}
