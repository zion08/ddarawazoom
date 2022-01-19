package org.mvc.service;

import java.util.List;

import org.mvc.bean.UserInfoDTO;
import org.mvc.controller.MainController;
import org.springframework.stereotype.Service;


public interface UserInfoService {

	//회원가입 정보 입력
	//실행이 일어나기 위해서 필요한 변수값...? 
	public int insertUserInfo(UserInfoDTO dto); 
	
	//회원 로그인 데이터 가져오기
	public int getUserInfo(UserInfoDTO dto);
	
}
