package org.mvc.mybatis;

import java.util.List;

import org.mvc.bean.PaymentDTO;

public interface PaymentMapper {
	
	public int paymentInsert(PaymentDTO dto);
	public List<PaymentDTO> getPaymentList();
}
