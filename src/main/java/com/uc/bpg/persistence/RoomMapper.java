package com.uc.bpg.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uc.bpg.domain.Room;
import com.uc.web.persistence.AppMapper;

public interface RoomMapper extends AppMapper {

	boolean selectExistsRoom(
			@Param("hotel")
			Long hotel,
			@Param("storey")
			Integer storey,
			@Param("room")
			String roomNo);

	void insertBatch(
			@Param("rooms")
			List<Room> rooms);
}