<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<div class="container-fluid">

    <main class="col-md-9 m-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">매출 그래프</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button>
        </div>
      </div>

      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

      <h2>최신 리뷰</h2>
      <div class="table-responsive">
      	<c:if test="${reviewList == null}">
      		<hr class="featurette-divider">
		
		   <div class="featurette">
		     <div class="col-md-12">
		       <h2 class="featurette-heading" style="text-align: center;">아직 작성된 리뷰가 없습니다.</h2>
	 	     </div>
		   </div>
      	</c:if>
      	
      	<c:if test="${reviewList != null}"> 
      		
	        <table class="table table-striped table-sm table-bordered">
	          <thead>
	            <tr>
	              <th scope="col" style="width: 30%">강의 제목</th>
	              <th scope="col" style="width: 15%">회원 닉네임</th>
	              <th scope="col">후기</th>
	            </tr>
	          </thead>
	          <tbody>
	          
	          <c:forEach var="list" items="${reviewList}">
	            <tr>
	              <td>${list.title}</td>
	              <td>${list.nick}</td>
	              <td>${list.content}</td>
	            </tr>
	          </c:forEach>
	          
	          </tbody>
	        </table>
        
        </c:if>
        
      </div>
    </main>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>

<script>
	/* globals Chart:false, feather:false */

	$(document).ready(function(){
	  'use strict'
	  
	  var amountData = new Array();
	  var payData = new Array();
	  
	  $.ajax({
		url : "/coachroom/getPayment",
		type : "post",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			console.log(data);
	
			for(var key in data){
				console.log(key);
				payData.push(key);
				
				console.log(data[key]);
				amountData.push(data[key]);
			}
			console.log(payData);
			console.log(amountData);
		}
	  });
	  
	  feather.replace({ 'aria-hidden': 'true' })
	
	  // Graphs
	  var ctx = document.getElementById('myChart')
	  // eslint-disable-next-line no-unused-vars
	  var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: payData,
	      datasets: [{
	        data: amountData,
	        lineTension: 0,
	        backgroundColor: 'transparent',
	        borderColor: '#007bff',
	        borderWidth: 4,
	        pointBackgroundColor: '#007bff'
	      }]
	    },
	    options: {
	      scales: {
	        yAxes: [{
	          ticks: {
	            beginAtZero: false
	          }
	        }]
	      },
	      legend: {
	        display: false
	      }
	    }
	  })
	})

</script>

<%@ include file="../layout/footer.jsp"%>