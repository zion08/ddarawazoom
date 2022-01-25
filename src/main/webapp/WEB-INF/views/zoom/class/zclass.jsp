<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../layout/header.jsp"%>

<div class="container-fluid">
	<div class="album py-2 bg-light"><br>
    	<h2 style="text-align: center;"> 따라와 줌 </h2>
    	<h3 style="text-align: center;"> 온라인PT 
    	<c:if test="${sessionScope.id == null && sessionScope.c_id != null}">
			<div style="text-align: right; margin-right: 20px;">
				<input type="button" value="강의등록" class="btn btn-outline-primary" onclick="window.location='/ddarawazoom/zwriteForm'">
			</div>  
		</c:if>
		</h3><br>
	    <div class="container">
		<div class="row row-cols-2 row-cols-sm-1 row-cols-md-3 g-2"> 
	 
		<c:if test="${contentCount == 0}" >
		<div class="container-fluid">
			<div align="center">
		   		<h5>수업이 없습니다.</h5>
		   		<h5>강의등록 버튼을 눌러 수업을 추가해주세요!</h5>  
		    </div>
		</div>   
		</c:if>
				
		<c:if test="${contentCount > 0}">	
			<c:forEach var="zoomList" items="${list}">
			<div class="col">
				<div class="card shadow-sm">
		        	<img src="/resources/coach/img/${zoomList.img}" class="card-img-top" width="100" height="225">       
	         	<div class="card-body"> 	
					<p class="card-text">No.${number} 
						<c:set var="number" value="${number - 1}"/>
						조회수${zoomList.count} 
					</p>
					<p class="card-text">
						${zoomList.c_id} 강사님
					</p>
					<p class="card-text">
						<a href="/ddarawazoom/zoomReadcount?num=${zoomList.num}">${zoomList.title}</a>
					</p>
					<p class="card-text">
						가격 : ${zoomList.price}원  
					</p>	
				<div class="d-flex justify-content-between align-items-center">
	            <div class="btn-group"> &nbsp;&nbsp;&nbsp;&nbsp; 
	              	<button type="button" class="btn btn-sm btn btn-danger" disabled>${zoomList.type}</button>&nbsp;&nbsp; 	 	 
	             	<button type="button" class="btn btn-sm btn btn-success" disabled>${zoomList.goal}</button>&nbsp;&nbsp;
	             	<button type="button" class="btn btn-sm btn btn-warning" disabled>${zoomList.tool}</button>&nbsp;&nbsp;
	             	<button type="button" class="btn btn-sm btn btn-primary" disabled>${zoomList.frequency}</button> 
	            </div>	          
		        </div>
	            </div>
	        	</div>
	       </div>
		   </c:forEach> 
		</c:if>
		
		</div><br /> 
	
		<c:if test="${totalPage > 1}">
			<div id="page">페이지&nbsp;  
				<c:if test="${startPage > 10}">
					<a href="/ddarawazoom/zoom?pageNum=${startPage - 10}"> [이전] </a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/ddarawazoom/zoom?pageNum=${i}">${i}</a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a href="/ddarawazoom/zoom?pageNum=${startPage + 10}"> [다음] </a>
				</c:if>
			</div>
		</c:if>
				
	 	</div>
	</div>	 
</div>  
	
<%@ include file="../../layout/footer.jsp"%> 
