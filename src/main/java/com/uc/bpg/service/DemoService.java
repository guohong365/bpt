package com.uc.bpg.service;

import java.util.List;

import com.uc.bpg.domain.Hotel;

public interface DemoService {
	void insertStatus(Long hotel);
	void insertUsages(Long hotel, int times);
	void insertBills(Long hotel);
	List<Hotel> selectHotels();

}
