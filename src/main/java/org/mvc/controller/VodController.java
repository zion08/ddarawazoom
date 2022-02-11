package org.mvc.controller;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.mvc.Component.Crawling;
import org.mvc.bean.YoutubeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
 
@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class VodController {

	@Autowired
	private Crawling crawling;
	
	@RequestMapping("/vod")
	public String main() throws IOException, ParseException {
		log.info("	-----CT----->vod Page");
		
		String qurey = "java";
		String maxResults = "5";
		
		List<String> videoIdList = crawling.getVideioId(qurey, maxResults);
		System.out.println(videoIdList.toString());
		
//		String videoId = videoIdList.get(0);
//		System.out.println("---CT-vid-->"+ videoId);
//		YoutubeDTO dto = crawling.getVideioInfo("wYg3W24w99A");
//		System.out.println(dto);

//		for (int i=0; i<videoIdList.size(); i++) {
//			String videoId = videoIdList.get(i);
//			YoutubeDTO dto = crawling.getVideioInfo(videoId);
//			System.out.println(dto);
//		}
		
//		YoutubeDTO dto = crawling.getVideioInfoTest();
//		System.out.println(dto);

		return "/vod/vclass";
	}
}
