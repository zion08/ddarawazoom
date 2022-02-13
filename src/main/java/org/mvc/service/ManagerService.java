package org.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.ZoomDTO;

public interface ManagerService {

	// 등록된 모든 코치 정보
	public List<CoachInfoDTO> getAllCoachInfo();
	
	// 등록된 모든 코치의 수
	public int countAllCoach();
	
	// 코치 한 명의 정보
	public CoachInfoDTO coachInfo(String c_id);
	
	// 코치 한 명의 경력정보
	public List<CoachCareerDTO> coachCareer(String c_id);
	
	// 코치가 등록한 강의 정보
	public List<ZoomDTO> getCoachClass(String c_id);
	
	// 코치 강의 삭제
	public int deleteClass(int num);
	
	// 코치 강의 복구
	public int restoreClass(int num);
	
	// 코치 상태 변경
	public int changeStatus(CoachInfoDTO dto);
	
	// 관리자 강의 삭제
	public int zoomClassDelete(Long num);
	
	// 관리자 강의 검색 관련
	public int zoomSearchCount(@Param("sort")String sort, @Param("search")String search);
	
	public List<ZoomDTO> zoomSearchList(@Param("startRow") int startRow, @Param("endRow")int endRow, @Param("sort")String sort, @Param("search")String search); 
}
