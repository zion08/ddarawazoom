package org.mvc.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mvc.bean.ClassApplyDTO;
import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.FileInfo;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.service.CoachRoomService;
import org.mvc.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coachroom")
public class CoachRoomController {
   
	@Setter(onMethod_=@Autowired)
	private CoachRoomService service;
	
	@Autowired
	private PaymentService servicePayment;
	
	@Autowired
	private FileInfo fileInfo;
	
//  =========== 코치룸 메인화면 ===========  //	
	@RequestMapping()
	public String main(HttpSession session, Model model) {
		log.info("	-----CT----->coachMain");
		
		String c_id = (String)session.getAttribute("c_id");

		model.addAttribute("reviewList", service.getAllReview(c_id));
		
		return "/coachroom/main";
	}
	
//  =========== 코치정보 관련 코드 시작 ===========  //	
	@RequestMapping("/info")
	public String info(HttpSession session, Model model) {
		log.info("	-----CT----->coachInfo");
		String c_id = (String)session.getAttribute("c_id");
		
		model.addAttribute("coachInfo", service.getCoachInfo(c_id));
		model.addAttribute("coachCareer", service.getAllCareerInfo(c_id));
		// 경력이 여러개일 경우 앞의 갯수 카운팅을 위해 1을 넘김
		model.addAttribute("number", 1);
		
		return "/coachroom/coachinfo/info";
	}

	@RequestMapping("/infoUpdate")
	public String infoUpdate(HttpSession session, Model model) {
		log.info("	-----CT----->coachInfoUpdate");
		
		String c_id = (String)session.getAttribute("c_id");
		
		model.addAttribute("coachInfo", service.getCoachInfo(c_id));
		
		return "/coachroom/coachinfo/infoUpdate";
	}
	
	@RequestMapping("/infoUpdateData")
	public @ResponseBody int infoUpdateData(@RequestBody CoachInfoDTO dto, HttpSession session) {
		log.info("	-----CT----->infoUpdateData");
		log.info(""+dto);
		
		int result = 0;
		
		if(dto.getC_gender().equals("0")) {
			dto.setC_gender("남성");
		} else if(dto.getC_gender().equals("1")) {
			dto.setC_gender("여성");
		}
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		result = service.updateInfo(dto);
		
		return result;
	}
	
	@RequestMapping("/imgUpdate")
	public String imgUpdate() {
		log.info("	-----CT----->imgUpdate");
		return "/coachroom/coachinfo/imgUpdate";
	}
	
	@RequestMapping("/imgUpdatePro")
	public @ResponseBody int imgUpdatePro(CoachInfoDTO dto, MultipartFile save, HttpSession session) {
		log.info("	-----CT----->imgUpdatePro");
		log.info(""+save.getOriginalFilename());
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		int result = 0;
		
		String file = fileInfo.imgUpload(save, c_id);
		if(file != null) {
			dto.setC_img(file);
			result = service.updateImg(dto);
		}
		return result;
	}
	
	@RequestMapping("/careerInsert")
	public String careerInsert() {
		log.info("	-----CT----->careerInsert");
		return "/coachroom/coachinfo/careerInsert";
	}
	
	@RequestMapping("/careerInsertPro")
	public @ResponseBody int careerInsertPro(HttpSession session, @RequestBody CoachCareerDTO dto) {
		log.info("	-----CT----->careerInsertPro");

		int result = 0;
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		result = service.insertCareer(dto);
		
		return result;
	}
	
	@RequestMapping("/careerUpdate")
	public String careerUpdate(HttpSession session, Model model, CoachCareerDTO dto) {
		log.info("	-----CT----->careerUpdate");
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		model.addAttribute("coachCareer", service.getCareerInfo(dto));
		
		return "/coachroom/coachinfo/careerUpdate";
	}
	
	@RequestMapping("/careerUpdatePro")
	public @ResponseBody int careerUpdatePro(HttpSession session, @RequestBody CoachCareerDTO dto) {
		log.info("	-----CT----->careerUpdatePro");
		
		int result = 0;
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		result = service.updateCareer(dto);
		
		return result;
	}
	
	@RequestMapping("/careerDelete")
	public @ResponseBody int careerDelete(HttpSession session, @RequestBody CoachCareerDTO dto) {
		log.info("	-----CT----->careerDelete");
		
		int result = 0;
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		result = service.deleteCareer(dto);
		
		return result;
	}
	
	@RequestMapping("/introduceUpdate")
	public String introduceUpdate() {
		log.info("	-----CT----->introduceUpdate");
		return "/coachroom/coachinfo/introduceUpdate";
	}
	
	@RequestMapping("/introduceUpdatePro")
	public @ResponseBody int introduceUpdatePro(HttpSession session, @RequestBody CoachInfoDTO dto) {
		log.info("	-----CT----->introduceUpdatePro");
		log.info(""+dto);
		int result = 0;
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		result = service.updateItroduce(dto);
		
		return result;
	}
//  =========== 코치정보 관련 코드 종료 ===========  //	
	
//  =========== 스케줄 관련 코드 시작 ===========  //
	@RequestMapping("/schedule")
	public String coachSchedule() {
		log.info("	-----CT----->coachSchedule");
		
		return "/coachroom/schedule/schedule";
	}
	
	@RequestMapping("/getSchedule")
	public @ResponseBody ArrayList<ScheduleDTO> getSchedule(HttpSession session, Model model) {
		log.info("	-----CT----->getSchedule");
		String c_id = (String)session.getAttribute("c_id");
		
		return service.getAllSchedule(c_id);
	}
	
	@RequestMapping("/add_event")
	public String add_event() {
		log.info("	-----CT----->add_event");
		return "/coachroom/schedule/schedule_add";
	}
	
	@RequestMapping("/add_eventPro")
	public @ResponseBody int add_eventPro(@RequestBody ScheduleDTO dto, HttpSession session) throws ParseException {
		log.info("	-----CT----->add_eventPro");
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		// 날짜와 시간정보를 각각 String 값으로 받은 후 두개를 합쳐서 Date 타입으로 변환 후 데이터 삽입
		String startStr = dto.getStart_date() +" "+ dto.getStart_time();
		String endStr = dto.getEnd_date() + " " + dto.getEnd_time();
				
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		Date start = transFormat.parse(startStr);
		Date end = transFormat.parse(endStr);
				
		dto.setStart(start);
		dto.setEnd(end);
		
		int result = service.insertSchedule(dto);
		
		return result;
	}
	
	@RequestMapping("/schedule_popup")
	public String sechedule_popup(ScheduleDTO dto, Model model) {
		log.info("	-----CT----->schedule_popup");
		log.info(""+dto);
		model.addAttribute("dto", dto);
		return "/coachroom/schedule/schedule_popup";
	}
	
	@RequestMapping("/delete_event")
	public @ResponseBody int delete_event(int id) {
		log.info("	-----CT----->delete_event // id ----->"+id);
		
		ScheduleDTO dto = new ScheduleDTO();
		dto.setId(id);
		int result = service.deleteSchedule(dto);
		return result;
	}
	
	@RequestMapping("/update_schedule")
	public String update_schedule(HttpSession session, ScheduleDTO dto, Model model) {
		log.info("	-----CT----->update_schedule");
		log.info(""+dto.getId());
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		log.info(""+service.getSchedule(dto));
		
		model.addAttribute("schedule", service.getSchedule(dto));
		return "/coachroom/schedule/schedule_update";
	}
	
	@RequestMapping("/update_schedulePro")
	public @ResponseBody int update_schedulePro(@RequestBody ScheduleDTO dto, HttpSession session) throws ParseException {
		log.info("	-----CT----->update_schedulePro");
		log.info(""+dto);
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		// 날짜와 시간정보를 각각 String 값으로 받은 후 두개를 합쳐서 Date 타입으로 변환 후 데이터 삽입
		String startStr = dto.getStart_date() +" "+ dto.getStart_time();
		String endStr = dto.getEnd_date() + " " + dto.getEnd_time();
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		Date start = transFormat.parse(startStr);
		Date end = transFormat.parse(endStr);
		
		dto.setStart(start);
		dto.setEnd(end);
		
		int result = service.updateSchedule(dto);
		
		return result;
	}
//	=========== 스케줄 관련 코드 종료 ===========  //
	
//	=========== 리뷰관리 관련 코드 시작 ===========  //
	
	// 코치가 등록한 수업 목록
	@RequestMapping("/class")
	public String review(HttpSession session, Model model, String pageNum) {
		log.info("	-----CT----->class");
		
		String c_id = (String)session.getAttribute("c_id");
		
		int pageSize = 10;
		
		if (pageNum == null) {
		       pageNum = "1";
		}

	    int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		
		count = service.getClassCount(c_id);
		List classList = null;
		if(count > 0) {
			classList = service.getAllClass(c_id, startRow, endRow);
		}
		
		model.addAttribute("classList", classList);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		
		return "/coachroom/list";
	}
	
	// 해당 수업의 리뷰 목록
	@RequestMapping("/content")
	public String content(ZoomDTO dto, String pageNum, Model model, HttpSession session) {
		log.info("	-----CT-----> review/content");
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		int pageSize = 10;
		
		if (pageNum == null) {
		       pageNum = "1";
		}

	    int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		
		count = service.reviewCount(dto.getNum());
		List reviewList = null;
		if(count > 0) {
			reviewList = service.getReview(dto.getNum());
		}
		
		model.addAttribute("classContent", service.getClass(c_id, dto.getNum()));
		model.addAttribute("review", reviewList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		
		return "/coachroom/review/reviewPage";
	}
//	=========== 리뷰관리 관련 코드 종료 ===========  //	
	
//	=========== 회원관리 관련 코드 시작 ===========  //	
	@RequestMapping("/member")
	public String member(ClassApplyDTO dto, Model model, HttpSession session) {
		log.info("	-----CT-----> member/content");
		
		String c_id = (String)session.getAttribute("c_id");
		
		Long num = Long.valueOf(dto.getNum());
		
		model.addAttribute("classContent", service.getClass(c_id, num));
		model.addAttribute("member", service.getApplyMember(dto));
		model.addAttribute("count", service.applyMemberCount(dto.getNum()));
		
		return "/coachroom/member/memberPage";
	}
//	=========== 회원관리 관련 코드 종료 ===========  //	

	
//	=========== 코치 수입 관련 코드 시작 ===========  //
	@RequestMapping("/payment")
	public String payment (Model model, HttpSession session) {
		log.info("	-----CT-----> coach payment");
		
		// 코치별 결제 내역 출력
		String c_id = (String)session.getAttribute("c_id");
		List<PaymentDTO> paymentList = servicePayment.getPaymentCoachList(c_id);
		model.addAttribute("payment", paymentList);
		
		// 코치별 총 거래액, 환불액, 매출액
		DecimalFormat fmt = new DecimalFormat("###,###");
		int amount = servicePayment.getAmountCoach(c_id);
		String amountFmt = fmt.format(amount);
		model.addAttribute("amount", amountFmt);
		
		int cancelAmount = servicePayment.getCancelAmountCoach(c_id);
		String cancelAmoutFmt = fmt.format(cancelAmount);
		model.addAttribute("cancelAmount", cancelAmoutFmt);
		
		int sales = amount - cancelAmount;
		String salseFmt = fmt.format(sales);
		model.addAttribute("sales", salseFmt);
		
		return "/coachroom/payment/coachPayment";
	}		
//	=========== 코치 수입 관련 코드 종료 ===========  //
	
}
