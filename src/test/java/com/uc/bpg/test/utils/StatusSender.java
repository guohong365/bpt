package com.uc.bpg.test.utils;

import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.uc.bpg.domain.Device;
import com.uc.bpg.persistence.DeviceMapper;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.ExampleImpl;
import com.uc.web.utils.HttpRequester;

public class StatusSender {

	static class StatusPlus implements Runnable {
		private DeviceMapper mapper;

		public StatusPlus(DeviceMapper mapper) {
			this.mapper = mapper;
			stop=false;
		}

		public DeviceMapper getMapper() {
			return mapper;
		}
		
		private boolean stop;
		
		public void setStop(boolean stop) {
			this.stop = stop;
		}
		
		public boolean isStop() {
			return stop;
		}

		@SuppressWarnings("unchecked")
		@Override
		public void run() {
			while (!isStop()) {
				System.err.println();
				System.err.println("report status.....");
				System.err.println();
				Example example = new ExampleImpl();
				example.or().andFieldEqualTo("VALID", true);
				long count = mapper.selectCountByExample(example);
				List<Device> devices = (List<Device>) mapper.selectByExample(example, 0, count);
				for (Device device : devices) {
					String param = genParam(device.getSerialNo());
					try {
						String result = HttpRequester.requestGet(USAGE_URL, param);
						System.err.println(result);
						Thread.sleep(50);
					} catch (Exception e) {
						e.printStackTrace(System.err);
						try {
							Thread.sleep(30000L);
						} catch (InterruptedException e1) {
						}
					}
				}
				try {
					Thread.sleep(30000L);
				} catch (InterruptedException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
	
	static class StopThread extends Thread{
		private StatusPlus statusPlus;
		public StopThread(StatusPlus statusPlus){
			this.statusPlus=statusPlus;
		}
		
		@Override
		public void run() {
			System.err.println("to stop ......");
			statusPlus.setStop(true);
		}
	}
	
	private static final String[] xmlConfigs = { "classpath*:root-context.xml", "classpath*:mapper-beans.xml",
			"classpath*:service-beans.xml" };

	private static final String PARAM_FORMAT = "Sts=%d&Bat=%d&Mac=%s";
	private static final String USAGE_URL = "http://localhost:8080/bpg/data/hb";

	static Random random = new Random(Calendar.getInstance().getTimeInMillis());

	static String genParam(String serial) {
		int status = random.nextInt(100) - 92;
		return String.format(PARAM_FORMAT, (status < 0 ? 0 : status), random.nextInt(4) + 1, serial);
	}

	Thread thread;

	public static void main(String[] args) {
		FileSystemXmlApplicationContext context = new FileSystemXmlApplicationContext(xmlConfigs);
		DeviceMapper mapper = context.getBean(DeviceMapper.class);
		StatusPlus statusPlus=new StatusPlus(mapper);
		Thread thread = new Thread(statusPlus);
		thread.start();
		Runtime.getRuntime().addShutdownHook(new StopThread(statusPlus));
		try {
			thread.join();
		} catch (InterruptedException e) {
			e.printStackTrace(System.err);
		}

		context.close();
	}
}
