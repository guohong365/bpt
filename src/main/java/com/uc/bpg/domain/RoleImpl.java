package com.uc.bpg.domain;

import java.util.List;

import com.uc.web.domain.AbstractRole;
import com.uc.web.domain.WithLongId;

public class RoleImpl extends AbstractRole implements WithLongId {
	private String uuid;
	private String description;
	private List<FunctionAvailable> functions;
	
	public Long getId(){
		return (Long) super.getId();
	}
	
	public List<FunctionAvailable> getFunctions() {
		return functions;
	}
	
	public void setFunctions(List<FunctionAvailable> functions) {
		this.functions = functions;
	}
	
	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}