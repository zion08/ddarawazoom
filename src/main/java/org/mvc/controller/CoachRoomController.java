package org.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mvc.bean.ScheduleDTO;
import org.mvc.service.CoachRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@RequestMapping("/schedule")
	public String coachSchedule() {
		log.info("	-----CT----->coachSchedule");
		
		return "/coachroom/schedule/schedule";
	}
	
	@RequestMapping("/getSchedule")
	public @ResponseBody ArrayList<ScheduleDTO> getSchedule(Model model) {
		log.info("	-----CT----->getSchedule");
		
		return service.getAllSchedule();
	}
	
	@RequestMapping("/add_event")
	public String add_event() {
		log.info("	-----CT----->add_event");
		return "/coachroom/schedule/schedule_add";
	}
	
	@RequestMapping("/add_eventPro")
	public @ResponseBody Map<Object, Object> add_eventPro(@RequestBody ScheduleDTO dto) {
		log.info("	-----CT----->add_eventPro");
		
		service.insertSchedule(dto);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		return map;
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
	public String update_schedule(ScheduleDTO dto, Model model) {
		log.info("	-----CT----->update_schedule");
		log.info(""+dto.getId());
		log.info(""+service.getSchedule(dto));
		model.addAttribute("schedule", service.getSchedule(dto));
		return "/coachroom/schedule/schedule_update";
	}
	
	@RequestMapping("/update_schedulePro")
	public @ResponseBody int update_schedulePro(@RequestBody ScheduleDTO dto) {
		log.info("	-----CT----->update_schedulePro");
		log.info(""+dto);
		int result = service.updateSchedule(dto);
		return result;
	} 
}
