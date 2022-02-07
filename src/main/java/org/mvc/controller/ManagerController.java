package org.mvc.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.FileInfo;
import org.mvc.bean.NoticeDTO;
import org.mvc.bean.Notice_CDTO;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.service.NoticeService;
import org.mvc.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

//	=========== 관리자 공지사항 관련 코드 시작 ===========  //
	@RequestMapping("/notice")
	public String notice(String pageNum, Model model, HttpSession session, Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> manager notice");
		int pageSize = 8;
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    
	    count = serviceNotice.noticeCount();
	    
	    List noticeList = null;
	    List commentList = null;
	    
	    if(count > 0) {
	    	noticeList = serviceNotice.noticeList(startRow, endRow);
	    	commentList = serviceNotice.getAllComment(startRow, endRow);
	    	
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
	    model.addAttribute("commentList", commentList);
	    model.addAttribute("c_num", notice_CDTO.getC_num());
		return "/manager/notice/notice";
	}
	
	@RequestMapping("/commentDelete")
	public @ResponseBody int commentDelete(@RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> manager notice_commentDelete");

		int result = 0;
		
		result = serviceNotice.managerDeletedChange(notice_CDTO.getC_num());
		
		return result;
	}
//	=========== 관리자 공지사항 관련 코드 종료 ===========  //


//	=========== 관리자 리뷰 관련 코드 시작 ===========  //
	
	@RequestMapping("/review")
	public String review() {
		
		return "/manager/review/review";
	}
	
//	=========== 관리자 리뷰 관련 코드 종료 ===========  //

}