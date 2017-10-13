package com.uc.bpg.export;

import java.math.BigDecimal;
import com.uc.bpg.domain.Hotel;
import com.uc.utils.export.ValueFormatter;

public class HotelFormatter implements ValueFormatter<Hotel> {

	@Override
	public String get(int column, Hotel item) {
		switch(column){
		case 0:
			return item.getName();
		case 1:
			return item.getTotalDevice().toString();
		case 2:
			return item.getPublicUsage().toString();
		case 3:
			return item.getOwnedDevice().toString();
		case 4:
			return item.getChargeStandard().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
		case 5:			
			return item.getRatio().multiply(new BigDecimal("100")).setScale(2, BigDecimal.ROUND_HALF_UP).toString()+ "%";
		case 6:
			return item.getBillingCycleString();
		case 7:
			return item.getCharge().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
		case 8:			
			return item.getAddress()==null ? "":item.getAddress();
		case 9:
			return item.getLinkman()==null?"":item.getLinkman();
		case 10:
			return item.getTele()==null?"":item.getTele();
		case 11:			
			return item.getDescription()==null?"":item.getDescription();
		}
		return "";
	}

	@Override
	public int getCount() {
		return 12;
	}

}
