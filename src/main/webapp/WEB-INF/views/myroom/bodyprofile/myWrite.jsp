<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<html>
<head>
	<title>MyProfile 작성 페이지</title>
</head>
<body>
   <div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
			<h4 class="mb-3">마이 프로필 정보 수정</h4>
			<form class="needs-validation" method="post" action="/myroom/bodyprofile/myWritePro" enctype="multipart/form-data">
				<div class="row g-3">
					<div class="col-6">
						<label for="id" class="form-label">* 아이디</label><br/>
							${sessionScope.id} 님
					</div>
					<div class="col-6">
						<label for="nick" class="form-label">* 닉네임</label>
						<input type="text" class="form-control" id="nick" name="nick" placeholder="닉네임을 입력하세요" required />
					</div>
					<div class="col-6">
						<label for="name" class="form-label">* 이 름</label>
						<input type="text" class="form-control" id="name" name="name"  placeholder="이름을 입력하세요" required/>
					</div>
					<div class="col-6">
						<label for="birth" class="form-label">* 생년월일</label>
						<input class="form-control"  type="date"  id="birth" name="birth" required/>
					</div>
					<div class="col-12">
						<label for="gender" class="form-label">* 성 별</label>
						<select class="form-select" id="gender" name="gender" required>
							<option value="성별선택">성별 선택</option>
							<option value="남성">남성</option>
							<option value="여성">여성</option>
						</select>
					</div>
					<div class="col-12">
						<label for="tel" class="form-label">* 연락처</label>
						<input type="text" class="form-control"  id="tel" name="tel" placeholder="'-'포함해서 전화번호를 입력하세요 " required/>
					</div>
					<div class="col-12">
						<label for="email" class="form-label">* 이메일</label>
						<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" required/>	
					</div>
					<div class="col-12">
						<label for="img" class="form-label">* 프로필 사진</label>
						<input type="file" class="form-control" id="img" name="save" multiple="multiple"  required/>	
					</div>
				</div>
					
					<hr class="my-4">
				
					<div style="text-align: center;"> 
						<input type="submit" class="btn btn-outline-primary"  value="입력하기" />
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