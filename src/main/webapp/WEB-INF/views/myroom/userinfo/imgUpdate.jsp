<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>imgUpdate 페이지</title>
		<link href="../../resources/image/Exercise.svg" rel="shortcut icon" type="image/x-icon">
		<link href="../../resources/css/styles.css" rel="stylesheet">
		<link href="../../resources/css/user.css" rel="stylesheet">
		
		<script src="/resources/js/user.js" type="text/javascript"></script>
		<script src="/resources/js/form-validation.js"></script>
	</head>
	<body>
		<form class="needs-validation" novalidate id="updateForm" action="/myroom/info" method="post" onsubmit="imgUpdatePro();" enctype="multipart/form-data">
			<div class="mb-3">
				 	<h3>
				 		<label for="formFile" class="form-label">
				 			프로필 사진 변경
				 		</label>
				 	</h3>
				 <input class="form-control" type="file"  id="formFileMultiple" multiple required>
			     
			     <hr class="my-4">
			     
			     <input type="button" id="updateButton" class="btn btn-outline-dark" value="사진 업로드" type="submit">
			</div>
		</form>
	</body>
</html>