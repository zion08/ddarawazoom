package org.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class MainController {

	@RequestMapping
	public String main() {
		log.info("	-----CT----->main Page");
		return "/main/main";
	}
	
	@RequestMapping("/login")
	public String login() {
		log.info("	-----CT----->login Page");
		return "/main/login/login";
	}
	
	
	
}
