package com.uc.bpg.controller.hotel.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import com.uc.bpg.controller.BusinessDetailControllerBase;
import com.uc.bpg.controller.RoomDetailController;
import com.uc.bpg.domain.Room;
import com.uc.bpg.service.RoomDetailService;
import com.uc.bpg.uitls.BatchProcessResult;
import com.uc.bpg.uitls.BatchProcessResultItem;
import com.uc.web.controller.WebAction;
import com.uc.web.domain.security.UserProfile;

public class RoomDetailControllerImpl extends BusinessDetailControllerBase<Room> implements RoomDetailController{
	private static final String ACTION_BATCH_ADD = "batchNew";

	@Override
	protected Room onCreateEntity() {
		return new Room();
	}
	
	public RoomDetailService getService(){
		return (RoomDetailService) super.getService();
	}
	
	@Override
	protected String onGetDetailPage(String action, Object selectedId, Model model) {
		if(ACTION_BATCH_ADD.equals(action)){
			model.addAttribute(PARAM_NAME_ACTION, ACTION_BATCH_ADD);
			model.addAttribute(PARAM_NAME_ACTION_NAME, "批量创建");
			return getPageBasePath() + "/batchAdd";
		} else {
			return super.onGetDetailPage(action, selectedId, model);
		}
	}

	@Override
	public String postBatchAdd(Integer storey, String pattern, Integer begin, Integer end, Boolean ignoreDuplicated) {
		BatchProcessResult result=new BatchProcessResult();		
		if(storey==null){
			result.setMsg("操作失败！原因：楼层为空！");
			return result.toJson();			
		}
		if(StringUtils.isEmpty(pattern)){
			result.setMsg("操作失败！原因：房间号模板为空！");
			return result.toJson();
		}
		if(begin==null || begin <0){
			result.setMsg("操作失败！原因：起始房间号为空或小于0！");
			return result.toJson();
		}
		if(end==null || end<0 || begin>end){
			result.setMsg("操作失败！原因：结束房间号为空或小于起始房间号！");
			return result.toJson();
		}
		List<Room> rooms=new ArrayList<>();
		Long hotel=(Long) getUser().getOrgnization().getId();
		boolean failed=false;
		for(int i=begin; i<=end; i++){
			String roomNo=String.format(pattern, storey, i);
			if(getService().selectExistsRoom(hotel, storey, roomNo)){
				result.add(new BatchProcessResultItem(roomNo, "房间号已存在。", false));
				failed=false;
				continue;
			}
			Room room=new Room();
			room.setHotel(hotel);
			room.setRoomNo(roomNo);
			room.setUuid(UUID.randomUUID().toString());
			room.setStorey(storey);
			room.setValid(true);
			rooms.add(room);			
		}		
		if(!ignoreDuplicated && failed){
			result.setMsg("操作失败！原因：已存在部分房间号！");
			return result.toJson();
		}
		try{
			getService().insertBatch(rooms);
			result.setMsg(String.format("操作成功！新建[%d]房间。", rooms.size()));
		}catch (Exception e) {
			getLogger().error(e.toString());
			result.setMsg("操作失败！原因：数据库操作失败！");
		}
		return result.toJson();
	}
	
	@Override
	protected void onBeforSaveDetail(UserProfile user, String action, Object entity) throws Exception {
		Room detail=(Room) entity;
		if(WebAction.NEW.equals(action)){
			detail.setUuid(UUID.randomUUID().toString());
			detail.setHotel((Long) user.getOrgnization().getId());
		}
		super.onBeforSaveDetail(user, action, detail);
	}
	
}
