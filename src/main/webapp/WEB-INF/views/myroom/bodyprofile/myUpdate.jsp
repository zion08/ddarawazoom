<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../layout/header.jsp"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
	<head>
		<title>MyProfile 수정 페이지</title>
		<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
	</head>
<body>
	<form method="post" action="/myroom/bodyprofile/myUpdatePro" enctype="multipart/form-data">	
			<div class="container">
				<label for="b_img">* 프로필 이미지</label><br/>
				<img id="imge_section" src="/resources/image/myroom/${myProfileDTO.b_img}" width="70px" height="70px"/>
				<input type="file" name="save" multiple="multiple" class="form-control form-control-sm" id="formFileSm" />
			</div>
			<div class="container">
				<label for="b_id">* 아이디</label>      <!-- session id  담을 곳 -->
					<input type="text" name="b_id" value="${myProfileDTO.b_id}" />
			</div>
		
			<div class="container">
				<label for="b_nick">* 닉네임</label>
				<input type="text" name="b_nick" value="${myProfileDTO.b_nick}" />
			</div>
		
			<div class="container">
				<label for="b_name">* 이 름</label>
				<input type="text" name="b_name" value="${myProfileDTO.b_name}" />
			</div>
			
			<div class="container">
				<label for="b_gender">* 성 별</label>
				<select name="b_gender" class="form-select form-select-sm" aria-label=".form-select-sm example">
					<option value="${myProfileDTO.b_gender}">${myProfileDTO.b_gender}</option>
					<option value="남">남</option>
					<option value="여">여</option>
				</select>
			</div>
			
			<div class="container">
				<label for="b_birth">* 생년월일</label>
				<fmt:formatDate var="my_Birth" pattern="yyyy-MM-dd" value="${myProfileDTO.b_birth}" />
				<input class="date" type="date" name="b_birth" value="${my_Birth}" />
			</div>
			
			<div class="container">
				<label for="b_tel">* 연락처</label>
				<input type="text" name="b_tel" value="${myProfileDTO.b_tel}" />
			</div>
			
			<div class="container">
				<label for="b_email">* 이메일</label>
				<input type="email" name="b_email" value="${myProfileDTO.b_email}"/>	
			</div>
			
			<div>
				<input type="submit" value="수정하기" />
					&nbsp;
				<input type="reset" value="다시작성하기" />
					&nbsp;
				<input type="button" value="마이룸이동" onClick="javascript:window.location='/myroom/main'" />
			</div>
		</form>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>