package org.mvc.controller;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mvc.bean.FileInfo;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.service.MyRoomService;
import org.mvc.service.PaymentService;
import org.mvc.service.ZoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
 
@Slf4j
@Controller
@RequestMapping("/ddarawazoom")   
public class ZoomController { 
	
	@Autowired
	private ZoomService service;

	@Autowired
	private MyRoomService myService;
	
	@Autowired
	private PaymentService servicePayment;
	
	@Autowired
	private FileInfo fileInfo;   
	
	// ===== zoom강의 메인(리스트) ===== //
	@RequestMapping("zoom")
	public String main(String pageNum, Model model,  HttpSession session, HttpServletRequest request) {
		log.info(" -----CT-----> Main "); 
		
		String id = (String)session.getAttribute("id");
		log.info("id=" + id);
		
		String c_id = (String)session.getAttribute("c_id"); 
		log.info("c_id=" + c_id); 
		
		int pageSize = 9;
		if (pageNum == null) {
		    pageNum = "1";
		}
	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number= 0;
			
	    count = service.zoomCount();
	    List zoomList = null;
	    if (count > 0) {
	    	zoomList = service.zoomList(startRow, endRow);
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
	    
	    number = count - (currentPage-1) * pageSize;
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("zoomList", zoomList);	    
	    return "/zoom/class/zclass";	
	}
	
	// ===== zoom 강의등록 ===== //
	@RequestMapping("/zwriteForm")
	public String zwriteForm(HttpSession session, Model model) {
		log.info(" -----CT-----> writeForm ");
		
		String c_id = (String)session.getAttribute("c_id");
		model.addAttribute("c_id" , c_id);
		log.info("c_id=" + c_id);
		
		return "/zoom/class/zwriteForm"; 
	} 
		
	@RequestMapping("/zwritePro")
	public String zwritePro(ZoomDTO dto , Model model) {
		log.info(" -----CT-----> writePro ");
		log.info("dto=" + dto);
		
		Date now = new Date();
	    SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	    String nowDate = format.format(now);

		dto.setMerchant_uid("ddz" + nowDate); 
		log.info("Merchant_uid" + dto.getMerchant_uid());
		
		model.addAttribute("result" , service.zoomInsert(dto)); 
		
		return "/zoom/class/zwritePro"; 
	}
	
	// ===== zoom강의 삭제 ===== //
	@RequestMapping("/zdeleteForm")
	public String zdeleteForm(@ModelAttribute("num") int num, HttpSession session, Model model) {
		log.info(" -----CT-----> deleteForm ");
		model.addAttribute("zoom" , service.zoomContent(num));
		return "/zoom/class/zdeleteForm";
	}
	
	@RequestMapping("zdeletePro")
	public String zdeletePro(int num , Model model) {
		log.info(" -----CT-----> deletePro ");
		model.addAttribute("result" , service.zoomDelete(num));
		return "/zoom/class/zdeletePro";
	}
	
	// ===== zoom강의 수정 ===== //
	@RequestMapping("zupdateForm")
	public String zupdateForm(int num , ZoomDTO dto , Model model) {
		log.info(" -----CT-----> UpdateForm ");
		log.info("dto=" + dto);
		model.addAttribute("ZoomDTO" , service.zoomContent(num));
		return "/zoom/class/zupdateForm"; 
	}
	
	@RequestMapping("zupdatePro")
    public String zupdatePro(ZoomDTO dto , Model model) {
        log.info(" -----CT-----> updatePro "); 
        log.info("dto=" + dto);
        model.addAttribute("num" , dto.getNum());
    	model.addAttribute("result" , service.zoomUpdate(dto));
		return "/zoom/class/zupdatePro"; 
	}
	
	// ===== 조회수 더하기(redirect zclasscontent) ===== //
	@RequestMapping("zoomReadcount")
	public String zoomReadcount(int num , RedirectAttributes rttr) {
		log.info(" -----CT-----> Readcount ");
		service.zoomReadcount(num);
		rttr.addAttribute("num" , num); 
		return "redirect:/ddarawazoom/zclasscontent";    
	}
	
	// ===== 이미지 업데이트 ===== //
	@RequestMapping("/imgUpdate")
	public String imgUpdate(int num, Model model) {
		log.info(" -----CT-----> imgUpdate ");
		model.addAttribute("zoomContent" , service.zoomContent(num));
		return "/zoom/class/imgUpdate";
	}
	
	@RequestMapping("/imgUpdatePro")
	public String imgUpdatePro(ZoomDTO dto , MultipartFile save, Model model) {
		log.info(" -----CT-----> imgUpdatePro ");
		
		log.info("img=" + dto.getImg());
		log.info("intro=" + dto.getIntro());
		log.info("num=" + dto.getNum());
		
		String fileName = fileInfo.classImgUpload(save, dto.getNum()); 	
		
		log.info("fileName=" , fileName);
		if(fileName != null) {
			dto.setImg(fileName);
			model.addAttribute("result" , service.imgUpdate(dto)); 
		}
		model.addAttribute("num" , dto.getNum());
		return "/zoom/class/imgUpdatePro";   
	}
	
	// ===== zoom강의별 내용화면 ===== //
	@RequestMapping("/zclasscontent")
	public String zclasscontent(String pageNum, ZoomDTO dto, int num, Model model , HttpSession session , HttpServletRequest request) { 
		log.info(" -----CT-----> zoomClassContent "); 
			
		String id = (String)session.getAttribute("id");
		log.info("id=" + id);
		
		String c_id = (String)session.getAttribute("c_id"); 
		log.info("c_id=" + c_id);
		
		if(id != null && c_id == null) {
			model.addAttribute("result" , myService.zoomLikeCheck(id , dto.getNum()));
			model.addAttribute("userInfo", service.getUserInfo(id)); 
		}
		
		int pageSize = 5; 
		if (pageNum == null) {
		    pageNum = "1"; 
		} 
	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    
	    count = service.reCount(num);
	    List reviewList = null;
	    if (count > 0) {
	    	reviewList = service.reviewList(num, startRow, endRow); 
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
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("reviewList", reviewList);
	    model.addAttribute("zoomContent" , service.zoomContent(num));
	    // 총 결제 갯수
	    model.addAttribute("cnt", servicePayment.getOerderCount());
		return "/zoom/class/zclasscontent";   
	} 
	
	// ===== zoom 후기등록 ===== //
	@RequestMapping("re_writeForm")
	public String re_writeForm() {
		return "/zoom/class/zclasscontent"; 
	}
	
	@RequestMapping("re_writePro")
	public String re_writePro(ReviewDTO dto , Model model) {
		model.addAttribute("num" , dto.getClass_num());  
		model.addAttribute("result" , service.reInsert(dto)); 
		return "/zoom/class/re_writePro"; 
	}
}	