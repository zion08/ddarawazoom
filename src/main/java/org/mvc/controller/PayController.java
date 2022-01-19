package org.mvc.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.mvc.bean.DateFormatChange;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.service.PaymentService;
import org.mvc.service.ZoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class PayController {
	
	@Autowired
	private ZoomService serviceZoom;
	
	@Autowired
	private PaymentService servicePayment;
	
	@Autowired
	private PaymentDTO paymentDTO;
	
	@Autowired
	private DateFormatChange dateFormat;
	
	private IamportClient api;
	public PayController() {
    	// REST API 키와 REST API secret
		this.api = new IamportClient("3390529037918084","0374ed2bfae3f054f7ff51e2c27c9503a06cb4099a069d85607c8888899772c8883878e2404ec8b7");
	}
	
	@RequestMapping("/pay")
	public String zcalsscontent(Model model) {
		int num = 11;
		model.addAttribute("ZoomDTO" , serviceZoom.zoomContent(num));
		
		// 결제 내역 출력
		List<PaymentDTO> paymentList = servicePayment.getPaymentList();
		model.addAttribute("payment", paymentList);
		return "/zoom/pay/pay";  
	}
	
	@RequestMapping("/payPro")
	public @ResponseBody int payPro(String imp_uid, String merchant_uid) throws IamportResponseException, IOException {
		// DB에서 결제 정보 조회
		// int amountToBePaid = serviceZoom.getPrice(merchant_uid);
		int amountToBePaid = 1000; // test용
			
		int result = 0;
		IamportResponse<Payment> verify = api.paymentByImpUid(imp_uid);	// 결제 번호(imp_uid)와 금액(amount)으로 결제 검증	
		if(verify.getResponse().getAmount().compareTo(BigDecimal.valueOf(amountToBePaid)) == 0) {
			log.info("	------>verify: " + "검증 성공");
			
			Payment payment = verify.getResponse();	// api로 결제 정보 조회 (iamport 서버)			 
			
			String impUid = payment.getImpUid();
			String merchantUid = payment.getMerchantUid();
			String name = payment.getName();
			int amountInt = payment.getAmount().intValue();
			String buyerName = payment.getBuyerName();
			String buyerTel = payment.getBuyerTel();
			String buyerEmail = payment.getBuyerEmail();
			Date paidAt = payment.getPaidAt();
			String paidAtStr = dateFormat.dateTimeFull(paidAt);
			String status = payment.getStatus();
			
			paymentDTO.setImpUid(impUid);		// DTO 변수 저장
			paymentDTO.setMerchantUid(merchantUid);
			paymentDTO.setName(name);
			paymentDTO.setAmount(amountInt);
			paymentDTO.setBuyerName(buyerName);
			paymentDTO.setBuyerTel(buyerTel);
			paymentDTO.setBuyerEmail(buyerEmail);
			paymentDTO.setPaidAt(paidAtStr);
			paymentDTO.setStatus(status);
			
			result = servicePayment.paymentInsert(paymentDTO);
			if(result==1) {
				log.info("	------>save: " + "저장 성공");
			} else {
				log.info("	------>save: " + "저장 실패");
			}
			
		} else {
			log.info("	------>verify: " + "검증 실패");
		}
		return result;  
	}
	
	
	@RequestMapping("/paycancelPro")
	public @ResponseBody int paycancelPro(String imp_uid, String merchant_uid) throws IamportResponseException, IOException {
		int result = 1;
		log.info("	------>imp_uid: " + imp_uid);
		log.info("	------>imp_uid: " + merchant_uid);
		
		return result; 
	}

	
	@RequestMapping("/payProtest")
	public @ResponseBody String payPro() throws IamportResponseException, IOException {

		IamportResponse<Payment> verify = api.paymentByImpUid("imp_087641817336");
		if(verify.getResponse().getAmount().compareTo(BigDecimal.valueOf(1000)) == 0) {
			log.info("	------>verify: " + "검증 성공");
			
			Payment payment = verify.getResponse();	// api로 결제 정보 조회 (iamport 서버)			 
			
			String impUid = payment.getImpUid();
			log.info("	------>impUid: " + impUid);

			
			Date paidAtDate = payment.getPaidAt();
			log.info("	------>paidAtDate: " + paidAtDate);
			
			String paidAt = dateFormat.dateTimeFull(paidAtDate);
			
			paymentDTO.setPaidAt(paidAt);
			log.info("	------>paidAt: " + paymentDTO.getPaidAt());
			
			
			String status = payment.getStatus();
			log.info("	------>status: " + status);
		}
		return "ok";  
	}
	
	
	

}
