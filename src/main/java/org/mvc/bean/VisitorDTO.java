package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class VisitorDTO {
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date v_date;
	private String id;
	private String c_id;

}
