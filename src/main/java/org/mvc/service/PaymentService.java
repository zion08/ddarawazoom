package org.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.PaymentDTO;

public interface PaymentService {
	
	//결제 정보 입력
	public int paymentInsert(PaymentDTO dto);
	
	//전체 주문 건수 조회
	public int getOerderCount();
	
	//주문번호에 대한 결제 정보 조회
	public PaymentDTO getMerchantUidInfo(String merchant_uid);
	
	
	//결제 내역 전체 조회
	public List<PaymentDTO> getPaymentList();
	
	//결제 내역 검색
	public List<PaymentDTO> getSearchPaymentList(String category, String input);
	
	//내 결제 내역
	public List<PaymentDTO> getPaymentMyList(String id);
	
	//코치별 결제 내역
	public List<PaymentDTO> getPaymentCoachList(String c_id);
	
	//강의별 결제 내역
	public List<PaymentDTO> getPaymentClassList(String c_num);

	//결제 취소 상세 내역 출력
	public List<PaymentDTO> getCancelList(String imp_Uid);
	
	
	//결제 취소 내역 업데이트
	public int paymentCancelUpdateTP(PaymentDTO dto);
	public int paymentCancelUpdateTC(PaymentDTO dto);
	
	//결제 취소 내역 입력
	public int paymentCancelInsert(PaymentDTO dto);
	
	
	// 총 거래 금액
	public int getAmountTotal();
	
	// 검색된 거래금액
	public int getSearchAmountTotal(String category, String input);
	
	// 총 환불 금액
	public int getCancelAmountTotal();
	
	// 검색된 환불 금액
	public int getSearchCancelAmountTotal(String category, String input);
	
	//코치별 총 거래 금액
	public int getAmountCoach(String c_id);
	
	//코치별 총 환불 금액
	public int getCancelAmountCoach(String c_id);
	
	//나의 총 거래 금액
	public int getAmountMy(String id);
		
	//나의 총 환불 금액
	public int getCancelAmountMy(String id);

}
