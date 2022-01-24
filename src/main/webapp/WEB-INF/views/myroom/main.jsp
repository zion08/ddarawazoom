<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Myroom Main 페이지</title>
		
	<style>
		  #calendar {
		    max-width: 900px;
		    margin: 0 auto;
		  }
	</style>
		
		<link href='../../resources/css/class/main.css' rel='stylesheet' />
		<link href="../../resources/css/class/class.css" rel="stylesheet" />
		
	</head>
	<body>
		<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-5">
			  		<div class="card" style="margin-left:150px;  margin-bottom: 70px; width:450px; border-radius: 50%;  text-align:center;">
	            		<div class="card-body">
	              			<h4 class="card-title">
		              			관심 Zoom
		          			</h4>
	              			<p class="card-text" >
	              				관심있는 Zoom강의를 소중하게 담아놓은 공간입니다.
	              			</p>
	              			<a href="/myroom/likeZoom" class="btn btn-primary">
	   							관심Zoom로 이동
	   			 			 </a>
			            </div>
			          </div>
			       </div>
		       <div class="col-5">
		          <div class="card" style="margin-left: 150px; margin-bottom: 50px; width: 450px; border-radius: 50%; text-align:center; ">
	              	<div class="card-body">
		              <h4 class="card-title">
		              	관심 Vod
		              </h4>
		              <p class="card-text">
		              	관심있는 Vod강의를 소중하게 담아놓은 공간입니다.
		              </p>
		              <a href="/myroom/likeVod" class="btn btn-primary">
		    			관심Vod로 이동
		    		  </a>
		            </div>
		          </div>
	          </div>
	          </div>
		</div>
		
		
			<div id='calendar'></div>
		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		<script src='/resources/js/class/main.js'></script>
		<script src="/resources/js/class/class.js" type="text/javascript"></script>
		<script src="/resources/js/class/class_zoom.js" type="text/javascript"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
	</body>
</html>


<%@ include file="../layout/footer.jsp"%>