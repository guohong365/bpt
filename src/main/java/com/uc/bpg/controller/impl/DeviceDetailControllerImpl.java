package com.uc.bpg.controller.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.uc.bpg.Constant;
import com.uc.bpg.constant.CODES;
import com.uc.bpg.controller.BusinessDetailListControllerBase;
import com.uc.bpg.controller.DeviceDetailListController;
import com.uc.bpg.domain.AllotHistory;
import com.uc.bpg.domain.Device;
import com.uc.bpg.domain.Hotel;
import com.uc.bpg.domain.OrgnizationImpl;
import com.uc.bpg.forms.AllotHisQueryForm;
import com.uc.bpg.service.CodesService;
import com.uc.bpg.service.DeviceDetailService;
import com.uc.bpg.uitls.BatchProcessResult;
import com.uc.bpg.uitls.BatchProcessResultItem;
import com.uc.bpg.uitls.DeviceBatchFile;
import com.uc.bpg.uitls.DeviceBatchFileParser;
import com.uc.web.domain.Code;
import com.uc.web.domain.CodeImpl;
import com.uc.web.domain.security.UserProfile;

public class DeviceDetailControllerImpl 
	extends BusinessDetailListControllerBase<Device, AllotHisQueryForm, AllotHistory> implements DeviceDetailListController {
	
	private CodesService codesService;
	
	public void setCodesService(CodesService codesService) {
		this.codesService=codesService;		
	}
	
	public CodesService getCodesService() {
		return codesService;
	}
	
	public DeviceDetailService getService() {
		return (DeviceDetailService) super.getService();
	}
		
	@Override
	protected Map<String, List<Code>> onGetNewCodes(UserProfile user) {
		return onGetModifyCodes(user, null);
	}
	
	@Override
	protected Map<String, List<Code>> onGetModifyCodes(UserProfile user, Object detail) {
		Map<String, List<Code>> map= super.onGetModifyCodes(user, detail);
		map.put(CODES.DEVICE_TYPE, getCodesService().selectTypes(false));
		return map;
	}
	
	@Override
	protected Device onCreateEntity() {
		Device detail= new Device();
		detail.setValid(true);
		return detail;
	}

	private DeviceBatchFileParser parser;

	public void setParser(DeviceBatchFileParser parser) {
		this.parser = parser;
	}
	
	public DeviceBatchFileParser getParser() {
		return parser;
	}
	
	@Override
	public String getDetailPage(String action, Long selectedId, Model model) {
		switch(action){
		case ACTION_BATCH_ADD:
			return onGetBatchAdd(model);
		case ACTION_BATCH_ALLOT:
			return onGetBatchAllot(model);
		case ACTION_ALLOT_PUBLIC:
		case ACTION_WITHDRAW_PUBLIC:
			return onGetAllotPublic(action, selectedId, model);
		case ACTION_BATCH_WITHDRAW:
			return onGetBatchWithdraw(model);
		case ACTION_BATCH_SCRAP:
			return onGetBatchScrap(model);
		case ACTION_ALLOT:
			return onGetAllot(selectedId, model);
		case ACTION_WITHDRAW:
			super.onGetDetailPage("view", selectedId, model);
			model.addAttribute(PARAM_NAME_ACTION, action);
			model.addAttribute(PARAM_NAME_ACTION_NAME, "收回设备");
			return getViewPageName();
		case ACTION_SCRAP:
			super.onGetDetailPage("view", selectedId, model);
			model.addAttribute(PARAM_NAME_ACTION, action);
			model.addAttribute(PARAM_NAME_ACTION_NAME, "设备报废");
			return getViewPageName();
		case ACTION_VIEW_HIS:
			return onGetViewHis(action, selectedId, model);
		case ACTION_RANDOM_ALLOT:
			return onRandomAllot(model);
		case ACTION_WITHDRAW_ALL:
			return onWithdrawAll(model);
		}
		return super.onGetDetailPage(action, selectedId, model);
	}
	
	private String onWithdrawAll(Model model) {
		OrgnizationImpl orgnization=(OrgnizationImpl) getUser().getOrgnization();
		String msg;
		int count= getService().updateWithdrawAll((Long) getUser().getUser().getId(), orgnization.getId());
		msg=String.format("成功收回%d个设备", count);
		model.addAttribute(PARAM_NAME_DLG_MESSAGE, msg);
		model.addAttribute(PARAM_NAME_DLG_TITLE, "收回设备");
		return "/utils/messageBox";
	}

	private String onRandomAllot(Model model) {		
		int count= getService().randomAllot((Long)getUser().getUser().getId(),(Long) getUser().getOrgnization().getId());
		model.addAttribute(PARAM_NAME_DLG_TITLE, "随机分配");
		model.addAttribute(PARAM_NAME_DLG_MESSAGE, String.format("随机分配%d个设备。", count));
		return "/utils/messageBox";
	}

	protected String onGetAllotPublic(String action, Long deviceId, Model model) {
		Device device=(Device) getService().selectById(deviceId);
		device.setPublicUsage(ACTION_ALLOT_PUBLIC.equals(action));
		device.setModifier((Long) getUser().getUser().getId());
		device.setModifyTime(Calendar.getInstance().getTime());
		getService().updateAllot(device, ACTION_ALLOT_PUBLIC.equals(action)? Constant.DEVICE_OPERATION_ALLOT_PUBLIC:Constant.DEVICE_OPERATION_WITHDRAW_PUBLIC);
		model.addAttribute(PARAM_NAME_DLG_TITLE, "操作结果");
		model.addAttribute(PARAM_NAME_DLG_MESSAGE, String.format(ACTION_ALLOT_PUBLIC.equals(action)?"成功设置公用设备[%s]":"成功解除公用设备[%s]", device.getSerialNo()));
		return "utils/messageBox";
	}

	
	protected String onGetViewHis(String action, Long selectedId, Model model) {
		model.addAttribute(PARAM_NAME_ACTION, ACTION_VIEW_HIS);
		model.addAttribute(PARAM_NAME_ACTION_NAME, "分配历史");
		model.addAttribute(PARAM_NAME_DETAIL, getService().selectById(selectedId));
		AllotHisQueryForm queryForm=new AllotHisQueryForm();
		queryForm.setQueryMainId(selectedId);
		List<Code> opts=new ArrayList<>();
		opts.add(new CodeImpl(Constant.DEVICE_OPERATION_NEW, Constant.DEVICE_OPERATION_NEW));
		opts.add(new CodeImpl(Constant.DEVICE_OPERATION_ALLOT, Constant.DEVICE_OPERATION_ALLOT));
		opts.add(new CodeImpl(Constant.DEVICE_OPERATION_WITHDRAW, Constant.DEVICE_OPERATION_WITHDRAW));
		opts.add(new CodeImpl(Constant.DEVICE_OPERATION_ALLOT_PUBLIC, Constant.DEVICE_OPERATION_ALLOT_PUBLIC));
		opts.add(new CodeImpl(Constant.DEVICE_OPERATION_WITHDRAW_PUBLIC, Constant.DEVICE_OPERATION_WITHDRAW_PUBLIC));
		opts.add(new CodeImpl(Constant.DEVICE_OPERATION_SCRAP, Constant.DEVICE_OPERATION_SCRAP));
		model.addAttribute(CODES.DEVICE_OPERATIONS, opts);
		getListController().postListPage(queryForm, model);
		
		return "common/allotHistory/list";
	}

	@Override
	protected String onPostDetailPage(String action, Object detail) {
		switch(action){
		case ACTION_ALLOT:			
		case ACTION_WITHDRAW:
			return onPostAllot(action, (Device) detail);
		case ACTION_SCRAP:
			return onPostScrap((Device) detail);			
		}
		return super.onPostDetailPage(action, detail);
	}
	
	@Override
	protected void saveModify(Object detail) {
		((Device) detail).setModifier((Long) getUser().getUser().getId());
		((Device) detail).setModifyTime(Calendar.getInstance().getTime());
		super.saveModify(detail);
	}
	
	@Override
	protected void saveNew(Object entity) {
		Device detail=(Device) entity;
		detail.setUuid(UUID.randomUUID().toString());
		detail.setInputer((Long) getUser().getUser().getId());
		detail.setInputTime(Calendar.getInstance().getTime());
		detail.setValid(true);		
		super.saveNew(detail);
	}
	
	protected String onPostScrap(Device detail) {
		Device device=(Device) getService().selectById(detail.getId());
		device.setModifier((Long) getUser().getUser().getId());
		device.setModifyTime(Calendar.getInstance().getTime());
		device.setValid(false);
		getService().updateAllot(device, Constant.DEVICE_OPERATION_SCRAP);
		return "OK";
	}

	protected String onPostAllot(String action, Device detail) {
		Device device=(Device) getService().selectById(detail.getId());
		if(isForeground()){
		  device.setRoom(ACTION_ALLOT.equals(action)?detail.getRoom():null);	
		} else {
		  device.setHotel(ACTION_ALLOT.equals(action) ? detail.getHotel():null);
		}
		device.setModifier((Long) getUser().getUser().getId());		
		device.setModifyTime(Calendar.getInstance().getTime());
		getService().updateAllot(device,ACTION_ALLOT.equals(action)? Constant.DEVICE_OPERATION_ALLOT:Constant.DEVICE_OPERATION_WITHDRAW);
		return "OK";
	}

	protected String onGetAllot(Long selectedId, Model model) {
		Device device=new Device();
		device.setId(selectedId);
		model.addAttribute(PARAM_NAME_DETAIL, device);
		if(isForeground()){
			model.addAttribute(CODES.ROOM_LIST, getService().selectAllocableRooms((Long) getUser().getOrgnization().getId()));
			model.addAttribute(PARAM_NAME_ACTION_NAME, "分配设备到房间");
			
		} else {
			model.addAttribute(CODES.HOTELS, getCodesService().selectAllocableHotelCodes());
			model.addAttribute(PARAM_NAME_ACTION_NAME, "分配设备到酒店");
		}
		
		model.addAttribute(PARAM_NAME_ACTION, ACTION_ALLOT);
		
		return getPageBasePath() +"/allot";
	}

	protected String onGetBatchAdd(Model model) {
		Map<String, List<Code>> map = onGetNewCodes(getUser());
		model.addAttribute(PARAM_NAME_ACTION, ACTION_BATCH_ADD);
		model.addAttribute(PARAM_NAME_ACTION_NAME, "批量添加");
		model.addAllAttributes(map);		
		return getPageBasePath() + "/batchAdd";
	}
		
	@Override
	public String postBatchFile(String action, Long param, MultipartFile file) {		
		return onProcessBatchFile(action, param, file);
	}
	
	protected String onProcessBatchFile(String action, Long param, MultipartFile file){
		BatchProcessResult result=new BatchProcessResult();
		getLogger().trace(file==null? "file is null .......": file.getOriginalFilename() +" "+ file.getSize() + " uploading.......");
		if(file==null || file.getSize()==0){
			result.setMsg("操作失败！原因：没有文件或文件为空！");
			return result.toJson();
		}
		if(parser==null){
			result.setMsg("操作失败！原因：系统配置错误，请联系系统管理员...");
			return result.toJson();
		}
		
		DeviceBatchFile batchFile;
		try {
			batchFile= parser.parser(file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			result.setMsg(String.format("{msg:'文件解析错误！原因：%s'}", e.getMessage()));
			return result.toJson();
		}	
		
		if(!batchFile.getAction().equals(action)){
			result.setMsg("操作失败!原因：批量文件操作符与当前操作不符！");
			return result.toJson();
		}
		batchFile.setParam(param);
		if(!batchFile.getItems().isEmpty()){
			
			switch(batchFile.getAction()){
			case ACTION_BATCH_ADD:
				processAdd(batchFile, result);
				break;
			case ACTION_BATCH_ALLOT:
				processAllot(batchFile, result);
				break;
			case ACTION_BATCH_WITHDRAW:
				proccessWithdraw(batchFile,result);
				break;
			case ACTION_BATCH_SCRAP:
				processScrap(batchFile, result);
				break;
			}
			getLogger().trace("result=" + result.toJson());
			return result.toJson();
		}
		result.setMsg("操作失败：原因：文件中没有包含有效数据。");		
		return result.toJson();
	}
	
	protected void processScrap(DeviceBatchFile batchFile, BatchProcessResult result) {
		boolean failed=false;
		List<Device> devices=new ArrayList<>();		
		for(String serial:batchFile.getItems()){
			if(alreadyAllot(serial, null)){
				result.add(new BatchProcessResultItem(serial, "设备已分配给酒店，不能报废！", false));
				failed=true;
				continue;
			}
			Date modifyTime=Calendar.getInstance().getTime();
			Device device=new Device();
			device.setSerialNo(serial);
			device.setModifier((Long) getUser().getUser().getId());
			device.setModifyTime(modifyTime);
			devices.add(device);
		}
		if(failed){
			result.setMsg("批量报废失败！原因：设备不存在或已分配给酒店，不能报废！.");
			return;
		}
		try{
			getService().updateBatchScrap(devices);
			result.setMsg("批量报废成功！");
		}catch (Exception e) {
			e.printStackTrace();
			result.setMsg("批量报废失败！原因：数据库操作失败。");
		}			
	}

	protected void proccessWithdraw(DeviceBatchFile batchFile, BatchProcessResult result) {
		boolean failed=false;
		List<Device> devices=new ArrayList<>();		
		for(String serial:batchFile.getItems()){
			if(!alreadyAllot(serial, batchFile.getParam())){
				result.add(new BatchProcessResultItem(serial, "设备不存在或未分配给目标酒店！", false));
				failed=true;
				continue;
			}
			Date modifyTime=Calendar.getInstance().getTime();
			Device device=new Device();
			device.setSerialNo(serial);
			device.setModifier((Long) getUser().getUser().getId());
			device.setModifyTime(modifyTime);
			devices.add(device);
		}
		if(failed){
			result.setMsg("批量收回失败！原因：设备不存在或未分配给目标酒店！.");
			return;
		}
		try{
			getService().updateBatchWithdraw(devices);
			result.setMsg("批量分配成功！");
		}catch (Exception e) {
			e.printStackTrace();
			result.setMsg("批量分配失败！原因：数据库操作失败。");
		}			
	}

	protected void processAllot(DeviceBatchFile batchFile, BatchProcessResult result) {
		Hotel hotel=getService().selectHotel(batchFile.getParam());
		long count=hotel.getTotalDevice()-hotel.getOwnedDevice();
		if(count < batchFile.getItems().size()){
			result.setMsg(String.format("批量分配失败！原因:酒店[%s]可分配数为%d,批量分配数超过限制[%s]！",
					hotel.getName(),
					hotel.getTotalDevice()-hotel.getOwnedDevice(), 
					batchFile.getItems().size()));
			return;
		}
		boolean failed=false;
		List<Device> devices=new ArrayList<>();
		
		for(String serial:batchFile.getItems()){
			if(!alreadyExist(serial)){
				result.add(new BatchProcessResultItem(serial, "设备编号不存在！", false));
				failed=true;
				continue;
			}
		}
		if(failed){
			result.setMsg("批量分配失败！原因：设备编号不存在。");
			return;
		}
		for(String serial:batchFile.getItems()){	
			if(alreadyAllot(serial, null)){
				result.add(new BatchProcessResultItem(serial, "设备已分配！", false));
				failed=true;
				continue;
			}
			Date modifyTime=Calendar.getInstance().getTime();
			Device device=new Device();
			device.setSerialNo(serial);
			device.setHotel(batchFile.getParam());
			device.setModifier((Long) getUser().getUser().getId());
			device.setModifyTime(modifyTime);			
			devices.add(device);
		}
		if(failed){
			result.setMsg("批量分配失败！原因：设备已分配。");
			return;
		}
		try{
			getService().updateBatchAllot(devices);
			result.setMsg("批量分配成功！");
		}catch (Exception e) {
			e.printStackTrace();
			result.setMsg("批量分配失败！原因：数据库操作失败。");				
		}			
	}

	protected void processAdd(DeviceBatchFile batchFile, BatchProcessResult result){		
		boolean failed=false;
		List<Device> devices=new ArrayList<>();
		Date inputTime=Calendar.getInstance().getTime();
		for(String serial: batchFile.getItems()){
			if(alreadyExist(serial)){
				result.add(new BatchProcessResultItem(serial, "设备编号已经存在！", false));
				failed=true;
				continue;
			}
			
			Device device=new Device();
			device.setUuid(UUID.randomUUID().toString());
			device.setSerialNo(serial);
			device.setType(batchFile.getParam());
			device.setInputer((Long) getUser().getUser().getId());
			device.setInputTime(inputTime);
			devices.add(device);
		}
		if(failed){
			result.setMsg("批量添加失败！原因：文件包含已存在设备编号。");
			return;
		}
		try {
			getService().insertBatchAdd(devices);
			result.setMsg(String.format("成功添加设备：%d个", devices.size()));
		} catch (Exception e) {
			e.printStackTrace();
			result.setMsg("批量添加失败！原因：数据库操作失败。");
		}
	}
	 
	protected boolean alreadyExist(String serial) {
		return getService().selectExistsSerial(serial);
	}
	
	protected boolean alreadyAllot(String serial, Long hotel){
		return getService().selectAlreadyAllot(serial, hotel);
	}

	public String onGetBatchAllot(Model model) {		;
		model.addAttribute(CODES.HOTELS, getCodesService().selectAllocableHotelCodes());
		model.addAttribute(PARAM_NAME_ACTION, ACTION_BATCH_ALLOT);
		model.addAttribute(PARAM_NAME_ACTION_NAME, "批量分配");
		return getPageBasePath() + "/batchAllot";
	}

	public String onGetBatchWithdraw(Model model) {
		model.addAttribute(CODES.HOTELS, getCodesService().selectAllocableHotelCodes());
		model.addAttribute(PARAM_NAME_ACTION, ACTION_BATCH_WITHDRAW);
		model.addAttribute(PARAM_NAME_ACTION_NAME, "批量收回");
		return getPageBasePath() + "/batchAllot";
	}

	public String onGetBatchScrap(Model model) {		
		model.addAttribute(PARAM_NAME_ACTION, ACTION_BATCH_SCRAP);
		model.addAttribute(PARAM_NAME_ACTION_NAME, "批量报废");
		return getPageBasePath() + "/batchScrap";
	}
	
}
