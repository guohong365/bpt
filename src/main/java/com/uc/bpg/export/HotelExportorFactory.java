package com.uc.bpg.export;

import com.uc.bpg.domain.Hotel;
import com.uc.bpg.forms.HotelQueryForm;
import com.uc.utils.export.excel.app.FlatHeaderExportorFacotryBase;

public class HotelExportorFactory extends FlatHeaderExportorFacotryBase<HotelQueryForm, Hotel>{
	private static final String[] columns={
			"酒店","设备总数","公用总数","已拥有","结算标准","分成比例","结算周期","酒店收费","地址","联系人","电话","备注"	
		};
		private static final String DEFAULT_FILE_NAME = "酒店清单.xls";
		private static final String DEFAULT_TITLE = "酒店清单";
		public HotelExportorFactory() {
			setColumns(columns);
			setFileName(DEFAULT_FILE_NAME);
			setTitle(DEFAULT_TITLE);
			setFormatter(new HotelFormatter());
		}

}
