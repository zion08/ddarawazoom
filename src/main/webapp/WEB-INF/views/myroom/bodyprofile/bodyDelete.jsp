<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<html>
<head>
	<title>bodyDelete 페이지</title>
	<link href="../../resources/css/styles.css" rel="stylesheet">
</head>

<body>
	<form action="/myroom/bodyprofile/bodyDeletePro" method="post">
		<input type="hidden" name="b_num" value="${b_num}">
		<div style="text-align: center;">
			<b>삭제 시, 복구가 되지 않습니다<br/><br/>
			 		정말로 삭제하시겠습니까?
			</b>
		</div>
		<div style="margin-top:20px; width:100%; text-align: center;">
			<input type="submit" id="deleteButton" class="btn btn-outline-danger" value="삭제하기" />
		</div>
	</form>
</body>
</html>