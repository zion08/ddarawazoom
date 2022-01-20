<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ include file="../../layout/header.jsp"%>    

<script src ="resources/js/like/like.js" type="text/javascript"></script>

<table align="center">
	<tr>
		<td>글번호 ${ZoomDTO.num}</td>
		<td>강사명 ${ZoomDTO.c_id}</td>
		<td>조회수 ${ZoomDTO.count}</td> 
	</tr>
	<tr>
		<td>
			소개사진 <img src="/resources/coach/img/${ZoomDTO.img}" width="100" > 
			<input type="button" value="사진변경" onclick="window.location='/ddarawazoom/imgUpdate?img=${ZoomDTO.img}&num=${ZoomDTO.num}'" />    
		</td>
	</tr>
	<tr>
		<td>수업이름 ${ZoomDTO.title}</td> 
	</tr>
	<tr>
		<td><%-- zoom 수업 출력되는 칸 --%></td>
	</tr>
	<%-- 관리자만 수정, 삭제 나중에 처리 --%>
	<tr>
		<td>
			<input type="button" value="글수정" onclick="document.location.href='/ddarawazoom/zupdateForm?num=${ZoomDTO.num}'">
			<input type="button" value="글삭제" onclick="document.location.href='/ddarawazoom/zdeleteForm?num=${ZoomDTO.num}'"> 
			
			<input type="button" value="글목록" onclick="document.location.href='/ddarawazoom/zoom'">
		</td>
	</tr>
	<tr>
		<td>
			<c:if test="${result == true}">
				<a href="/myroom/likeZoom_out?zoom_num=${ZoomDTO.num}&pageNum=${pageNum}">
					<img src="/resources/image/like/heart_fill.png" width="30px" height="30px" onclick="zoomLikeWrite()"><br/>
				</a>
			</c:if>
			<c:if test="${result != true}">
				<a href="/myroom/likeZoom_in?zoom_num=${ZoomDTO.num}&pageNum=${pageNum}">
					<img src="/resources/image/like/heart_empty.png" width="30px" height="30px" onclick="zoomLikeDelete(${ZoomDTO.num})"><br/>
				</a>
			</c:if>
			<input type="button" value="장바구니 담기">
			<input type="button" value="바로 결제하기">
		</td>
	</tr>
</table>

<br />

<form action="re_writePro" method="post">
	<table align="center">
		<tr><td>회원후기작성</td></tr>
		<tr>
			<td>
				글번호 : <input type="hidden" name="class_num" value="${ZoomDTO.num}">${ZoomDTO.num}<br />
				아이디 : <input type="text" name="id"><br />
				닉네임 : <input type="text" name="nick"><br />
				제목 : <input type="hidden" name="title" value="${ZoomDTO.title}">${ZoomDTO.title}<br />
				내용 : <input type="text" name="content"><br/> 
				평점 : <input type="text" name="grade"><br/> 
				
					<input type="submit" value="작성하기">	
			</td>
		</tr>
	</table>
</form>

<br />

<table align="center">
	<c:if test="${contentCount > 0}">
		<tr>
			<td>글번호</td>
			<td>아이디</td>
			<td>닉네임</td>
			<td>제목</td>
			<td>내용</td>
			<td>평점</td>
		</tr>
	<c:forEach var="ReviewDTO" items="${reList}">
		<tr>
			<td>
				${number}
				<c:set var="number" value="${number - 1}"/>
			</td>
			<td>${ReviewDTO.id}</td>
			<td>${ReviewDTO.nick}</td>
			<td>${ReviewDTO.title}</td>
			<td>${ReviewDTO.content}</td>
			<td>${ReviewDTO.grade}</td> 
		</tr>
	</c:forEach>
	</c:if>  
	
	<tr>
		<td>
			<div id="page">
				<c:if test="${startPage > pageBlock}">
					<a href="/ddarawazoom/zclasscontent?num=${ZoomDTO.num}&pageNum=${startPage}-${pageBlock}"> [이전] </a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/ddarawazoom/zclasscontent?num=${ZoomDTO.num}&pageNum=${i}">${i}</a>
				</c:forEach>
				
				<c:if test="${endPage < totalPage}">
					<a href="/ddarawazoom/zclasscontent?num=${ZoomDTO.num}&pageNum=${startPage}+${pageBlock}"> [다음] </a>
				</c:if>
			</div>
		</td>
	</tr> 
</table>

<br />

<%@ include file="../../layout/footer.jsp"%>  
