package com.uc.bpg.forms;

import com.uc.web.forms.ListQueryFormImpl;
import com.uc.web.tools.annotation.ComponentType;
import com.uc.web.tools.annotation.FormField;

public class QueryFormBase extends ListQueryFormImpl implements IQueryFormBase {
	@FormField(value="所有", order=9999, component=ComponentType.CHECKBOX)
    private Boolean queryAll;
    private Long queryHotel;
    @Override
	protected void buildOrderByColumnMap() {
	}
	public Boolean getQueryAll() {
		return queryAll;
	}
	public void setQueryAll(Boolean queryAll) {
		this.queryAll = queryAll;
	}
	public Long getQueryHotel() {
		return queryHotel;
	}
	public void setQueryHotel(Long queryHotel) {
		this.queryHotel = queryHotel;
	}

}
