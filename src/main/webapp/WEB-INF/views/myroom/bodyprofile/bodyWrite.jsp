<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layout/header.jsp"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<title>BodyProfile 작성 페이지</title>
		<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
		<script src="../../resources/js/script.js"></script>
		
	</head>
<body>

		<form method="post" action="/myroom/bodyprofile/bodyWritePro">
			<div class="container">
				<label for="b_id">* 아이디</label>
				<input type="text" name="b_id" /> <!-- session id 담을 곳 -->
			</div>	
						
			<div class="container">
				<label for="b_date">* 작성 날짜</label>
				<input type="date" name="b_date" />
			</div>
			
			<div class="container">
				<label for="b_height">* 키</label>
				<input type="text" name="b_height" />
			</div>	
			
			<div class="container">
				<label for="b_weight">* 몸무게</label>
				<input type="text" name="b_weight" />
			</div>
			
			<div class="container">
				<label for="b_muscle">근육량</label>
				<input type="text" name="b_muscle" />
			</div>
			
			<div class="container">
				<label for="b_bodyfat">체지방</label>
				<input type="text" name="b_bodyfat" />
			</div>
			
			<div class="container">
				<label for="b_shape">체 형</label>
				<select name="b_shape">
					<option value="선 택">선 택</option>
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
				<input type="text" name="b_chest" /> 
			</div>
			
			<div class="container">
				<label for="b_waist">허리 둘레</label>
				<input type="text" name="b_waist" />
			</div>
			
			<div class="container">
				<label for="b_arm">팔뚝 둘레</label>
				<input type="text" name="b_arm" />
			</div>
			
			<div class="container">
				<label for="b_thigh">허벅지 둘레</label>
				<input type="text" name="b_thigh" />
			</div>
			
			<div class="container">
				<label for="b_hip">엉덩이 둘레</label>
				<input type="text" name="b_hip" />
			</div>
			
			<input type="submit" value="입력하기" />
				&nbsp;
			<input type="reset" value="다시작성하기" />
				&nbsp;
			<input type="button" value="마이룸이동" onClick="javascript:window.location='/myroom/main'" />
		</form> 
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>