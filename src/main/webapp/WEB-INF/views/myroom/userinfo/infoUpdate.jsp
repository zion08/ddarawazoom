<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<html>
<head>
	<title>userInfo 수정페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/myroom/user.js" type="text/javascript"></script>
	
	<link href="../../resources/css/myroom/userinfo.css" rel="stylesheet">
</head>
<body>
	<div class="container-xl px-4 mt-4">
	    <div class="row">
	        <div class="col-xl-4">
	            <!-- Profile picture card-->
	            <div class="card mb-4 mb-xl-0">
	                <div class="card-header">Profile Picture</div>
	                <div class="card-body text-center">
	                    <img class="img-account-profile rounded-circle mb-2" src="../../resources/image/upload/${userInfo.img}" alt="">
	                    <div class="small font-italic text-muted mb-4">${userInfo.nick}님의 프로필 사진</div>
	                    <input type="button" class="btn btn-outline-black" value="프로필사진 변경" onclick="imgUpdateForm();">
	                </div>
	            </div>
	        </div>
	        <div class="col-xl-8">
	            <div class="card mb-4">
	                <div class="card-header">User Info</div>
	                <div class="card-body">
	                    <form class="needs-validation" novalidate id="updateForm" action="/myroom/userInfo" method="post" onsubmit="infoUpdate_submit();">
	                        <div class="row gx-3 mb-3">
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="inputFirstName">* 아 이 디</label><br/>
	                                	${sessionScope.id}
	                            </div>
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="inputLastName">* 닉 네 임</label>
	                                <input class="form-control" id="inputLastName" type="text" placeholder="Enter your last name" value="${userInfo.nick}" required>
	                            </div>
	                             <div class="invalid-feedback">
	                				닉네임은 필수항목입니다.
	              				</div>
	                        </div>
	                        <div class="row gx-3 mb-3">
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="inputOrgName">* 이 름</label>
	                                <input class="form-control" id="inputOrgName" type="text" placeholder="Enter your organization name" value="${userInfo.name}" required>
	                            </div>
	                             <div class="invalid-feedback">
	                				이름은 필수항목입니다.
	              				</div>
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="inputLocation">* 패 스 워 드</label>
	                                <input class="form-control" id="inputLocation" type="text" placeholder="Enter your location" value="${userInfo.pw}" required>
	                            </div>
	                             <div class="invalid-feedback">
	                				패스워드는 필수항목입니다.
	              				</div>
	                        </div>
	                        <div class="row gx-3 mb-3">
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="inputOrgName">* 이 메 일</label>
	                                <input class="form-control" id="inputOrgName" type="email" placeholder="Enter your organization name" value="${userInfo.email}" required>
	                            </div>
	                            <div class="invalid-feedback">
	                				이메일은 필수항목입니다.
	              				</div>
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="gender">* 성 별</label>
	                                <select class="form-select" id="gender" name="gender" required>
										<option value="${userInfo.gender}">${userInfo.gender}</option>
										<option value="남성">남성</option>
										<option value="여성">여성</option>
									</select>
	                            </div>
	                             <div class="invalid-feedback">
	                				성별은 필수항목입니다.
	              				</div>
	                        </div>
	                        <div class="row gx-3 mb-3">
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="inputPhone">* 연 락 처</label>
	                                <input class="form-control" id="inputPhone" type="tel" placeholder="Enter your phone number" value="${userInfo.tel}" required>
	                            </div>
	                             <div class="invalid-feedback">
	                				연락처는 필수항목입니다.
	              				</div>
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="inputBirthday">* 생 년 월 일</label>
	                                <fmt:formatDate var="birth" pattern="yyyy-MM-dd" value="${userInfo.birth}" />
	                                <input class="form-control" id="inputBirthday" type="date" name="birthday" placeholder="Enter your birthday" value="${birth}" required>
	                            </div>
	                            <div class="invalid-feedback">
	                				생년월일은 필수항목입니다.
	              				</div>
	                        </div>
	                        	<hr class="my-4">
	                        <div class="update_button">
								<input type="submit" value="정보수정 하기" class="btn btn-outline-black" />&nbsp;&nbsp;
								<input type="reset" value="다시 작성" class="btn btn-outline-black" />&nbsp;&nbsp;
		         				<input type="button" value="탈퇴 하러가기" id="deleteButton" class="btn btn-outline-black"
		          					onclick="userDelete()" />&nbsp;&nbsp;
		          				<input type="button" value="이전으로" class="btn btn-outline-black"
		          					onclick="window.location='/myroom/userInfo'" />
	          				</div>	
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>