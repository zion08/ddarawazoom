package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MyProfileDTO {
	private String b_id;
	private String b_nick;
	private String b_name;
	private String b_gender;
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date b_birth;
	private String b_tel;
	private String b_email;
	private String b_img;
}
