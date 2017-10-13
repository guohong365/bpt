package com.uc.bpg.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uc.bpg.domain.Hotel;
import com.uc.bpg.service.DemoService;
import com.uc.utils.LoggerSupportorImpl;

@Controller
@RequestMapping("/demo")
public class DemoController extends LoggerSupportorImpl {
	private static final String DEMO_PAGE="/demo/demo";
	private static final String DEMO_ACTION_GEN_USAGES="GEN_USAGE";
	private static final String DEMO_ACTION_GEN_BILLS="GEN_BILL";
	private static final String DEMO_ACTION_GEN_STATUS="GEN_STATUS";
	
	@Resource(name="${service.demo}")
	DemoService service;
	
	@RequestMapping(value="/demo", method=RequestMethod.GET)
	public String getDemoPage(Model model){
		List<Hotel> hotels=service.selectHotels();
		model.addAttribute("_hotels", hotels);
		getLogger().trace(hotels.toString());
		return DEMO_PAGE;
	}
	
	@RequestMapping(value="/demo", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String postDemo(
			@RequestParam("action")
			String action,
			@RequestParam("hotel")
			Long hotel,
			@RequestParam(value="count", required=false)
			Integer count
			){
		switch(action){
		case DEMO_ACTION_GEN_USAGES:
			service.insertUsages(hotel, count==null || count<=0?1:count);
			break;
		case DEMO_ACTION_GEN_BILLS:
			service.insertBills(hotel);
			break;
		case DEMO_ACTION_GEN_STATUS:
			service.insertStatus(hotel);
			break;
		default:
			return "{\"ok\":false, \"msg\":\"无效操作\"}";
		}		
		return "{\"ok\":true}";
	}
	

}
