<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../layout/header.jsp"%>
    
<!DOCTYPE html>
<html>
	<head>
		<title>userInfo 페이지</title>
		<link href="../../resources/css/myroom/user.css" rel="stylesheet">
		
		<script src="../../resources/js/myroom/user.js" type="text/javascript"></script>
	</head>
	
	<body>
	
 		<div class="userInfo_title">
			${userInfo.nick}님의 정보
		</div>


		<div class="card" style="width: 30rem;">
  			<img src="../../resources/image/upload/${userInfo.img}" name="img"/><br/>
		</div>
		

		<div class="userInfo">
			<div class="table-responsive">
				<table class="table" id="table">
					<thead>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">닉네임</th>
							<th scope="col">이메일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${userInfo.id}</td>
							<td>${userInfo.nick}</td>
							<td>${userInfo.email}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
				 								<div class="d-flex justify-content-between align-items-center">
		
			<div class="btn-group">
					<input type="button" class="btn btn-outline-dark"  value="프로필사진 변경" onclick="imgUpdateForm();">&nbsp;&nbsp; 	
					<input type="button" class="btn btn-outline-dark" value="정보수정 하러가기" onclick="window.location='/myroom/infoUpdate'">
			</div>
			</div>
			
	</body>
</html>

<%@ include file="../../layout/footer.jsp"%>