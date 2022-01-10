package org.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.mvc.bean.ScheduleDTO;

public interface CoachRoomService {

	// 스케쥴 데이터 가져오기
	public ArrayList<ScheduleDTO> getSchedule();
	
	// 스케쥴 작성
	public int insertEvent(ScheduleDTO dto);
}
