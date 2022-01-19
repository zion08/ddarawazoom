package org.mvc.controller;
 
import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String loginPro(UserInfoDTO dto, HttpSession session, Model model) {
		if(service.getUserInfo(dto) == 1){
			session.setAttribute("id", dto.getId());
		}
		System.out.println(dto);
		model.addAttribute("result", service.getUserInfo(dto));
		log.info("	-----CT----->loginPro Page");
		return "/main/login/loginPro";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//로그아웃은 세션에 저장된 것을 지우면 된다.
		session.removeAttribute("id");
		//세선에 저장된 모든 것을 지우고 세션을 초기화
		session.invalidate();
		log.info("	-----CT----->logout Page");
		return "/main/logout/logout";
	}
	
	@RequestMapping("/findid")
	public String findid() {
		log.info("	-----CT----->findid Page");
		return "/main/findidpw/findid";
	}
	
	@RequestMapping("/findpw")
	public String findpw() {
		log.info("	-----CT----->findpw Page");
		return "/main/findidpw/findpw";
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
