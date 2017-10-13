package com.uc.bpg.controller;

import org.springframework.web.multipart.MultipartFile;

import com.uc.bpg.domain.Device;
import com.uc.bpg.forms.AllotHisQueryForm;
import com.uc.web.controller.DetailListController;

public interface DeviceDetailListController extends DetailListController<Long, Device, AllotHisQueryForm>{
	public static final String ACTION_BATCH_ADD="BATCH_ADD";
	public static final String ACTION_BATCH_ALLOT="BATCH_ALLOT";
	public static final String ACTION_BATCH_WITHDRAW="BATCH_WITHDRAW";
	public static final String ACTION_BATCH_SCRAP="BATCH_SCRAP";
	public static final String ACTION_ALLOT="allot";
	public static final String ACTION_WITHDRAW="withdraw";
	public static final String ACTION_SCRAP="scrap";
	public static final String ACTION_VIEW_HIS="viewHis";
	public static final String PARAM_DEVICE_ALLOT_HIS="_ALLOT_HIS";
	public static final String ACTION_ALLOT_PUBLIC = "allotPublic";
	public static final String ACTION_WITHDRAW_PUBLIC = "withdrawPublic";
	public static final String ACTION_RANDOM_ALLOT="randomAllot";
	public static final String ACTION_WITHDRAW_ALL="withdrawAll";
	String postBatchFile(String action, Long param, MultipartFile file);
		
}
