package org.mvc.mybatis;

import java.util.List;

import org.mvc.bean.ZoomDTO;

public interface ZoomMapper { 
	public List<ZoomDTO> getList();
	public ZoomDTO getContent(int num);
	public int zoomInsert(ZoomDTO dto);  
	
}
