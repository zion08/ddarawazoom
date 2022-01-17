<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="/ddarawazoom/imgUpdatePro" method="post" enctype="multipart/form-data">   
	<input type="hidden" name="num" value="${num}"> <br />
	<input type="hidden" name="intro" value="${intro}"> <br />
	<input type="file" name="save" > <br />
    <input type="submit" value="전송" /> 
</form>