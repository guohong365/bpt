package com.uc.bpg.uitls;

import java.util.ArrayList;
import java.util.List;

public class BatchProcessResult {
	private String msg;
	private List<BatchProcessResultItem> items;
	
	public BatchProcessResult() {
		items=new ArrayList<>();
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public List<BatchProcessResultItem> getItems() {
		return items;
	}
	
	public void add(BatchProcessResultItem item){
		items.add(item);
	}

	public String toJson() {
		StringBuilder builder=new StringBuilder();
		builder.append("{\"msg\":\"").append(getMsg()).append("\"");
		if(!getItems().isEmpty()){
			builder.append(",").append("\"details\":[");
			
			for(int index=0; index<getItems().size(); index++){
				BatchProcessResultItem item=getItems().get(index);
				builder
				.append("{\"item\":\"").append(item.getItem()).append("\",")
				.append("\"ok\":\"").append(item.isOk()?"成功":"失败").append("\",")
				.append("\"msg\":\"").append(item.getMsg()).append("\"}");
				if(index<getItems().size()-1){
					builder.append(",");
				}
			}			
			builder.append("]");
		}
		builder.append("}");
		return builder.toString();
	}
	
}
