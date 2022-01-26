<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../layout/header.jsp"%>
    
<!DOCTYPE html>
<html>
	<head>
		<title>userInfo 페이지</title>
		<link href="../../resources/css/myroom/userInfo.css" rel="stylesheet">
		
		<script src="../../resources/js/myroom/user.js" type="text/javascript"></script>
	</head>
	
	<body>
	
	
		<div class="container-xl px-4 mt-4">
		    <div class="row">
		        <div class="col-xl-4">
		            <div class="card mb-4 mb-xl-0">
		                <div class="card-header">Profile Picture</div>
		                <div class="card-body text-center">
		                    <img class="img-account-profile rounded-circle mb-2" src="../../resources/image/upload/${userInfo.img}" alt="">
		                    <div class="small font-italic text-muted mb-4">${userInfo.nick}님의 프로필 사진</div>
		                </div>
		            </div>
		        </div>
		        <div class="col-xl-8">
		            <div class="card mb-4">
		                <div class="card-header">Account Details</div>
		                <div class="card-body">
		                    <form>
		                        <div class="row gx-3 mb-3">
		                            <div class="col-md-6">
		                                <label class="small mb-1" for="inputFirstName">아 이 디 : </label>
		                                	${sessionScope.id}
		                            </div>
		                            <div class="col-md-6">
		                                <label class="small mb-1" for="inputLastName">닉 네 임 : </label>
		                                	${userInfo.nick}
		                            </div>
		                        </div>
		                        <div class="row gx-3 mb-3">
		                            <div class="col-md-6">
		                                <label class="small mb-1" for="inputOrgName">이 름 : </label>
		                                	${userInfo.name}
		                            </div>
		                            <div class="col-md-6">
		                                <label class="small mb-1" for="inputLocation">성 별 : </label>
		                                	${userInfo.gender}
		                            </div>
		                        </div>
		                        <div class="row gx-3 mb-3">
		                            <div class="col-md-6">
		                                <label class="small mb-1" for="inputOrgName">이 메 일 : </label>
		                                	${userInfo.email}
		                            </div>
		                            <div class="col-md-6">
		                                <label class="small mb-1" for="inputLocation">상 태 : </label>
		                                	${userInfo.status}
		                            </div>
		                        </div>
		                        <div class="row gx-3 mb-3">
		                            <div class="col-md-6">
		                                <label class="small mb-1" for="inputPhone">연 락 처 : </label>
		                               		${userInfo.tel}
		                            </div>
		                            <div class="col-md-6">
		                                <label class="small mb-1" for="inputBirthday">생 년 월 일 : </label>
		                                	${userInfo.birth}
		                            </div>
		                        </div>
		                         <hr class="my-4">
		                        <div class="update_button">
									<input type="button" class="btn btn-outline-black" value="정보수정 하러가기"
										onclick="window.location='/myroom/infoUpdate'"/>
											&nbsp;&nbsp;
									<input type="button" class="btn btn-outline-black" value="마이룸으로"
										onclick="window.location='/myroom'" />
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