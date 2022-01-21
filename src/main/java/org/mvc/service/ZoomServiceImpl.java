package org.mvc.service;

import java.util.List;

import org.mvc.bean.LikeDTO;
import org.mvc.bean.ReviewDTO;
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
	public List<ZoomDTO> zoomList(int firstRownum, int lastRownum) { 
		return mapper.zoomList(firstRownum, lastRownum); 
	}
	
	@Override
	public int zoomInsert(ZoomDTO dto) {
		log.info("dto=" + dto);
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
	
	// 후기관련
	@Override
	public List<ReviewDTO> reList(int firstRownum, int lastRownum) { 
		return mapper.reList(firstRownum, lastRownum);
	}

	@Override
	public int reInsert(ReviewDTO dto) {
		return mapper.reInsert(dto);
	}


	@Override
	public int reCount(Long num) {
		return mapper.reCount(num);  
	}

	@Override
	public List<ReviewDTO> reContent(Long class_num) {
		return mapper.reContent(class_num);
	}
}
