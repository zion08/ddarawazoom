package org.mvc.service;

import java.util.List;

import org.mvc.bean.UserDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.mybatis.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int getUserInfo(UserInfoDTO dto) {
		return mapper.getUserInfo(dto);
	}

	@Override
	public int kakaoInsert(UserDTO dto) {
		return mapper.kakaoInsert(dto);
	}

	@Override
	public int kakaoCheck(UserDTO dto) {
		return mapper.kakaoCheck(dto);
	}

	
	
	
}
