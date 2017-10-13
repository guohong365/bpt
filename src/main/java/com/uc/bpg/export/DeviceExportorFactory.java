package com.uc.bpg.export;

import com.uc.bpg.domain.Device;
import com.uc.bpg.forms.DeviceQueryForm;
import com.uc.utils.export.excel.app.FlatHeaderExportorFacotryBase;

public class DeviceExportorFactory extends FlatHeaderExportorFacotryBase<DeviceQueryForm, Device> {
	private static final String[] columns={
			"设备名称","设备型号","设备编号","有效","酒店","房间","状态"	
		};
		
	private static final String DEFAULT_TITLE = "设备列表";

	public DeviceExportorFactory() {
		setColumns(columns);
		setTitle(DEFAULT_TITLE);		
		setFileName(DEFAULT_TITLE + ".xls");
		setFormatter(new DeviceFormatter());
	}

}
