<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>공지사항 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/notice.js" type="text/javascript"></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12">
	            <h3 class="text-dark">Notice Content 페이지&nbsp;<img src="../../resources/image/Exercise.svg" class="notis_img" ></h3>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="job-detail mt-2 p-4">
	                <div class="row">
	                    <div class="col-lg-12">
	                    </div>
	                </div>
	                <div class="custom-form">
	                	<form class="needs-validation" method="post" action="/manager/noticeWritePro" enctype="multipart/form-data">
	                        <div class="row">
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="writer_id" class="text-muted">작 성 자 : </label>
	                                   	${noticeDTO.writer_id} 님
	                                </div>
	                            </div>
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="taget_id" class="text-muted">공지 확인 대상 : </label>
	                                    ${noticeDTO.target_id}
	                                </div>
	                            </div>
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="taget_id" class="text-muted">조 회 수 : </label>
	                                    ${noticeDTO.viewcnt}
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                                <div class="form-group app-label">
	                                    <label for="university/college" class="text-muted">제 목 : </label><br/>
	                                   	${noticeDTO.title}
	                                </div>
	                            </div>
	                             <div class="col-lg-12">
	                                <div class="form-group app-label">
	                                    <label for="content" class="text-muted">내 용 : </label><br/>
	                                    ${noticeDTO.content}
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                             	<label for="img" class="text-muted">첨부 파일 : </label><br/>
	                             	<img src="../../resources/image/upload/${noticeDTO.img}" alt="img">
	                            </div>
	                        </div>
	                         <div class="col-lg-12">
	                          	<div class="text-center">
	                          		<input type="button" class="btn btn-outline-black" onclick="window.location='/manager/noticeUpdate?num=${noticeDTO.num}'" value="수정 페이지 이동"/>
	                          			&nbsp;
	                          		<input type="button" class="btn btn-outline-black" onclick="noticeDelete(${noticeDTO.num})" value="삭제"/>
	                          			&nbsp;
									<input type="button" class="btn btn-outline-black" value="공지사항 페이지로 돌아가기" onClick="javascript:window.location='/manager/notice'" />
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
    
	<div class="container">
	
		<div class="be-comment-block">
			<c:if test="${count == null}" >
    			작성된 댓글이 없습니다.
    		</c:if>
			<c:if test="${count != null}" >
				<h1 class="comments-title">Comments</h1>
				<div class="be-comment">
					<div class="be-img-comment">	
					</div>
					<c:forEach var="notice_CList" items="${notice_CList}">
						<div class="be-comment-content">
							<span class="be-comment-name">
								${notice_CList.writer_id}
							</span>
							<span class="be-comment-time">
								<i class="fa fa-clock-o">작성 날짜 : </i>
								<fmt:formatDate var="notice_regdate" pattern="yyyy-MM-dd HH:mm" value="${notice_CList.regdate}" />
									${notice_regdate}
									&nbsp;
									<input type="button" class="" value="답글"/>
									<input type="button" class="" value="수정"/>
									<input type="button" class="" value="삭제"/>
							</span>
							<p class="be-comment-text">
								${notice_CList.content}
							</p>
						</div>
					</c:forEach>
				</div>
			</c:if>
			<form class="form-block" id="commentForm"  action="/manager/noticeContent" onsubmit="commentWrite();" method="post">
				<input type="hidden" name="num" value="${noticeDTO.num}" />
				<div class="row">
					<div class="col-xs-12 col-sm-6">
						<div class="form-group fl_icon">
							<div class="icon"><i class="fa fa-user"></i></div>
							<c:if test="${sessionScope.id != null && sessionScope.c_id == null}">
								<input class="form-input" name="writer_id" type="text" value="${sessionScope.id}">
							</c:if>
							<c:if test="${sessionScope.id == null && sessionScope.c_id != null}">
								<input class="form-input" name="writer_id" type="text" value="${sessionScope.c_id}">
							</c:if>
						</div>
					</div>
					<div class="col-xs-12">									
						<div class="form-group">
							<textarea class="form-input" name="content" placeholder="댓글을 작성해주세요.">
								<c:if test="${sessionScope.id == null && sessionScope.c_id == null }">
									로그인이 필요합니다.
								</c:if>
							</textarea>
						</div>
					</div>
					<input type="submit" class="btn btn-black" value="댓글 작성" />
				</div>
			</form>
		</div>
	</div>
	<div id="page">
		<c:if test="${pageCount > 0}">
			페이지&nbsp;
			<c:if test="${startPage > 10}">
				<a href="/manager/noticeContent?pageNum=${startPage - 10}"> [이전] </a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/manager/noticeContent?pageNum=${i}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="/manager/noticeContent?pageNum=${startPage + 10}"> [다음] </a>
			</c:if>
		</c:if>	
	</div>
	
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>