package org.mvc.mybatis;


import org.mvc.bean.UserInfoDTO;

public interface UserInfoMapper {

	//아이디 중복 확인
	//public List<UserInfoDTO> getList(String id);
	
	//회원가입 정보 저장
	public int insertUserInfo(UserInfoDTO dto);
	
	//회원 가입일자
	//public List<UserInfoDTO> getList( regdate);
}
