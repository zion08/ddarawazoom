package org.mvc.controller;
 
import org.mvc.bean.UserInfoDTO;
import org.mvc.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class MainController {

	@Autowired //service 끌어다 놨다.
	private UserInfoService service;
	
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
	
	@RequestMapping("/loginPro")
	public String loginPro() {
		log.info("	-----CT----->loginPro Page");
		return "/main/login/loginPro";
	}

	@RequestMapping("/signup")
	public String signup(UserInfoDTO dto) {
		
		log.info("------CT----->signupForm Page");
		return "/main/signup/signupForm";
	}
	
	@RequestMapping("/signupPro")
	public String signupPro(UserInfoDTO dto, Model model) {
		//if(service.UserInfo())
		log.info("------CT----->signupPro Page");
		System.out.println(dto);
		model.addAttribute("UserInfoDTO", service.insertUserInfo(dto));
		return "/main/signup/signupPro";
	}
	
	@RequestMapping("/coachsignup")
	public String coachsignup() {
		log.info("------CT----->coachsignup Page");
		return "/main/signup/coachsignupForm";
	}
	
	@RequestMapping("/signupwelcome")
	public String signupwelcome() {
		log.info("------CT----->signupwelcome Page");
		return "/main/signup/signupwelcomeForm";
	}
	
	
	

	
	
}
