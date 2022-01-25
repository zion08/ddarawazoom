<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../layout/header.jsp"%>
<%@ include file="../../pay/cancel.jsp"%>

<script src="/resources/coach/custom/js/coach-info.js" type="text/javascript"></script>

<section class="masthead">
	<%-- <div class="col-md-9 m-sm-auto col-lg-10 px-md-4 fs-7">
		<p class="text-end m-sm-0">(+) 총 거래액: ${amount}</p>
		<p class="text-end m-sm-0">(-) 총 환불액: ${cancelAmount}</p>
		<p class="text-end m-sm-0">(=) 총 매출액: ${sales}</p>
	</div> --%>
	<div class="table-responsive col-md-9 m-sm-auto col-lg-10 px-md-4" >
		<table id="paymentList" class="table table-striped table-sm table-hover">
			<thead>
	            <tr>
	              	<th scope="col">결제번호</th>
	              	<th scope="col">주문번호</th>
	              	<th scope="col">강의</th>
	              	<th scope="col">결제금액</th>
	              	<th scope="col">환불금액</th>
	              	<th scope="col">결제시각</th>
	              	<th scope="col">상태</th>
	            </tr>
			</thead>
			<tbody>
				<c:forEach items="${payment}" var="paymentDTO">
            		<tr>
            			<td>${paymentDTO.impUid}</td>
		              	<td>${paymentDTO.merchantUid}</td>
		              	<td>
		              		${paymentDTO.c_num}) ${paymentDTO.name}</br>
		              		${paymentDTO.c_id}</br>		              		
		              	</td>
		              	<td>${paymentDTO.amount}</td>
		              	<td>${paymentDTO.cancelAmount}</td>
		              	<td>${paymentDTO.paidAt}</td>
		              	<td>	              		
		              		<c:if test="${paymentDTO.status == 'paid'}">		              				 	 
	               				<button class="btn btn-sm btn-success" disabled>결제완료</button></br>
		              			<button class="refundReqBtn btn btn-sm btn-outline-dark" data-toggle="modal" data-target="#refundModal">
	              					취소 요청하기
	              				</button> 
              				</c:if>
              				<c:if test="${paymentDTO.status == 'creq'}">		              				 	 
	               				<button class="refundReqInfo btn btn-sm btn-secondary" >취소요청중</button></br>
	               				<div id="c-req-detail" style="display: none;"></div>
              				</c:if>			              				
		              		<c:if test="${paymentDTO.status == 'cancelled'}">
		              			<button class="refundDone btn btn-sm btn btn-danger" id="">취소완료</button></br>		              				              			
		              			<div id="c-detail" style="display: none;"></div>
		              		</c:if>								              			              		
		              	</td>
            		</tr>
				</c:forEach>        
			</tbody>
		</table>
	</div>
</section>


<%@ include file="../../layout/footer.jsp"%>