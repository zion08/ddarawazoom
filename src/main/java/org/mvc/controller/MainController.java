package org.mvc.controller;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.FileInfo;
import org.mvc.bean.UserInfoDTO;
import org.mvc.service.UserEmailService;
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
	
	@Autowired
	private UserEmailService emailService;
	
	@Autowired
	private FileInfo fileInfo;
	
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
			if(userDTO.getId().equals("admin")) {
				result = 1;
				session.setAttribute("admin", userDTO.getId());
				model.addAttribute("result", result);
			} else {
				result = 1;
				session.setAttribute("id", userDTO.getId());
				model.addAttribute("result", result);
			}
			
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
		session.removeAttribute("c_id");
		//세선에 저장된 모든 것을 지우고 세션을 초기화
		session.invalidate();
		log.info("	-----CT----->logout Page");
		return "/main/logout/logout";
	}
	
	@RequestMapping("/findIdPw")
	public String findid() {
		log.info("	-----CT----->findIdPw Page");
		return "/main/findidpw/findIdPw";
	}
	
	@RequestMapping("/findIdPro")
	public @ResponseBody String findIdPro(@RequestBody UserInfoDTO dto) {
		log.info("	-----CT----->findIdPro Page");
		
		StringBuffer sb = new StringBuffer();
		
		sb.append(dto.getTel());
		sb.insert(3, "-");
		sb.insert(8, "-");
		
		dto.setTel(sb.toString());
		
		String result = null;
		result = service.findId(dto);
		
		return result;
	}
	
	@RequestMapping("/emailSend")
	public @ResponseBody int emailSend(String id, String email) {
		log.info("	-----CT----->emailSend Page");
		
		int result = 0;
		result = emailService.mailSendWithUserKey(id, email);
		
		return result;
	}
	
	@RequestMapping("/emailCheck")
	public @ResponseBody int emailCheck(@RequestBody UserInfoDTO dto) {
		log.info("	-----CT----->emailCheck Page");
		
		int result = 0;
		result = service.emailCheck(dto);
		
		return result;
	}
	
	@RequestMapping("/updatePw")
	public @ResponseBody int updatePw(UserInfoDTO dto, String pw1, String pw2) {
		log.info("	-----CT----->updatePw Page");
		
		int result = 0;
		if(pw1.equals(pw2)) {
			dto.setPw(pw1);
			result = service.updatePw(dto);
		}
		
		return result;
	}
	
	@RequestMapping("/idCheck")
	public @ResponseBody int idCheck(String id) {
		log.info("	-----CT----->idCheck");
		int result = 0;
		
		if(id == "" || id == null) {
			result = -1;
		} else {
			if(service.idCheck(id) == 1 || service.c_idCheck(id) == 1) {
				result = 1;
			}
		}
		
		return result;
	}
	
	@RequestMapping("/nickCheck")
	public @ResponseBody int nickCheck(String nick) {
		log.info("	-----CT----->nickCheck");
		int result = 0;
		
		if(nick == "" || nick == null) {
			result = -1;
		} else {
			if(service.nickCheck(nick) == 1 || service.c_nickCheck(nick) == 1) {
				result = 1;
			}
		}
		
		return result;
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
	
	@RequestMapping("/coachsignupPro")
	public String coachsignupPro(CoachInfoDTO dto, Model model, MultipartFile save) {
		log.info("------CT----->coachsignupPro Page");
		log.info(""+dto);
		log.info(save.getOriginalFilename());
		
		service.coachInsert(dto);
		
		String file = fileInfo.imgUpload(save, dto.getC_id());
		if(file != null) {
			dto.setC_img(file);
			service.coachImgUpload(dto);
		}
		
		model.addAttribute("c_id", dto.getC_id());
		return "/main/signup/coachsignupPro";
	}
	
	@RequestMapping("/coachCareerInsert")
	public @ResponseBody int coachCareerInsert(@RequestBody CoachCareerDTO dto) {
		log.info("------CT----->coachCareerInsert Page");
		log.info(""+dto);
		int result = 0;
		
		result = service.careerInsert(dto);
		
		return result;
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
