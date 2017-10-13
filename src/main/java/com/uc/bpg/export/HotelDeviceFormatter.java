package com.uc.bpg.export;

import com.uc.bpg.domain.Device;
import com.uc.utils.export.ValueFormatter;

public class HotelDeviceFormatter implements ValueFormatter<Device> {
	
	@Override
	public String get(int column, Device item) {
		switch(column){
		case 0:
			return item.getName();
		case 1:
			return item.getTypeName();
		case 2:
			return item.getSerialNo();
		case 3:
			return item.getRoomNo();
		case 4:
			return item.getStatusDetail();
		}
		return "";
	}

	@Override
	public int getCount() {
		return 5;
	}

}
