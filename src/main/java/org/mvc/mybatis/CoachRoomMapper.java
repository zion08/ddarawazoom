package org.mvc.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mvc.bean.ScheduleDTO;

public interface CoachRoomMapper {

	// 스케쥴 데이터 가져오기
	public ArrayList<ScheduleDTO> getAllSchedule();
	
	// 스케쥴 작성
	public int insertSchedule(ScheduleDTO dto);
	
	// 스케쥴 삭제
	public int deleteSchedule(ScheduleDTO dto);
	
	// 스케쥴 수정
	public int updateSchedule(ScheduleDTO dto);
	
	// 수정할 스케쥴 가져오기
	public ScheduleDTO getSchedule(ScheduleDTO dto);
}
