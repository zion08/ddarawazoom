<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../layout/header.jsp"%>

<section class="masthead">
	<h1 class="text-center">Zoom강의 리스트 출력</h1>
<table align="center">
	<tr>
		<td>글번호</td>
		<td>수업이름</td>
		<td>수업소개</td>
		<td>운동종류</td>
		<td>운동목적</td>
		<td>운동기구</td>
		<td>운동횟수</td>
		<td>가격</td>
		<td>사진</td>
		<td>조회수</td>
	</tr>
<c:forEach var="ZoomDTO" items="${list}">
	<tr>
		<td>${ZoomDTO.num}</td>
		<td>
			<a href="/ddarawazoom/zclasscontent?num=${ZoomDTO.num}">
				${ZoomDTO.title} 
			</a>
		</td>
		<td>${ZoomDTO.intro}</td> 
		<td>${ZoomDTO.type}</td> 
		<td>${ZoomDTO.goal}</td> 
		<td>${ZoomDTO.tool}</td> 
		<td>${ZoomDTO.frequency}</td> 
		<td>${ZoomDTO.price}</td> 
		<td>${ZoomDTO.img}</td> 
		<td>${ZoomDTO.count}</td> 
	</tr>
</c:forEach>
</table>
</section>

<%@ include file="../../layout/footer.jsp"%>

