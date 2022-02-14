package org.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.mvc.Component.Crawling;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.YoutubeDTO;
import org.mvc.service.YoutubeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
 
@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class VodController {

	@Autowired
	private YoutubeService serviceYoutube;
	
	@RequestMapping("/vod")
	public String main(Model model, HttpServletRequest request) {
		log.info("	-----CT----->vod Page");
		
		String pageNum= request.getParameter("pageNum");	
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int pageSize = 10;	
		int currentPage = Integer.parseInt(pageNum); 
		int firstRownum = (currentPage-1)*pageSize + 1;	
		int lastRownum = currentPage*pageSize;		
		
		int pageBlock = 5;	
		int contentCount = serviceYoutube.vodOnCount();
		int totalPage;	
		int startPage;	
		int endPage;	
		
		totalPage = contentCount/pageSize + (contentCount%pageSize == 0 ? 0 : 1);
		startPage = (currentPage/pageBlock)*pageBlock + 1;
		endPage = startPage + pageBlock - 1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		if (contentCount > 0){
			model.addAttribute("contentCount", contentCount);
			model.addAttribute("youtube", serviceYoutube.getVideoList(firstRownum, lastRownum));
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
		} else {
			model.addAttribute("contentCount", 0);
		}
		
		return "/vod/vclass";
	}
	
	@RequestMapping("/keywordVod")
	public String searchVod(String qurey) {
		return "redirect: /ddarawazoom/vod";
	}
}
