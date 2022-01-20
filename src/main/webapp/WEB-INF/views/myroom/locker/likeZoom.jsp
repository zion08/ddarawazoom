<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
	<head>
		<title>likeZoom 페이지</title>
	</head>
	<body>
			
		<table class="table" id="lockerList">
			<thead>
				<tr>
					<th>
						번 호
					</th>
					<th>
						사 진
					</th>
					<th>
						코치 명
					</th>
					<th>
						강의 명
					</th>
					<th>
						강의 소개
					</th>
					<th>
						강의 종류
					</th>
					<th>
						운동 목적
					</th>
					<th>
						운동 기구
					</th>
					<th>
						운동 횟수
					</th>
					<th>
						가 격
					</th>
				</tr>
			</thead>
			<c:forEach var="ZoomDTO" items="${ZoomDTO}" >
				<tbody>
					<tr>
						<td>
							${ZoomDTO.num}
							<input type="hidden" name="num" value="${ZoomDTO.num}"/>
							
						</td>
						<td>
							<img src="/resources/coach/img/${ZoomDTO.img}" width="100" >
						</td>
						<td>
							${ZoomDTO.c_id}
						</td>
						<td>
							<a href="/ddarawazoom/zoomReadcount?num=${ZoomDTO.num}">${ZoomDTO.title}</a>
						</td>
						<td>
							${ZoomDTO.intro}
						</td>
						<td>
							${ZoomDTO.type}
						</td>
						<td>
							${ZoomDTO.goal}
						</td>
						<td>
							${ZoomDTO.tool}
						</td>
						<td>
							${ZoomDTO.frequency}
						</td>
						<td>
							${ZoomDTO.price}
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</body>
</html>

<%@ include file="../../layout/footer.jsp"%>