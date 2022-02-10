package org.mvc.service;

import java.util.List;

import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.UserInfoDTO;
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
	
	// 모든 멤버 정보
	public List<UserInfoDTO> getAllUserInfo();
	
	// 모든 멤버 수
	public int countAllUser();
	
	// 멤버 한 명의 정보
	public UserInfoDTO userInfo(String id);
	
	// 멤버 비밀번호 변경
	public int updateUserPw(UserInfoDTO userDTO);
	
	// 멤버 탈퇴
	public int userDelete(String id);
	
	// 신규 가입자 수
	public int newUserCount();
	
	// 오늘의 신규 가입자 리스트
	public List<UserInfoDTO> newUser();
	
	// 탈퇴 멤버 
	public List<UserInfoDTO> getDeleteUser();
	
	// 탈퇴 멤버 수
	public int getDeleteUserCount();
}
