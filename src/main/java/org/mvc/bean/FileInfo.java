package org.mvc.bean;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileInfo {

	public boolean fileTypeCheck(MultipartFile file, String type) {
		boolean result = false;
		String fileType = file.getContentType().split("/")[0];
		// "/" 기준으로 나누어 배열에 기준으로 type를 확인
		if(fileType.equals(type)) {
			result = true;
		}
		return result;
	}
}
