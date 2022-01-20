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

	
}
