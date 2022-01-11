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
		
		return service.getSchedule();
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
	
	@RequestMapping("/schedule_delete")
	public String shcedule_delete() {
		return "/coachroom/schedule/schedule_delete";
	}
	
	@RequestMapping("/delete_event")
	public @ResponseBody Map<Object, Object> delete_event(@RequestBody String id) {
		log.info("	-----CT----->delete_event");
		log.info(""+id);
		
		int num = Integer.parseInt(id.split("=")[1]);
		
		ScheduleDTO dto = new ScheduleDTO();
		dto.setId(num);
		service.deleteShcedule(dto);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		return map;
	}
}
