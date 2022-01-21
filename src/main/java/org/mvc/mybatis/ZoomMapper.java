package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ZoomDTO;

public interface ZoomMapper { 
	// 코치강의관련
	public List<ZoomDTO> zoomList(@Param("firstRownum") int firstRownum, @Param("lastRownum")int lastRownum); 
	public int zoomInsert(ZoomDTO dto);
	public int zoomDelete(int num); 
	public int zoomUpdate(ZoomDTO dto);
	public int zoomCount();
	public int zoomReadcount(int num);
	public int imgUpdate(ZoomDTO dto); 
	public ZoomDTO zoomContent(int num);
	
	// 후기관련
	public List<ReviewDTO> reList(@Param("firstRownum") int firstRownum, @Param("lastRownum")int lastRownum);
	public List<ReviewDTO> reContent(Long class_num);  
	public int reInsert(ReviewDTO dto);
	public int reCount(Long num);  
}
