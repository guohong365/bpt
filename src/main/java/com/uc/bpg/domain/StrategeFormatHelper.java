package com.uc.bpg.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

import com.uc.bpg.Constant;
import com.uc.web.domain.Code;
import com.uc.web.domain.CodeImpl;

public class StrategeFormatHelper {
	private static final String ERROR_PARAM="参数错误";
	private static final String ERROR_CONFIG="配置错误";
	private static final String[] weekDays={"","星期日","星期一","星期二","星期三","星期四","星期五","星期六"};
	private static final String[] zhNumber={"",
			"一","二","三","四","五","六","七","八","九","十",
			"十一","十二",	"十三","十四","十五","十六","十七","十八","十九","二十",
			"二十一","二十二","二十三","二十四",	"二十五","二十六","二十七","二十八","二十九","三十","三十一"};
	public static String getBillingCycleString(String billingCycle, Integer param1, Integer param2){
		if(StringUtils.isEmpty(billingCycle)) return ERROR_PARAM;
		
		switch(billingCycle){
		case Constant.BILL_CYCLE_WEEKLY:
			return param1!=null && param1>0 ? 
					("每周"+ weekDays[param1]) : ERROR_CONFIG;
		case Constant.BILL_CYCLE_MONTHLY:
			return param2!=null && param2>0 ? 
					("每月" + zhNumber[param2] + "日"): ERROR_CONFIG;
		case Constant.BILL_CYCLE_QUARTERLY:
			return param1!=null && param1>0 &&
					param2!=null && param2>0 ? 
			    		   ("每季度第"+ zhNumber[param1] +"个月第" +zhNumber[param2]+ "日") : ERROR_CONFIG;
		case Constant.BILL_CYCLE_YEAERLY:
			return param1!=null && param1>0 &&
					param2!=null && param2>0 ? 
			    		   ("每年第"+ zhNumber[param1] +"个月第" +zhNumber[param2]+ "日") : ERROR_CONFIG;
		}
		return ERROR_CONFIG;
		
	}
	public static List<Code> getCyleTypes(){
		List<Code> codes=new ArrayList<>();
		codes.add(new CodeImpl(Constant.BILL_CYCLE_WEEKLY, "每" + Constant.BILL_CYCLE_WEEKLY));
		codes.add(new CodeImpl(Constant.BILL_CYCLE_MONTHLY, "每" + Constant.BILL_CYCLE_MONTHLY));
		codes.add(new CodeImpl(Constant.BILL_CYCLE_QUARTERLY, "每" + Constant.BILL_CYCLE_QUARTERLY));
		codes.add(new CodeImpl(Constant.BILL_CYCLE_YEAERLY, "每" + Constant.BILL_CYCLE_YEAERLY));
		return codes;
	}
	public static List<Code> getMonths(){
		List<Code> codes=new ArrayList<>();
		for(int i=1; i<=12; i++){
			codes.add(new CodeImpl((long) i, zhNumber[i] +"月"));
		}
		return codes;
	}
	public static List<Code> getWeekDays(){
		List<Code> codes=new ArrayList<>();
		for(int i=1; i<=7; i++){
			codes.add(new CodeImpl((long)i, weekDays[i]));
		}
		return codes;
	}
	
	public static List<Code> getQuarterMonths(){
		List<Code> codes=new ArrayList<>();
		codes.add(new CodeImpl(1L, "第一个月"));
		codes.add(new CodeImpl(2L, "第二个月"));
		codes.add(new CodeImpl(3L, "第三个月"));
		return codes;
	}
	
	public static List<Code> getMonthDays(){
		List<Code> codes=new ArrayList<>();
		for(int i=1; i<=31; i++){
			codes.add(new CodeImpl((long) i, zhNumber[i] +"日"));
		}
		return codes;
	}
	
}
