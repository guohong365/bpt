package com.uc.bpg.controller.hotel.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uc.bpg.forms.RoomQueryForm;
import com.uc.web.controller.AbstractListControllerProxy;
import com.uc.web.controller.ControllerBase;

@Controller
@RequestMapping("${controller.proxy.uri.hotel.room}")
public class ForeRoomListControllerProxy extends AbstractListControllerProxy<RoomQueryForm> {

	@Value("${controller.proxy.uri.hotel.room}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	
	@Resource(name="${controller.impl.list.hotel.room}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
}
