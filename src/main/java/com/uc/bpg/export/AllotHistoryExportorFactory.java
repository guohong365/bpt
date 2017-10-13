package com.uc.bpg.export;

import com.uc.bpg.domain.AllotHistory;
import com.uc.bpg.forms.AllotHisQueryForm;
import com.uc.utils.export.excel.app.FlatHeaderExportorFacotryBase;

public class AllotHistoryExportorFactory extends FlatHeaderExportorFacotryBase<AllotHisQueryForm, AllotHistory> {

	private static final String DEFAULT_TITLE = "设备分配历史";
	private static final String DEFAULT_FILE_NAME="设备分配历史[%s].xls";
	private static final String[] columns={
			"操作时间","操作","酒店","房间","操作人"	
	};
	public AllotHistoryExportorFactory() {
		setColumns(columns);
		setFileName(DEFAULT_FILE_NAME);
		setTitle(DEFAULT_TITLE);
		setFormatter(new AllotHistoryFormatter());
	}

}
