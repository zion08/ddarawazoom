package org.mvc.mybatis;

import java.util.List;

import org.mvc.bean.PaymentDTO;

public interface PaymentMapper {
	
	public int paymentInsert(PaymentDTO dto);
	
	public List<PaymentDTO> getPaymentList();
	
	public int getOerderCount();
	
	public PaymentDTO getMerchantUidInfo(String merchant_uid);
	
	public int paymentCancelUpdate(PaymentDTO dto);

	public int paymentCancelInsert(PaymentDTO dto);
	
	public List<PaymentDTO> getCancelList(String imp_Uid);
	
	public List<PaymentDTO> getPaymentMyList(String id);
	
	public List<PaymentDTO> getPaymentCoachList(String c_id);
	
	public List<PaymentDTO> getPaymentClassList(String c_num);

}
