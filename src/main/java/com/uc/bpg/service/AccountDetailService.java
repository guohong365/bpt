package com.uc.bpg.service;

import com.uc.bpg.domain.Bill;
import com.uc.web.service.AppDetailService;

public interface AccountDetailService extends AppDetailService{

	int pay(Bill detail);
	int verify(Bill detail);

}
