package org.mvc.service;

import java.util.List;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.MyProfileDTO;
import org.mvc.bean.UserDTO;
import org.mvc.mybatis.MyRoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;


@Service
public class MyRoomServiceImpl implements MyRoomService {

// 바디프로필 관련

	@Setter(onMethod_=@Autowired)
	private MyRoomMapper mapper;

	@Override
	public MyProfileDTO getMyProfile(String b_id) {
		return mapper.getMyProfile(b_id);
	}
	
	@Override
	public List<BodyProfileDTO> getBodyProfile(String b_id) {
		return mapper.getBodyProfile(b_id);
	}

	@Override
	public List<BodyProfileDTO> bodyList(String b_id){
		return mapper.bodyList(b_id);
	}
	
	@Override
	public int myWrite(MyProfileDTO myDTO) {
		return mapper.myWrite(myDTO);
	}
	
	@Override
	public int myUpdate(MyProfileDTO myDTO) {
		return mapper.myUpdate(myDTO);
	}

	@Override
	public int bodyWrite(BodyProfileDTO bodyDTO) {
		return mapper.bodyWrite(bodyDTO);
	}

	@Override
	public BodyProfileDTO bodyRead(int b_num, String b_id) {
		return mapper.bodyRead(b_num, b_id);
	}
	
	@Override
	public int bodyUpdate(BodyProfileDTO bodyDTO) {
		return mapper.bodyUpdate(bodyDTO);
	}

	@Override
	public int bodyDelete(int b_num) {
		return mapper.bodyDelete(b_num);
	}

	
// 회원정보 관련
	
	@Override
	public UserDTO getUserInfo(String id) {
		return mapper.getUserInfo(id);
	}

	@Override
	public int updateInfo(UserDTO userDTO) {
		return mapper.updateInfo(userDTO);
	}

	@Override
	public int updateImg(UserDTO userDTO) {
		return mapper.updateImg(userDTO);
	}

}
