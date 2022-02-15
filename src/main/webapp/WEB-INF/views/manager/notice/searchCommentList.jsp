<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>댓글 검색 결과</title>
	<script src="../../resources/js/manager/notice.js" type="text/javascript" ></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
</head>
<body>
	<div class="container">
	   	<div class="row">
	        <div class="col-xl-12">
	            <div class="card">
	                <div class="card-body">
	                    <div class="table-responsive">
	                    	<h6 class="header-title pb-3 mt-1">* COMMENT *</h6>
	                    	<input type="button" class="btn btn-default" id="notice_button" onclick="window.location='/ddarawazoom/notice'" value="[공지사항 페이지 이동]">
	                    	<c:if test="${comment_count == 0}">
	                    		<h6>작성된 공지사항 댓글이 없습니다.</h6>
							</c:if>
	                    	<c:if test="${comment_count != 0}">
		                        <table class="table table-hover mb-0">
		                            <thead>
		                                <tr class="align-self-center">
		                                    <th>작 성 자</th>
		                                    <th>작성 내용</th>
		                                    <th>작 성 일</th>
		                                    <th>상 태</th>
		                                    <th>버 튼</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            	<c:forEach var="commentList" items="${commentList}">
			                                <tr>
			                                    <td>${commentList.writer_id}</td>
			                                    <td>
		                                    		<a href="/ddarawazoom/noticeContent?num=${commentList.num}&c_num=${commentList.c_num}&pageNum=${pageNum}">
		                                    			${commentList.content}
		                                    		</a>
			                                    </td>
			                                    <td>
													<fmt:formatDate var="comment_regdate" pattern="yyyy-MM-dd HH:mm" value="${commentList.regdate}" />
													 ${comment_regdate}
												</td>
												<td>
													<c:if test="${commentList.deleted eq  'all'}">
														<font style="color: red;">경고받은 댓글</font>
													</c:if>
													<c:if test="${commentList.deleted eq  'yes'}">
														<font style="color: blue;">${commentList.writer_id}님이 직접 삭제한 댓글</font>
													</c:if>
													<c:if test="${commentList.deleted ne  'yes' && commentList.deleted ne  'all' }">
														${commentList.content}
													</c:if>
												</td>
			                                    <td>
			                                    	<c:if test="${commentList.deleted == 'no'}">
				                                    	<input type="button" class="btn btn-outline-black" onclick="reComment(${commentList.c_num});" value="답글"/>
				                                    	<input type="button" class="btn btn-outline-black" onclick="managerDeletedChange(${commentList.c_num});" value="경고하기"/>
				                                    </c:if>	
				                                    <c:if test="${commentList.deleted == 'all'}">
				                                        <input type="button" class="btn btn-outline-black" onclick="managerDeletedCancell(${commentList.c_num});" value="경고취소"/>
				                                    </c:if>
			                                    </td>
			                                </tr>
			                             </c:forEach>
		                            </tbody>
		                        </table>
		                    </c:if>
	                    </div>
	                </div>
	               	<div id="page">
						<c:if test="${comment_pageCount > 0}">
							페이지&nbsp;
							<c:if test="${startPage > 10}">
								<a href="/manager/notice?pageNum=${startPage - 10}"> [이전] </a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${comment_endPage}">
								<a href="/manager/notice?pageNum=${i}">${i}</a>
							</c:forEach>
							<c:if test="${comment_endPage < pageCount}">
								<a href="/manager/notice?pageNum=${startPage + 10}"> [다음] </a>
							</c:if>
						</c:if>	
					</div>
	            </div>
	                <div style="width: 50%; text-align:center; margin: 0 auto;">
	                  <form action="/manager/searchCommentList" method="post" name="searchCommentForm" onsubmit="return comment_valueCheck()">
						  <div class="input-group mb-3">
						    <select class="form-select form-select-sm" id="search-commentcategory" name="category" style="width: 25%;">
						      <option value="">선 택</option>
						      <option value="content">작성 내용</option>
						      <option value="writer_id">작성자</option>
						    </select>
					    <input type="text" class="form-control" placeholder="검색어를 입력하세요" style="width: 60%;" id="search-commentInput" name="input">
					    <button class="btn btn-outline-secondary" type="submit" id="search-btn" style="width: 15%;">검색</button>
					  </div>
					</form>
				 </div>
	        </div>
	    </div>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>