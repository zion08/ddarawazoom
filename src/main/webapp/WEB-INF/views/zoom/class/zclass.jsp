<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../layout/header.jsp"%>

<div class="container-fluid">
	<div class="album py-2 bg-light"><br>
    	<h2 style="text-align: center;"> 따라와 줌 </h2>
    	<h3 style="text-align: center;"> 온라인PT </h3><br>
    <div class="container">
	<div class="row row-cols-2 row-cols-sm-1 row-cols-md-3 g-2"> 
 
	<c:if test="${contentCount == 0}" >
	    <h5 align="center">수업이 없습니다.</h5> 
	    <h5 align="center">강의등록 버튼을 눌러 수업을 추가해주세요!</h5>  
	</c:if>
			
	<c:if test="${contentCount > 0}">	
		<c:forEach var="ZoomDTO" items="${list}">
		<div class="col">
			<div class="card shadow-sm">
	        	<img src="/resources/coach/img/${ZoomDTO.img}" class="card-img-top" width="100" height="225">       
         	<div class="card-body"> 	
				<p class="card-text">No.${number} 
					<c:set var="number" value="${number - 1}"/>
					조회수${ZoomDTO.count} 
				</p>
				<p class="card-text">
					${ZoomDTO.c_id} 강사님
				</p>
				<p class="card-text">
					<a href="/ddarawazoom/zoomReadcount?num=${ZoomDTO.num}">${ZoomDTO.title}</a>
				</p>
				<p class="card-text">
					가격 : ${ZoomDTO.price}원 
				</p>	
			<div class="d-flex justify-content-between align-items-center">
            <div class="btn-group"> &nbsp;&nbsp;&nbsp;&nbsp; 
              	<button type="button" class="btn btn-sm btn btn-danger" disabled>${ZoomDTO.type}</button>&nbsp;&nbsp; 	 	 
             	<button type="button" class="btn btn-sm btn btn-success" disabled>${ZoomDTO.goal}</button>&nbsp;&nbsp;
             	<button type="button" class="btn btn-sm btn btn-warning" disabled>${ZoomDTO.tool}</button>&nbsp;&nbsp;
             	<button type="button" class="btn btn-sm btn btn-primary" disabled>${ZoomDTO.frequency}</button> 
            </div>	          
	        </div>
            </div>
        	</div>
       </div>
	   </c:forEach> 
	</c:if>
	
	</div><br /> 
	
	<c:if test="${id == null && c_id != null}">
		<div>
			<input type="button" value="강의등록" class="btn btn-outline-primary" onclick="window.location='/ddarawazoom/zwriteForm'">
		</div>  
	</c:if> <br />

		<div id="page">페이지&nbsp;  
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
				
 	</div>
	</div>	 
</div>  
	
<%@ include file="../../layout/footer.jsp"%> 
