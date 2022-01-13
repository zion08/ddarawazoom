package org.mvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.service.CoachRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coachroom")
public class CoachRoomController {

	@Setter(onMethod_=@Autowired)
	private CoachRoomService service;
	
//  =========== 코치룸 메인화면 ===========  //	
	@RequestMapping()
	public String main() {
		log.info("	-----CT----->coachMain");
		return "/coachroom/main";
	}
	
//  =========== 코치정보 관련 코드 시작 ===========  //	
	@RequestMapping("/info")
	public String info(HttpSession session, Model model) {
		log.info("	-----CT----->coachInfo");
		String c_id = (String)session.getAttribute("c_id");
		
		// 임시 코치 아이디
		c_id = "kimcoach";
		
		model.addAttribute("coachInfo", service.getCoachInfo(c_id));
		model.addAttribute("coachCareer", service.getCareerInfo(c_id));
		
		return "/coachroom/coachinfo/info";
	}

	@RequestMapping("/infoUpdate")
	public String infoUpdate(HttpSession session, Model model) {
		log.info("	-----CT----->coachInfoUpdate");
		
		String c_id = (String)session.getAttribute("c_id");
		
		// 임시 코치 아이디
		c_id = "kimcoach";
		
		model.addAttribute("coachInfo", service.getCoachInfo(c_id));
		
		return "/coachroom/coachinfo/infoUpdate";
	}
	
	@RequestMapping("/infoUpdateData")
	public @ResponseBody int infoUpdateData(@RequestBody CoachInfoDTO dto, HttpSession session) {
		log.info("	-----CT----->infoUpdateData");
		log.info(""+dto);
		
		if(dto.getC_gender().equals("0")) {
			dto.setC_gender("남성");
		} else if(dto.getC_gender().equals("1")) {
			dto.setC_gender("여성");
		}
		
		String c_id = (String)session.getAttribute("c_id");
		
		// 임시 코치 아이디
		c_id = "kimcoach";
		
		dto.setC_id(c_id);
		int result = service.updateInfo(dto);
		
		return result;
	}
//  =========== 코치정보 관련 코드 종료 ===========  //	
	
//  =========== 스케줄 관련 코드 시작 ===========  //
	@RequestMapping("/schedule")
	public String coachSchedule() {
		log.info("	-----CT----->coachSchedule");
		
		return "/coachroom/schedule/schedule";
	}
	
	@RequestMapping("/getSchedule")
	public @ResponseBody ArrayList<ScheduleDTO> getSchedule(HttpSession session, Model model) {
		log.info("	-----CT----->getSchedule");
		String c_id = (String)session.getAttribute("c_id");
		
		// 임시 코치 아이디
		c_id = "kimcoach";
		return service.getAllSchedule(c_id);
	}
	
	@RequestMapping("/add_event")
	public String add_event() {
		log.info("	-----CT----->add_event");
		return "/coachroom/schedule/schedule_add";
	}
	
	@RequestMapping("/add_eventPro")
	public @ResponseBody int add_eventPro(@RequestBody ScheduleDTO dto) throws ParseException {
		log.info("	-----CT----->add_eventPro");
		
		// 날짜와 시간정보를 각각 String 값으로 받은 후 두개를 합쳐서 Date 타입으로 변환 후 데이터 삽입
		String startStr = dto.getStart_date() +" "+ dto.getStart_time();
		String endStr = dto.getEnd_date() + " " + dto.getEnd_time();
				
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		Date start = transFormat.parse(startStr);
		Date end = transFormat.parse(endStr);
				
		dto.setStart(start);
		dto.setEnd(end);
		
		int result = service.insertSchedule(dto);
		
		return result;
	}
	
	@RequestMapping("/schedule_popup")
	public String sechedule_popup(ScheduleDTO dto, Model model) {
		log.info("	-----CT----->schedule_popup");
		log.info(""+dto);
		model.addAttribute("dto", dto);
		return "/coachroom/schedule/schedule_popup";
	}
	
	@RequestMapping("/delete_event")
	public @ResponseBody int delete_event(int id) {
		log.info("	-----CT----->delete_event // id ----->"+id);
		
		ScheduleDTO dto = new ScheduleDTO();
		dto.setId(id);
		int result = service.deleteSchedule(dto);
		return result;
	}
	
	@RequestMapping("/update_schedule")
	public String update_schedule(HttpSession session, ScheduleDTO dto, Model model) {
		log.info("	-----CT----->update_schedule");
		log.info(""+dto.getId());
		
		String c_id = (String)session.getAttribute("c_id");
		
		// 임시 코치 아이디
		c_id = "kimcoach";
		dto.setC_id(c_id);
		
		log.info(""+service.getSchedule(dto));
		
		model.addAttribute("schedule", service.getSchedule(dto));
		return "/coachroom/schedule/schedule_update";
	}
	
	@RequestMapping("/update_schedulePro")
	public @ResponseBody int update_schedulePro(@RequestBody ScheduleDTO dto) throws ParseException {
		log.info("	-----CT----->update_schedulePro");
		log.info(""+dto);
		
		// 날짜와 시간정보를 각각 String 값으로 받은 후 두개를 합쳐서 Date 타입으로 변환 후 데이터 삽입
		String startStr = dto.getStart_date() +" "+ dto.getStart_time();
		String endStr = dto.getEnd_date() + " " + dto.getEnd_time();
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		Date start = transFormat.parse(startStr);
		Date end = transFormat.parse(endStr);
		
		dto.setStart(start);
		dto.setEnd(end);
		
		int result = service.updateSchedule(dto);
		
		return result;
	}
//	=========== 스케줄 관련 코드 종료 ===========  //
	
}
