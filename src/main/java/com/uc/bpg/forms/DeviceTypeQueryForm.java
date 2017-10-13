package com.uc.bpg.forms;

import java.util.Map;


public class DeviceTypeQueryForm extends QueryFormBase  {
	public static final String COL_NAME="NAME";
	public static final String COL_PRODUCT="PRODUCT";
	public static final String COL_SHOW_ORDER="SHOW_ORDER";
	
	private String queryName;
	private String queryProduct;
	
	
	@Override
	protected void buildOrderByColumnMap() {
		Map<String, String> map= getColumnMap();
		map.put(COL_NAME, COL_NAME);
		map.put(COL_PRODUCT, COL_PRODUCT);
		map.put(COL_SHOW_ORDER, COL_SHOW_ORDER);		
	}


	public String getQueryName() {
		return queryName;
	}


	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}


	public String getQueryProduct() {
		return queryProduct;
	}


	public void setQueryProduct(String queryProduct) {
		this.queryProduct = queryProduct;
	}
}
