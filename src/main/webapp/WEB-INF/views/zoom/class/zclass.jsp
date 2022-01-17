<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../layout/header.jsp"%>

<section class="masthead">
	
<table align="center">
<c:if test="${contentCount > 0}">	
	<tr>
		<td>글번호</td>
		<td>강사명</td>
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
		<td>
			${number}
			<c:set var="number" value="${number - 1}"/>
		</td>
		<td>${ZoomDTO.c_id}</td>
		<td>
			<a href="/ddarawazoom/zoomReadcount?num=${ZoomDTO.num}">${ZoomDTO.title}</a>
		</td>
		<td>${ZoomDTO.intro}</td> 
		<td>${ZoomDTO.type}</td> 
		<td>${ZoomDTO.goal}</td> 
		<td>${ZoomDTO.tool}</td> 
		<td>${ZoomDTO.frequency}</td> 
		<td>${ZoomDTO.price}</td> 
		<td><img src="/resources/coach/img/${ZoomDTO.img}" width="100" /></td> 
		<td>${ZoomDTO.count}</td> 
	</tr>
</c:forEach>
</c:if>
	<tr>
		<td>
			<div id="page">
				<c:if test="${startPage > pageBlock}">
					<a href="/ddarawazoom/zoom?pageNum=${startPage}-${pageBlock}"> [이전] </a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/ddarawazoom/zoom?pageNum=${i}">${i}</a>
				</c:forEach>
				
				<c:if test="${endPage < totalPage}">
					<a href="/ddarawazoom/zoom?pageNum=${startPage}+${pageBlock}"> [다음] </a>
				</c:if>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="글쓰기" onclick="window.location='/ddarawazoom/zwriteForm'">
		</td>
	</tr>
</table>
</section>

<%@ include file="../../layout/footer.jsp"%>
