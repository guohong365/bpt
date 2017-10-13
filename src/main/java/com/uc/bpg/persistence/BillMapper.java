package com.uc.bpg.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uc.bpg.domain.Bill;
import com.uc.bpg.domain.DeviceUsage;
import com.uc.web.persistence.AppMapper;

public interface BillMapper extends AppMapper {

	void insertGeneratedBill(
			@Param("bill")
			Bill bill,
			@Param("usages")
			List<DeviceUsage> usages);
}