package org.mvc.service;

import java.util.List;

import org.mvc.bean.NoticeDTO;
import org.mvc.bean.Notice_CDTO;

public interface NoticeService {

	// 공지 글 가져오기
	public List<NoticeDTO> noticeList(int startRow, int endRow);

	// 공지 글 수
	public int noticeCount();
	
	// 공지 글 작성
	public int noticeWrite(NoticeDTO noticeDTO);
	
	// 관련 공지 글 출력
	public NoticeDTO getNotice(NoticeDTO noticeDTO);
	
	// 공지 글 수정
	public int noticeUpdate(NoticeDTO noticeDTO);
	
	// 공지 글 삭제
	public int noticeDelete(int num);
	
	// 공지 조회수
	public int noticeViewCount(int num);
	
	// 공지 댓글 작성
	public int commentWrite(Notice_CDTO notice_CDTO);
	
	// 공지 댓글 수
	public int commentCount(int num);
	
	// 공지 댓글 가져오기
	public List<Notice_CDTO> getComment(int num, int startRow, int endRow);
}
