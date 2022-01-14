<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layout/header.jsp"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<html>
	<head>
		<title>Profile Page</title>
    	<link href="../resources/myroom/css/simple-sidebar.css" rel="stylesheet">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	</head>
<body>		
	

	<!-- myprofile 여부 확인 후, 출력 -->	
	<c:if test="${myProfileDTO == null}" >
	
		<div class="card" style="width: 35rem; margin: auto; padding:0px; overflow:hidden;">
		  	<div class="card-header" style="text-align:center; font-size:15px;">
				<img src="../../resources/image/myroom/b_img.png" name="b_img" width="150px" height="150px"/>
				<br/>
				${myProfileDTO.b_id}님의 프로필	
		  	</div>
		  	
		  	<ul class="list-group list-group-flush">
			    <li class="list-group-item" style="text-align:center; padding: 20px;">
			    	<b>작성 된 프로필이 없습니다.</b><br/><br/>
			    	"작성하러가기" 버튼을 클릭한 후, <b>${myProfileDTO.b_id}</b>님 의 프로필을 작성해주세요.<br/>
					[프로필 작성이 완료되면, 바디프로필 작성이 가능합니다.]
				</li>
				<li class="list-group-item" style="margin:auto;">
					<input type="button" value="작성하러가기" onclick="document.location.href='/myroom/bodyprofile/myWrite'" />
				</li>
		  	</ul>
		</div>
	</c:if>
	
	<c:if test="${myProfileDTO != null}" >
	
		<div class="card" style="width: 35rem; margin: auto; padding:0px; overflow:hidden;">
			<div class="card-header" style="text-align:center">
		    	<img src="../../resources/image/myroom/${myProfileDTO.b_img}" name="b_img" width="150px" height="150px"/>
		    	<br/>
		    	<b>${myProfileDTO.b_nick}</b>님의 마이 프로필	
		  	</div>
			  <ul class="list-group list-group-flush">
			  	<li class="list-group-item">아이디 : ${myProfileDTO.b_id}</li>
			    <li class="list-group-item">
			    	닉네임 : ${myProfileDTO.b_nick}
			    </li>
			    <li class="list-group-item">
			    	이 름 : ${myProfileDTO.b_name}
			    </li>
			    <li class="list-group-item">
			    	성 별 : ${myProfileDTO.b_gender}
			    </li>
			    <li class="list-group-item">
			    	생년월일 : <fmt:formatDate value="${myProfileDTO.b_birth}" type="date" dateStyle="long"/>
			    </li>
			    <li class="list-group-item">
			    	연락처 : ${myProfileDTO.b_tel}
			    </li>
			    <li class="list-group-item">
			    	이메일 : ${myProfileDTO.b_email}
			    </li>
			    <li class="list-group-item" style="margin:auto;">
			    	<input type="button" value="수정하러가기"
						onclick="document.location.href='/myroom/bodyprofile/myUpdate'"/>
						&nbsp;
					<input type="button"  value="오늘하루 기록하기"
						onclick="document.location.href='/myroom/bodyprofile/bodyWrite'"/>
				</li>
			  </ul>
		</div>
	</c:if>
	

			
	<!-- bodyprofile 여부 확인 후, 출력 -->	
	<c:if test="${bodyProfileDTO == null}" >
		<div class="card" style="width: 35rem; margin: auto; padding:0px; overflow:hidden; margin-top: 30px;">
		  	<div class="card-header" style="text-align:center">
				${myProfileDTO.b_nick}님의 바디 프로필	
		  	</div>
		  	<ul class="list-group list-group-flush">
			    <li class="list-group-item" style="text-align:center; padding: 20px;">
			    	작성 된 바디프로필이 없습니다.<br/><br/>
					"오늘하루 기록하기" 버튼을 클릭한 후, 바디프로필을 작성해주세요.
				</li>
		  	</ul>
		</div>
	</c:if>
	
		<c:forEach items="${bodyProfileDTO}" var="bodyProfileDTO">	
		  <div class="card" style="width: 35rem; margin: auto; padding:0px; overflow:hidden; margin-top: 30px;">
			  	<div class="card-header" style="text-align: center">
			   		${myProfileDTO.b_nick}님의 바디 프로필	
			  	</div>
			  	<ul class="list-group list-group-flush">
				    <li class="list-group-item">
				    	키 : ${bodyProfileDTO.b_height} cm
				    </li>
				    <li class="list-group-item">
				    	몸무게 : ${bodyProfileDTO.b_weight} kg
				    </li>
				    <li class="list-group-item">
				    	근육 량 : ${bodyProfileDTO.b_muscle}
				    </li>
				    <li class="list-group-item">
				    	체지방 량 : ${bodyProfileDTO.b_bodyfat}
				    </li>
				    <li class="list-group-item">
				    	체 형 : ${bodyProfileDTO.b_shape}
				    </li>
				    <li class="list-group-item">
				    	가슴 둘레 : ${bodyProfileDTO.b_chest} cm
				    </li>
				    <li class="list-group-item">
				    	허리 둘레 : ${bodyProfileDTO.b_waist} cm
				    </li>
				    <li class="list-group-item">
				    	팔뚝 둘레 : ${bodyProfileDTO.b_arm} cm
					</li>
				    <li class="list-group-item">
				    	허벅지 둘레 : ${bodyProfileDTO.b_thigh} cm
				    </li>
				    <li class="list-group-item">
				    	엉덩이 둘레 : ${bodyProfileDTO.b_hip} cm
				    </li>
			  	</ul>
			</div>
		</c:forEach>
	
			
			<!--차트가 그려질 부분-->
				
				
	
				<table class="table table-striped table-bordered" style="width: 80rem; margin: auto; text-align: center; " >
						<tr>
							<td>
								순 서
							</td>
							<td>
								<label for="b_date">측정 날짜</label>
							</td>
							<td>
								<label for="b_height">키</label>
							</td>
							<td>
								<label for="b_weight">몸무게</label>
							</td>
							<td>
								<label for="b_muscle">근육량</label>
							</td>
							<td>
								<label for="b_bodyfat">체지방량</label>
							</td>
							<td>
								<label for="b_shape">체 형</label>
							</td>
							<td>
								<label for="b_chest">가슴 둘레</label>
							</td>
							<td>
								<label for="b_waist">허리 둘레</label>
							</td>
							<td>
								<label for="b_arm">팔뚝 둘레</label>
							</td>
							<td>
								<label for="b_thigh">허벅지 둘레</label>
							</td>
							<td>
								<label for="b_hip">엉덩이 둘레</label>
							</td>
							<td>
								<label>버 튼</label>
							</td>
						</tr>
					<c:forEach items="${bodyList}" var="bodyProfileDTO" varStatus="status">					
						<!-- 본 바디프로필이 삭제 될 수 있도록 b_num 을 hidden 으로 넘긴다 -->
						
						<tr>
							<td>
								${status.index+1}
							</td>
							<td>
								<fmt:formatDate value="${bodyProfileDTO.b_date}" type="date" dateStyle="medium"/>
							</td>
							<td>
								${bodyProfileDTO.b_height}
							</td>
							<td>
								${bodyProfileDTO.b_weight}
							</td>
							<td>
								${bodyProfileDTO.b_muscle}
							</td>
							<td>
								${bodyProfileDTO.b_bodyfat}
							</td>
							<td>
								${bodyProfileDTO.b_shape}
							</td>
							<td>
								${bodyProfileDTO.b_chest}
							</td>
							<td>
								${bodyProfileDTO.b_waist}
							</td>
							<td>
								${bodyProfileDTO.b_arm}
							</td>
							<td>
								${bodyProfileDTO.b_thigh}
							</td>
							<td>
								${bodyProfileDTO.b_hip}
							</td>
							<td>
								<input type="button"  value="수 정" style="width:35pt; height:20pt; font-size:13px;"
									onclick="document.location.href='/myroom/bodyprofile/bodyUpdate?b_num=${bodyProfileDTO.b_num}'"/>
						
								<input type="button" value="삭 제" style="width:35pt; height:20pt; font-size:13px;"
									onclick="window.open('/myroom/bodyprofile/bodyDelete?b_num=${bodyProfileDTO.b_num}','delete','width=400,height=200');" />
							</td>
						</tr>
					</c:forEach>
				</table>
				
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>