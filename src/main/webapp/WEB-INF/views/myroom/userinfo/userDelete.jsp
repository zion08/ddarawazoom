<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
	<title>멤버 Delete 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../../resources/js/myroom/user.js" type="text/javascript"></script>
	
	<link href="../../resources/css/styles.css" rel="stylesheet">
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet">
</head>
<body>
	<form class="needs-validation" novalidate id="userDelete"  method="post" >
		<div class="mb-4">
			<label for="pw" class="form-label" id="deleteTitle">
				* 패스워드 확인 *
			</label>
			<p class="deleteSubTitle">
				패스워드 확인이 필요합니다. 아래 칸에 패스워드를 입력해주세요.
			</p>
			<input class="form-control" type="text" id="pw" name="pw" required>
			<div class="invalid-feedback">
				패스워드를 반드시 입력해주세요.
			</div>
			
			<hr class="my-4">
			
			<div class="userDeleteButton">
				<input type="button" class="btn btn-outline-black" onclick="userDeletePro()" value="탈퇴하기">
			</div>
		</div>
	</form>
</body>
	<script src="../../resources/js/form-validation.js"></script>
</html>