<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>DDay 작성 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../../resources/js/form-validation.js"></script>
	
	<link href="../../resources/css/styles.css" rel="stylesheet">
</head>
<body>
	<form class="needs-validation" id="dddayForm" method="post" >
		<input type="text" id="in_year" placeholder="'구하려는 '년'을 입력하세요." />
		<input type="text" id="id_month" placeholder="구하려는 '월'을 입력하세요." />
		<input type="text" id="id_year" placeholder="구하려는 '일'을 입력하세요." />
		
		<hr class="my-4">
		
		<input type="button" class="btn btn-outline-black"  onclick="dday();" value="디데이 구하기" />
	</form>
</body>
</html>