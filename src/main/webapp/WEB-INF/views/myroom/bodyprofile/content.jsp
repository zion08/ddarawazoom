<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layout/header.jsp"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<title>Profile Page</title>		
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="../../resources/js/myroom/bodyprofile.js" ></script>
		
		<link href="../../resources/css/myroom/bodyprofile.css" rel="stylesheet" >
		

	<div class="profile_title">
		<h2>${myProfileDTO.b_id}님의 소중한 공간</h2>
	</div>
	
	<!-- 마이 프로필 출력 -->
	<div class="container">
      <div class="row">
      	<c:if test="${myProfileDTO == null}" >
			<div class="card">
		  		<div class="card-header">
			    	<img src="../../resources/image/upload/${myProfileDTO.img}" name="img" width="150px" height="150px" alt="img"/>
					<br/>
					${myProfileDTO.b_id}님의 프로필	
		  		</div>
			  	<ul class="list-group list-group-flush">
				    <li class="list-group-item">
				    	<b>작성 된 프로필이 없습니다.</b><br/><br/>
				    	"작성하러가기" 버튼을 클릭한 후, <b>${myProfileDTO.b_id}</b>님 의 프로필을 작성해주세요.<br/>
						[프로필 작성이 완료되면, 바디프로필 작성이 가능합니다.]
					</li>
					<li class="list-group-item">
						<input type="button" value="작성하러가기" class="btn btn-outline-dark"
							onclick="document.location.href='/myroom/bodyprofile/myWrite'" />
					</li>
			  	</ul>
			</div>
		</c:if>
        <c:if test="${myProfileDTO != null}" >
	        <div class="col-6">
	          <div class="card">
		          <div class="card-header">
		              	<b>${myProfileDTO.b_id}</b>님의 마이 프로필	
		            </div>
			           <div class="card-header" style="background: white;">
					    	<img src="../../resources/image/upload/${myProfileDTO.img}" name="img" width="150px" height="150px" alt="img"/>
					  	</div>
		            <div class="card-body">
		              	<ul class="list-group list-group-flush">
						  	<li class="list-group-item">
						  		아이디 : ${myProfileDTO.b_id}</li>
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
				  		</ul>
				  		   <div class="list_button">
						    	<input type="button" value="수정하러가기"  class="btn btn-outline-dark"
									onclick="document.location.href='/myroom/bodyprofile/myUpdate'"/>
									&nbsp;&nbsp;
								<input type="button"  value="오늘하루 기록하기"  class="btn btn-outline-dark"
									onclick="document.location.href='/myroom/bodyprofile/bodyWrite'"/>
							</div>
			            </div>
			         </div>
			     </div>
		     </c:if>
        <div class="col-6">
        	<c:if test="${bodyProfileDTO == null}" >
				<div class="card">
				  	<div class="card-header" >
						${myProfileDTO.b_nick}님의 바디 프로필	
				  	</div>
				  	<ul class="list-group list-group-flush">
					    <li class="list-group-item">
					    	작성 된 바디프로필이 없습니다.<br/><br/>
							"오늘하루 기록하기" 버튼을 클릭한 후, 바디프로필을 작성해주세요.
						</li>
				  	</ul>
				</div>
			</c:if>
        	<c:forEach items="${bodyProfileDTO}" var="bodyProfileDTO">	
			  	<div class="card">
				  	<div class="card-header">
				   		${myProfileDTO.b_nick}님의 바디 프로필	
				  	</div>
				  		<div class="card-header" style="background: white;">
					    	<img src="../../resources/image/upload/${bodyProfileDTO.b_img}" name="b_img" width="150px" height="150px" alt="b_img"/>
					  	</div>
					  	<ul class="list-group list-group-flush">
						    <li class="list-group-item">
						    	키 : ${bodyProfileDTO.b_height} cm
						    </li>
						    <li class="list-group-item">
						    	몸무게 : ${bodyProfileDTO.b_weight} kg
						    </li>
						    <li class="list-group-item">
						    	근육 량 : ${bodyProfileDTO.b_muscle} kg
						    </li>
						    <li class="list-group-item">
						    	체지방 량 : ${bodyProfileDTO.b_bodyfat} kg
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
        </div>
      </div>
    </div>
    
	
	
	<!-- 바디프로필 리스트 -->
	<table class="table" id="bodyprofileList" style="height: 130px ; vertical-align: middle;">
		<thead>
			<tr class="table-light">
				<th scope="col">
					순 서
				</th>
				<th scope="col">
					바디 사진
				</th>
				<th scope="col">
					측정 날짜
				</th>
				<th scope="col">
					키
				</th>
				<th scope="col">
					몸무게
				</th>
				<th scope="col">
					근육량
				</th>
				<th scope="col">
					체지방량
				</th>
				<th scope="col">
					체 형
				</th>
				<th scope="col">
					가슴 둘레
				</th>
				<th scope="col">
					허리 둘레
				</th>
				<th scope="col">
					팔뚝 둘레
				</th>
				<th scope="col">
					허벅지 둘레
				</th>
				<th scope="col">
					엉덩이 둘레
				</th>
				<th scope="col">
					버 튼
				</th>
			</tr>
		</thead>
		<c:forEach var="bodyProfileDTO" items="${bodyList}" >	
			<tbody>				
				<tr>
					<th scope="row">
						${number}
						<c:set var="number" value="${number + 1}"/>
					</th>
					<td>
						<img src="../../resources/image/upload/${bodyProfileDTO.b_img}" name="b_img" width="150px" height="150px"/>
					</td>
					<td>
						<fmt:formatDate value="${bodyProfileDTO.b_date}" type="date" dateStyle="medium"/>
					</td>
					<td>
						${bodyProfileDTO.b_height} cm
					</td>
					<td>
						${bodyProfileDTO.b_weight} kg
					</td>
					<td>
						${bodyProfileDTO.b_muscle} kg
					</td>
					<td>
						${bodyProfileDTO.b_bodyfat} kg
					</td>
					<td>
						${bodyProfileDTO.b_shape}
					</td>
					<td>
						${bodyProfileDTO.b_chest} cm
					</td>
					<td>
						${bodyProfileDTO.b_waist} cm
					</td>
					<td>
						${bodyProfileDTO.b_arm} cm
					</td>
					<td>
						${bodyProfileDTO.b_thigh} cm
					</td>
					<td>
						${bodyProfileDTO.b_hip} cm
					</td>
					<td style="width: 10px; font-size:10px;">
						<input type="button"  value="수 정"  id="updateButton" class="btn btn-outline-primary"
							onclick="window.location='/myroom/bodyprofile/bodyUpdate?b_num=${bodyProfileDTO.b_num}'"/>
							&nbsp;&nbsp;
						<input type="button" value="삭 제" id="deleteButton" class="btn btn-outline-danger"
							onclick="window.open('/myroom/bodyprofile/bodyDelete?b_num=${bodyProfileDTO.b_num}','delete','width=600,height=200');" />
					</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
		
		
		
		<!-- 바디 프로필 차트 -->
		<div class="weightChart" style="position: relative; height:60vh; width:80vw; margin: 0 auto; margin-top: 100px;">
			<canvas id="weightChart" style="height:30vh; width:50vw; margin: 0 auto;"></canvas>
		</div>
		<br/><br/>
		<div class="muscleBodyChart" style="position: relative; height:60vh; width:80vw; margin: 0 auto; margin-top: 100px;">
			<canvas id="muscleBodyChart" style="height:30vh; width:50vw; margin: 0 auto;"></canvas>
		</div>
		<div class="bodySizeChart" style="position: relative; height:60vh; width:80vw; margin: 0 auto; margin-top: 100px;">
			<canvas id="bodySizeChart" style="height:30vh; width:50vw; margin: 0 auto;"></canvas>
		</div>
		

<%@ include file="../../layout/footer.jsp"%>