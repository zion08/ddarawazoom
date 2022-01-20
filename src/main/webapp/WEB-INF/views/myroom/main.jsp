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
		
		<link href='/resources/css/class/main.css' rel='stylesheet' />
		<link href="/resources/css/class/class.css" rel="stylesheet" />
		<link href="../../resources/css/bodyprofile.css" rel="stylesheet" >
		
	</head>
	<body>
		
	<div class="container">
     	<div class="row">
        	<div class="col-6">
          		<div class="card">
  						<img src="../../resources/image/upload/zoom.png" class="card-img-top" alt="likeZoom" id="likeZoom" width="130px" height="500px">
            		<div class="card-body">
              			<h4 class="card-title">
	              			관심 Zoom
	          			</h4>
              			<p class="card-text">
              				관심있는 Zoom강의를 소중하게 담아놓은 공간입니다.
              			</p>
              			<a href="/myroom/likeZoom" class="btn btn-primary">
   							페이지 이동
   			 			 </a>
		            </div>
		          </div>
		        </div>
		        <div class="col-6">
		          <div class="card">
  					<img src="../../resources/image/upload/vod.jpg" class="card-img-top" alt="likevod" id="likdVod" width="130px" height="500px">
	              <div class="card-body">
		              <h4 class="card-title">
		              	관심 Vod
		              </h4>
		              <p class="card-text">
		              	관심있는 Vod강의를 소중하게 담아놓은 공간입니다.
		              </p>
		              <a href="/myroom/likeVod" class="btn btn-primary">
		    			페이지 이동
		    		  </a>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	
		<!-- 바디 프로필 차트 -->
		<div class="weightChart" style="position: relative; height:40vh; width:50vw; margin: 0 auto; margin-top:20px;">
			<canvas id="weightChart" style="height:30vh; width:50vw; margin: 0 auto;"></canvas>
		</div>
		<br/><br/>
		<div class="muscleBodyChart" style="position: relative; height:40vh; width:50vw; margin: 0 auto; margin-top: 20px;">
			<canvas id="muscleBodyChart" style="height:30vh; width:50vw; margin: 0 auto;"></canvas>
		</div>
		<div class="bodySizeChart" style="position: relative; height:40vh; width:50vw; margin: 0 auto; margin-top: 20px;">
			<canvas id="bodySizeChart" style="height:30vh; width:50vw; margin: 0 auto;"></canvas>
		</div>
		
		
		<div id='calendar' style="postion: relative;"></div>
		
		
		
		
		
		
		<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
  
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="../../resources/js/bodyprofile.js" ></script>
		<script src='/resources/js/class/main.js'></script>
		<script src="/resources/js/class/class.js" type="text/javascript"></script>
		<script src="/resources/js/class/class_zoom.js" type="text/javascript"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</body>
</html>
<%@ include file="../layout/footer.jsp"%>