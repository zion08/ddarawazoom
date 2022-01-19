package org.mvc.mybatis;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.MyProfileDTO;
import org.mvc.bean.UserDTO;

public interface MyRoomMapper {

// 바디프로필 관련
	
	public MyProfileDTO getMyProfile(String b_id);
	
	public List<BodyProfileDTO> getBodyProfile(String b_id);
		
	public List<BodyProfileDTO> bodyList(String b_id);
		
	public int myWrite(MyProfileDTO myDTO);
	
	public int myUpdate(MyProfileDTO myDTO);
	
	public int bodyWrite(BodyProfileDTO bodyDTO);
	
	public BodyProfileDTO bodyRead(
			@Param("b_num") int b_num,
			@Param("b_id") String b_id);
	
	public int bodyUpdate(BodyProfileDTO bodyDTO);
	
	public int bodyDelete(int b_num);

	public List<BodyProfileDTO> bodyprofielChart(
			@Param("b_id") String b_id,
			@Param("b_date") Date b_date);
	
	
// 회원 정보 관련 
	
		public UserDTO getUserInfo(String id);
		
		public int updateInfo(UserDTO userDTO);
		
		public int updateImg(UserDTO userDTO);
}
