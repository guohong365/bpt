package com.uc.bpg.persistence;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uc.web.persistence.AppMapper;

public interface ChargingMapper extends AppMapper {

	BigDecimal selectChargingStandard(
			@Param("ids")
			List<Long> ids);
}