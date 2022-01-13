<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>    

<table align="center">
	<tr>
		<td>글번호 ${ZoomDTO.num}</td>
		<td>조회수 ${ZoomDTO.count}</td>
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
			<input type="button" value="글수정" onclick="document.location.href='/ddarawazoom/zupdateForm?num=${ZoomDTO.num}&title=${ZoomDTO.title}&intro=${ZoomDTO.intro}&type=${ZoomDTO.type}&goal=${ZoomDTO.goal}&tool=${ZoomDTO.tool}&frequency=${ZoomDTO.frequency}&price=${ZoomDTO.price}'">
			<input type="button" value="글삭제" onclick="document.location.href='/ddarawazoom/zdeleteForm?num=${ZoomDTO.num}'">
			
			<input type="button" value="글목록" onclick="document.location.href='/ddarawazoom/zoom'">
		</td>
	</tr>
</table>

<%@ include file="../../layout/footer.jsp"%> 
	 	