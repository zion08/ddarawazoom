<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%> 

	<br />
	<h4 align="center">No.${num}번의 사진을  정말 변경하시겠습니까?</h4> 
	
	<form name="imgUpdate" action="/ddarawazoom/imgUpdatePro" method="post" enctype="multipart/form-data" align="center">  
		<input type="hidden" name="num" value="${num}"> <br />
		<input type="hidden" name="intro" value="${intro}">
		
		<div class="mb-3" style="width: 60%; margin:0 auto;">
			 <label for="formFile" class="form-label">사진 변경</label>
			 <input class="form-control" type="file" id="formFile" required>
			 <div class="invalid-feedback">
		     	사진을 선택해주세요.
		     </div>
		     
		     <hr class="my-4">
		     
		     <button class="btn btn-primary" type="submit">
		     	업로드
		     </button>
		</div>
		 
	</form>
	
<%@ include file="../../layout/footer.jsp"%> 