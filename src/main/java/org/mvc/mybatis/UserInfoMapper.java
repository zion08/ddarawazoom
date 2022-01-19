package org.mvc.mybatis;

import java.util.List;

import org.mvc.bean.UserInfoDTO;

public interface UserInfoMapper {

	//아이디 중복 확인
	//public List<UserInfoDTO> getList(String id);
	
	//회원가입 정보 저장
	public int insertUserInfo(UserInfoDTO dto);
	
	//회원 가입일자
	//public List<UserInfoDTO> getList( regdate);
	
	//회원 로그인 하기. 그러려면 id 와 pw 를 데이터와 비교해야 한다
	public int getUserInfo(UserInfoDTO dto);
	
}
