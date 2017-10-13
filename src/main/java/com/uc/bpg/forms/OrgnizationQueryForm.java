package com.uc.bpg.forms;

public class OrgnizationQueryForm  extends QueryFormBase  {
	private String queryName;
	@Override
	protected void buildOrderByColumnMap() {
	}
	public String getQueryName() {
		return queryName;
	}
	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}	
}