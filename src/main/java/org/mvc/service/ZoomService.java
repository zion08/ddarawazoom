package org.mvc.service;

import java.util.List;

import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ZoomDTO;

public interface ZoomService {
	public List<ZoomDTO> zoomList(int firstRownum, int lastRownum); 
	public List<ReviewDTO> reList(int firstRownum, int lastRownum);
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
