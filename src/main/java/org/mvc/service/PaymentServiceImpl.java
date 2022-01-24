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
	public List<PaymentDTO> getPaymentList() {
		return mapper.getPaymentList();
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
	public int paymentCancelUpdate(PaymentDTO dto) {
		return mapper.paymentCancelUpdate(dto);
	}

	@Override
	public int paymentCancelInsert(PaymentDTO dto) {
		return mapper.paymentCancelInsert(dto);
	}

	@Override
	public List<PaymentDTO> getCancelList(String imp_Uid) {
		return mapper.getCancelList(imp_Uid);
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

	
}
