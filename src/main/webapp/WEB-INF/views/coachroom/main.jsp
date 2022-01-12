<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따라와줌-코치룸</title>
</head>
<body>
	<center>
		<h1>코치룸</h1>
		
		<input type="button" value="내 정보 관리" onclick="window.location='/coachroom/info'" /> <br/>
		<input type="button" value="내 일정 관리" onclick="window.location='/coachroom/schedule'" />
	</center>
</body>
</html>

<%@ include file="../layout/footer.jsp"%>