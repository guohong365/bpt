package com.uc.bpg.domain;

import com.uc.web.domain.AbstractFunction;
import com.uc.web.domain.WithLongId;

public class FunctionImpl extends AbstractFunction implements WithLongId  {
	private String uuid;
	private String description;
	
	@Override
	public Long getId() {
		return (Long) super.getId();
	}	
	public void setId(Long id) {
		super.setId(id);
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