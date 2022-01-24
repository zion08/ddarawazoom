package org.mvc.service;

import java.util.List;

import org.mvc.bean.PaymentDTO;

public interface PaymentService {
	
	//결제 정보 입력
	public int paymentInsert(PaymentDTO dto);
	
	//결제 내역 전체 조회
	public List<PaymentDTO> getPaymentList();
	
	//전체 주문 건수 조회
	public int getOerderCount();
	
	//주문번호에 대한 결제 정보 조회
	public PaymentDTO getMerchantUidInfo(String merchant_uid);
	
	//결제 취소 내역 업데이트
	public int paymentCancelUpdate(PaymentDTO dto);
	
	//결제 취소 내역 입력
	public int paymentCancelInsert(PaymentDTO dto);
	
	//결제 취소 상사 내역 출력
	public List<PaymentDTO> getCancelList(String imp_Uid);
	
	//내 결제 내역
	public List<PaymentDTO> getPaymentMyList(String id);
	
	//코치별 결제 내역
	public List<PaymentDTO> getPaymentCoachList(String c_id);
	
	//강의별 결제 내역
	public List<PaymentDTO> getPaymentClassList(String c_num);
}
