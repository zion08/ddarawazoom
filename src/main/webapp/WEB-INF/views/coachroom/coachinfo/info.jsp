<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따라와줌-코치정보</title>
</head>

<style>
	.parent {
		display: flex;
	}
	
	.left {
		padding-left: 70px;
		width: 50%;
	}
	
	.right {
		padding-left: 70px;
		flex-glow: 1;
		width: 50%;
	}
	
	.center {
		text-align: center;
		margin: 0 auto;
		margin-bottom: 20px;
	}
</style>

<body>
	<div class="center">
		프로필 사진 : ${coachInfo.c_img} <br/>
		<input type="button" value="프로필 사진 변경" onclick="window.location='/coachroom/imgUpdate'" />
	</div>
	
	<div class="parent">
	
		<div class="left">
			코치 기본 정보 <br/>
			이름 : ${coachInfo.c_name} <br/>
			닉네임 : ${coachInfo.c_nick} <br/>
			성별 : ${coachInfo.c_gender} <br/>
			생년월일 : <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${coachInfo.c_birth}" /> <br/>
			연락처 : ${coachInfo.c_tel} <br/>
			이메일 : ${coachInfo.c_email} <br/>
			소속 : ${coachInfo.company} <br/>
			<input type="button" value="정보 수정" onclick="window.location='/coachroom/infoUpdate'" />
		</div>
		
		<div class="right">
			코치 경력 정보 <br/>
			전문 분야 : ${coachCareer.specialty} <br/>
			경력 : ${coachCareer.career} <br/>
			자격증 : ${coachCareer.certificate} <br/>
			<input type="button" value="경력 수정" onclick="window.location='/coachroom/careerUpdate'" />
		</div>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>