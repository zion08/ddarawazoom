package org.mvc.bean;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PaymentDTO {
	private String impUid;
	private String merchantUid;
	private String name;
	private int amount;
	private String buyerName;
	private String buyerTel;
	private String buyerEmail;
	private String paidAt;
	private String status;
}
