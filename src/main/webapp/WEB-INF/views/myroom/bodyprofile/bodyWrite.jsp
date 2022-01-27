<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<title>BodyProfile 작성 페이지</title>
	</head>
<body>
	
	<div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
			<h4 class="mb-3">마이 프로필 정보 수정</h4>
				<form method="post" action="/myroom/bodyprofile/bodyWritePro" enctype="multipart/form-data">
					<div class="row g-3">
						<div class="col-12">
							<label for="b_id" class="form-label">* 아이디</label><br/>
								${sessionScope.id} 님
						</div>	
						<div class="col-12">
							<label for="b_date" class="form-label">* 작성 날짜</label>
							<input type="date" class="form-control" id="b_date" name="b_date" />
						</div>
						<div class="col-6">
							<label for="b_height" class="form-label">* 키</label>
							<input type="text" class="form-control" id="b_height" name="b_height" /> cm
						</div>	
						<div class="col-6">
							<label for="b_weight" class="form-label">* 몸무게</label>
							<input type="text" class="form-control" id="b_weight" name="b_weight" /> kg
						</div>
						<div class="col-6">
							<label for="b_muscle" class="form-label">근육량</label>
							<input type="text" class="form-control" id="b_muscle" name="b_muscle" /> kg
						</div>
						<div class="col-6">
							<label for="b_bodyfat" class="form-label">체지방</label>
							<input type="text" class="form-control" id="b_bodyfat" name="b_bodyfat" class="form-control"/> kg
						</div>
						<div class="col-6">
							<label for="b_shape" class="form-label">체 형</label>
							<select class="form-select" id="b_shape" name="b_shape">
								<option value="선 택">선 택</option>
								<option value="마른비만형">마른비만형</option>
								<option value="하체비만형">하체비만형</option>
								<option value="복부비만형">복부비만형</option>
								<option value="상체비만형">상체비만형</option>
								<option value="전체비만형">전체비만형</option>
								<option value="정상">정상</option>
							</select>
						</div>
						<div class="col-6">
							<label for="b_chest" class="form-label">가슴 둘레</label>
							<input type="text" class="form-control" id="b_chest" name="b_chest" /> cm
						</div>
						<div class="col-6">
							<label for="b_waist" class="form-label">허리 둘레</label>
							<input type="text" class="form-control" name="b_waist" /> cm
						</div>
						<div class="col-6">
							<label for="b_arm" class="form-label">팔뚝 둘레</label>
							<input type="text" class="form-control" id="b_arm" name="b_arm" /> cm
						</div>
						<div class="col-6">
							<label for="b_thigh" class="form-label">허벅지 둘레</label>
							<input type="text" class="form-control" id="b_hip" name="b_thigh" /> cm
						</div>
						<div class="col-6">
							<label for="b_hip" class="form-label">엉덩이 둘레</label>
							<input type="text" class="form-control" id="b_hip" name="b_hip" /> cm
						</div>
						<div class="col-12">
							<label for="b_img" class="form-label">바디 사진</label><br/>
							<input type="file" class="form-control" id="b_img" name="save"  multiple="multiple" class="form-control form-control-sm" />
						</div>
					</div>
					
					 	<hr class="my-4">
					
						<div style="text-align: center;">
							<input type="submit"  class="btn btn-outline-black" value="입력하기" />
								&nbsp;
							<input type="reset" class="btn btn-outline-black"  value="다시작성하기" />
								&nbsp;
							<input type="button" class="btn btn-outline-black"  value="마이룸이동" onClick="javascript:window.location='/myroom/main'" />
						</div>
					</form>
				 </div>
		   	 </div>
		  </main>
		</div> 
	
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>