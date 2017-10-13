package com.uc.bpg.controller;

import com.uc.bpg.domain.Room;
import com.uc.web.controller.DetailController;


public interface RoomDetailController extends DetailController<Long, Room>{
	String postBatchAdd(Integer storey, String pattern, Integer begin, Integer end, Boolean ignoreDuplicated);
}
