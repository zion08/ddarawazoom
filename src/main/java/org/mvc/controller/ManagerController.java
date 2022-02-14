package org.mvc.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.mvc.Component.Crawling;
import org.mvc.bean.CoachInfoDTO;
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
import org.mvc.service.YoutubeService;
import org.mvc.service.ZoomService;
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
	private ManagerService managerService;
	
	@Autowired
	private ReviewService serviceReview;
	
	@Autowired
	private YoutubeService serviceYoutube;
  
  @Autowired
  private ZoomService serviceZoom;
	
	@Autowired
	private Crawling crawling;

//	=========== 관리자 Vod 관련 코드 시작 ===========  //
	@RequestMapping("/vod")
	public String vodManage(Model model, HttpServletRequest request) {
		
		String pageNum= request.getParameter("pageNum");	
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int pageSize = 5;	
		int currentPage = Integer.parseInt(pageNum); 
		int firstRownum = (currentPage-1)*pageSize + 1;	
		int lastRownum = currentPage*pageSize;		
		
		int pageBlock = 5;	
		int contentCount = serviceYoutube.vodCount();
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
			model.addAttribute("onCount", serviceYoutube.vodOnCount());
			model.addAttribute("offCount", serviceYoutube.vodOffCount());
			model.addAttribute("youtube", serviceYoutube.getManageVideoList(firstRownum, lastRownum));
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
		} else {
			model.addAttribute("contentCount", 0);
		}

		return "/manager/vod/vodManage";
	}
	
	@RequestMapping("/searchVod")
	public @ResponseBody List<String> searchVod(String qurey, String maxResults) throws IOException, ParseException {
		List<String> videoIdList = crawling.getVideioId(qurey, maxResults);
		return videoIdList;
	}
	
	@RequestMapping("/autoInsertVod")
	public @ResponseBody int autoInsertVod(String qurey, String maxResults) throws IOException, ParseException {
		int result=0;	
		List<String> videoIdList = crawling.getVideioId(qurey, maxResults);		
		for (int i=0; i<videoIdList.size(); i++) {
			String videoId = videoIdList.get(i);
			result = insertVod(videoId);
		}
		return result;
	}
	
	@RequestMapping("/insertVod")
	public @ResponseBody int insertVod(String videoId) throws IOException, ParseException {
		int result=0;	
		YoutubeDTO dto = crawling.getVideioInfo(videoId.trim());		
		result = serviceYoutube.insertVideo(dto);		
		return result;
	}
	
	@RequestMapping("/deleteVod")
	public @ResponseBody int deleteVod(int vnum) {
		int result=0;
		result = serviceYoutube.deleteVod(vnum);
		return result;
	}
	
	@RequestMapping("/changeStatusVod")
	public @ResponseBody int changeStatusVod(int vnum, String status) {
		int result=0;		
		result = serviceYoutube.changeStatusVod(vnum, status);
		return result;
	}
//	=========== 관리자 Vod 관련 코드 종료 ===========  //


//	=========== 관리자 수입 관련 코드 시작 ===========  //
	@RequestMapping("/sales")
	public String payment (Model model) {
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
	public String salesSearch (Model model, String category, String input) {
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
	    int noticeCount = 0;
	    int commentCount = 0;
	    
	    noticeCount = serviceNotice.noticeCount();
	    commentCount = serviceNotice.getcommentCount();
	    
	    List<NoticeDTO> noticeList = null;
	    List<Notice_CDTO> commentList = null;
	    
	    if(noticeCount > 0 && commentCount > 0) {
	    	noticeList = serviceNotice.noticeList(startRow, endRow);
	    	commentList = serviceNotice.getAllComment(startRow, endRow);
	    	
	    	int notice_pageCount =  noticeCount / pageSize + ( noticeCount % pageSize == 0 ? 0 : 1);
	    	int comment_pageCount =  commentCount / pageSize + ( commentCount % pageSize == 0 ? 0 : 1);
	    	
	    	int startPage = (int)(currentPage/10)*10+1;
	    	int pageBlock = 10;
	    	int notice_endPage = startPage + pageBlock - 1;
	    	int comment_endPage = startPage + pageBlock - 1;
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
	    model.addAttribute("notice_count", noticeCount);
	    model.addAttribute("comment_count", commentCount);
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
		    
		    List<ReviewDTO> reviewList = null;
		    
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

//	=========== 관리자 멤버 관련 코드 시작 ===========  //
	@RequestMapping("/user")
	public String user(Model model) {
		log.info("	-----CT-----> manager user");
		
		model.addAttribute("newUser", managerService.newUser());
		model.addAttribute("newUserCount", managerService.newUserCount());
		
		model.addAttribute("deleteUser", managerService.getDeleteUser());
		model.addAttribute("deleteUserCount", managerService.getDeleteUserCount());
		
		model.addAttribute("kakaoUser", managerService.getKakaoUser());
		model.addAttribute("kakaoUserCount", managerService.kakaoUserCount());
		
		model.addAttribute("naverUser", managerService.getNaverUser());
		model.addAttribute("naverUserCount", managerService.naverUserCount());
		
		model.addAttribute("userInfo", managerService.getUserInfo());
		model.addAttribute("userCount", managerService.userCount());
		
		// 탈퇴 멤버 제외한 모든 멤버 수
		model.addAttribute("count", managerService.countAllUser());

		return "/manager/user/user";
	}
	
	@RequestMapping("/searchUserList")
	public String searchUserList(String category, String input, String pageNum, Model model) {
		log.info("	-----CT-----> manager searchUserList");
		log.info("category="+category+" input="+input);

		int pageSize = 8;
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int searchCount = 0;
		int number = 0;
	
		searchCount = managerService.searchCount(category, input);
		
		List<UserInfoDTO> userList = null;
		
		if(searchCount > 0) {
			userList = managerService.searchUserList(category, input, startRow, endRow);
		}else{
			userList = managerService.searchUserList(category, input, startRow, endRow);
		}
		
		if(searchCount > 0) {
	    	int pageCount = searchCount / pageSize + (searchCount % pageSize == 0 ? 0 : 1);
	    	
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
		
		number = searchCount - (currentPage - 1) * pageSize;
		
		model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("searchCount", searchCount);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("userList", userList);
	    
	    log.info("=======ddd"+userList);
	    log.info("========================"+userList.size());
	    
	    model.addAttribute("category", category);
	    model.addAttribute("input", input);
	    
		model.addAttribute("newUserCount", managerService.newUserCount());
		model.addAttribute("deleteUserCount", managerService.getDeleteUserCount());
		model.addAttribute("kakaoUserCount", managerService.kakaoUserCount());
		model.addAttribute("naverUserCount", managerService.naverUserCount());
		model.addAttribute("userCount", managerService.userCount());
		model.addAttribute("count", managerService.countAllUser());
	    
		return "/manager/user/searchUserList";
	}

	@RequestMapping("/userInfo")
	public String userInfo(String id, Model model) {
		log.info("	-----CT-----> manager userInfo");
		
		model.addAttribute("number", 1);
		model.addAttribute("userInfo", managerService.userInfo(id));
		model.addAttribute("userPayment", servicePayment.getPaymentCoachList(id));
		
		return "/manager/user/userInfo";
	}
	
	@RequestMapping("/userPw")
	public String userPw(String id, Model model) {
		log.info("	-----CT-----> manager userPw");

		model.addAttribute("userInfo", managerService.userInfo(id));
		
		return "/manager/user/userPw";
	}
	
	@RequestMapping("/updateUserPw")
	public @ResponseBody int updateUserPw(@RequestBody UserInfoDTO userDTO) {
		log.info("	-----CT-----> manager updateUserPw");

		int result = 0;
		
		result = managerService.updateUserPw(userDTO);
		
		return result;
	}
	
	@RequestMapping("/userDelete")
	public @ResponseBody int userDelete(String id) {
		log.info("	-----CT-----> manager updateUserPw");
		
		int result = 0;
		
		result = managerService.userDelete(id);
		
		return result; 
	}
//	=========== 관리자 멤버 관련 코드 종료 ===========  //
	
//	=========== 관리자 zoom강의 관련 코드 시작 ===========  //	
	
	@RequestMapping("/zoom")
	public String zoom(String pageNum, Model model) {
		log.info("	-----CT-----> manager zoomclass");
		
		int pageSize = 10;
		if(pageNum == null) {
			pageNum = "1"; 
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1; 
		int endRow = currentPage * pageSize;
		int count = 0;
		count = serviceZoom.zoomCount();
		List zoomList = null;
		if(count > 0) {
			zoomList = serviceZoom.zoomList(startRow, endRow);
			
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = (int)(currentPage/10) * 10 + 1;
			int pageBlock = 10;
			int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			model.addAttribute("startPage" , startPage);
			model.addAttribute("endPage" , endPage);
			model.addAttribute("pageCount" , pageCount);
		}
		
		model.addAttribute("pageNum" , pageNum);
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("startRow" , startRow);
		model.addAttribute("endRow" , endRow);
		model.addAttribute("count" , count);
		model.addAttribute("pageSize" , pageSize);
		model.addAttribute("zoomList" , zoomList);
		return "/manager/zoom/zoomClass"; 
	}
	
	@RequestMapping("/zoomClassDelete")
	public @ResponseBody int zoomClassDelete(@RequestBody ZoomDTO dto) {
		log.info("	-----CT-----> manager zoomClassDelete");
		int result = 0;
		result = managerService.zoomClassDelete(dto.getNum());
		return result;
	} 
	
	@RequestMapping("/zoomSearchClass")
	public String zoomSearchClass(String pageNum, Model model, String sort, String search) {
		log.info("	-----CT-----> manager zoomSearchclass");
		
		int pageSize = 10;
		if(pageNum == null) {
			pageNum = "1"; 
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1; 
		int endRow = currentPage * pageSize;
		int count = 0;
		
		count = managerService.zoomSearchCount(sort, search);
		
		List zoomList = null;
		if(count > 0) {
			zoomList = managerService.zoomSearchList(startRow, endRow, sort, search);  
			
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = (int)(currentPage/10) * 10 + 1;
			int pageBlock = 10;
			int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			model.addAttribute("startPage" , startPage);
			model.addAttribute("endPage" , endPage);
			model.addAttribute("pageCount" , pageCount);
		}
		
		model.addAttribute("pageNum" , pageNum);
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("startRow" , startRow);
		model.addAttribute("endRow" , endRow);
		model.addAttribute("count" , count);
		model.addAttribute("pageSize" , pageSize);
		model.addAttribute("zoomList" , zoomList);
		
		return "/manager/zoom/zoomSearchClass";
	}

//	=========== 관리자 zoom강의 관련 코드 종료 ===========  //	

}