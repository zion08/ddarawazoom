<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/coach/custom/js/review.js" type="text/javascript"></script>	
<link href="/resources/coach/custom/css/carousel.css" rel="stylesheet" />

<%@ include file="../../layout/header.jsp"%>   
      
<div class="container marketing">

  <!-- 해당 수업 간략하게 표시 -->
  <div class="row">
    <div class="col-lg-12">
      <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
		
      <h2>${classContent.title}</h2>
	  <p>${classContent.intro}</p>
	</div><!-- /.col-lg-4 -->
  </div><!-- /.row -->
		
  <!-- 리뷰 시작 -->
  <c:if test="${count == 0}">
  	  <hr class="featurette-divider">
		
	  <div class="row featurette">
	    <div class="col-md-12">
	      <h2 class="featurette-heading" style="text-align: center;">아직 등록한 회원이 없습니다.</h2>
	    </div>
	  </div>
  </c:if>
  
  <hr class="featurette-divider">
  
  <c:if test="${count > 0}">
  
	  <div class="row featurette">
	    <div class="col-md-12">
	    
	      <table class="table table-bordered">
  		    <thead>
		      <tr>
		        <th scope="col"></th>
		        <th scope="col" style="width: 80%;">등록한 회원 목록</th>
		        <th scope="col" style="width: 10%;"></th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach var="member" items="${member}">
		        <tr>
		          <th scope="row">회원 ID</th>
		          <td>${member.id}</td>
		          <td style="text-align: center;">
		          	 <button type="button" class="btn btn-sm btn-outline-secondary"
	                	onclick="window.location='/myroom/info?id=${member.id}'">회원 정보</button>
		          </td>
		        </tr>
		      </c:forEach>
  		    </tbody>
		  </table>
	    </div>
	  </div>
	  
  </c:if>
  	     
</div>

    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="/resources/coach/custom/js/dashboard.js"></script>


<%@ include file="../../layout/footer.jsp"%>