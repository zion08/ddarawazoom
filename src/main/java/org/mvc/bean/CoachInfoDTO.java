package org.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class CoachInfoDTO {
	
	private String c_id;
	private String c_pw;
	private String c_name;
	private String c_nick;
	private String c_gender;
	private Date c_birth;
	private String c_tel;
	private String c_email;
	private String c_img;
	private String company;
	private Date c_time;
	private String c_status;
	private Date c_regdate;
}
