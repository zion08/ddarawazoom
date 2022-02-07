<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
	<title>공지사항 댓글 Delete 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../../resources/js/manager/notice.js" type="text/javascript" ></script>
	
	<link href="../../resources/css/styles.css" rel="stylesheet">
</head>
<body>
	<form class="needs-validation" id="commentDelete" name="comment_delete" method="post">
		<input type="hidden" id="num" name="num" value="${notice_CDTO.num}" />
		<input type="hidden" id="c_num" name="c_num" value="${notice_CDTO.c_num}" />
		<input type="hidden" id="ref" name="ref" value="${notice_CDTO.ref}"/>
		<input type="hidden" id="re_step" name="re_step" value="${notice_CDTO.re_step}"/>
		<input type="hidden" id="re_level" name="re_level" value="${notice_CDTO.re_level}"/>
			
		<c:if test="${sessionScope.id != null}">
			<c:set var="writer_id" value="${sessionScope.id}"></c:set>
			<input type="hidden" id="writer_id" name="writer_id" value="${sessionScope.id}"/>
		</c:if>
		<c:if test="${sessionScope.c_id != null}">
			<c:set var="writer_id" value="${sessionScope.c_id}"></c:set>
			<input type="hidden" id="writer_id" name="writer_id" value="${sessionScope.c_id}"/>
		</c:if>
		
		<div class="mb-4">
			<p class="text-center" style="font-weight: bold; font-size:20px; margin:20px;">
				* 댓글 삭제를 위한 패스워드 확인 *
			</p>
			<p class="text-center" style="font-size:13px;">
				댓글 삭제를 위해서는 작성 시, 패스워드 확인이 필요합니다.<br/>
				댓글 입력 시, 기입했던 패스워드를 기입해주세요.
			</p>
			<input class="form-control" type="text" id="pw" name="pw" autofocus="autofocus">
			
			<hr class="my-4">
			
			<div class="text-center">
				<input type="button" class="btn btn-outline-black" onclick="commentDeletePro();" value="댓글 삭제하기">
			</div>
		</div>
	</form>
</body>
</html>