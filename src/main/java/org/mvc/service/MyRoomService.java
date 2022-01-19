package org.mvc.service;

import java.util.List;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.MyProfileDTO;
import org.mvc.bean.UserDTO;

public interface MyRoomService {
	
// 바디프로필 관련
	
	public MyProfileDTO getMyProfile(String b_id);
	
	public List<BodyProfileDTO> getBodyProfile(String b_id);
		
	public List<BodyProfileDTO> bodyList(String b_id);
	
	public int myWrite(MyProfileDTO myDTO);
	
	public int myUpdate(MyProfileDTO myDTO);
	
	public int bodyWrite(BodyProfileDTO bodyDTO);
	
	public BodyProfileDTO bodyRead(int b_num, String b_id);
	
	public int bodyUpdate(BodyProfileDTO bodyDTO);
	
	public int bodyDelete(int b_num);
	

// 회원 정보 관련 
	
	public UserDTO getUserInfo(String id);
	
	public int updateInfo(UserDTO userDTO);
	
	public int updateImg(UserDTO userDTO);
}
