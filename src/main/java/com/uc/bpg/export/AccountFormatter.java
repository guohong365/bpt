package com.uc.bpg.export;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import com.uc.bpg.domain.Bill;
import com.uc.utils.export.ValueFormatter;
import com.uc.utils.export.excel.ExcelSheetHeader;
import com.uc.utils.export.excel.ExcelExportOptions;
import com.uc.utils.export.excel.ExcelFlatHeader;

public class AccountFormatter implements ValueFormatter<Bill>{
	@Override
	public String get(int column, Bill item) {
		SimpleDateFormat format=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		switch(column){
		case 0:
			return format.format(item.getGeneratedTime());
		case 1:
			return item.getHotelName();
		case 2:
			return item.getIncome().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
		case 3:	
			return item.getBasicCharge().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
		case 4:
			return item.getRent().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
		case 5:
			return item.getState();
		case 6:
			return format.format(item.getPayTime());
		case 7:
			return item.getPayerName();
		case 8:
			return format.format(item.getVerifyTime());
		case 9:
			return item.getVerifierName();
		}
		return "";
	}

	@Override
	public int getCount() {
		return 10;
	}
	static class AccountExportorHeader extends ExcelFlatHeader implements ExcelSheetHeader {
		private static final String[] columns={
				"生成时间","酒店","酒店收入","应付款","分成比例","付款状态","付款时间","付款人","确认时间","确认人"	
			};		
		private static final String DEFAULT_TITLE = "账单";

		public AccountExportorHeader(ExcelExportOptions options) {
			super(DEFAULT_TITLE, columns);
		}
	}
}
