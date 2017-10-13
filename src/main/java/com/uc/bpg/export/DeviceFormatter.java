package com.uc.bpg.export;

import com.uc.bpg.domain.Device;
import com.uc.utils.export.ValueFormatter;

public class DeviceFormatter implements ValueFormatter<Device> {

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
			return item.getValid()? "有效":"报废";
		case 4:
			return item.getHotelName();
		case 5:
			return item.getRoomNo();
		case 6:
			return item.getStatusDetail();
		}
		return "";
	}

	@Override
	public int getCount() {
		return 7;
	}

}
