package org.mvc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mvc.bean.ClassApplyDTO;
import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.mybatis.CoachRoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

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
	public List<CoachCareerDTO> getAllCareerInfo(String id) {
		return mapper.getAllCareerInfo(id);
	}

	@Override
	public int updateInfo(CoachInfoDTO dto) {
		return mapper.updateInfo(dto);
	}

	@Override
	public int updateImg(CoachInfoDTO dto) {
		return mapper.updateImg(dto);
	}

	@Override
	public CoachCareerDTO getCareerInfo(CoachCareerDTO dto) {
		return mapper.getCareerInfo(dto);
	}

	@Override
	public int updateCareer(CoachCareerDTO dto) {
		return mapper.updateCareer(dto);
	}

	@Override
	public int insertCareer(CoachCareerDTO dto) {
		return mapper.insertCareer(dto);
	}

	@Override
	public int updateItroduce(CoachInfoDTO dto) {
		return mapper.updateItroduce(dto);
	}

	@Override
	public int deleteCareer(CoachCareerDTO dto) {
		return mapper.deleteCareer(dto);
	}

	@Override
	public List<ZoomDTO> getAllClass(String id, int startRow, int endRow) {
		return mapper.getAllClass(id, startRow, endRow);
	}

	@Override
	public int getClassCount(String id) {
		return mapper.getClassCount(id);
	}

	@Override
	public ZoomDTO getClass(String c_id, Long num) {
		return mapper.getClass(c_id, num);
	}

	@Override
	public List<ReviewDTO> getReview(Long num) {
		return mapper.getReview(num);
	}

	@Override
	public int reviewCount(Long num) {
		return mapper.reviewCount(num);
	}

	@Override
	public List<ClassApplyDTO> getApplyMember(ClassApplyDTO dto) {
		return mapper.getApplyMember(dto);
	}

	@Override
	public int applyMemberCount(int num) {
		return mapper.applyMemberCount(num);
	}
	
}
