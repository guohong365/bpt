package com.uc.bpg.forms;

import com.uc.web.tools.annotation.AutoGenerateEntity;
import com.uc.web.tools.annotation.FormField;

@AutoGenerateEntity(buttons={"新建|new|btn-success|fa fa-pencil", "批量新建|batchNew|btn-success|fa fa-pencil"})
public class RoomQueryForm extends QueryFormBase  {
	@FormField(value="酒店",order=0)
	private String queryHotelName;
	@FormField(value="楼层",order=1)
	private Integer queryStorey;
	@FormField(value="房间号",order=2)
	private String queryRoomNo;
	static final String ORDER_BY_COLUMN_STOREY="楼层";
	static final String ORDER_BY_COLUMN_ROOM="房间号";
	static final String ORDER_BY_COLUMN_DEVICE_NAME="设备名称";
	static final String ORDER_BY_COLUMN_DEVICE_SERIAL="设备编号";
	static final String ORDER_BY_COLUMN_DEVICE_STATE="设备状态";
	
	@Override
	protected void buildOrderByColumnMap() {
		getColumnMap().put(ORDER_BY_COLUMN_STOREY, "STOREY");
		getColumnMap().put(ORDER_BY_COLUMN_ROOM, "ROOM_NO");
		getColumnMap().put(ORDER_BY_COLUMN_DEVICE_NAME, "DEVICE_NAME");
		getColumnMap().put(ORDER_BY_COLUMN_DEVICE_SERIAL, "DEVICE_SERIAL");
		getColumnMap().put(ORDER_BY_COLUMN_DEVICE_STATE, "DEVICE_STATUS");		
	}


	public String getQueryHotelName() {
		return queryHotelName;
	}


	public void setQueryHotelName(String queryHotelName) {
		this.queryHotelName = queryHotelName;
	}


	public Integer getQueryStorey() {
		return queryStorey;
	}


	public void setQueryStorey(Integer queryStorey) {
		this.queryStorey = queryStorey;
	}


	public String getQueryRoomNo() {
		return queryRoomNo;
	}


	public void setQueryRoomNo(String queryRoomNo) {
		this.queryRoomNo = queryRoomNo;
	}
	
}