package org.mvc.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.FileInfo;
import org.mvc.bean.MyProfileDTO;
import org.mvc.service.BodyProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myroom")
public class BodyProfileController {
	
	@Autowired
	private BodyProfileService service; 
	
	@Autowired
	private FileInfo fileInfo;

//  =========== 마이룸 메인화면 ===========  //	
	@RequestMapping()
	public String list() {
		log.info("	-----CT----->myroomMain");
		return "myroom/main";
	}


	
//  =========== 회원 정보 관련 코드 시작 ===========  //		
	
	@RequestMapping("/info")
	public String userInfo() {
		log.info("	-----CT----->userInfo");
		return "myroom/userInfo/info";
	}
	
	@RequestMapping("/userInfoUpdate")
	public String userInfoUpdate() {
		return "myroom/userInfoUpdate";
	}
//=========== 회원 정보 관련 코드 종료 ===========  //		
	
	
	
//  =========== 바디프로필 관련 코드 시작 ===========  //		
	@RequestMapping("/bodyprofile")
	public String bodyprofile(String b_id, Model model) { 
		
		model.addAttribute("myProfileDTO", service.getMyProfile("dam"));
		model.addAttribute("bodyProfileDTO", service.getBodyProfile("dam"));
		log.info(""+service.bodyList("dam"));
		model.addAttribute("bodyList", service.bodyList("dam"));
		return "myroom/bodyprofile/content";
	}
	
	

	// session id(로그인/회원가입) 이후, 변경할 곳
	@RequestMapping("/bodyprofile/myWrite")
	public String myWrite() {
		return "myroom/bodyprofile/myWrite";
	}
	
	@RequestMapping("/bodyprofile/myWritePro")
	public String myWritePro(MyProfileDTO myDTO, Model model) {
		model.addAttribute("result", service.myWrite(myDTO));
		return "myroom/bodyprofile/myWritePro";
	}
	
	@RequestMapping("/bodyprofile/myUpdate")
	public String myUpdate(String b_id, Model model) {
		model.addAttribute("myProfileDTO", service.getMyProfile("dam"));
		return "myroom/bodyprofile/myUpdate";
	}
	
	@RequestMapping("/bodyprofile/myUpdatePro")
	public String myUpdatePro(String b_id, MyProfileDTO myDTO, MultipartFile save, Model model) {		
		model.addAttribute("result", service.myUpdate(myDTO));
		return "myroom/bodyprofile/myUpdatePro";
	}
	
	@RequestMapping("/bodyprofile/bodyWrite")
	public String bodyWrite() {
		return "myroom/bodyprofile/bodyWrite";
	}
	
	@RequestMapping("/bodyprofile/bodyWritePro")
	public String bodyWritePro(BodyProfileDTO bodyDTO, MultipartFile save, String b_id, Model model) {

		String  file = fileInfo.imgUpload(save, "dam");
		if(file != null) {
			bodyDTO.setB_img(file);
			model.addAttribute("result",service.bodyWrite(bodyDTO));
		}
		return "myroom/bodyprofile/bodyWritePro";
	}
	
	@RequestMapping("/bodyprofile/bodyUpdate")
	public String bodyUpdate(int b_num, String b_id, Model model) {
		model.addAttribute("bodyProfileDTO", service.bodyRead(b_num, "dam"));
		return "myroom/bodyprofile/bodyUpdate";
	}
	
	@RequestMapping("/bodyprofile/bodyUpdatePro")
	public String bodyUpdatePro(BodyProfileDTO bodyDTO,  MultipartFile save, String b_id, Model model) {
		String  file = fileInfo.imgUpload(save, "dam");
		if(file != null) {
			bodyDTO.setB_img(file);
			model.addAttribute("result", service.bodyUpdate(bodyDTO));
		}
		return "myroom/bodyprofile/bodyUpdatePro";
	}
	
	@RequestMapping("/bodyprofile/bodyDelete")
	public String bodyDelete(int b_num, Model model) {
		model.addAttribute("b_num",b_num);
		return "myroom/bodyprofile/bodyDelete";
	}
	
	@RequestMapping("/bodyprofile/bodyDeletePro")
	public String bodyDeletePro(int b_num, Model model) {
		model.addAttribute("result",service.bodyDelete(b_num));
		return "myroom/bodyprofile/bodyDeletePro";
	}

	//  =========== 바디프로필 그래프  ===========  //		
	@RequestMapping("/getBodyList")
	public @ResponseBody List<BodyProfileDTO> getBodyList(Model model){
		log.info(""+service.bodyList("dam"));
		
		//		=========== 날짜 포맷을 mm월 dd일로 바꾼 후 view로 보내는 코드 ===========		//
		
		List<BodyProfileDTO> list = service.bodyList("dam"); // list 변수에 DB에서 가져온 값을 대입
		List<BodyProfileDTO> resultList = new ArrayList<BodyProfileDTO>(); // view로 보낼 리스트 선언
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일"); // 변경할 날짜 포맷 선언 후 생성
		for(BodyProfileDTO dto : list) { // DB에서 가져온 값을 하나씩 꺼내옴
			String date = sdf.format(dto.getB_date()); // dto안의 b_date의 포맷 변경 후 String 변수에 대입
			
			if(date.substring(4, 5).equals("0")) { // date문자열이(만약 날짜의 월)이 0으로 시작한다면
				StringBuffer dateDelete = new StringBuffer(date);
				date = dateDelete.deleteCharAt(4).toString(); // 문자열 0을 제거 (1번째 index부터 문자열을 잘라냄)
				
				if(date.substring(7, 8).equals("0")) { // 만약 날짜의 일이 0으로 시작한다면 (문자열의 3번째 index가 0이라면)
					 // 문자열을 삭제하는 함수를 사용하기 위해 StringBuffer 클래스 생성
					date = dateDelete.deleteCharAt(7).toString(); // 문자열 0을 제거 (3번째 index를 제거) 후 date 변수에 대입
				}
			}
			dto.setParse_date(date); // 위에서 변환한 날짜를 dto안에 대입
			resultList.add(dto); // view로 보낼 리스트에 dto 대입
		}
		log.info(""+resultList);
		model.addAttribute("bodyList", resultList);
		
		return resultList;
	}
}
//  =========== 바디프로필 관련 코드 종료 ===========  //		

	

