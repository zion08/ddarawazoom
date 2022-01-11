<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>   

<form action="/ddarawazoom/zdeletePro?num=${num}" method="post">
	<input type="submit" value="삭제하기">
	<input type="button" value="글목록" onclick="document.location.href='/ddarawazoom/zoom'">
</form>

<%@ include file="../../layout/footer.jsp"%> 