<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>관리자 공지사항 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/notice.js" type="text/javascript" ></script>

	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

</head>
<body>
	<c:if test="${sessionScope.id ne 'admin'}">
		<script>
			alert("본 페이지는 관리자만 이용할 수 있습니다.");
			history.go(-1);
		</script>
	</c:if>

	<c:if test="${sessionScope.id eq 'admin'}">
		<div class="container">
	    	<div class="row">
	    		<h5 class="header-title pb-3 mt-0">- 공지사항 관리자 페이지- </h5>
		        <div class="col-xl-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive">
		                    	<h6 class="header-title  mt-1">* NOTICE *</h6>
		                    	<input type="button" class="btn btn-default" id="notice_button" onclick="window.location='/ddarawazoom/notice'" value="[공지사항 페이지 이동]">
		                    	<input type="button" class="btn btn-default" id="notice_button" onclick="window.location='/ddarawazoom/noticeWrite'" value="[공지사항 작성하기]">
		                        <table class="table table-hover mb-0">
		                            <thead>
		                                <tr class="align-self-center">
		                                    <th>글 번호</th>
		                                    <th>제 목</th>
		                                    <th>작 성 자</th>
		                                    <th>대 상</th>
		                                    <th>작 성 일</th>
		                                    <th>조 회 수</th>
		                                    <th>첨부 파일</th>
		                                    <th>버 튼</th>
		                                </tr>
		                            </thead>
		                            <c:forEach var="noticeList" items="${noticeList}">
			                            <tbody>
			                                <tr>
			                                    <td>
			                                    	<c:if test="${noticeList.pin eq 'yes' }">
			                                    		<i class="fas fa-grin-stars" style="color:red;">★</i>
			                                    	</c:if>
			                                    	<c:if test="${noticeList.pin eq 'no' }">
			                                    		<c:set var="number" value="${number + 1}"/>
			                                    		${number}
			                                    	</c:if>
			                                    </td>
			                                    <td>
		                                    		<a href="/ddarawazoom/noticeViewCount?num=${noticeList.num}&pageNum=${pageNum}">
		                                    			${noticeList.title}
		                                    		</a>
			                                    </td>
			                                    <td>${noticeList.writer_id}</td>
			                                    <td>
			                                    		<c:if test="${noticeList.target_id eq 'All'}">
			                                    			<i class="fa fa-users icon2"></i>&nbsp;${noticeList.target_id}
			                                    		</c:if>
			                                    		<c:if test="${noticeList.target_id eq 'Coach'}">
			                                    			<i class="fa fa-user icon3" style="color: skyblue;"></i>&nbsp;${noticeList.target_id}
			                                    		</c:if>
			                                    		<c:if test="${noticeList.target_id eq 'Member'}">
			                                    			<i class="fa fa-user icon3" style="color: pink;"></i>&nbsp;${noticeList.target_id}
			                                    		</c:if>
			                                    </td>
			                                    <td>
													<fmt:formatDate var="notice_regdate" pattern="yyyy-MM-dd HH:mm" value="${noticeList.regdate}" />
													 ${notice_regdate}
												</td>
			                                    <td>${noticeList.viewcnt}</td>
			                                    <td>
			                                    	<c:if test="${noticeList.img != null}">	
			                                    		<i class="fa fa-picture-o icon5"></i>
			                                    	</c:if>
			                                    </td>
			                                    <td>
			                                    	<input type="button" class="btn btn-outline-black" onclick="window.location='/ddarawazoom/noticeUpdate?num=${noticeList.num}'" value="수정"/>
			                                    	<input type="button" class="btn btn-outline-black" onclick="managerNoticeDelete(${noticeList.num});" value="삭제"/>
			                                    </td>
			                                </tr>
			                            </tbody>
		                            </c:forEach>
		                        </table>
		                    </div>
		                </div>
		                <div id="page">
							<c:if test="${pageCount > 0}">
								페이지&nbsp;
								<c:if test="${startPage > 10}">
									<a href="/manager/notice?pageNum=${startPage - 10}"> [이전] </a>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<a href="/manager/notice?pageNum=${i}">${i}</a>
								</c:forEach>
								<c:if test="${endPage < pageCount}">
									<a href="/manager/notice?pageNum=${startPage + 10}"> [다음] </a>
								</c:if>
							</c:if>	
						</div>
		            </div>
		        </div>
		    </div>
		</div>
		
		
		<div class="container">
	    	<div class="row">
		        <div class="col-xl-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive">
		                    	<h6 class="header-title pb-3 mt-1">* COMMENT *</h6>
		                    	<input type="button" class="btn btn-default" id="notice_button" onclick="window.location='/ddarawazoom/notice'" value="[공지사항 페이지 이동]">
		                        <table class="table table-hover mb-0">
		                            <thead>
		                                <tr class="align-self-center">
		                                    <th>작 성 자</th>
		                                    <th>작성 내용</th>
		                                    <th>패스워드</th>
		                                    <th>작 성 일</th>
		                                    <th>상 태</th>
		                                    <th>버 튼</th>
		                                </tr>
		                            </thead>
		                            <c:forEach var="commentList" items="${commentList}">
			                            <tbody>
			                                <tr>
			                                    <td>${commentList.writer_id}</td>
			                                    <td>
		                                    		<a href="/ddarawazoom/noticeContent?num=${commentList.num}&c_num=${commentList.c_num}&pageNum=${pageNum}">
		                                    			${commentList.content}
		                                    		</a>
			                                    </td>
			                                    <td>${commentList.pw}</td>
			                                    <td>
													<fmt:formatDate var="comment_regdate" pattern="yyyy-MM-dd HH:mm" value="${commentList.regdate}" />
													 ${comment_regdate}
												</td>
												<td>
													<c:if test="${commentList.deleted eq  'all'}">
														<font style="color: red;">관리자에 의해 삭제된 댓글</font>
													</c:if>
													<c:if test="${commentList.deleted eq  'yes'}">
														<font style="color: blue;">${commentList.writer_id}님이 직접 삭제한 댓글</font>
													</c:if>
													<c:if test="${commentList.deleted ne  'yes' && commentList.deleted ne  'all' }">
														${commentList.content}
													</c:if>
												</td>
			                                    <td>
			                                    	<c:if test="${commentList.deleted ne  'yes' && commentList.deleted ne  'all'}">
				                                    	<input type="button" class="btn btn-outline-black" onclick="reComment(${commentList.c_num});" value="답글"/>
				                                    	<input type="button" class="btn btn-outline-black" onclick="managerDeletedChange(${commentList.c_num});" value="삭제"/>
			                                    	</c:if>
			                                    </td>
			                                </tr>
			                            </tbody>
		                            </c:forEach>
		                        </table>
		                    </div>
		                </div>
	                	<div id="page">
							<c:if test="${pageCount > 0}">
								페이지&nbsp;
								<c:if test="${startPage > 10}">
									<a href="/manager/notice?pageNum=${startPage - 10}"> [이전] </a>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<a href="/manager/notice?pageNum=${i}">${i}</a>
								</c:forEach>
								<c:if test="${endPage < pageCount}">
									<a href="/manager/notice?pageNum=${startPage + 10}"> [다음] </a>
								</c:if>
							</c:if>	
						</div>
		            </div>
		        </div>
		    </div>
		</div>
	</c:if>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>