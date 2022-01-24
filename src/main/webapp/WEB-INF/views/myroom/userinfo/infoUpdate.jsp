<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="../../layout/header.jsp"%>
    
<!DOCTYPE html>
<html>
	<head>
		<title>userInfo 수정페이지</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="../../resources/js/myroom/user.js" type="text/javascript"></script>
		
		<link href="../../resources/css/myroom/user.css" rel="stylesheet">
	</head>
	<body>

	<div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
	        <h4 class="userUpdateTitle">멤버 정보 수정</h4>
	        <form class="needs-validation" novalidate id="updateForm" action="/myroom/userInfo" method="post" onsubmit="infoUpdate_submit();">
	          <div class="row g-3">
					<div class="col-6">
						<label for="id" class="form-label">아이디</label>
						<div class="input-group has validation">
							${sessionScope.id}
						</div>
					</div>
		            <div class="col-6">
						<label for="pw" class="form-label">비밀번호</label>
						<div class="input-group has validation">
							<input type="text" name="pw" class="form-control" value="${userInfo.pw}" required/>
						</div>
						<div class="invalid-feedback">
	               		 	닉네임은 필수항목입니다.
	              		</div>
					</div>
		            <div class="col-6">
						<label for="email" class="form-label">이메일</label>
						<div class="input-group has validation">
							<input type="text" name="email" class="form-control" value="${userInfo.email}" required/>
						</div>
						<div class="invalid-feedback">
		                	이메일은 필수항목입니다.
		              	</div>
					</div>
		            <div class="col-6">
						<label for="nick" class="form-label">닉네임</label>
						<div class="input-group has validation">
							<input type="text" name="nick" class="form-control" value="${userInfo.nick}" required/>
						</div>
						<div class="invalid-feedback">
	                		닉네임은 필수항목입니다.
	              		</div>
					</div>
	          </div>
	          
	          <hr class="my-4">
	          
	          <div  class="userInfoUpdateButton">
		          <input type="submit" value="정보 수정" class="btn btn-outline-primary" />
		          	&nbsp;&nbsp;
		          <input type="reset" value="다시 작성" class="btn btn-outline-danger" />
		          	&nbsp;&nbsp;
		         <input type="button" value="탈 퇴" id="deleteButton" class="btn btn-outline-dark"
		          	onclick="window.location='/myroom/userInfo/userDelete'"/>
		       </div>
	        </form>
	      </div>
	    </div>
	  </main>
	</div>

	</body>
</html>

<%@ include file="../../layout/footer.jsp"%>