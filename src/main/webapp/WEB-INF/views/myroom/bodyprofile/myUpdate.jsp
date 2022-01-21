<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../layout/header.jsp"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<html>
	<head>
		<title>MyProfile 수정 페이지</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
<body>

<div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
			<h4 class="mb-3">마이 프로필 정보 수정</h4>
			<form method="post" action="/myroom/bodyprofile/myUpdatePro" enctype="multipart/form-data">	
				<div class="row g-3">
					<div class="col-6">
						<label for="b_id" class="form-label">* 아이디</label>      <!-- session id  담을 곳 -->
							<input type="text" class="form-control" id="b_id" name="b_id" value="${myProfileDTO.b_id}" />
					</div>
				
					<div class="col-6">
						<label for="b_nick" class="form-label">* 닉네임</label>
						<input type="text" class="form-control" id="b_id" name="b_nick" value="${myProfileDTO.b_nick}" />
					</div>
				
					<div class="col-6">
						<label for="b_name" class="form-label">* 이 름</label>
						<input type="text" class="form-control" id="b_name" name="b_name" value="${myProfileDTO.b_name}" />
					</div>
					
					<div class="col-6">
						<label for="b_birth" class="form-label">* 생년월일</label>
						<fmt:formatDate var="my_Birth" pattern="yyyy-MM-dd" value="${myProfileDTO.b_birth}" />
						<input class="form-control" type="date" id="b_birth" name="b_birth" value="${my_Birth}" />
					</div>
					
					<div class="col-12">
						<label for="b_gender" class="form-label">* 성 별</label>
						<select class="form-select" id="b_gender" name="b_gender" required>
							<option value="${myProfileDTO.b_gender}">${myProfileDTO.b_gender}</option>
							<option value="남성">남성</option>
							<option value="여성">여성</option>
						</select>
					</div>
					
					<div class="col-12">
						<label for="b_tel" class="form-label">* 연락처</label>
						<input type="text" class="form-control"id="b_tel" name="b_tel" value="${myProfileDTO.b_tel}" />
					</div>
					
					<div class="col-12">
						<label for="b_email" class="form-label">* 이메일</label>
						<input type="email" class="form-control" id="b_email" name="b_email" value="${myProfileDTO.b_email}"/>	
					</div>
				</div>
						<hr class="my-4">
						
					<div style="text-align: center;">
						<input type="submit" class="btn btn-outline-primary" value="수정하기" />
							&nbsp;
						<input type="reset" class="btn btn-outline-danger" value="다시작성하기" />
							&nbsp;
						<input type="button" class="btn btn-outline-secondary" value="마이룸이동" onClick="javascript:window.location='/myroom/main'" />
					</div>
				</form>
			</div>
	   	 </div>
	  </main>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>