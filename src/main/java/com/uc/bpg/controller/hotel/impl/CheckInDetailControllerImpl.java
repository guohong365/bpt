package com.uc.bpg.controller.hotel.impl;

import com.uc.bpg.controller.BusinessDetailControllerBase;
import com.uc.bpg.controller.CheckInDetailController;
import com.uc.bpg.domain.CheckIn;

public class CheckInDetailControllerImpl extends BusinessDetailControllerBase<CheckIn> implements CheckInDetailController {
	@Override
	protected CheckIn onCreateEntity() {
		return new CheckIn();
	}
}
