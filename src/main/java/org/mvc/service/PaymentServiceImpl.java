package org.mvc.service;

import java.util.List;

import org.mvc.bean.PaymentDTO;
import org.mvc.mybatis.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentMapper mapper;
	
	@Override
	public int paymentInsert(PaymentDTO dto) {
		return mapper.paymentInsert(dto);
	}
	
	@Override
	public int getOerderCount() {
		return mapper.getOerderCount();
	}
	
	@Override
	public PaymentDTO getMerchantUidInfo(String merchant_uid) {
		return mapper.getMerchantUidInfo(merchant_uid);
	}
	
	
	
	@Override
	public List<PaymentDTO> getPaymentList() {
		return mapper.getPaymentList();
	}

	@Override
	public List<PaymentDTO> getPaymentMyList(String id) {
		return mapper.getPaymentMyList(id);
	}

	@Override
	public List<PaymentDTO> getPaymentCoachList(String c_id) {
		return mapper.getPaymentCoachList(c_id);
	}
	
	@Override
	public List<PaymentDTO> getPaymentClassList(String c_num) {
		return mapper.getPaymentClassList(c_num);
	}
	
	@Override
	public List<PaymentDTO> getCancelList(String imp_Uid) {
		return mapper.getCancelList(imp_Uid);
	}
	
	
	
	@Override
	public int paymentCancelUpdate(PaymentDTO dto) {
		return mapper.paymentCancelUpdate(dto);
	}

	@Override
	public int paymentCancelInsert(PaymentDTO dto) {
		return mapper.paymentCancelInsert(dto);
	}
	
	
	
	@Override
	public int getAmountTotal() {
		return mapper.getAmountTotal();
	}

	@Override
	public int getCancelAmountTotal() {
		return mapper.getCancelAmountTotal();
	}

	@Override
	public int getAmountCoach(String c_id) {
		return mapper.getAmountCoach(c_id);
	}

	@Override
	public int getCancelAmountCoach(String c_id) {
		return mapper.getCancelAmountCoach(c_id);
	}

	@Override
	public int getAmountMy(String id) {
		return mapper.getAmountMy(id);
	}

	@Override
	public int getCancelAmountMy(String id) {
		return mapper.getCancelAmountMy(id);
	}

	@Override
	public List<PaymentDTO> getSearchPaymentList(String category, String input) {
		return mapper.getSearchPaymentList(category, input);
	}

	@Override
	public int getSearchAmountTotal(String category, String input) {
		return mapper.getSearchAmountTotal(category, input);
	}

	@Override
	public int getSearchCancelAmountTotal(String category, String input) {
		return mapper.getSearchCancelAmountTotal(category, input);
	}


	
}
