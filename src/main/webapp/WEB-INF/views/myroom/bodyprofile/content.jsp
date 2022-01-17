<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layout/header.jsp"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
	<head>
		<title>Profile Page</title>
		<link href="/resources/css/bodyprofile.css" rel="stylesheet" >
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	</head>
<body>		
	
	<!-- 마이 프로필 출력 -->
	<c:if test="${myProfileDTO == null}" >
	
		<div class="card">
		  	<div class="card-header">
				<img src="../../resources/image/upload/${myProfileDTO.b_img}" name="b_img" width="150px" height="150px"/>
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
		<div class="card">
			<div class="card-header">
		    	<img src="../../resources/image/upload/${myProfileDTO.img}" name="img" width="150px" height="150px"/>
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
			    <li class="list-group-item">
			    	<input type="button" value="수정하러가기"  class="btn btn-outline-dark"
						onclick="document.location.href='/myroom/bodyprofile/myUpdate'"/>
						&nbsp;&nbsp;
					<input type="button"  value="오늘하루 기록하기"  class="btn btn-outline-dark"
						onclick="document.location.href='/myroom/bodyprofile/bodyWrite'"/>
				</li>
			  </ul>
		</div>
	</c:if>
	

			
	<!-- 바디 프로필 마지막 결과 출력 -->	
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
		
		<br/><br/>
		
		<!-- 바디 프로필 차트 -->
		<div class="weightChart" style="position: relative; height:60vh; width:80vw; margin: 0 auto;">
			<canvas id="weightChart" style="height:30vh; width:50vw; margin: 0 auto;"></canvas>
		</div>
		<br/><br/>
		<div class="muscleBodyChart" style="position: relative; height:60vh; width:80vw; margin: 0 auto;">
			<canvas id="muscleBodyChart" style="height:30vh; width:50vw; margin: 0 auto;"></canvas>
		</div>
		<div class="bodySizeChart" style="position: relative; height:60vh; width:80vw; margin: 0 auto;">
			<canvas id="bodySizeChart" style="height:30vh; width:50vw; margin: 0 auto;"></canvas>
		</div>
	
		<br/><br/>
	
		<!-- 바디프로필 리스트 -->
		<table class="table" id="bodyprofileList">
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
			<c:forEach items="${bodyList}" var="bodyProfileDTO" varStatus="status">	
				<tbody>				
					<tr>
						<th scope="row">
							${status.index+1}
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
								onclick="document.location.href='/myroom/bodyprofile/bodyUpdate?b_num=${bodyProfileDTO.b_num}'"/>
					
							<input type="button" value="삭 제" id="deleteButton" class="btn btn-outline-danger"
								onclick="window.open('/myroom/bodyprofile/bodyDelete?b_num=${bodyProfileDTO.b_num}','delete','width=600,height=200');" />
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
			
				
				
				<script>
					$(document).ready(function(){
	
						var weight = new Array();
						
						// 날짜 정보를 저장할 리스트 선언
						var date = new Array();
						
						$.ajax({
							type: "post",
							url: "/myroom/getBodyList", 
							dataType: "json",
							async: false,
							success: function(result){
								var bodyList = JSON.stringify(result);
								var jsonList = JSON.parse(bodyList);
								
								console.log(jsonList);
								
								for(var i = 0; i < jsonList.length; i++){
									
									var b_list = jsonList[i];
									
									weight.push(jsonList[i].b_weight);
									
									// 날짜 리스트 안에 가져온 날짜 정보를 주입
									date.push(b_list.parse_date);
								}
							}
						});
						
						console.log(weight);
						console.log(date);
						
						var ctx = document.getElementById('weightChart').getContext('2d');
							var chart = new Chart(ctx, { 
								type: 'line', 
								data: {
									labels: date,
									datasets: [
										{
											label: '몸무게',
											backgroundColor: '#80b6f4',
				                            borderColor: '#80b6f4',
				                            pointBorderColor: '#80b6f4',
				                            pointBackgroundColor: '#80b6f4', 
				                            pointHoverBackgroundColor: 'white', //hover시 pointBacground
				                            pointHoverBorderColor: '#black',
							                borderWidth: 3,
							                fillColor: "#79D1CF",
							                strokeColor: "#79D1CF",
							                display : true,
							                fill: false,
											data: weight
										}]
									},
								options: {
									maintainAspectRatio: false, //차트 비율 유지하지 않음
									randing: true,
									tooltips: {
										enabled:false
									}, // hover시 보였던 툴팁 제거
									hover: {
										animationDuration: 0
									}, // 차트 위에 값 나타내기
									animation: {
										duration: 1,
										onComplete: function(){
											var chartInstance = this.chart,
					                        ctx = chartInstance.ctx;
						                    ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
						        			ctx.textAlign = "center";
						    				ctx.font = "15px Open Sans";
						    				ctx.fillStyle = 'black';
					    				
					    				
						    				Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
						    					var meta = chartInstance.controller.getDatasetMeta(i);
						    					Chart.helpers.each(meta.data.forEach(function (bar, index) {
						    						data = dataset.data[index];
						    						if(i==0){
						    							ctx.fillText(data, bar._model.x, bar._model.y-20); 
						    						} else {
						    							ctx.fillText(data, bar._model.x, bar._model.y-20);
						    						}
						    					}),this)
						    				}),this);
						    			}
						    		},
									responsive: true,
									legend:{
										display:false
									},
									elements: {
										line: {
											fill: false
										},
										point: {
											hoverRadiuse: 7,
											radius: 5
										}
									},
									scales: {
										yAxes: [{
											scaleLabel:{
												display: true,
												labelString: 'Kg',
												fontColor:'black',
												fontSize: 13
											},
											ticks:{
												max:150,
												min: 0,
												stepSize: 10,
												autoSkip: false
											},
											stacked: true
										}]
									},
									interaction: {
										mode: 'index',
										intersect: false,
									},
										title: {
											display: true,
											text: '몸무게 변화',
											fontSize: 23
										}
									}
								});
							});
						
					
					
					
					
						$(document).ready(function(){
							
							var muscle = new Array();
							var bodyfat = new Array();
							var date = new Array();
							
							$.ajax({
								type: "post",
								url: "/myroom/getBodyList", 
								dataType: "json",
								async: false,
								success: function(result){
									var bodyList = JSON.stringify(result);
									var jsonList = JSON.parse(bodyList);
									
									for(var i = 0; i < jsonList.length; i++){
										
										var b_list = jsonList[i];
										
										muscle.push(jsonList[i].b_muscle);
										bodyfat.push(jsonList[i].b_bodyfat);
										date.push(b_list.parse_date);
									}
								}
							});
							
							console.log(muscle);
							console.log(bodyfat);
							
							var ctx = document.getElementById('muscleBodyChart').getContext('2d');
								var chart = new Chart(ctx, { 
									type: 'bar', 
									data: {
										labels: date,
										datasets: [
											{
												label: '근육량',
												backgroundColor: '#0066ff',
											    borderColor: '#0066ff',
											    pointHoverBackgroundColor: 'white',
					                            pointHoverBorderColor: '#black',
								                borderWidth: 3,
								                display : true,
								                fill: false,
								                stack: 'combined',
								                type: 'line',
												data: muscle
											},
											{
												label: '체지방량',
												backgroundColor: '#ff91c2',
								                borderColor: '#ff91c2',
								                display : true,
								                fill: false,
								                stack: 'combined',
								                type:'bar',
												data: bodyfat
											}]
										},
									options: {
										elements: {
											line: {
												fill: false
											},
											point: {
												hoverRadiuse: 7,
												radius: 5
											}
										},
										scales: {
											yAxes: [{
												scaleLabel:{
													display: true,
													labelString: "Kg",
													fontColor:'black',
													fontSize: 13
												},
												ticks:{
													max:50,
													min: 0,
													stepSize:10,
													autoSkip: false
												},
												stacked: true
											}]
										},
										interaction: {
											mode: 'index',
											intersect: false,
										},
										title: {
											display: true,
											text: '근육량 / 체지방량 변화',
											fontSize:23
										}
									},
								});
							});
						
						
						
						
						
						
						
$(document).ready(function(){
							
							var chest = new Array();
							var waist = new Array();
							var arm = new Array();
							var thigh = new Array();
							var hip = new Array();
							var date = new Array();

							$.ajax({
								type: "post",
								url: "/myroom/getBodyList", 
								dataType: "json",
								async: false,
								success: function(result){
									var bodyList = JSON.stringify(result);
									var jsonList = JSON.parse(bodyList);
									
									console.log(jsonList.length);
									
									for(var i = 0; i < jsonList.length; i++){
										
										var b_list = jsonList[i];
										
										chest.push(jsonList[i].b_chest);
										waist.push(jsonList[i].b_waist);
										arm.push(jsonList[i].b_arm);
										thigh.push(jsonList[i].b_thigh);
										hip.push(jsonList[i].b_hip);
										date.push(b_list.parse_date);
									}
								}
							});
							
							console.log(chest);
							console.log(waist);
							console.log(arm);
							console.log(thigh);
							console.log(hip);
							console.log(date);
							
							var ctx = document.getElementById('bodySizeChart').getContext('2d');
								var chart = new Chart(ctx, { 
									type: 'horizontalBar', 
									data: {
										labels: date,
										datasets: [
											{
												label: '가슴 둘레',
												backgroundColor: '#ff91c2',
								                borderColor: '#ff91c2',
								                borderWidth: 2,
								                display : true,
								                fill: false,
												data: chest
											},
											{
												label: '허리 둘레',
												backgroundColor: '#FFE4B5',
								                borderColor: '#FFE4B5',
								                borderWidth: 2,
								                display : true,
								                fill: false,
												data: waist
											},
											{
												label: '팔뚝 둘레',
												backgroundColor: '#FFB6C1',
								                borderColor: '#FFB6C1',
								                borderWidth: 2,
								                display : true,
								                fill: false,
												data: arm
											},
											{
												label: '허벅지 둘레',
												backgroundColor: '#66CDAA',
								                borderColor: '#66CDAA',
								                borderWidth: 2,
								                display : true,
								                fill: false,
												data: thigh
											},
											{
												label: '엉덩이 둘레',
												backgroundColor: '#9370DB',
								                borderColor: '#9370DB',
								                borderWidth: 2,
								                display : true,
								                fill: false,
												data: hip
											}]
										},
									options: {
										tooltips: {
											enabled:true
										},
										hover: {
											animationDuration: 0
										},
										elements: {
											line: {
												fill: false
											},
											point: {
												hoverRadius: 7,
												radius: 5
											}
										},
										scales: {
											xAxes: [{
												scaleLabel:{
													display: true,
													labelString: "Month",
													fontColor: 'blue',
													fontSize: 13
												},
												stacked: true
											}],
											yAxes: [{
												scaleLabel:{
													display: true,
													labelString: "Cm",
													fontColor:'red',
													fontSize: 13
												},
												ticks:{
													max:400,
													min: 0,
													stepSize:100,
													autoSkip: false
												},
												stacked: true
											}]
										},
										interaction: {
											mode: 'index',
											intersect: false,
										},
										title: {
											display: true,
											text: '바디 사이즈 변화',
											fontSize: 25
										}
									},
								});
							});
				</script>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>