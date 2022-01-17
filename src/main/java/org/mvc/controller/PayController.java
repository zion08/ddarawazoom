package org.mvc.controller;

import java.util.List;

import org.mvc.bean.ZoomDTO;
import org.mvc.service.ZoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class PayController {
	
	@Autowired
	private ZoomService service;
	
	@RequestMapping("/pay")
	public String zcalsscontent(Model model) {
		int num = 7;
		model.addAttribute("ZoomDTO" , service.getContent(num));
		return "/zoom/pay/pay";  
	}
	
	@RequestMapping("/payPro")
	public int payPro(String imp_uid, String merchant_uid, Model model) {
		System.out.println("------>imp_uid: "+imp_uid);
		System.out.println("------>merchant_uid: "+merchant_uid);
		return 1;  
	}
	

}
