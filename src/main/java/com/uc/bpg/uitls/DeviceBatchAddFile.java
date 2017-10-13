package com.uc.bpg.uitls;

import java.util.List;

public interface DeviceBatchAddFile {
	public static final String BATCH_ADD="新增";
	public static final String BATCH_ALLOT="分配";
	public static final String BATCH_WITHDRAW="收回";
	public static final String BATCH_SCRAP="报废";
	String getAction();
	void setAction(String action);	
	Long getType();
	void setType(Long type);
	List<String> getItems();
}
