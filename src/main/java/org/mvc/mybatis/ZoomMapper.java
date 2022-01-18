package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ZoomDTO;

public interface ZoomMapper { 
	public List<ZoomDTO> zoomList(@Param("firstRownum") int firstRownum, @Param("lastRownum")int lastRownum); 
	public List<ReviewDTO> reList(@Param("firstRownum") int firstRownum, @Param("lastRownum")int lastRownum);
	public ZoomDTO zoomContent(int num);
	public int zoomInsert(ZoomDTO dto);
	public int reInsert(ReviewDTO dto);
	public int zoomDelete(int num); 
	public int zoomUpdate(ZoomDTO dto);
	public int zoomCount();
	public int reCount();
	public int zoomReadcount(int num);
	public int imgUpdate(ZoomDTO dto); 
}
