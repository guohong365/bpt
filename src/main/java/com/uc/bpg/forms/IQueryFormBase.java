package com.uc.bpg.forms;

import com.uc.web.forms.ListQueryForm;

public interface IQueryFormBase extends ListQueryForm {
	Long getQueryHotel();
	void setQueryHotel(Long hotel);

}
