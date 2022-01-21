package org.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.MyProfileDTO;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.VodDTO;
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
	public ArrayList<ZoomDTO> likeZoomList(String id) {
		return mapper.likeZoomList(id);
	}

	@Override
	public int zoomLikeCheck(String id, Long num) {
		return mapper.zoomLikeCheck(id, num);
	}

	@Override
	public int zoomLikeWrite(String id, int num) {
		return mapper.zoomLikeWrite(id, num);
	}

	@Override
	public int zoomLikeDelete(String id, int num) {
		return mapper.zoomLikeDelete(id, num);
	}

	@Override
	public ArrayList<VodDTO> likeVodList(String id){
		return mapper.likeVodList(id);
	}
	
	@Override
	public int vodLikeCheck(String id, int num) {
		return mapper.vodLikeCheck(id, num);
	}

	@Override
	public int vodLikeWrite(String id, int num) {
		return mapper.vodLikeWrite(id, num);
	}

	@Override
	public int vodLikeDelete(String id, int num) {
		return mapper.vodLikeDelete(id, num);
	}
	
// 리뷰 관련
	@Override
	public List<ReviewDTO> getReview(Long num, String id) {
		return mapper.getReview(num, id);
	}

	@Override
	public int reviewCount(String id) {
		return mapper.reviewCount(id);
	}

	@Override
	public ReviewDTO getMyReview(ReviewDTO reviewDTO) {
		return mapper.getMyReview(reviewDTO);
	}
	
	@Override
	public int updateReview(ReviewDTO reviewDTO) {
		return mapper.updateReview(reviewDTO);
	}

	@Override
	public int deleteReview(ReviewDTO reviewDTO) {
		return mapper.deleteReview(reviewDTO);
	}

}
