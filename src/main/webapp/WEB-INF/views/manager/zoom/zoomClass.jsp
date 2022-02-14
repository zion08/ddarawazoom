<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>zoom 강의관리 페이지</title>
	<script src="../../resources/js/manager/zoom.js" type="text/javascript" ></script>
	<link href="../../resources/css/manager/zoom.css" rel="stylesheet">
</head>

<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-md-auto">
    <h3 style="text-align: center;"> zoom 강의관리 페이지 </h3><br>
    
    <c:if test="${count > 0}">
      <table name="zoomclass" class="table">
		  <thead align="center">
		  	<tr><th colspan="6">total : ${count}</th></tr>
		    <tr>
		      <th scope="col">글번호</th>
		      <th scope="col">강의명</th>
		      <th scope="col">강사명</th>
		      <th scope="col">조회수</th>
		      <th scope="col">인기강의</th>
		      <th scope="col">관리</th>
		    </tr>
		  </thead>
			<c:forEach var="zoomList" items="${zoomList}">	  
				  <tbody align="center">
				    <tr>
				      <th scope="row">${zoomList.num}</th>		 
				      <td id="title">
				      	<a href="/ddarawazoom/zclasscontent?num=${zoomList.num}">${zoomList.title}</a>
				      </td>		      	     		   
				      <td>${zoomList.c_id}</td>
				      <td>${zoomList.count}</td>
				      <td>
				      	<c:if test="${zoomList.count >= 50}">
					      <span class="hit">hit!!</span>
					    </c:if>
				      </td>
				      <td>
				      	<input type="button" value="삭제" onclick="zoomClassDelete(${zoomList.num})">
				      </td>
				    </tr>
				  </tbody>  
			</c:forEach>	  
		</table>
	</c:if>
	
	<form align="center" action="/manager/zoomSearchClass" method="post">
		<select name="sort">
			<option value="c_id">코치명</option>
			<option value="title">강의명</option>
		</select>
		<input type="text" name="search">
		<input type="submit" value="검색">
	</form>
	
	<c:if test="${count > 1}">
		<div id="page">페이지&nbsp;  
			<c:if test="${startPage > 10}">
				<a href="/manager/zoom?pageNum=${startPage - 10}"> [이전] </a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/manager/zoom?pageNum=${i}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="/manager/zoom?pageNum=${startPage + 10}"> [다음] </a>
			</c:if>
		</div>
	</c:if>	
	 	
    </div>
  </div>
</div>
</html>

<%@ include file="../../layout/footer.jsp"%> 