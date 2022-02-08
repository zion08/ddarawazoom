package org.mvc.service;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;

public interface ZoomService {
	// 코치강의관련
	public List<ZoomDTO> zoomList(@Param("startRow") int startRow, @Param("endRow")int endRow);  
	public int zoomInsert(ZoomDTO dto);
	public int zoomDelete(int num); 
	public int zoomUpdate(ZoomDTO dto);
	public int zoomCount();
	public int zoomReadcount(int num);
	public int imgUpdate(ZoomDTO dto); 
	public ZoomDTO zoomContent(int num);

	//페이관련
	public int getPrice(String merchant_Uid);
	
	// 후기관련
	public List<ReviewDTO> reviewList(@Param("startRow") int startRow, @Param("endRow")int endRow); 
	public int reInsert(ReviewDTO dto);
	public int reCount(int num); 
	public UserInfoDTO getUserInfo(String id);   
} 