<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<html>
	<head>
		<title>MyProfile 수정 페이지</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<link href="../../resources/css/myroom/myUpdate.css" rel="stylesheet" >
	</head>
	<body>
	
		<div class="container">
		<div class="row justify-content-center">
		    <div class="col-12 col-lg-10 col-xl-8 mx-auto">
		        <h2 class="h3 mb-4 page-title"></h2>
		        <div class="my-4">
		            <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
		                <li class="nav-item">
		                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="false">
		                    	My Profile
		                    </a>
		                </li>
		            </ul>
		            <form>
		                <div class="row mt-5 align-items-center">
		                    <div class="col-md-3 text-center mb-5">
		                        <div class="avatar avatar-xl">
		                            <img src="../../resources/image/upload/${userInfo.img}" alt="img" class="avatar-img rounded-circle" />
		                        </div>
		                    </div>
		                    <div class="col">
		                        <div class="row align-items-center">
		                            <div class="col-md-7">
		                                <h4 class="mb-1">${sessionScope.id} 님</h4>
		                                <p class="small mb-3"><span class="badge badge-dark">New York, USA</span></p>
		                            </div>
		                        </div>
		                        <div class="row mb-4">
		                            <div class="col-md-7">
		                                <p class="text-muted">
		                                    ${sessionScope.id} 님의 소중한 정보를 수정 할 수 있는 <br/>마이 프로필 페이지 입니다.
		                                </p>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <hr class="my-4" />
		                <div class="form-row">
                    		<div class="form-group">
		                        <label for="nick">* 닉 네 임 : </label>
		                        <input type="text" id="nick" class="form-control" value="${userInfo.nick}" /><br/>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label for="inputEmail4">*  이 름 :</label>
		                    <input type="text" class="form-control" id="inputEmail4" value="${userInfo.name}" /><br/>
		                </div>
		                <div class="form-group">
		                    <label for="inputEmail4">*  이 메 일 :</label>
		                    <input type="email" class="form-control" id="inputEmail4" value="${userInfo.email}" /><br/>
		                </div>
		                <div class="form-group">
		                    <label for="birth">* 생 년 월 일 :</label>
		                    <fmt:formatDate var="birth" pattern="yyyy-MM-dd" value="${userInfo.birth}" />
								<input class="form-control" type="date" id="birth" name="birth" value="${birth}" /><br/>
		                </div>
		                <div class="form-row">
		                    <div class="form-group">
		                        <label for="inputCompany5">* 연 락 처 :</label>
		                        <input type="text" class="form-control" id="inputCompany5" value="${userInfo.tel}" /><br/>
		                    </div>
		                    <div class="form-group">
		                        <label for="inputState5">* 성 별 :</label>
		                        <select id="inputState5" class="form-control" id="gender" name="gender" required>
									<option value="${userInfo.gender}">${userInfo.gender}</option>
									<option value="남성">남성</option>
									<option value="여성">여성</option>
								</select><br/>
		                    </div>
		                    <div class="form-group">
		                        <label for="inputZip5">* 프로필 사진</label>
		                        <input type="file" class="form-control" id="save" name="save" value="${userInfo.img}" /><br/>	
		                    </div>
		                </div>
		                <hr class="my-4" >
		                <div class="text-center">
			                <input type="submit" class="btn btn-outline-black" value="수정하기" />
			                	&nbsp;
							<input type="reset" class="btn btn-outline-black" value="다시작성하기" />
								&nbsp;
							<input type="button" class="btn btn-outline-black" value="마이룸이동" onClick="javascript:window.location='/myroom'" />
						</div>
		            </form>
		        </div>
		    </div>
		</div>
		
		</div>
	
	</body>
</html>

<%@ include file="../../layout/footer.jsp"%>