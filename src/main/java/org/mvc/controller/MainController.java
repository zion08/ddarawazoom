package org.mvc.controller;

import javax.servlet.http.HttpSession;

import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.service.CoachRoomServiceImpl;
import org.mvc.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class MainController {

	@Autowired // service 끌어다 놨다.
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

		if (service.getUserInfo(userDTO) == 1) {
			result = 1;
			session.setAttribute("id", userDTO.getId());
			model.addAttribute("result", result);
		} else {
			coachDTO.setC_id(userDTO.getId());
			coachDTO.setC_pw(userDTO.getPw());
			if (service.coachCheck(coachDTO) == 1) {
				result = 1;
				session.setAttribute("c_id", coachDTO.getC_id());
				model.addAttribute("result", result);
			}
		}

		return "/main/login/loginPro";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 로그아웃은 세션에 저장된 것을 지우면 된다.
		session.removeAttribute("id");
		session.removeAttribute("c_id");
		// 세선에 저장된 모든 것을 지우고 세션을 초기화
		session.invalidate();
		log.info("	-----CT----->logout Page");
		return "/main/logout/logout";
	}

//	// 아이디, 비밀번호 찾기 페이지
//	@RequestMapping("/findidpw")
//	public String findidpw() {
//		log.info("	-----CT----->findidpw Page");
//		return "/main/findidpw/findidpw";
//	}
//
//
//	// 찾은 아이디값 내어주기
//	@RequestMapping("/findidpwPro")
//	public @ResponseBody String findidpwPro(
//		@RequestParam("name") String name, @RequestParam("tel") String tel
//
//	) {
//		String result = service.getId(name, tel);
//		log.info("	-----CT----->findidpwPro Page");
//		return result;
//	}
//
//	// 비밀번호 찾기 : 이름, 아이디, 이메일 맞나 확인
//	@RequestMapping("/findpwPro")
//	public @ResponseBody int findpwPro(@RequestParam("name") String name, @RequestParam("id") String id,
//			@RequestParam("email") String email) {
//		int result = 0;
//		log.info("name=" + name + "id=" + id + "email=" + email);
//		if (service.findPw(name, id, email) == 1) {
//			log.info("1 나오라고" + service.findPw(name, id, email));
//			result = 1;
//		}
//		// String result=service.findPw(int);
//		log.info("	-----CT----->findpwPro Page");
//		return result;
//	}
//
//	
//	// 비밀번호 찾기
//	@RequestMapping("/findpw")
//	public void findpw(UserInfoDTO dto) throws Exception {
//		log.info("------CT----->findpw Page");
//	}

	// 아이디 중복체크
	@RequestMapping("/idCheck")
	public @ResponseBody int idCheck(String id) {
		log.info("	-----CT----->idCheck");
		int result = 0;
		if (id == "") {
			result = -1;
		} else {
			result = service.idCheck(id);
		}
		return result;
	}
	
	// 코치 아이디 중복체크
	@RequestMapping("/idCheckcoach")
	public @ResponseBody int idCheckcoach(String id) {
		log.info("	-----CT----->idCheckcoach");
		int result = 0;
		if (id == "") {
			result = -1;
		} else {
			result = service.idCheckcoach(id);
		}
		return result;
	}
	
	// 닉네임 중복체크
	@RequestMapping("/nickCheck")
	public @ResponseBody int nickCheck(String nick) {
		log.info("	-----CT----->nickCheck");
		int result = 0;
		if (nick == "") {
			result = -1;
		} else {
			result = service.nickCheck(nick);
		}
		return result;
	}
	
	// 코치 닉네임 중복체크
	@RequestMapping("/nickCheckcoach")
	public @ResponseBody int nickCheckcoach(String nick) {
		log.info("	-----CT----->nickCheckcoach");
		int result = 0;
		if (nick == "") {
			result = -1;
		} else {
			result = service.nickCheckcoach(nick);
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
		log.info("---------CT-------> coachsignup Page"+dto.getId());
		if(service.insertUserInfo(dto) == 1){
			   model.addAttribute("result" , 1);
		}else{
			   model.addAttribute("result" , 0);
		}
		return "/main/signup/signupPro";
	}
	

	@RequestMapping("/coachsignup")
	public String coachsignup(CoachInfoDTO dto) {
		log.info("------CT----->coachsignup Page");
		return "/main/signup/coachsignupForm";
	}
	
	@RequestMapping("/coachsignupPro")
	public String coachsignupPro(CoachInfoDTO dto, Model model) {
		log.info("------CT----->coachsignupPro Page"+dto.getC_id());
		if(service.insertCoachInfo(dto) == 1) {
			model.addAttribute("result",  1);
		}else {
			model.addAttribute("result", 0);
		}
		return "/main/signup/coachsignupPro";
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
		log.info("======== kakao login data => " + dto);
		int result = 0;

		if (service.kakaoCheck(dto) == 1) {
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
		log.info("======== naver login data => " + dto);
		int result = 0;

		if (service.naverCheck(dto) == 1) {
			session.setAttribute("id", dto.getId());
			result = 1;
		} else {
			session.setAttribute("id", dto.getId());
			result = service.naverInsert(dto);
		}

		return result;
	}

}
