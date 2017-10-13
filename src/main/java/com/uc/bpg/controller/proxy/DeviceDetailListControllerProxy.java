package com.uc.bpg.controller.proxy;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uc.bpg.controller.DeviceDetailListController;
import com.uc.bpg.domain.AllotHistory;
import com.uc.bpg.domain.Device;
import com.uc.bpg.forms.AllotHisQueryForm;
import com.uc.web.controller.AbstractDetailListControllerProxy;
import com.uc.web.controller.ControllerBase;
@Controller
@RequestMapping(value="${controller.proxy.uri.background.device}")
public class DeviceDetailListControllerProxy 
	extends AbstractDetailListControllerProxy<Long, Device, AllotHisQueryForm, AllotHistory>
	implements DeviceDetailListController {
	
	@Value(value="${controller.proxy.uri.background.device}")
	@Override
	public void setBaseUri(String baseUri) {
		super.setBaseUri(baseUri);
	}
	@Resource(name="${controller.impl.detail.background.device}")
	@Override
	public void setController(ControllerBase controller) {
		super.setController(controller);
	}
	public DeviceDetailListController getController(){		
		return (DeviceDetailListController) super.getController();
	}

	@Override
	@RequestMapping(value="/batchFile", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String postBatchFile(
			@RequestParam(value=PARAM_NAME_ACTION)
			String action,
			@RequestParam(value="param", required=false)
			Long param,
			@RequestParam(value="batchFile")
			MultipartFile file) {		
		return getController().postBatchFile(action,param, file);
	}
	
}
