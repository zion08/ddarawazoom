package org.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.LikeDTO;
import org.mvc.bean.MyProfileDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;
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
	public MyProfileDTO getMyProfile(String id) {
		return mapper.getMyProfile(id);
	}
	
	@Override
	public List<BodyProfileDTO> getBodyProfile(String id) {
		return mapper.getBodyProfile(id);
	}

	@Override
	public List<BodyProfileDTO> bodyList(String id){
		return mapper.bodyList(id);
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
	public BodyProfileDTO getBodyInfo(BodyProfileDTO bodyDTO) {
		return mapper.getBodyInfo(bodyDTO);
	}
	
	@Override
	public int bodyUpdate(BodyProfileDTO bodyDTO) {
		return mapper.bodyUpdate(bodyDTO);
	}

	@Override
	public int bodyDelete(int b_num) {
		return mapper.bodyDelete(b_num);
	}

	
//  멤버 정보 관련
	@Override
	public UserInfoDTO getUserInfo(String id) {
		return mapper.getUserInfo(id);
	}

	@Override
	public int updateInfo(UserInfoDTO userDTO) {
		return mapper.updateInfo(userDTO);
	}

	@Override
	public int updateImg(UserInfoDTO userDTO) {
		return mapper.updateImg(userDTO);
	}

	
// 멤버 일정 관련
	@Override
	public ArrayList<ScheduleDTO> getAllClass(String id) {
		return mapper.getAllClass(id);
	}

	
// 관심 등록 관련
	@Override
	public ArrayList<ZoomDTO> likeZoomList(int num) {
		return mapper.likeZoomList(num);
	}

	@Override
	public Boolean likeCheck(String id, int num) {
		return mapper.likeCheck(id, num);
	}

	@Override
	public int zoomLikeWrite(LikeDTO likeDTO) {
		return mapper.zoomLikeWrite(likeDTO);
	}

	@Override
	public int zoomLikeDelete(LikeDTO likeDTO) {
		return mapper.zoomLikeDelete(likeDTO);
	}
}
