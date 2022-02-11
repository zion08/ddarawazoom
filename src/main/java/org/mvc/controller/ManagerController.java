package org.mvc.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.mvc.Component.Crawling;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.FileInfo;
import org.mvc.bean.NoticeDTO;
import org.mvc.bean.Notice_CDTO;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.VodDTO;
import org.mvc.bean.YoutubeDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.service.ManagerService;
import org.mvc.service.NoticeService;
import org.mvc.service.PaymentService;
import org.mvc.service.ReviewService;
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
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private ReviewService serviceReview;
	
	@Autowired
	private Crawling crawling;

//	=========== 관리자 Vod 관련 코드 시작 ===========  //
	@RequestMapping("/vod")
	public String vodManage() {
		
		return "/manager/vod/vodManage";
	}
	
	@RequestMapping("/searchVod")
	public @ResponseBody List<String> searchVod(String qurey, String maxResults) throws IOException, ParseException {
		System.out.println(qurey);
		System.out.println(maxResults);

		List<String> videoIdList = crawling.getVideioId(qurey, maxResults);
		System.out.println(videoIdList.toString());
		return videoIdList;
	}
	
	@RequestMapping("/insertVod")
	public @ResponseBody int insertVod(String videoId) throws IOException, ParseException {
		int result=0;
		System.out.println(videoId);
	

		YoutubeDTO dto = crawling.getVideioInfo(videoId);
		System.out.println(dto);
		return result;
	}
//	=========== 관리자 Vod 관련 코드 종료 ===========  //

	
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
	
	@RequestMapping("/salesSearch")
	public String salesSearch (Model model, HttpSession session, String category, String input) {
		log.info("	-----CT-----> manager sales");
		
		// 결제 내역 출력
		List<PaymentDTO> paymentList = servicePayment.getSearchPaymentList(category, input);
		model.addAttribute("payment", paymentList);
		
		// 총 거래액, 환불액, 매출액
		DecimalFormat fmt = new DecimalFormat("###,###");
		int amount = servicePayment.getSearchAmountTotal(category, input);
		String amountFmt = fmt.format(amount);
		model.addAttribute("amount", amountFmt);
		
		int cancelAmount = servicePayment.getSearchCancelAmountTotal(category, input);
		String cancelAmoutFmt = fmt.format(cancelAmount);
		model.addAttribute("cancelAmount", cancelAmoutFmt);
		
		int sales = amount - cancelAmount;
		String salseFmt = fmt.format(sales);
		model.addAttribute("sales", salseFmt);
		
		return "/manager/sales/salesSearch";
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
	
	@RequestMapping("/managerDeletedChange")
	public @ResponseBody int commentDelete(@RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> manager managerDeletedChange");

		int result = 0;
		
		result = serviceNotice.managerDeletedChange(notice_CDTO.getC_num());
		
		return result;
	}
	
	@RequestMapping("/managerDeletedCancell")
	public @ResponseBody int managerDeletedCancell(@RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> manager managerDeletedCancell");
		
		int result = 0;
		
		result = serviceNotice.managerDeletedChange(notice_CDTO.getC_num());
		
		return result;
	}
	
	@RequestMapping("/managerCommentDelete")
	public @ResponseBody int managerCommentDelete(@RequestBody Notice_CDTO notice_CDTO) {
		log.info("	-----CT-----> manager managerCommentDelete");
		
		int result = 0;
		
		result = serviceNotice.managerCommentDelete(notice_CDTO.getC_num());
		
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

//	=========== 관리자 코치 관련 코드 시작 ===========  //
	
	@RequestMapping("/coach")
	public String coachMain(Model model) {
		log.info("	-----CT-----> manager coachMain");
		model.addAttribute("count", managerService.countAllCoach());
		model.addAttribute("allCoachInfo", managerService.getAllCoachInfo());
		return "/manager/coach/coachMain";
	}
	
	@RequestMapping("/coachInfo")
	public String coachInfo(String c_id, Model model) {
		log.info("	-----CT-----> manager coachInfo");
		
		// 코치 정보
		model.addAttribute("number", 1);
		model.addAttribute("coachInfo", managerService.coachInfo(c_id));
		model.addAttribute("coachCareer", managerService.coachCareer(c_id));

		// 코치가 등록한 수업 정보
		model.addAttribute("classNumber", 1);
		model.addAttribute("coachClass", managerService.getCoachClass(c_id));
		
		return "/manager/coach/coachInfo";
	}
	
	@RequestMapping("/coachStatusChange")
	public @ResponseBody int coachStatusChange(CoachInfoDTO dto) {
		log.info("	-----CT-----> manager coachStatusChange");
		int result = 0;
		result = managerService.changeStatus(dto);
		
		return result;
	}
	
	@RequestMapping("/classDelete")
	public @ResponseBody int classDelete(int num){
		log.info("	-----CT-----> manager classDelete");
		int result = 0;
		result = managerService.deleteClass(num);
		
		return result;
	}
	
	@RequestMapping("/classRestore")
	public @ResponseBody int classRestore(int num) {
		log.info("	-----CT-----> manager classRestore");
		int result = 0;
		result = managerService.restoreClass(num);
		
		return result;
	}
	
//	=========== 관리자 코치 관련 코드 종료 ===========  //
	
}