package org.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ScheduleDTO {
	private int id;
	private String m_id;
	private String c_id;
	private String title;
	private Date start;
	private Date end;
}
