package com.uc.bpg.uitls;

import java.io.IOException;
import java.util.Arrays;
import java.util.Set;

import org.springframework.util.StringUtils;

import com.uc.bpg.controller.DeviceDetailListController;
import com.uc.utils.LoggerSupportorImpl;

public class DeviceBatchFileParserImpl extends LoggerSupportorImpl implements DeviceBatchFileParser {
	@Override
	public DeviceBatchFile parser(byte[] fileBytes) throws IOException{
		String allLiens=new String(fileBytes, "GBK");
		getLogger().trace(allLiens);
		
		String[] lines=allLiens.split("\r\n|\n");
		
		int index=0;
		String line;
		String action = null;
		while(index<lines.length){
			line=lines[index].trim();
			if(line.isEmpty()) {
				index ++;
				continue;
			}
			if(line.startsWith(DeviceBatchFile.BATCH_ADD)){
				action=DeviceDetailListController.ACTION_BATCH_ADD;
			} else if(line.startsWith(DeviceBatchFile.BATCH_ALLOT)){
				action=DeviceDetailListController.ACTION_BATCH_ALLOT;
			} else if(line.startsWith(DeviceBatchFile.BATCH_WITHDRAW)){
				action=DeviceDetailListController.ACTION_BATCH_WITHDRAW;
			} else if(line.startsWith(DeviceBatchFile.BATCH_SCRAP)){
				action=DeviceDetailListController.ACTION_BATCH_SCRAP;
			} else {				
				throw new IllegalHeaderFormat("文件头部格式错误");
			}
			index++;
			break;
		};		
		DeviceBatchFile batchFile=new DeviceBatchFileImpl(action);
		parseLines(lines, index, batchFile.getItems());
		getLogger().trace("parse Finished......");
		return batchFile;

	}

	protected void parseLines(String[] lines, int offset, Set<String> items){
		getLogger().trace("lines={}, start from line[{}]", lines.length, offset);
		String line="";
		while(offset<lines.length){
			getLogger().trace("parse line[{}] [{}]。。。。", offset, lines[offset]);
			line=lines[offset].trim();
			if(line.isEmpty()){
				getLogger().trace("line is empty.....");				
				offset++;
				continue;
			}
			
			String[] serials=line.split(" |\\t|,|，");
			if(getLogger().isTraceEnabled()){
				String string= StringUtils.collectionToDelimitedString(Arrays.asList(serials), ",", "[", "]");
				getLogger().trace("line split to [{}]", string);
			}
			for(String serial:serials){
				serial=serial.trim().toUpperCase();
				if(serial.length()>0){
					items.add(serial);
				}
			}
			offset++;
		}
	}			
}
