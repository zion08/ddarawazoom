<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
<head>
	<title>User 관리 페이지</title>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
	<link href="../../resources/css/manager/user.css" rel="stylesheet" />
	
</head>
<body>
	<div class="container">
		<div class="row el-element-overlay">
		
			<h3 class="header-title pb-3 mt-0">- 멤버 관리자 페이지 -</h3>
			
			<c:if test="${count == 0}">
				등록된 멤버가 없습니다.
			</c:if>
			<c:if test="${count != 0}">
				<h5> - 오늘 새로 가입한 신규 멤버 <font style="color:red;">[ ${newUserCount} 명 ]</font>- </h5>
				<c:forEach var="newUser" items="${newUser}">
				    <div class="col-lg-3 col-md-6">
				        <div class="card">
				            <div class="el-card-item">
				                <div class="el-card-avatar el-overlay-1"> <img src="../../resources/image/upload/${newUser.img}" alt="user">
				                    <div class="el-overlay">
				                        <ul class="list-style-none el-info">
				                            <li class="el-item"><a class="btn default btn-outline image-popup-vertical-fit el-link" href="/manager/userInfo?id=${newUser.id}"><i class="fa fa-search" aria-hidden="true"></i></a></li>
				                        </ul>
				                    </div>
				                </div>
				                <div class="el-card-content">
				                    <h4 class="m-b-0">${newUser.id}</h4> <span class="text-muted">${newUser.email}</span>
				                </div>
				            </div>
				        </div>
				    </div>
				</c:forEach>
				
				<h5> - 탈퇴한 멤버 <font style="color:red;">[ ${deleteUserCount} 명 ]</font>- </h5>
				<c:forEach var="deleteUser" items="${deleteUser}">
				    <div class="col-lg-3 col-md-6">
				        <div class="card">
				            <div class="el-card-item">
				                <div class="el-card-avatar el-overlay-1"> <img src="../../resources/image/upload/${deleteUser.img}" alt="user">
				                    <div class="el-overlay">
				                        <ul class="list-style-none el-info">
				                            <li class="el-item"><a class="btn default btn-outline image-popup-vertical-fit el-link" href="/manager/userInfo?id=${deleteUser.id}"><i class="fa fa-search" aria-hidden="true"></i></a></li>
				                        </ul>
				                    </div>
				                </div>
				                <div class="el-card-content">
				                    <h4 class="m-b-0">${deleteUser.id}</h4> <span class="text-muted">${deleteUser.email}</span>
				                </div>
				            </div>
				        </div>
				    </div>
				</c:forEach>
				
				<h5> -  기존 가입 멤버 <font style="color:red;">[ ${count}명 ]</font> -</h5>
				<c:forEach var="userInfo" items="${userInfo}">
				    <div class="col-lg-3 col-md-6">
				        <div class="card">
				            <div class="el-card-item">
				                <div class="el-card-avatar el-overlay-1"> <img src="../../resources/image/upload/${userInfo.img}" alt="user">
				                    <div class="el-overlay">
				                        <ul class="list-style-none el-info">
				                            <li class="el-item"><a class="btn default btn-outline image-popup-vertical-fit el-link" href="/manager/userInfo?id=${userInfo.id}"><i class="fa fa-search" aria-hidden="true"></i></a></li>
				                        </ul>
				                    </div>
				                </div>
				                <div class="el-card-content">
				                    <h4 class="m-b-0">${userInfo.id}</h4> <span class="text-muted">${userInfo.email}</span>
				                </div>
				            </div>
				        </div>
				    </div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>