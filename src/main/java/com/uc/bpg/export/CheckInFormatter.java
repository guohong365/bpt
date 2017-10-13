package com.uc.bpg.export;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import com.uc.bpg.domain.CheckIn;
import com.uc.utils.export.ValueFormatter;

public class CheckInFormatter implements ValueFormatter<CheckIn> {

	@Override
	public String get(int column, CheckIn item) {
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		switch(column){
		case 0:
			return item.getRoomNo();
		case 1:
			return item.getCheckInTime()==null ?"":dateFormat.format(item.getCheckInTime());
		case 2:
			return item.getCheckOutTime()==null?"":dateFormat.format(item.getCheckOutTime());
		case 3:
			return item.getUseTimes().toString();
		case 4:
			return item.getCharge().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
		case 5:
			return item.getCheckInReceptionistName();
		case 6:	
			return item.getCheckOutReceptionistName()==null?"":item.getCheckOutReceptionistName();
		default:
			return "";
		}
	}

	@Override
	public int getCount() {
		return 7;
	}

}
