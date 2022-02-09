package org.mvc.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.Notice_CDTO;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.VodDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.service.NoticeService;
import org.mvc.service.PaymentService;
import org.mvc.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	private ReviewService serviceReview;
	
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
	public String notice(String pageNum, Model model, Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> manager notice");
		int pageSize = 8;
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int notice_count = 0;
	    int comment_count = 0;
	    
	    notice_count = serviceNotice.noticeCount();
	    comment_count = serviceNotice.getcommentCount();
	    
	    List noticeList = null;
	    List commentList = null;
	    
	    if(notice_count > 0 && comment_count > 0) {
	    	noticeList = serviceNotice.noticeList(startRow, endRow);
	    	commentList = serviceNotice.getAllComment(startRow, endRow);
	    	
	    	int notice_pageCount = notice_count / pageSize + (notice_count % pageSize == 0 ? 0 : 1);
	    	int comment_pageCount = comment_count / pageSize + (comment_count % pageSize == 0 ? 0 : 1);
	    	int startPage = (int)(currentPage/10)*10+1;
	    	int pageBlock = 10;
	    	int notice_endPage = startPage + pageBlock - 1;
	    	int comment_endPage = startPage + pageBlock -1;
	    	if (notice_endPage > notice_pageCount && comment_endPage > comment_pageCount) {
	    		notice_endPage = notice_pageCount;
	    		comment_endPage = comment_pageCount;
	    	}
	    	model.addAttribute("startPage", startPage);
	    	model.addAttribute("notice_endPage", notice_endPage);
	    	model.addAttribute("comment_endPage", comment_endPage);
	    	model.addAttribute("notice_pageCount", notice_pageCount);
	    	model.addAttribute("comment_pageCount", comment_pageCount);
	    }
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("notice_count", notice_count);
	    model.addAttribute("comment_count", comment_count);
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
	public String review(String pageNum, ReviewDTO reviewDTO, ZoomDTO zoomDTO, VodDTO vodDTO, Model model) {
		log.info("	-----CT-----> manager review");

		int pageSize = 8;
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int reviewCount = 0;
	   
	    reviewCount = serviceReview.reviewCount();
	    
	    List reviewList = null;
	    
	    if(reviewCount > 0) {
	    	reviewList = serviceReview.reviewList(startRow, endRow);
	    	
	    	int reviewPageCount = reviewCount / pageSize + (reviewCount % pageSize == 0 ? 0 : 1);
	    	
	    	int startPage = (int)(currentPage/10)*10+1;
	    	int pageBlock = 10;
	    	int endPage = startPage + pageBlock - 1;
	    	if (endPage > reviewPageCount) {
	    		endPage = reviewPageCount;
	    	}
	    	model.addAttribute("startPage", startPage);
	    	model.addAttribute("endPage", endPage);
	    	model.addAttribute("reviewPageCount", reviewPageCount);
	    }
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("reviewCount", reviewCount);
	    model.addAttribute("reviewList", reviewList);
	    
		return "/manager/review/review";
	}
	
	@RequestMapping("/managerReviewChange")
	public @ResponseBody int managerReviewChange(@RequestBody ReviewDTO reviewDTO) {
		log.info("	-----CT-----> manager managerReviewChange");
		
		int result = 0;
		
		result = serviceReview.managerReviewChange(reviewDTO.getReview_num());
		
		return result;
	}
	
	@RequestMapping("/managerChangeCancell")
	public @ResponseBody int managerChangeCancell(@RequestBody ReviewDTO reviewDTO) {
		log.info("	-----CT-----> manager managerChangeCancell");
		
		int result = 0;
		
		result = serviceReview.managerChangeCancell(reviewDTO.getReview_num());
		
		return result;
	}
	
	@RequestMapping("/managerReviewDelete")
	public @ResponseBody int managerReviewDelete(@RequestBody ReviewDTO reviewDTO) {
		log.info("	-----CT-----> manager managerReviewDelete");
		
		int result = 0;
		
		result = serviceReview.managerReviewDelete(reviewDTO.getReview_num());
		
		return result;
	}
	
//	=========== 관리자 리뷰 관련 코드 종료 ===========  //

}