package org.mvc.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.mybatis.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
  
public class UserInfoServiceImpl implements UserInfoService{
	
	@Setter(onMethod_=@Autowired) //mapper를 끌어다 놨다.
	private UserInfoMapper mapper;
	
	@Override
	public int insertUserInfo(UserInfoDTO dto) {
		return mapper.insertUserInfo(dto);
	}
	
	@Override
	public int insertCoachInfo(CoachInfoDTO dto) {
		return mapper.insertCoachInfo(dto);
	}

	@Override
	public int getUserInfo(UserInfoDTO dto) {
		return mapper.getUserInfo(dto);
	}

	@Override
	public int kakaoInsert(UserInfoDTO dto) {
		return mapper.kakaoInsert(dto);
	}

	@Override
	public int kakaoCheck(UserInfoDTO dto) {
		return mapper.kakaoCheck(dto);
	}

	@Override
	public int naverInsert(UserInfoDTO dto) {
		return mapper.naverInsert(dto);
	}

	@Override
	public int naverCheck(UserInfoDTO dto) {
		return mapper.naverCheck(dto);
	}

	@Override
	public int coachCheck(CoachInfoDTO coachDTO) {
		return mapper.coachCheck(coachDTO);
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}
	
	@Override
	public int idCheckcoach(String id) {
		return mapper.idCheckcoach(id);
	}
	
	@Override
	public int nickCheck(String nick) {
		return mapper.nickCheck(nick);
	}
	
	@Override
	public int nickCheckcoach(String nick) {
		return mapper.nickCheckcoach(nick);
	}

//	@Override
//	public String getId(String name, String tel) {
//		return mapper.getId(name, tel);
//	}
//
//
//	@Override
//	public int findPw(String name, String id, String email) {
//		return mapper.findPw(name, id, email);
//	}
	


	

}


	
	
	
	
	



	

