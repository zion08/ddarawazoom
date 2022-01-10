package org.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class ZoomController {
	
	@RequestMapping("/zoom")
	public String main() {
		log.info("	-----CT----->zoom Page");
		return "/zoom/class/zclass";
	}
}
