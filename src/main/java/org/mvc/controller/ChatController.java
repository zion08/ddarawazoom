package org.mvc.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatController {

	@RequestMapping()
	public String loginProcess(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		
		log.info("=========="+id);
		
		
    	model.addAttribute("id", id);
		return "/chat/chat";
	}
}
