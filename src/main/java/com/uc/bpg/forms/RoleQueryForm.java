package com.uc.bpg.forms;

public class RoleQueryForm extends QueryFormBase  {
	private static final String ORDER_BY_COLUMN_NAME = "角色名称";
	private String queryName;
	private Boolean queryValid;
	private Boolean queryInternal;
	@Override
	protected void buildOrderByColumnMap() {
		getColumnMap().put(ORDER_BY_COLUMN_NAME, "NAME");
	}
	public String getQueryName() {
		return queryName;
	}
	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}
	public Boolean getQueryValid() {
		return queryValid;
	}
	public void setQueryValid(Boolean queryValid) {
		this.queryValid = queryValid;
	}
	public Boolean getQueryInternal() {
		return queryInternal;
	}
	public void setQueryInternal(Boolean queryInternal) {
		this.queryInternal = queryInternal;
	}

}