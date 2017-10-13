package com.uc.bpg.forms;

import java.util.Map;

public class UserQueryForm extends QueryFormBase {
	public static final String ORDER_BY_COLUMN_LOGIN_ID="用户ID";
	public static final String ORDER_BY_COLUMN_NAME="用户姓名";
	public static final String ORDER_BY_COLUMN_ORG="所属机构";
	public static final String ORDER_BY_COLUMN_TYPE="用户类型";
	
	private String queryLoginId;
	private String queryName;
	private Boolean queryValid;
	private String queryOrgName;
	private String queryOrgType;
	public String getQueryLoginId() {
		return queryLoginId;
	}
	public void setQueryLoginId(String queryLoginId) {
		this.queryLoginId = queryLoginId;
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
	public String getQueryOrgName() {
		return queryOrgName;
	}
	public void setQueryOrgName(String queryOrgName) {
		this.queryOrgName = queryOrgName;
	}
	public String getQueryOrgType() {
		return queryOrgType;
	}
	public void setQueryOrgType(String queryOrgType) {
		this.queryOrgType = queryOrgType;
	}
	
	@Override
	protected void buildOrderByColumnMap() {
		Map<String,String> map=getColumnMap();
		map.clear();
		map.put(ORDER_BY_COLUMN_LOGIN_ID, "LOGIN_ID");
		map.put(ORDER_BY_COLUMN_NAME, "NAME");
		map.put(ORDER_BY_COLUMN_ORG, "ORG_NAME");
		map.put(ORDER_BY_COLUMN_TYPE, "ORG_TYPE");
	}
	
}