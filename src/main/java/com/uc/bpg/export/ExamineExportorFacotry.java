package com.uc.bpg.export;

import com.uc.bpg.domain.Examine;
import com.uc.bpg.forms.ExamineQueryForm;
import com.uc.utils.export.excel.app.FlatHeaderExportorFacotryBase;

public class ExamineExportorFacotry extends FlatHeaderExportorFacotryBase<ExamineQueryForm, Examine> {
	private static final String[] columns={"MAC","状态","接收时间","数据"};
	
	public ExamineExportorFacotry() {
		setTitle("数据接收记录");
		setFileName("数据接收记录.xls");
		setColumns(columns);
		setFormatter(new ExamineFormatter());
	}
}
