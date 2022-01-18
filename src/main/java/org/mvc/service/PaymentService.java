package org.mvc.service;

import java.util.List;

import org.mvc.bean.PaymentDTO;

public interface PaymentService {
	
	public int paymentInsert(PaymentDTO dto);
	public List<PaymentDTO> getPaymentList();
}
