<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
	<head>
		<title>BodyProfile 수정 페이지</title>
		<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
		<script src="../../resources/myroom/js/script.js" type="text/javascript"></script>
	</head>
<body>

	<div class="group" id="popupGroup">
		<div class="group-head">
			<h1 class="zTree-h1"> 일정 수정 </h1>
		</div>
		
		<div class="group-body">
			<form action="/myroom/bodyprofile/bodyUpdatePro" method="post">
				<input type="hidden" name="b_num" value="${bodyProfileDTO.b_num}" />
				
				<div class="container">
					<label for="b_date">작성 날짜</label>
					<fmt:formatDate var="body_Date" pattern="yyyy-MM-dd" value="${bodyProfileDTO.b_date}" />
					<input class="date" type="date" name="b_date" value="${body_Date}" />
				</div>
				<div class="container">
					<label for="b_height">키</label>
					<input type="text" name="b_height" value="${bodyProfileDTO.b_height}" /> cm
				</div>
				<div class="container">
					<label for="b_weight">몸무게</label>
					<input type="text" name="b_weight" value="${bodyProfileDTO.b_weight}"  /> cm
				</div>
				<div class="container">
					<label for="b_muscle">근육 량</label>
					<input type="text" name="b_muscle" value="${bodyProfileDTO.b_muscle}" /> kg
				</div>
				<div class="container">
					<label for="b_bodyfat">체지방 량</label>
					<input type="text" name="b_bodyfat" value="${bodyProfileDTO.b_bodyfat}" /> kg
				</div>
				<div class="container">
					<label for="b_shape">체 형</label>
					<select name="b_shape" class="form-select" aria-label="Default select example">
						<option value="${bodyProfileDTO.b_shape}">${bodyProfileDTO.b_shape}</option>
						<option value="마른비만형">마른비만형</option>
						<option value="하체비만형">하체비만형</option>
						<option value="복부비만형">복부비만형</option>
						<option value="상체비만형">상체비만형</option>
						<option value="전체비만형">전체비만형</option>
						<option value="정상">정상</option>
					</select>
				</div>
				<div class="container">
					<label for="b_chest">가슴 둘레</label>
					<input type="text" name="b_chest" value="${bodyProfileDTO.b_chest}" /> cm
				</div>
				<div class="container">
					<label for="b_waist">허리 둘레</label>
					<input type="text" name="b_waist" value="${bodyProfileDTO.b_waist}" /> cm
				</div>
				<div class="container">
					<label for="b_arm">팔뚝 둘레</label>
					<input type="text" name="b_arm" value="${bodyProfileDTO.b_arm}" /> cm
				</div>
				<div class="container">
					<label for="b_thigh">허벅지 둘레</label>
					<input type="text" name="b_thigh" value="${bodyProfileDTO.b_thigh}" /> cm
				</div>
				<div class="container">
					<label for="b_hip">엉덩이 둘레</label>
					<input type="text" name="b_hip" value="${bodyProfileDTO.b_hip}" /> cm
				</div>
				<input type="submit" value="수정하기" />
				<input type="button" value="바디프로필이동" onClick="javascript:window.location='/myroom/bodyprofile'" />
			</form>
		</div>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>