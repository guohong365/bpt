package com.uc.bpg.service.impl;

import java.util.Arrays;

import org.springframework.util.StringUtils;

import com.uc.bpg.forms.BillQueryForm;
import com.uc.bpg.service.AccountListService;
import com.uc.bpg.service.BusinessListServiceBase;
import com.uc.web.persistence.Example;
import com.uc.web.persistence.QueryCondition;

public class AccountListServiceImpl extends BusinessListServiceBase<BillQueryForm> implements AccountListService {

	public boolean prepareExample(BillQueryForm queryForm, Example example) {
		super.prepareExample(queryForm, example);
		QueryCondition condition = example.or();
		if (queryForm.getQueryGeneratedTimeFrom() != null) {
			condition.andFieldGreaterThanOrEqualTo("GENERATED_TIME", queryForm.getQueryGeneratedTimeFrom());
		}
		if (queryForm.getQueryGeneratedTimeTo() != null) {
			condition.andFieldLessThanOrEqualTo("GENERATED_TIME", queryForm.getQueryGeneratedTimeTo());
		}
		if (queryForm.getQueryHotel() != null) {
			condition.andFieldEqualTo("HOTEL", queryForm.getQueryHotel());
		} else {
			if (!StringUtils.isEmpty(queryForm.getQueryHotelName())) {
				condition.andFieldLike("HOTEL_NAME", queryForm.getQueryHotelName());
			} else {
				queryForm.setQueryHotelName(null);
			}
		}
		if (queryForm.getQueryIncomeFrom() != null) {
			condition.andFieldGreaterThanOrEqualTo("INCOME", queryForm.getQueryIncomeFrom());
		}
		if (queryForm.getQueryIncomeTo() != null) {
			condition.andFieldLessThanOrEqualTo("INCOME", queryForm.getQueryIncomeTo());
		}
		if (queryForm.getQueryPayableFrom() != null) {
			condition.andFieldGreaterThanOrEqualTo("BASIC_CHARGE", queryForm.getQueryPayableFrom());
		}
		if (queryForm.getQueryPayableTo() != null) {
			condition.andFieldLessThanOrEqualTo("BASIC_CHARGE", queryForm.getQueryPayableTo());
		}
		boolean isAll = true;
		String[] states = null;
		if (!StringUtils.isEmpty(queryForm.getQueryState())) {
			isAll = false;
			states = queryForm.getQueryState().split(",");
			for (String state : states) {
				if (state.isEmpty()) {
					queryForm.setQueryState(null);
					isAll = true;
					break;
				}
			}
		}
		if (!isAll) {
			condition.andFieldIn("STATE", Arrays.asList(states));
		} else {
			queryForm.setQueryState(null);
		}
		if (queryForm.getQueryVerifyTimeFrom() != null) {
			condition.andFieldGreaterThanOrEqualTo("VERIFY_TIME", queryForm.getQueryVerifyTimeFrom());
		}
		if (queryForm.getQueryVerifyTimeTo() != null) {
			condition.andFieldLessThanOrEqualTo("VERIFY_TIME", queryForm.getQueryVerifyTimeTo());
		}
		if (!StringUtils.isEmpty(queryForm.getQueryPayerName())) {
			condition.andFieldLike("PAYER_NAME", queryForm.getQueryPayerName());
		} else {
			queryForm.setQueryPayerName(null);
		}
		if (!StringUtils.isEmpty(queryForm.getQueryVerifierName())) {
			condition.andFieldLike("VERIFIER_NAME", queryForm.getQueryVerifierName());
		} else {
			queryForm.setQueryVerifierName(null);
		}

		return true;
	}
}
