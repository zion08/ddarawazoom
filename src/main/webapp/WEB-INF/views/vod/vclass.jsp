<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<script>
$(document).ready(function(){

$('#search-btn').click(function() {
	$.ajax({
        type: "post",
		data: {"qurey":$('#search-input').val()},
        url: "/manager/insertVod", // data 보낼 주소		                    	                    	
        success: function(result){	// data 전송 성공 했을때                		                    	
        	console.log(result);
			$("#vodList").load("/manager/vod #vodList");
        }
    });
});

});
</script>

<div class="container-fluid bg-light">
	</br>
	<div class="album py-2 bg-light">
	  	<h2 style="text-align: center;"> 따라와 줌 </h2>
	  	<h3 style="text-align: center;"> 온라인PT-VOD </h3>
	  	</br>
  	</div>
  	
   	<c:if test="${contentCount > 1}">
   		<div class="container-vod">
   			<div style="width: 50%;">
		   		<div class="input-group mb-3">
					<input type="text" class="form-control" id="search-input" placeholder="검색어를 입력하세요" style="width: 60%;"/>
					<button class="btn btn-outline-secondary" id="search-btn" style="width: 15%;">
						검색
					</button>
				</div>
			</div>	
			<div class="row row-cols-2 row-cols-sm-1 row-cols-md-3 g-2">
			    <c:forEach items="${youtube}" var="youtubeDTO">
				    <div class="col">
					    <div class="card" style="width: 480;">
					     	<div class="text-center">${youtubeDTO.embedhtml}</div> 		    		
						    	<div class="card-body"> 	
									<p class="card-text">
										${youtubeDTO.title}
									</p>
									<p class="card-text">
										${youtubeDTO.channeltitle}
									</p>
									<p class="card-text">
										#${youtubeDTO.tag1} #${youtubeDTO.tag2} #${youtubeDTO.tag3}
									</p>	
					            </div>
				            </div>	    
					    </div>
			    </c:forEach>	  
		  	</div>
		  	
		  	<br/>
		  	<form action="/ddarawazoom/searchClass" method="post" onsubmit="return valueCheck()">	
				<div style="width: 50%; text-align: center; margin: auto 0;">
					<div class="input-group mb-3">
						<select class="form-select form-select-sm" id="search-category" name="category" style="width: 25%;">
							<option selected value="">선택하세요</option>
							<option value="title">영상 제목</option>
							<option value="channeltitle">채널 이름</option>
							<option value=""></option>
						</select>
					
						<input type="text" class="form-control" placeholder="검색어를 입력하세요" style="width: 60%;" id="search-input" name="input">
						<button class="btn btn-outline-secondary" type="submit" id="search-btn" style="width: 15%;">검색</button>
					 </div>
				</div>
			</form>
			
			<br/>
			<div id="page">
				<span>페이지</span>  
				<c:if test="${startPage > pageBlock}">
					<a href="/ddarawazoom/vod?pageNum=${startPage}-${pageBlock}"> [이전] </a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/ddarawazoom/vod?pageNum=${i}">${i}</a>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<a href="/ddarawazoom/vod?pageNum=${startPage}+${pageBlock}"> [다음] </a>
				</c:if>
			</div>
			<br/>
			
		</div>	
	</c:if>	
</div>

<%@ include file="../layout/footer.jsp"%>
