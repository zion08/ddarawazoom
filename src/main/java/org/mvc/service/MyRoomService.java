package org.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.LikeDTO;
import org.mvc.bean.MyProfileDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;

public interface MyRoomService {
	
// 바디프로필 관련
	public MyProfileDTO getMyProfile(String id);
	
	public List<BodyProfileDTO> getBodyProfile(String id);
		
	public List<BodyProfileDTO> bodyList(String id);
	
	public int myWrite(MyProfileDTO myDTO);
	
	public int myUpdate(MyProfileDTO myDTO);
	
	public int bodyWrite(BodyProfileDTO bodyDTO);
	
	public BodyProfileDTO getBodyInfo(BodyProfileDTO bodyDTO);
	
	public int bodyUpdate(BodyProfileDTO bodyDTO);
	
	public int bodyDelete(int b_num);
	

// 회원 정보 관련 
	public UserInfoDTO getUserInfo(String id);
	
	public int updateInfo(UserInfoDTO userDTO);
	
	public int updateImg(UserInfoDTO userDTO);
	
	
// 멤버 일정 관련
	public ArrayList<ScheduleDTO> getAllClass(String id);	
	
// 관심 등록 관련
	public ArrayList<ZoomDTO> likeZoomList(int num);

	public Boolean likeCheck(String id, int num);
	
	public int zoomLikeWrite(LikeDTO likeDTO);
	
	public int zoomLikeDelete(LikeDTO likeDTO);
}
