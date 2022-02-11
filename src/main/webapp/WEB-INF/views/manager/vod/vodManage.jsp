<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%> 
  
<script type="text/javascript">
$(document).ready(function(){

	$('#SearchBtn').click(function() {
		$.ajax({
            type: "post",
    		data: {
    			"qurey":$('#qurey').val(), 
    			"maxResults":$('#maxResults').val()
    			},
            url: "/manager/searchVod", // data 보낼 주소		                    	                    	
            success: function(videoIdList){	// data 전송 성공 했을때                		                    	
            	var code=""
            	$.each(videoIdList, function( index, value ) {
                    code += videoIdList[index]+" / ";
            		console.log( videoIdList[index] ); 
                 });

            	$("#code").html(code);
            }
        });
	});
	
	$('#InputBtn').click(function() {
		$.ajax({
            type: "post",
    		data: {"videoId":$('#videoId').val()},
            url: "/manager/insertVod", // data 보낼 주소		                    	                    	
            success: function(result){	// data 전송 성공 했을때                		                    	
            	console.log(result);

            }
        });
	});


			
});
</script>      

<div class="container marketing">
	<h2 style="text-align: center;"> Vod 관리 </h2>
	<hr class="featurette-divider">
	<div class="container">
  		<div class="row">
			<div class="form-floating col">
		   		<input type="text" id="qurey" class="form-control" placeholder="qurey"/>
		   		<label for="qurey">키워드</label>
			</div>
			<div class="form-floating col-md-auto">
				<input type="number" id="maxResults" class="form-control vw-10" placeholder="maxResults">
	    		<label for="maxResults">검색 갯수</label>
	    	</div>
	    	<div class="form-floating col-md-auto">
				<input type="button" id="SearchBtn" class="w-100 btn btn-lg btn-secondary mb-3" value="코드검색"/>
			</div>
			<div class="form-floating col">
		   		<input type="text" id="videoId" class="form-control" placeholder="videoId"/>
		   		<label for="videoId">동영상코드</label>
			</div>
			<div class="form-floating col-md-auto">
				<input type="button" id="InputBtn" class="w-100 btn btn-lg btn-primary mb-3" value="코드입력"/>
			</div>
		</div>
	</div>
	
	<div class="container" id="code">

	</div>
  	

</div>


<%@ include file="../../layout/footer.jsp"%>