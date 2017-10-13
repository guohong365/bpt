package com.uc.bpg.controller.hotel.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uc.bpg.controller.RoomDetailController;
import com.uc.bpg.domain.Room;
import com.uc.web.controller.AbstractDetailControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping("${controller.proxy.uri.hotel.room}")
public class ForeRoomDetailControllerProxy extends AbstractDetailControllerProxy<Long, Room> implements RoomDetailController{

	@Value("${controller.proxy.uri.hotel.room}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.detail.hotel.room}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
	
	public RoomDetailController getController(){
		return (RoomDetailController) super.getController();
	}

	@Override
	@RequestMapping(value="/batchAdd", method=RequestMethod.POST, produces="application/json;charset=UTF-8;")
	@ResponseBody
	public String postBatchAdd(
			@RequestParam(value="storey", required=true)
			Integer storey,
			@RequestParam(value="pattern", required=true)
			String pattern,
			@RequestParam(value="begin", required=true)
			Integer begin,
			@RequestParam(value="end", required=true)
			Integer end,
			@RequestParam(value="ignoreDuplicated", required=false, defaultValue="false")
			Boolean ignoreDuplicated
			) {
		return getController().postBatchAdd(storey, pattern, begin, end, ignoreDuplicated);
	}

}
