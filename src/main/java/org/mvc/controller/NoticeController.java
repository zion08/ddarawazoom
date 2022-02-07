package org.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.FileInfo;
import org.mvc.bean.NoticeDTO;
import org.mvc.bean.Notice_CDTO;
import org.mvc.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class NoticeController {

	@Autowired
	private NoticeService serviceNotice;
	
	@Autowired
	private FileInfo fileInfo;
	
//=========== 공지사항 관련 코드 시작 ===========  //
	@RequestMapping("/notice")
	public String notis(String pageNum, Model model, HttpSession session) {
		log.info("	-----CT-----> ddarawazoom notice");
		
		int pageSize = 8;
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    count = serviceNotice.noticeCount();
	    
	    List noticeList = null;
	    if(count > 0) {
	    	noticeList = serviceNotice.noticeList(startRow, endRow);
	    	
	    	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	    	
	    	int startPage = (int)(currentPage/10)*10+1;
	    	int pageBlock = 10;
	    	int endPage = startPage + pageBlock - 1;
	    	if (endPage > pageCount) {
	    		endPage = pageCount;
	    	}
	    	model.addAttribute("startPage", startPage);
	    	model.addAttribute("endPage", endPage);
	    	model.addAttribute("pageCount", pageCount);
	    }
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("count", count);
	    model.addAttribute("noticeList", noticeList);
	    model.addAttribute("number", number);
	    
		return "/notice/notice";
	}
	
	@RequestMapping("/noticeWrite")
	public String notisWrite() {
		log.info("	-----CT-----> ddarawazoom noticeWrite");

		return "/notice/noticeWrite";
	}
	
	@RequestMapping("/noticeWritePro")
	public String noticeWritePro(HttpSession session, NoticeDTO noticeDTO, Model model, MultipartFile save) {
		log.info("	-----CT-----> ddarawazoom noticeWritePro");

		String id = (String)session.getAttribute("id");
		
		noticeDTO.setWriter_id(id);
		
		String file = fileInfo.imgUpload(save, id);
		if(file != null) {
			noticeDTO.setImg(file);
			model.addAttribute("result", serviceNotice.noticeWrite(noticeDTO));
		}
		
		return "/notice/noticeWritePro";
	}
	
	@RequestMapping("/noticeContent")
	public String noticeContent(String pageNum, Model model, NoticeDTO noticeDTO, int num, Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> ddarawazoom noticeContent");
		
		int pageSize = 8;
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    
	    count = serviceNotice.commentCount(notice_CDTO.getNum());
	    
	    List notice_CList = null;
	    if(count > 0) {
	    	notice_CList = serviceNotice.getCommentList(notice_CDTO.getNum(), startRow, endRow);
	    	
	    	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	    	
	    	int startPage = (int)(currentPage/10)*10+1;
	    	int pageBlock = 10;
	    	int endPage = startPage + pageBlock - 1;
	    	if (endPage > pageCount) {
	    		endPage = pageCount;
	    	}
	    	model.addAttribute("startPage", startPage);
	    	model.addAttribute("endPage", endPage);
	    	model.addAttribute("pageCount", pageCount);
	    }
	    model.addAttribute("pageNum", pageNum);
		model.addAttribute("noticeDTO", serviceNotice.getNotice(noticeDTO));
		model.addAttribute("notice_CList", notice_CList);
		model.addAttribute("count", count);
		
		return "/notice/noticeContent";
	}
	
	@RequestMapping("/noticeViewCount")
	public String noticeViewCount(int num, RedirectAttributes ra) {
		log.info("	-----CT-----> ddarawazoom noticeWiewCount");
		
		serviceNotice.noticeViewCount(num);
		ra.addAttribute("num", num);
		
		return "redirect:/ddarawazoom/noticeContent";
	}
	
	@RequestMapping("/noticeUpdate")
	public String noticeUpdate(HttpSession session, Model model, NoticeDTO noticeDTO) {
		log.info("	-----CT-----> ddarawazoom noticeUpdate");

		String id = (String)session.getAttribute("id");
		
		noticeDTO.setWriter_id(id);
		
		model.addAttribute("noticeDTO", serviceNotice.getNotice(noticeDTO));
		
		return "/notice/noticeUpdate";
	}
	
	@RequestMapping("/noticeUpdatePro")
	public String noticeUpdatePro(HttpSession session, Model model, NoticeDTO noticeDTO,  MultipartFile save) {
		log.info("	-----CT-----> ddarawazoom noticeUpdatePro");
		
		String id = (String)session.getAttribute("id");
		
		noticeDTO.setWriter_id(id);
		
		String file = fileInfo.imgUpload(save, id);
		if(file != null) {
			noticeDTO.setImg(file);
			model.addAttribute("result", serviceNotice.noticeUpdate(noticeDTO));
		}
		
		return "/notice/noticeUpdatePro";
	}
	
	@RequestMapping("/noticeDelete")
	public @ResponseBody int noticeDelete(HttpSession session, @RequestBody NoticeDTO noticeDTO) {
		log.info("	-----CT-----> ddarawazoom noticeDelete");
		
		String id = (String)session.getAttribute("id");
		
		int result = 0;
		
		noticeDTO.setWriter_id(id);
		
		result = serviceNotice.noticeDelete(noticeDTO.getNum());
		return result;
	}
	
	@RequestMapping("/commentWrite")
	public @ResponseBody int commentWrite(HttpSession session, @RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> ddarawazoom notice_commentWrite");
		
		int result = 0;
		
		result = serviceNotice.commentWrite(notice_CDTO);
		
		return result;
	}
	
	@RequestMapping("/commentDelete")
	public String commentDelete(Notice_CDTO notice_CDTO, Model model) {
		log.info("	-----CT-----> ddarawazoom notice_commentDelete");

		model.addAttribute("c_num", notice_CDTO.getC_num());
		return "/notice/commentDelete";
	}
	
	@RequestMapping("/commentDeletePro")
	public @ResponseBody int commentDeletePro(@RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> ddarawazoom notice_commentDeletePro");

		int result = 0;
		
		String pw = serviceNotice.pwCheck(notice_CDTO.getWriter_id(), notice_CDTO.getC_num());
		
		if(pw.equals(notice_CDTO.getPw())) {
			result = serviceNotice.deletedChange(notice_CDTO.getC_num());
		}
		return result;
	}
	
	@RequestMapping("/commentUpdate")
	public String commentUpdate(Notice_CDTO notice_CDTO, Model model) {
		log.info("	-----CT-----> ddarawazoom notice_commentUpdate");
		
		model.addAttribute("notice_CDTO", serviceNotice.getComment(notice_CDTO.getC_num()));
		
		return "/notice/commentUpdate";
	}
	
	@RequestMapping("/commentUpdatePro")
	public @ResponseBody int commentUpdatePro(@RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> ddarawazoom notice_commentUpdatePro");

		int result = 0;
		
		result = serviceNotice.commentUpdate(notice_CDTO);
		
		return result;
	}
	
	@RequestMapping("/reComment")
	public String reComment(Notice_CDTO notice_CDTO, Model model) {
		log.info("	-----CT-----> ddarawazoom notice_reComment");
		
		
		
		model.addAttribute("notice_CDTO", serviceNotice.getComment(notice_CDTO.getC_num()));
		
		return "/notice/reComment";
	}
	
	@RequestMapping("/reCommentPro")
	public @ResponseBody int reCommentPro(@RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> ddarawazoom notice_reCommentPro");
		
		int result = 0;
		int re_step = notice_CDTO.getRe_step()+1;
		int re_level = notice_CDTO.getRe_level()+1;
		
		notice_CDTO.setRe_level(re_level);
		notice_CDTO.setRe_step(re_step);
		notice_CDTO.setRef(notice_CDTO.getC_num());
		
		result = serviceNotice.insertReComment(notice_CDTO);
		
		return result;
	}
	
//=========== 관리자 공지사항 관련 코드 종료 ===========  //	
	
}
