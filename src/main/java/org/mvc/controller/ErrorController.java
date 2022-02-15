package org.mvc.controller;import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ddarawazoom")
public class ErrorController {
	
	@RequestMapping("/error")
	public String errorPage() {
		
		return "/error/defaultError";
	}
	
	@RequestMapping("/error404")
	public String errorPage404() {
		
		return "/error/error404";
	}
	
	@RequestMapping("/error500")
	public String errorPage500() {
		
		return "/error/error500";
	}
}
