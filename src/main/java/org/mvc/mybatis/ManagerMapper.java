package org.mvc.mybatis;

import java.util.List;

import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.ZoomDTO;

public interface ManagerMapper {

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
}
