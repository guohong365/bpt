package com.uc.bpg.controller.hotel.impl;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.uc.bpg.domain.Charging;
import com.uc.bpg.domain.ChargingDetails;
import com.uc.bpg.domain.CheckIn;
import com.uc.bpg.service.ReceptionService;
import com.uc.bpg.uitls.OptResult;
import com.uc.web.controller.ControllerProxyBaseImpl;
import com.uc.web.service.Service;
import com.uc.web.utils.json.BigDecimalValueFilter;

@Controller
@RequestMapping("/hotel/reception")
public class ReceptionControllerImpl  extends ControllerProxyBaseImpl {
	
	private static final String RECEPTION_PAGE = "/hotel/reception/main";
	private static SerializeConfig mapping=new SerializeConfig();
	private static ValueFilter filter;
	private static String dateFormat="yyyy-MM-dd HH:mm:ss";
	private static String decimalFormat="#.00";
	static {
		mapping.put(Date.class, new SimpleDateFormatSerializer(dateFormat));
		//mapping.put(BigDecimal.class, new BigDecimalFormatSerializer(new DecimalFormat(decimalFormat)));
		filter=new BigDecimalValueFilter(decimalFormat);
	}

	@Resource(name="${service.reception}")
	public void setService(Service service){
		super.setService(service);
	}
	
	public ReceptionService getService() {
		return (ReceptionService) super.getService();
	}

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String getReceptionPage(Model model){
		model.addAttribute("userName",getUser().getOrgnization().getName() +" " + getUser().getUser().getName());
		return RECEPTION_PAGE;
	}
	
	@RequestMapping(value="/checkin", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	public String preCheckIn(
			@RequestParam(value="roomNo", required=true)
			String roomNo,
			Model model
			){
		OptResult<CheckIn> result=getService().selectRoomLastCheckIn((Long)getUser().getOrgnization().getId(), roomNo);		
		return JSONObject.toJSONString(result,mapping, filter);
	}
	
	@RequestMapping(value="/checkin", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String postCheckIn(
			@RequestParam(value="roomNo", required=true)
			String roomNo,
			Model model
			){
		OptResult<CheckIn> result=getService().selectRoomLastCheckIn((Long) getUser().getOrgnization().getId(), roomNo);
		if(result.isOk()){
			CheckIn checkIn=new CheckIn();
			checkIn.setCheckInReceptionist((Long)getUser().getUser().getId());
			checkIn.setCheckInTime(Calendar.getInstance().getTime());
			checkIn.setHotel((Long) getUser().getOrgnization().getId());
			checkIn.setRoom(result.getRoom());
			checkIn.setUuid(UUID.randomUUID().toString());
			int ret=getService().insertCheckIn(checkIn);
			result.setData(checkIn);
			if(ret!=1){
				result.setOk(false);
				result.setReason("系统错误，请联系管理员！");
			}
		} 
		return JSONObject.toJSONString(result,mapping, filter);
	}
	
	@RequestMapping(value="/checkout", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	public String preCheckOut(
			@RequestParam(value="roomNo", required=true)
			String room,
			Model model
			){
		OptResult<ChargingDetails> result=getService().selectRoomCheckOut((Long) getUser().getOrgnization().getId(), room);
		
		//model.addAttribute(PARAM_NAME_CHARGING_DETAILS, result);
		//if(result.isOk()){
		//	return CHECK_OUT_PAGE;
		//} else {
		//	return CHECK_ERROR_PAGE;
		//}
		String ret= JSONObject.toJSONString(result, mapping, filter);
		getLogger().trace(ret);
		return ret;
	}
	
	@RequestMapping(value="/checkout", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String postCharge(
			@RequestParam("checkIn")
			Long checkIn,
			@RequestParam("charge")
			BigDecimal charge,
			@RequestParam("id")
			List<Long> ids,
			Model model){
		getLogger().trace("checkIn={}", checkIn);
		getLogger().trace(ids==null?"": ids.toString());
		Charging charging=new Charging();
		BigDecimal chargingStandard;
		if(ids.size()>0){
			chargingStandard=getService().selectChargingStandard(ids);
		} else {
			chargingStandard=new BigDecimal(0);
		}
		charging.setUuid(UUID.randomUUID().toString());
		charging.setHotel((Long) getUser().getOrgnization().getId());
		charging.setChargingTime(new Date());
		charging.setCharge(charge);
		charging.setChargeStandard(chargingStandard);
		charging.setCheckIn(checkIn);
		charging.setReceptionist((Long) (getUser()).getUser().getId());		
		getService().insertCheckOut(charging, ids); 
		return "OK";
	}
}
