package org.mvc.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.ScheduleDTO;

public interface CoachRoomMapper {

	// 스케쥴 데이터 가져오기
	public ArrayList<ScheduleDTO> getAllSchedule(String id);
	
	// 스케쥴 작성
	public int insertSchedule(ScheduleDTO dto);
	
	// 스케쥴 삭제
	public int deleteSchedule(ScheduleDTO dto);
	
	// 스케쥴 수정
	public int updateSchedule(ScheduleDTO dto);
	
	// 수정할 스케쥴 가져오기
	public ScheduleDTO getSchedule(ScheduleDTO dto);
	
	// 코치 기본정보
	public CoachInfoDTO getCoachInfo(String id);
	
	// 모든 코치 경력정보
	public List<CoachCareerDTO> getAllCareerInfo(String id);
	
	// 수정할 경력 정보
	public CoachCareerDTO getCareerInfo(CoachCareerDTO dto);
	
	// 경력 정보 수정
	public int updateCareer(CoachCareerDTO dto);
	
	// 코치 정보수정
	public int updateInfo(CoachInfoDTO dto);
	
	// 코치 프로필사진 수정
	public int updateImg(CoachInfoDTO dto);
}
