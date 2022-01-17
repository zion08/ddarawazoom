<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script type="text/javascript">
	

	//01. 결제 준비
	var IMP = window.IMP;
	IMP.init("imp37432029");  //가맹점 식별 코드 (syoul)
	/* IMP.init("nictest00m"); */ //가맹점 식별 코드 (khyeonj8)
	 
	//02. 결제 요청 하기
	function requestPay() {	// IMP.request_pay(param, callback) 결제창 호출      
		var merchant_uid = "ddz"+${ZoomDTO.num}+"ab";
		console.log(merchant_uid);
		IMP.request_pay({		// parameter 설정 and 결제 완료 후 함수
			pg: "nice",						// pg사
	        pay_method: "card",				// 지불 수단
	        merchant_uid: merchant_uid,		// 제품 고유 번호 (강의 번호)
	        name: "${ZoomDTO.title}",
	        amount: ${ZoomDTO.price},		// 강의 가격
	        /* buyer_name: 
	        buyer_email: */
	        buyer_tel: "010-4242-4242"}, 
          
			function (rsp) { 	// callback
	        	if (rsp.success) {	        		
	        		console.log(rsp);
	        		console.log(rsp.imp_uid);
	        		console.log(rsp.merchant_uid);
	        		// 결제 성공 시 로직
	                // jQuery로 HTTP 요청
       			 	jQuery.ajax({
           			url: "/ddarawazoom/payPro", 
            		method: "POST",
            		headers: { "Content-Type": "application/json" },
            		data: {
                		imp_uid: rsp.imp_uid,
                		merchant_uid: rsp.merchant_uid
            			}
        			}).done(function (data) {
          				// 가맹점 서버 결제 API 성공시 로직
          				check = parseInt(data);	//문자>숫자 변경
          				if(check==1){
    						$("#result").html("성공");
    					}
        			})
	                
	            } else {
	            	// 결제 실패 시 로직,
	            	console.log(rsp);
	            }
	        
		});
	}
</script>

<section class="masthead">
	<div class="d-flex justify-content-center">
		<p>${ZoomDTO.num}번   |</p>
		<p>${ZoomDTO.title}   |</p>
		<p>${ZoomDTO.price}원   |</p>
		<button onclick="requestPay()">결제하기</button>
	</div>
</section>

<%@ include file="../../layout/footer.jsp"%>