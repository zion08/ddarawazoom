package org.mvc.service;

import java.util.List;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.MyProfileDTO;
import org.mvc.mybatis.BodyProfileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Service
public class BodyProfileSImpl implements BodyProfileS {

	@Setter(onMethod_=@Autowired)
	private BodyProfileMapper mapper;

	@Override
	public MyProfileDTO getMyProfile(String b_id) {
		return mapper.getMyProfile(b_id);
	}
	
	@Override
	public List<BodyProfileDTO> getBodyProfile(String b_id) {
		return mapper.getBodyProfile(b_id);
	}

	@Override
	public List<BodyProfileDTO> bodyList(String b_id){
		return mapper.bodyList(b_id);
	}
	
	@Override
	public int myWrite(MyProfileDTO myDTO) {
		return mapper.myWrite(myDTO);
	}
	
	@Override
	public int myUpdate(MyProfileDTO myDTO) {
		return mapper.myUpdate(myDTO);
	}

	@Override
	public int bodyWrite(BodyProfileDTO bodyDTO) {
		return mapper.bodyWrite(bodyDTO);
	}

	@Override
	public BodyProfileDTO bodyRead(int b_num, String b_id) {
		return mapper.bodyRead(b_num, b_id);
	}
	
	@Override
	public int bodyUpdate(BodyProfileDTO bodyDTO) {
		return mapper.bodyUpdate(bodyDTO);
	}

	@Override
	public int bodyDelete(int b_num) {
		return mapper.bodyDelete(b_num);
	}
}
