package com.uc.bpg.export;

import java.text.SimpleDateFormat;
import com.uc.bpg.domain.Examine;
import com.uc.utils.export.ValueFormatter;

public class ExamineFormatter implements ValueFormatter<Examine>{

	@Override
	public String get(int column, Examine item) {
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		switch(column){
		case 0:
			return item.getMac();
		case 1:
			return item.getStatus().toString();
		case 2:
			return format.format(item.getRecvTime());
		case 3:
			return item.getData();
		}
		return null;
	}

	@Override
	public int getCount() {
		return 4;
	}

}
