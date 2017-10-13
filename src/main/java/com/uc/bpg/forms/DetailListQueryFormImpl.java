package com.uc.bpg.forms;

import com.uc.web.forms.DetailListQueryForm;

public class DetailListQueryFormImpl extends QueryFormBase implements DetailListQueryForm {
	private Long queryMainId;

	public Long getQueryMainId() {
		return queryMainId;
	}

	public void setQueryMainId(Object queryMainId) {
		this.queryMainId = (Long) queryMainId;
	}
}
