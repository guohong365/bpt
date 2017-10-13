package com.uc.bpg.test.service;

import java.text.DecimalFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.uc.bpg.domain.ChargingDetails;
import com.uc.bpg.domain.CheckIn;
import com.uc.bpg.service.ReceptionService;
import com.uc.bpg.test.TestBase;
import com.uc.bpg.uitls.OptResult;
import com.uc.web.utils.json.BigDecimalValueFilter;

public class ReceptionServiceTest extends TestBase {
	@Resource(name="receptionService")
	ReceptionService service;
	
	@Test
	public void test(){
		
				
		OptResult<CheckIn> result=service.selectRoomLastCheckIn(2L, "8303");
		
		System.err.println(result.toString());
		
		OptResult<ChargingDetails> chargeResult=service.selectRoomCheckOut(2L, "8303");
		
		System.err.println(chargeResult.toString());
		
		
		SerializeConfig config=new SerializeConfig();
		config.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
		//config.put(BigDecimal.class, new BigDecimalFormatSerializer(new DecimalFormat("#.00")));
		String string= JSONObject.toJSONString(chargeResult,config, new BigDecimalValueFilter(new DecimalFormat("#.00")));
		System.out.println("-------------------");
		System.err.println(string);
		
	}
}
