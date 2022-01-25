package org.mvc.service;

import java.util.List;

import org.mvc.bean.ReviewDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.mybatis.ZoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ZoomServiceImpl implements ZoomService{ 

	@Setter(onMethod_=@Autowired)
	private ZoomMapper mapper;
	
	// 코치강의관련
	@Override
	public List<ZoomDTO> zoomList(int startRow, int endRow) { 
		return mapper.zoomList(startRow, endRow);  
	}
	
	@Override
	public int zoomInsert(ZoomDTO dto) {
		return mapper.zoomInsert(dto);
	}

	@Override
	public int zoomDelete(int num) {
		return mapper.zoomDelete(num);
	}
	
	@Override
	public int zoomUpdate(ZoomDTO dto) {   
		return mapper.zoomUpdate(dto);
	}

	@Override
	public int zoomCount() {
		return mapper.zoomCount();
	}

	@Override
	public int zoomReadcount(int num) {
		return mapper.zoomReadcount(num);  
	}

	@Override
	public int imgUpdate(ZoomDTO dto) {
		return mapper.imgUpdate(dto);
	}
	
	@Override
	public ZoomDTO zoomContent(int num) { 
		return mapper.zoomContent(num); 
	}
	
	// 페이관련
	@Override
	public int getPrice(String merchant_Uid) {
		return mapper.getPrice(merchant_Uid);
	}

	// 후기관련
	@Override
	public List<ReviewDTO> reviewList(int startRow, int endRow) { 
		return mapper.reviewList(startRow, endRow);  
	}

	@Override
	public int reInsert(ReviewDTO dto) {
		return mapper.reInsert(dto);
	}


	@Override
	public int reCount(int num) {
		return mapper.reCount(num);  
	}

	@Override
	public UserInfoDTO getUserInfo(String id) {
		return mapper.getUserInfo(id); 
	}
	
	

}
