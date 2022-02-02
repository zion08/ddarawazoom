<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
    
<html>
<head>
	<title>Locker 페이지</title>
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
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>