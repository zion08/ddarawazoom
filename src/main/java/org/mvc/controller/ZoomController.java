package org.mvc.controller;

import java.util.List;

import org.mvc.bean.ZoomDTO;

import org.mvc.service.ZoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom") 
public class ZoomController {
	
	@Autowired
	private ZoomService service;
	
	@RequestMapping("/zoom")
	public String main(Model model) {
		log.info("	-----CT----->zoom Page");
		List<ZoomDTO> list = service.getList();
		model.addAttribute("list" , list);
		return "/zoom/class/zclass";
	}
	
	@RequestMapping("/zclasscontent")
	public String zcalsscontent(int num , Model model) {
		model.addAttribute("ZoomDTO" , service.getContent(num));
		return "/zoom/class/zclasscontent";  
	}
	
	@RequestMapping("/zwriteForm")
	public String zwriteForm() {
		log.info("	-----CT----->zoom Page");
		return "/zoom/class/zwriteForm"; 
	}
	
	@RequestMapping("/zwritePro")
	public String zwritePro(ZoomDTO dto , Model model) {
		log.info("	-----CT----->zoom Page");
		System.out.println(dto);
		model.addAttribute("result" , service.zoomInsert(dto));
		return "/zoom/class/zwritePro"; 
	}
}	
