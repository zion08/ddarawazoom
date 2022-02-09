package org.mvc.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.controller.MainController;
import org.springframework.stereotype.Service;


public interface UserInfoService {

	//아이디 중복 확인
	public int idCheck(String id);
	
	//닉네임 중복 확인
	public int nickCheck(String nick);
	
	//아이디 중복 확인
	public int idCheckcoach(String id);
		
	//닉네임 중복 확인
	public int nickCheckcoach(String nick);
	
	//회원가입 정보 입력
	//실행이 일어나기 위해서 필요한 변수값...? 
	public int insertUserInfo(UserInfoDTO dto); 
	
	//코치 회원가입 정보 저장
	public int insertCoachInfo(CoachInfoDTO dto);
	
	//회원 로그인 데이터 가져오기
	public int getUserInfo(UserInfoDTO dto);
	
//	// id 찾기
//	public String getId(String name, String tel);
//	
//	// pw 찾기(이름, 아이디, 이메일 맞는 지 확인 작업)
//	public int findPw(String name, String id, String email);
	
	// 카카오 로그인(카카오에서 가져온 정보 DB에 저장)
	public int kakaoInsert(UserInfoDTO dto);
	
	// 카카오로 로그인한 사용자의 정보가 DB에 저장돼있는지 확인
	public int kakaoCheck(UserInfoDTO dto);
	
	// 네이버 로그인(네이버에서 가져온 정보 DB에 저장)
	public int naverInsert(UserInfoDTO dto);
	
	// 네이버로 로그인한 사용자의 정보가 DB에 저장돼있는지 확인
	public int naverCheck(UserInfoDTO dto);
	
	// 코치 로그인
	public int coachCheck(CoachInfoDTO coachDTO);
	
	
}
