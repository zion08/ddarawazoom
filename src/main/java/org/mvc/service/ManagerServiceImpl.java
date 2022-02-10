package org.mvc.service;

import java.util.List;

import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.mybatis.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerMapper mapper;

	@Override
	public List<CoachInfoDTO> getAllCoachInfo() {
		return mapper.getAllCoachInfo();
	}

	@Override
	public int countAllCoach() {
		return mapper.countAllCoach();
	}

	@Override
	public CoachInfoDTO coachInfo(String c_id) {
		return mapper.coachInfo(c_id);
	}

	@Override
	public List<CoachCareerDTO> coachCareer(String c_id) {
		return mapper.coachCareer(c_id);
	}

	@Override
	public List<ZoomDTO> getCoachClass(String c_id) {
		return mapper.getCoachClass(c_id);
	}

	@Override
	public int deleteClass(int num) {
		return mapper.deleteClass(num);
	}

	@Override
	public int restoreClass(int num) {
		return mapper.restoreClass(num);
	}

	@Override
	public int changeStatus(CoachInfoDTO dto) {
		return mapper.changeStatus(dto);
	}

	@Override
	public List<UserInfoDTO> getAllUserInfo() {
		return mapper.getAllUserInfo();
	}

	@Override
	public int countAllUser() {
		return mapper.countAllUser();
	}

	@Override
	public UserInfoDTO userInfo(String id) {
		return mapper.userInfo(id);
	}

	@Override
	public int updateUserPw(UserInfoDTO userDTO) {
		return mapper.updateUserPw(userDTO);
	}

	@Override
	public int userDelete(String id) {
		return mapper.userDelete(id);
	}

	@Override
	public int newUserCount() {
		return mapper.newUserCount();
	}
	
	@Override
	public List<UserInfoDTO> newUser() {
		return mapper.newUser();
	}

	@Override
	public List<UserInfoDTO> getDeleteUser() {
		return mapper.getDeleteUser();
	}

	@Override
	public int getDeleteUserCount() {
		return mapper.getDeleteUserCount();
	}

}
