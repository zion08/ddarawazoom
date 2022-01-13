package org.mvc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
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
	public ArrayList<ScheduleDTO> getAllSchedule(String id) {
		return mapper.getAllSchedule(id);
	}

	@Override
	public int insertSchedule(ScheduleDTO dto) {
		return mapper.insertSchedule(dto);
	}

	@Override
	public int deleteSchedule(ScheduleDTO dto) {
		return mapper.deleteSchedule(dto);
	}

	@Override
	public int updateSchedule(ScheduleDTO dto) {
		return mapper.updateSchedule(dto);
	}

	@Override
	public ScheduleDTO getSchedule(ScheduleDTO dto) {
		return mapper.getSchedule(dto);
	}

	@Override
	public CoachInfoDTO getCoachInfo(String id) {
		return mapper.getCoachInfo(id);
	}

	@Override
	public List<CoachCareerDTO> getCareerInfo(String id) {
		return mapper.getCareerInfo(id);
	}

	@Override
	public int updateInfo(CoachInfoDTO dto) {
		return mapper.updateInfo(dto);
	}
	
}
