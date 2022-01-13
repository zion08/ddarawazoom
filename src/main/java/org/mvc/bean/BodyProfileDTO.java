package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BodyProfileDTO {

	private int b_num;
	private String b_id;
	private float b_height;
	private float b_weight;
	private float b_muscle;
	private float b_bodyfat;
	private String b_shape;
	private float b_chest;
	private float b_waist;
	private float b_arm;
	private float b_thigh;
	private float b_hip;
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date b_date;
}
