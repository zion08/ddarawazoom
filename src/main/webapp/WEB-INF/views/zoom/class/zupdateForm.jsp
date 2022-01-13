<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>    

<form action="/ddarawazoom/zupdatePro" method="post" enctype="multipart/form-data">
	<%-- 작성자 : 관리자만 --%>
			 <input type="hidden" name="num" value="${ZoomDTO.num}">
	수업 이름 : <input type="text" name="title" value="${ZoomDTO.title}"><br />
	수업 소개 : <input type="text" name="intro" value="${ZoomDTO.intro}"><br /> 
	운동 종류 : <select name="type">
				<option value="여성웨이트">여성웨이트</option>
				<option value="필라테스">필라테스</option>
				<option value="요가">요가</option>
				<option value="피트니스">피트니스</option>
				<option value="발레">발레</option>
				<option value="재활">재활</option>
			</select> <br /> 	 			
	운동 목적 : <select name="goal">
				<option value="전신">전신</option>
				<option value="코어">코어</option>
				<option value="상체">상체</option>
				<option value="하체">하체</option>
				<option value="재활">재활</option>
				<option value="근력">근력</option>
				<option value="심신안정">심신안정</option>
				<option value="스트레칭">스트레칭</option>
			</select><br />  
	운동 기구 : <input type="text" name="tool" value="${ZoomDTO.tool}"><br />
	운동 횟수 : <input type="text" name="frequency" value="${ZoomDTO.frequency}"><br />
	가격 : <input type="text" name="price" value="${ZoomDTO.price}"><br />
	<%-- 
	사진 : <input type="file" name="img"><br />
	--%>
	<input type="reset" value="초기화" />
	<input type="submit" value="수정" />
	<input type="button" value="글목록" onclick="document.location.href='/ddarawazoom/zoom'">
</form>

<%@ include file="../../layout/footer.jsp"%>