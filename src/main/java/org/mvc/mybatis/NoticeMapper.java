package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.NoticeDTO;
import org.mvc.bean.Notice_CDTO;

public interface NoticeMapper {

	// 공지 글 가져오기
	public List<NoticeDTO> noticeList(
			@Param("startRow") int startRow,
			@Param("endRow")int endRow);
	
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
	
	// 공지 댓글 리스트
	public List<Notice_CDTO> getCommentList(
				@Param("num") int num,
				@Param("startRow") int startRow,
				@Param("endRow") int endRow);
	
	// 공지 댓글 삭제 패스워드 체크
	public String pwCheck(
			@Param("writer_id") String writer_id,
			@Param("c_num") int c_num);
	
	// 공지 댓글 삭제
	public int deletedChange(int c_num);
	
	// 관리자 댓글 삭제
	public int managerDeletedChange(int c_num);
	
	// 공지 댓글 가져오기
	public Notice_CDTO getComment(int c_num);
	
	// 공지 댓글 수정
	public int commentUpdate(Notice_CDTO notice_CDTO);
	
	// 대댓글 작성
	public int insertReComment(Notice_CDTO notice_CDTO);
	
	// 관리자 관리 - 모든 댓글
	public List<Notice_CDTO> getAllComment(
			@Param("startRow") int startRow,
			@Param("endRow") int endRow);
	
}
