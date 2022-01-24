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
								<label for="id" class="form-label"><b>* 아이디</b></label><br/>
									${sessionScope.id} 님
							</div>
							<div class="col-6">
								<label for="nick" class="form-label"><b>* 닉네임</b></label>
								<input type="text" class="form-control" id="nick" name="nick" value="${userInfo.nick}" />
							</div>
							<div class="col-6">
								<label for="name" class="form-label"><b>* 이 름</b></label>
								<input type="text" class="form-control" id="name" name="name" value="${userInfo.name}" />
							</div>
							<div class="col-6">
								<label for="birth" class="form-label"><b>* 생년월일</b></label>
								<fmt:formatDate var="my_Birth" pattern="yyyy-MM-dd" value="${userInfo.birth}" />
								<input class="form-control" type="date" id="birth" name="birth" value="${userInfo.birth}" />
							</div>
							<div class="col-12">
								<label for="gender" class="form-label"><b>* 성 별</b></label>
								<select class="form-select" id="gender" name="gender" required>
									<option value="${userInfo.gender}">성별 선택</option>
									<option value="남성">남성</option>
									<option value="여성">여성</option>
								</select>
							</div>
							<div class="col-12">
								<label for="tel" class="form-label"><b>* 연락처</b></label>
								<input type="text" class="form-control"id="tel" name="tel" value="${userInfo.tel}" />
							</div>
							<div class="col-12">
								<label for="email" class="form-label"><b>* 이메일</b></label>
								<input type="email" class="form-control" id="email" name="email" value="${userInfo.email}"/>	
							</div>
							<div class="col-12">
								<label for="img" class="form-label"><b>* 프로필 사진</b></label><br/>
								<img src="../../resources/image/upload/${userInfo.img}" width="100px" height="100px" alt="img">
								<input type="file" class="form-control" id="save" name="save" value="${userInfo.img}"/>	
							</div>
							
						</div>
								<hr class="my-4">
								
							<div style="text-align: center;">
								<input type="submit" class="btn btn-outline-primary" value="수정하기" />
									&nbsp;
								<input type="reset" class="btn btn-outline-danger" value="다시작성하기" />
									&nbsp;
								<input type="button" class="btn btn-outline-secondary" value="마이룸이동" onClick="javascript:window.location='/myroom'" />
							</div>
						</form>
					</div>
			   	 </div>
			  </main>
		  </div>
	</body>
</html>

<%@ include file="../../layout/footer.jsp"%>