package org.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class UserDTO {

	private String id;
	private String pw;
	private String email;
	private String nick;
	private Date regdate;
	private String img;
	private String status;
}
