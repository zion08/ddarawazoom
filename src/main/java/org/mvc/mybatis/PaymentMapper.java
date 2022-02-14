package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.PaymentDTO;

public interface PaymentMapper {
	
	public int paymentInsert(PaymentDTO dto);	
	
	public int getOerderCount();
	
	public PaymentDTO getMerchantUidInfo(String merchant_uid);
	

	public List<PaymentDTO> getPaymentList();
	
	public List<PaymentDTO> getSearchPaymentList(@Param("category")String category, @Param("input")String input);
	
	public List<PaymentDTO> getPaymentMyList(String id);
	
	public List<PaymentDTO> getPaymentCoachList(String c_id);
	
	public List<PaymentDTO> getPaymentClassList(String c_num);
	
	public List<PaymentDTO> getCancelList(String imp_Uid);
	
	
	public int paymentCancelUpdateTP(PaymentDTO dto);
	
	public int paymentCancelUpdateTC(PaymentDTO dto);

	public int paymentCancelInsert(PaymentDTO dto);
	

	public int getAmountTotal();

	public int getSearchAmountTotal(@Param("category")String category, @Param("input")String input);
	
	public int getCancelAmountTotal();
	
	public int getSearchCancelAmountTotal(@Param("category")String category, @Param("input")String input);
	
	public int getAmountCoach(String c_id);
	
	public int getCancelAmountCoach(String c_id);
	
	public int getAmountMy(String id);
	
	public int getCancelAmountMy(String id);
	
	

}
