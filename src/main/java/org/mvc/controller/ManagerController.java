package org.mvc.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.FileInfo;
import org.mvc.bean.NoticeDTO;
import org.mvc.bean.Notice_CDTO;
import org.mvc.bean.PaymentDTO;
import org.mvc.service.NoticeService;
import org.mvc.service.PaymentService;
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
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private PaymentService servicePayment;
	
	@Autowired
	private NoticeService serviceNotice;
	
	@Autowired
	private FileInfo fileInfo;
	
//	=========== 관리자 수입 관련 코드 시작 ===========  //
	@RequestMapping("/sales")
	public String payment (Model model, HttpSession session) {
		log.info("	-----CT-----> manager sales");
		
		// 결제 내역 출력
		List<PaymentDTO> paymentList = servicePayment.getPaymentList();
		model.addAttribute("payment", paymentList);
		
		// 총 거래액, 환불액, 매출액
		DecimalFormat fmt = new DecimalFormat("###,###");
		int amount = servicePayment.getAmountTotal();
		String amountFmt = fmt.format(amount);
		model.addAttribute("amount", amountFmt);
		
		int cancelAmount = servicePayment.getCancelAmountTotal();
		String cancelAmoutFmt = fmt.format(cancelAmount);
		model.addAttribute("cancelAmount", cancelAmoutFmt);
		
		int sales = amount - cancelAmount;
		String salseFmt = fmt.format(sales);
		model.addAttribute("sales", salseFmt);
		
		return "/manager/sales/sales";
	}		
//	=========== 관리자 수입 관련 코드 종료 ===========  //


//=========== 관리자 공지사항 관련 코드 시작 ===========  //
	@RequestMapping("/notice")
	public String notis(String pageNum, Model model, HttpSession session) {
		log.info("	-----CT-----> manager notice");
		
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
	    
	    List notisList = null;
	    if(count > 0) {
	    	notisList = serviceNotice.noticeList(startRow, endRow);
	    	
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
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("noticeList", notisList);
	    
		return "/manager/notice/notice";
	}
	
	@RequestMapping("/noticeWrite")
	public String notisWrite() {
		log.info("	-----CT-----> manager noticeWrite");

		return "/manager/notice/noticeWrite";
	}
	
	@RequestMapping("/noticeWritePro")
	public String noticeWritePro(HttpSession session, NoticeDTO noticeDTO, Model model, MultipartFile save) {
		log.info("	-----CT-----> manager noticeWritePro");

		String id = (String)session.getAttribute("id");
		
		noticeDTO.setWriter_id(id);
		
		String file = fileInfo.imgUpload(save, id);
		if(file != null) {
			noticeDTO.setImg(file);
			model.addAttribute("result", serviceNotice.noticeWrite(noticeDTO));
		}
		
		return "/manager/notice/noticeWritePro";
	}
	
	@RequestMapping("/noticeContent")
	public String noticeContent(String pageNum, HttpSession session, Model model, NoticeDTO noticeDTO, Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> manager noticeContent");

		String id = (String)session.getAttribute("id");
		
		noticeDTO.setWriter_id(id);
		
		int pageSize = 8;
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    
	    count = serviceNotice.commentCount(notice_CDTO.getC_num());
		
	    List notice_CList = null;
	    if(count > 0) {
	    	notice_CList = serviceNotice.getComment(noticeDTO.getNum(), startRow, endRow);
	    	
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
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
		model.addAttribute("noticeDTO", serviceNotice.getNotice(noticeDTO));
		model.addAttribute("notice_CList", notice_CList);
		model.addAttribute("count", count);
		
		return "/manager/notice/noticeContent";
	}
	
	@RequestMapping("/noticeViewCount")
	public String noticeViewCount(int num, RedirectAttributes ra) {
		log.info("	-----CT-----> manager noticeWiewCount");
		
		serviceNotice.noticeViewCount(num);
		ra.addAttribute("num", num);
		
		return "redirect:/manager/noticeContent";
	}
	
	@RequestMapping("/noticeUpdate")
	public String noticeUpdate(HttpSession session, Model model, NoticeDTO noticeDTO) {
		log.info("	-----CT-----> manager noticeUpdate");

		String id = (String)session.getAttribute("id");
		
		noticeDTO.setWriter_id(id);
		
		model.addAttribute("noticeDTO", serviceNotice.getNotice(noticeDTO));
		
		return "/manager/notice/noticeUpdate";
	}
	
	@RequestMapping("/noticeUpdatePro")
	public String noticeUpdatePro(HttpSession session, Model model, NoticeDTO noticeDTO,  MultipartFile save) {
		log.info("	-----CT-----> manager noticeUpdatePro");
		
		String id = (String)session.getAttribute("id");
		
		noticeDTO.setWriter_id(id);
		
		String file = fileInfo.imgUpload(save, id);
		if(file != null) {
			noticeDTO.setImg(file);
			model.addAttribute("result", serviceNotice.noticeUpdate(noticeDTO));
		}
		
		return "/manager/notice/noticeUpdatePro";
	}
	
	@RequestMapping("/noticeDelete")
	public @ResponseBody int noticeDelete(HttpSession session, @RequestBody NoticeDTO noticeDTO) {
		log.info("	-----CT-----> manager noticeDelete");
		
		String id = (String)session.getAttribute("id");
		
		int result = 0;
		
		noticeDTO.setWriter_id(id);
		
		result = serviceNotice.noticeDelete(noticeDTO.getNum());
		return result;
	}
	
	@RequestMapping("/commentWrite")
	public @ResponseBody int commentWrite(HttpSession session, @RequestBody Notice_CDTO noticeCDTO) {
		log.info("	-----CT-----> manager notice_commentWrite");
		
		String id = (String)session.getAttribute("id");
		
		int result = 0;
		
		noticeCDTO.setWriter_id(id);
				
		result = serviceNotice.commentWrite(noticeCDTO);
		
		return result;
	}
//=========== 관리자 공지사항 관련 코드 종료 ===========  //

}