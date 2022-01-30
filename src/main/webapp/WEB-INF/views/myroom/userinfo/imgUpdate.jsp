<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>imgUpdate 페이지</title>
	
	<script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="../../resources/js/myroom/user.js" type="text/javascript"></script>
	
	<link href="../../resources/css/styles.css" rel="stylesheet">
	<link href="../../resources/css/myroom/imageUpdate.css" rel="stylesheet">
</head>
<body>
	<form class="needs-validation" novalidate id="updateForm" action="/myroom/userInfo" method="post" onsubmit="imgUpdatePro();" enctype="multipart/form-data">
          <div class="mb-4">
		 		<label for="formFile" class="form-label" id="imgTitle">
		 			* 프로필 사진 변경 *
		 		</label>
		 		<p class="imgSubTitle">
		 			프로필 사진을 변경하기 위해서 파일을 첨부해주세요.
		 		</p>
			 	<input class="form-control" type="file"  id="formFile" required>
			 <div class="invalid-feedback">
     			사진을 선택해주세요.
     		</div>
     		
		     	<hr class="my-4">
		     	
	     	<div class="imgUpdateButton">
	     		<input type="submit" id="updateButton" class="btn btn-outline-black" value="사진 업로드">
	     	</div>
		</div>
	</form>
</body>
	<script src="../../resources/js/form-validation.js"></script>
</html>