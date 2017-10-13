package com.uc.bpg.export;

import com.uc.bpg.domain.Bill;
import com.uc.bpg.forms.BillQueryForm;
import com.uc.utils.export.excel.app.FlatHeaderExportorFacotryBase;

public class AccountExportorFactory extends FlatHeaderExportorFacotryBase<BillQueryForm, Bill>{
	private static final String[] columns={
			"生成时间","酒店","酒店收入","应付款","分成比例","付款状态","付款时间","付款人","确认时间","确认人"	
		};		
	private static final String DEFAULT_TITLE = "账单";
	
	public AccountExportorFactory() {
		setColumns(columns);
		setTitle(DEFAULT_TITLE);
		setFileName(DEFAULT_TITLE + ".xls");
		setFormatter(new AccountFormatter());
	}
		
}
