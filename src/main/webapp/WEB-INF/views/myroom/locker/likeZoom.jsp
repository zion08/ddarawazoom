<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
	<head>
		<title>likeZoom 페이지</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src ="../../resources/js/myroom/like.js" type="text/javascript"></script>
		
		<link href="../../resources/css/myroom/like.css" rel="stylesheet" >
	</head>
	<body>
		
		<div class="likeZoom_title">
			<h3>소중한 관심Zoom 공간</h3>
		</div>
		
		<div class="container-fluid">
   		 	<div class="container">
				<div class="row row-cols-1 row-cols-sm-1 row-cols-md-3 g-3">
					<c:forEach var="ZoomDTO" items="${ZoomDTO}">
						<div class="col">
							<div class="card shadow-sm">
		        				<img src="/resources/coach/img/${ZoomDTO.img}" class="card-img-top" width="100" height="225">       
		         					<div class="card-body"> 	
										<p class="card-text">
											<b>코치 명 :</b> ${ZoomDTO.c_id} 코치님
										</p>
										<p class="card-text">
											<b>강의 명 :</b><br/>
											<a href="/ddarawazoom/zoomReadcount?num=${ZoomDTO.num}">${ZoomDTO.title}</a>
										</p>
										<p class="card-text">
											<b>강의 소개 :</b><br/>
											${ZoomDTO.intro}
										</p>
										<p class="card-text">
											<b>가 격 :</b><br/>
											${ZoomDTO.price}원 
										</p>	
	 								<div class="d-flex justify-content-between align-items-center">
		              					<div class="btn-group">
							                <button type="button" class="btn btn-sm btn btn-danger" disabled>${ZoomDTO.type}</button>&nbsp;&nbsp; 	 	 
							               	<button type="button" class="btn btn-sm btn btn-success" disabled>${ZoomDTO.goal}</button>&nbsp;&nbsp;
							               	<button type="button" class="btn btn-sm btn btn-warning" disabled>${ZoomDTO.tool}</button>&nbsp;&nbsp;
							               	<button type="button" class="btn btn-sm btn btn-primary" disabled>${ZoomDTO.frequency}</button>
							               	<button type="button" class="btn btn-light" onclick="deleteLikeZoom(${ZoomDTO.num});">관심 해제</button>
		              					</div>	     
						            </div>
						         </div>
			        		</div>
		        		</div>
					</c:forEach> 
				</div>		
	 		</div>
		</div>	 
			
	</body>
</html>

<%@ include file="../../layout/footer.jsp"%>