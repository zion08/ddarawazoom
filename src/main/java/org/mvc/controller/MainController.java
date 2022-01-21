package org.mvc.controller;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	public String loginPro(UserInfoDTO userDTO, CoachInfoDTO coachDTO, HttpSession session, Model model) {
		log.info("	-----CT----->loginPro Page");
		System.out.println(userDTO);
		System.out.println(coachDTO);
		
		int result = 0;
		
		if(service.getUserInfo(userDTO) == 1){
			result = 1;
			session.setAttribute("id", userDTO.getId());
			model.addAttribute("result", result);
		} else {
			coachDTO.setC_id(userDTO.getId());
			coachDTO.setC_pw(userDTO.getPw());
			if(service.coachCheck(coachDTO) == 1) {
				result = 1;
				session.setAttribute("c_id", coachDTO.getC_id());
				model.addAttribute("result", result);
			}
		}
		
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
	
	// ========= 카카오 로그인 ========= //
	@RequestMapping("/kakaoLogin")
	public @ResponseBody int kakaoLogin(@RequestBody UserInfoDTO dto, HttpSession session) {
		log.info("------CT----->kakaoLogin");
		log.info("======== kakao login data => "+dto);
		int result = 0;
		
		if(service.kakaoCheck(dto) == 1) {
			session.setAttribute("id", dto.getId());
			result = 1;
		} else {
			session.setAttribute("id", dto.getId());
			result = service.kakaoInsert(dto);
		}
		
		return result;
	}
	
	@RequestMapping("/naverLogin")
	public String naverLogin() {
		log.info("------CT----->kakaoLogin");
		return "/main/login/naverLogin";
	}
	
	@RequestMapping("/naverLoginPro")
	public @ResponseBody int naverLoginPro(@RequestBody UserInfoDTO dto, HttpSession session) {
		log.info("------CT----->kakaoLoginPro");
		log.info("======== naver login data => "+dto);
		int result = 0;
		
		if(service.naverCheck(dto) == 1) {
			session.setAttribute("id", dto.getId());
			result = 1;
		} else {
			session.setAttribute("id", dto.getId());
			result = service.naverInsert(dto);
		}
		
		return result;
	}
	
}
