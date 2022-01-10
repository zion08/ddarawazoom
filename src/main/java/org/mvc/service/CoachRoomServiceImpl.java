package org.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.mvc.bean.ScheduleDTO;
import org.mvc.mybatis.CoachRoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class CoachRoomServiceImpl implements CoachRoomService{

	@Setter(onMethod_=@Autowired)
	private CoachRoomMapper mapper;

	@Override
	public ArrayList<ScheduleDTO> getSchedule() {
		return mapper.getSchedule();
	}

	@Override
	public int insertEvent(ScheduleDTO dto) {
		return mapper.insertEvent(dto);
	}
	
}
