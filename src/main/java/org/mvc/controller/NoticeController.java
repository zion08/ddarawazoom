package org.mvc.controller;

import java.util.List;

import javax.mail.Session;
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
	
	// 공지사항 페이지
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
	    
	    List<NoticeDTO> noticeList = null;
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
	
	// 공지사항 검색 페이지
	@RequestMapping("/searchNoticeList")
	public String searchNoticeList(String category, String input, String pageNum, Model model) {
		log.info("	-----CT-----> ddarawazoom searchNoticeList");
		log.info("category="+category+" input="+input);
		
		int pageSize = 8;
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
	
		count = serviceNotice.searchCount(category, input);
		
		List<NoticeDTO> noticeList = null;
		if(count > 0) {
			noticeList = serviceNotice.searchNoticeList(category, input, startRow, endRow);
			log.info("noticeList Size ="+noticeList.size());
		}
		
		if(count > 0) {
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
		
		number = count = (currentPage - 1) * pageSize;
		
		model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("noticeList", noticeList);
	    
	    model.addAttribute("category", category);
	    model.addAttribute("input", input);
	    
		return "/notice/searchNoticeList";
	}
	
	// 공지사항 작성
	@RequestMapping("/noticeWrite")
	public String notisWrite( NoticeDTO noticeDTO, Model model) {
		log.info("	-----CT-----> ddarawazoom noticeWrite");
		
		return "/notice/noticeWrite";
	}
	
	// 공지사항 작성 동작
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
	
	// 공지사항 댓글
	@RequestMapping("/noticeContent")
	public String noticeContent(String pageNum, Model model, NoticeDTO noticeDTO, int num, Notice_CDTO notice_CDTO, HttpSession session) {
		log.info("	-----CT-----> ddarawazoom noticeContent");
		
		String id = (String) session.getAttribute("id");
		String c_id = (String) session.getAttribute("c_id");
		
		if(id != null) {
			model.addAttribute("userInfo", serviceNotice.getUserInfo(id));
		} else if(c_id != null) {
			model.addAttribute("coachInfo", serviceNotice.getCoachInfo(c_id));
		}
		
		int pageSize = 8;
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    
	    count = serviceNotice.commentCount(notice_CDTO.getNum());
	    
	    List<Notice_CDTO> notice_CList = null;
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
	
	// 공지사항 조회수 증가 동작
	@RequestMapping("/noticeViewCount")
	public String noticeViewCount(int num, RedirectAttributes ra) {
		log.info("	-----CT-----> ddarawazoom noticeWiewCount");
		
		serviceNotice.noticeViewCount(num);
		ra.addAttribute("num", num);
		
		return "redirect:/ddarawazoom/noticeContent";
	}
	
	// 공지사항 수정
	@RequestMapping("/noticeUpdate")
	public String noticeUpdate(Model model, NoticeDTO noticeDTO) {
		log.info("	-----CT-----> ddarawazoom noticeUpdate");

		model.addAttribute("noticeDTO", serviceNotice.getNotice(noticeDTO));
		
		return "/notice/noticeUpdate";
	}
	
	// 공지사항 수정 동작
	@RequestMapping("/noticeUpdatePro")
	public String noticeUpdatePro(HttpSession session, Model model, NoticeDTO noticeDTO,  MultipartFile save) {
		log.info("	-----CT-----> ddarawazoom noticeUpdatePro");
		
		String id = (String)session.getAttribute("id");
		
		noticeDTO.setWriter_id(id);
		
		String file = fileInfo.imgUpload(save, id);
		if(file != null) {
			noticeDTO.setImg(file);
			model.addAttribute("result", serviceNotice.noticeUpdate(noticeDTO));
			model.addAttribute("num", noticeDTO.getNum());
		}
		
		return "/notice/noticeUpdatePro";
	}
	
	// 공지사항 삭제
	@RequestMapping("/noticeDelete")
	public @ResponseBody int noticeDelete(HttpSession session, @RequestBody NoticeDTO noticeDTO) {
		log.info("	-----CT-----> ddarawazoom noticeDelete");
		
		String id = (String)session.getAttribute("id");
		
		int result = 0;
		
		noticeDTO.setWriter_id(id);
		
		result = serviceNotice.noticeDelete(noticeDTO.getNum());
		
		return result;
	}
	
	// 공지사항 댓글 등록
	@RequestMapping("/commentWrite")
	public @ResponseBody int commentWrite(HttpSession session, @RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> ddarawazoom notice_commentWrite");
		
		int result = 0;
		result = serviceNotice.commentWrite(notice_CDTO);
		
		return result;
	}
	
	// 공지사항 댓글 삭제
	@RequestMapping("/commentDelete")
	public String commentDelete(Notice_CDTO notice_CDTO, Model model) {
		log.info("	-----CT-----> ddarawazoom notice_commentDelete");
		
		model.addAttribute("notice_CDTO", serviceNotice.getComment(notice_CDTO.getC_num()));

		return "/notice/commentDelete";
	}
	
	// 공지사항 댓글 삭제 동작
	@RequestMapping("/commentDeletePro")
	public @ResponseBody int commentDeletePro(int c_num) {
		log.info("	-----CT-----> ddarawazoom notice_commentDeletePro");

		int result = 0;
		
		result = serviceNotice.deletedChange(c_num);
		
		return result;
	}
	
	// 공지사항 댓글 수정
	@RequestMapping("/commentUpdate")
	public String commentUpdate(Notice_CDTO notice_CDTO, Model model, HttpSession session) {
		log.info("	-----CT-----> ddarawazoom notice_commentUpdate");
		
		String id = (String) session.getAttribute("id");
		String c_id = (String) session.getAttribute("c_id");
		
		if(id != null) {
			model.addAttribute("userInfo", serviceNotice.getUserInfo(id));
		} else if(c_id != null) {
			model.addAttribute("coachInfo", serviceNotice.getCoachInfo(c_id));
		}
		
		model.addAttribute("notice_CDTO", serviceNotice.getComment(notice_CDTO.getC_num()));
		
		return "/notice/commentUpdate";
	}
	
	// 공지사항 댓글 수정 동작
	@RequestMapping("/commentUpdatePro")
	public @ResponseBody int commentUpdatePro(@RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> ddarawazoom notice_commentUpdatePro");
		int result = 0;
		
		result = serviceNotice.commentUpdate(notice_CDTO);
		
		return result;
	}
	
	// 대 댓글 
	@RequestMapping("/reComment")
	public String reComment(Notice_CDTO notice_CDTO, Model model) {
		log.info("	-----CT-----> ddarawazoom notice_reComment");
		
		model.addAttribute("notice_CDTO", serviceNotice.getComment(notice_CDTO.getC_num()));
		
		return "/notice/reComment";
	}
	
	// 대댓글 작성 동작
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
