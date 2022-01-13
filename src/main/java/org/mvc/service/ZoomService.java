package org.mvc.service;

import java.util.List;

import org.mvc.bean.ZoomDTO;

public interface ZoomService {
	public List<ZoomDTO> getList();
	public ZoomDTO getContent(int num);
	public int zoomInsert(ZoomDTO dto); 
	public int zoomDelete(int num);
	public int zoomUpdate(ZoomDTO dto); 
}
