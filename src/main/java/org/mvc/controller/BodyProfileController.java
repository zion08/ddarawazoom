package org.mvc.controller;


import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.FileInfo;
import org.mvc.bean.MyProfileDTO;
import org.mvc.service.BodyProfileS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myroom")
public class BodyProfileController {
	
	@Autowired
	private BodyProfileS service;
	
	@Autowired
	private FileInfo fileInfo;

//  =========== 마이룸 메인화면 ===========  //	
	@RequestMapping()
	public String list() {
		log.info("	-----CT----->myroomMain");
		return "myroom/main";
	}
	
	@RequestMapping("/bodyprofile")
	public String bodyprofile(String b_id, Model model) { 
		
		model.addAttribute("myProfileDTO", service.getMyProfile("dam"));
		model.addAttribute("bodyProfileDTO", service.getBodyProfile("dam"));
		model.addAttribute("bodyList", service.bodyList("dam"));
		return "myroom/bodyprofile/content";
	}
	
	// session id(로그인/회원가입) 이후, 변경할 곳
	@RequestMapping("/bodyprofile/myWrite")
	public String myWrite() {
		return "myroom/bodyprofile/myWrite";
	}
	
	@RequestMapping("/bodyprofile/myWritePro")
	public String myWritePro(MyProfileDTO myDTO, MultipartFile save, Model model, HttpServletRequest req) {
		
		if(save != null) {
			if(fileInfo.fileTypeCheck(save, "image")) {
				String orgName = save.getOriginalFilename();
				String ext = orgName.substring(orgName.lastIndexOf("."));
				String fileName = myDTO.getB_id()+ext;
				String path = req.getSession().getServletContext().getRealPath("/resources/image/myroom");
				File f = new File(path+"//"+fileName);
				try {
					save.transferTo(f);
				}catch(Exception e) {
					e.printStackTrace();
				}
				myDTO.setB_img(fileName);
				model.addAttribute("result", service.myWrite(myDTO));
			}
		}
		return "myroom/bodyprofile/myWritePro";
	}
	
	@RequestMapping("/bodyprofile/myUpdate")
	public String myUpdate(String b_id, Model model) {
		model.addAttribute("myProfileDTO", service.getMyProfile("dam"));
		return "myroom/bodyprofile/myUpdate";
	}
	
	@RequestMapping("/bodyprofile/myUpdatePro")
	public String myUpdatePro(MyProfileDTO myDTO, MultipartFile save, Model model, HttpServletRequest req) {		
		if(save != null) {
			if(fileInfo.fileTypeCheck(save, "image")) {
				String orgName = save.getOriginalFilename();
				String ext = orgName.substring(orgName.lastIndexOf("."));
				String fileName = myDTO.getB_id()+ext;
				String path = req.getSession().getServletContext().getRealPath("/resources/image/myroom");
				File f = new File(path+"//"+fileName);
				try {
					save.transferTo(f);
				}catch(Exception e) {
					e.printStackTrace();
				}
				myDTO.setB_img(fileName);
				model.addAttribute("result", service.myUpdate(myDTO));
			}
		}
		return "myroom/bodyprofile/myUpdatePro";
	}
	
	@RequestMapping("/bodyprofile/bodyWrite")
	public String bodyWrite() {
		return "myroom/bodyprofile/bodyWrite";
	}
	
	@RequestMapping("/bodyprofile/bodyWritePro")
	public String bodyWritePro(BodyProfileDTO bodyDTO, Model model) {
		model.addAttribute("result",service.bodyWrite(bodyDTO));
		return "myroom/bodyprofile/bodyWritePro";
	}
	
	@RequestMapping("/bodyprofile/bodyUpdate")
	public String bodyUpdate(int b_num, String b_id, Model model) {
		model.addAttribute("bodyProfileDTO", service.bodyRead(b_num, "dam"));
		return "myroom/bodyprofile/bodyUpdate";
	}
	
	@RequestMapping("/bodyprofile/bodyUpdatePro")
	public String bodyUpdatePro(BodyProfileDTO bodyDTO, Model model) {
		model.addAttribute("result", service.bodyUpdate(bodyDTO));
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
}
