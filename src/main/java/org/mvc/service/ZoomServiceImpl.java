package org.mvc.service;

import java.util.List;

import org.mvc.bean.ZoomDTO;
import org.mvc.mybatis.ZoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class ZoomServiceImpl implements ZoomService{

	@Setter(onMethod_=@Autowired)
	private ZoomMapper mapper;
	
	@Override
	public List<ZoomDTO> getList() {
		return mapper.getList();
	}
	
	@Override
	public ZoomDTO getContent(int num) { 
		return mapper.getContent(num); 
	}
	
	@Override
	public int zoomInsert(ZoomDTO dto) {
		return mapper.zoomInsert(dto);
	}
}
