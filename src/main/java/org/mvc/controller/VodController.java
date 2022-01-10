package org.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class VodController {
	
	@RequestMapping("/vod")
	public String main() {
		log.info("	-----CT----->vod Page");
		return "/vod/vclass";
	}
}
