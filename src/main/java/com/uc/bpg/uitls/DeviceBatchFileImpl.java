package com.uc.bpg.uitls;

import java.util.HashSet;
import java.util.Set;

public class DeviceBatchFileImpl implements DeviceBatchFile {
	private String action;
	private Long param;	
	private Set<String> items;
	public DeviceBatchFileImpl(String action) {
		this.items=new HashSet<>();
		this.action=action;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Long getParam() {
		return param;
	}
	public void setParam(Long param) {
		this.param = param;
	}
	public Set<String> getItems() {
		return items;
	}
	public void setItems(Set<String> items) {
		this.items = items;
	}
	
	@Override
	public String toString() {
		StringBuilder builder=new StringBuilder();
		builder
		.append("action:[").append(getAction()).append("]").append("\r\n")
		.append("param:[").append(getParam()).append("]").append("\r\n")
		.append("items count=[").append(getItems().size()).append("]").append("\r\n")
		.append("items:[");
		for(String item:getItems()){
			builder.append("[").append(item).append("]");
		}
		builder.append("]").append("\r\n");
		return builder.toString();
	}

}
