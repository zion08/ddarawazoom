package org.mvc.service;

import java.util.List;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.MyProfileDTO;

public interface BodyProfileS {

	public MyProfileDTO getMyProfile(String b_id);
	
	public List<BodyProfileDTO> getBodyProfile(String b_id);
		
	public List<BodyProfileDTO> bodyList(String b_id);
	
	public int myWrite(MyProfileDTO myDTO);
	
	public int myUpdate(MyProfileDTO myDTO);
	
	public int bodyWrite(BodyProfileDTO bodyDTO);
	
	public BodyProfileDTO bodyRead(int b_num, String b_id);
	
	public int bodyUpdate(BodyProfileDTO bodyDTO);
	
	public int bodyDelete(int b_num);
}
