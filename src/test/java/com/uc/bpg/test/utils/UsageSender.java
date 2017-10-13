package com.uc.bpg.test.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.uc.bpg.domain.Device;
import com.uc.bpg.persistence.DeviceMapper;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.ExampleImpl;
import com.uc.web.utils.HttpRequester;

public class UsageSender {
	private static final String[] xmlConfigs = { "classpath*:root-context.xml", "classpath*:mapper-beans.xml",
			"classpath*:service-beans.xml" };

	private static final String PARAM_FORMAT = "Sts=%d&Bat=%d&User=1&Sys=%d&Dia=%d&Pul=%d&Ano=0&Time=%s&Mac=%s";
	private static final String USAGE_URL = "http://localhost:8080/bpg/data/recv";

	static Random random = new Random(Calendar.getInstance().getTimeInMillis());

	static String genParam(String serial, String date) {
		int status = random.nextInt(100) - 92;
		return String.format(PARAM_FORMAT, (status < 0 ? 0 : status), random.nextInt(4) + 1, 60 + random.nextInt(30),
				100 + random.nextInt(30), 50 + random.nextInt(30), date, serial);
	}

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		int countPerDevice = 10;
		FileSystemXmlApplicationContext context = new FileSystemXmlApplicationContext(xmlConfigs);
		DeviceMapper mapper = context.getBean(DeviceMapper.class);
		Example example = new ExampleImpl();
		example.or()
		.andFieldEqualTo("VALID", true)
		.andFieldIsNotNull("ROOM");
		
		long count = mapper.selectCountByExample(example);
		List<Device> devices = (List<Device>) mapper.selectByExample(example, 0, count);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		for (int i = 0; i < countPerDevice; i++) {
			for (Device device : devices) {
				String param = genParam(device.getSerialNo(), dateFormat.format(Calendar.getInstance().getTime()));
				try {
					String result = HttpRequester.requestGet(USAGE_URL, param);
					System.err.println(result);
					Thread.sleep(50);
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		context.close();
	}

}
