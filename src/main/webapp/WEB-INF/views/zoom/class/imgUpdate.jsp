<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%> 

	<br />
	<h4 align="center">No.${num}번의 사진을  정말 변경하시겠습니까?</h4> 
	
	<form name="imgUpdate" action="/ddarawazoom/imgUpdatePro" method="post" enctype="multipart/form-data" align="center">  
		<input type="hidden" name="num" value="${num}"> <br />
		<input type="hidden" name="intro" value="${intro}"> <br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="file" name="save"/><br /><br />  
	    <input type="submit" value="변경하기"/> 
	</form>
	
<%@ include file="../../layout/footer.jsp"%> 