<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../layout/header.jsp"%> 
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- payment cancel -->
<script 
	src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous">
</script>

<script async type="text/javascript">	  
   $(document).ready(function(){
   	
   	//01. 결제 준비
	var IMP = window.IMP;
	IMP.init("imp37432029");  //가맹점 식별 코드

	//02. 결제 하기
	$('#payBtn').click(function() {	// 결제하기 버튼 클릭      

		var paymentData = new Object();	// json 데이터 생성
		paymentData.merchantUid = "${zoomContent.merchant_uid}"+"-ORD"+"${cnt}";
		paymentData.c_id = "${zoomContent.c_id}";
		paymentData.c_num = ${zoomContent.num};
		paymentData.name = "${zoomContent.title}";
		paymentData.amount = ${zoomContent.price};
		paymentData.buyer_name = "${userInfo.id}";
		paymentData.buyer_email = "${userInfo.email}";
		paymentData.buyer_tel = "${userInfo.tel}";
		console.log(paymentData);
		
		IMP.request_pay({		// iamport 결제 요청
			pg: "nice",						// pg사
	        pay_method: "card",				// 지불 수단
	        merchant_uid: paymentData.merchantUid,		// 제품 주문번호
	        name: "${zoomContent.title}",			// 강의명
	        amount: ${zoomContent.price},			// 강의(제품) 가격
	        buyer_name: "${userInfo.id}",	// 구매자 id
	        buyer_email: "${userInfo.email}",		// 구매자 email
	        buyer_tel: "${userInfo.tel}"			// 구매자 전화번호
	        },
        console.log("iamport 결제 요청"),

	        function (rsp) {	// 결제 callback
	        	console.log(rsp);
	            if (rsp.success) {	// 결제 성공 시 로직          		       	            		            	
	            	paymentData.impUid = rsp.imp_uid;		            	
	            	var msg = '결제 완료';
	            	$.ajax({
	                    type: "post",
	                    dataType: "json",
	                    contentType : "application/json; charset=UTF-8",
	            		data: JSON.stringify(paymentData),
	                    url: "/ddarawazoom/payPro", // data 보낼 주소		                    	                    	
	                    success: function(result){	// data 전송 성공 했을때                		                    	
	                    	console.log(result);
	                    	if(result == 1){
	                    		console.log("Payment All Success");
	        	            	msg += '(' + rsp.name +')';	        	            	
	                    	} else {
	                    		console.log("Payment Warn");
	                    	}
	                    	alert(msg);
	                    }
	                });	            	
	            } else {	            	
	                // 결제 실패 시 로직,
	                var msg = '결제 실패';
	                msg += '(' + rsp.error_msg +')';
				}	            
			}
        );
	});
	
	
	//03. 결제 취소 하기		
	$(".refundBtn").click(function (){	// 취소하기 or 잔여금액 취소하기 버튼 클릭
		$("#refundModal").modal('show');	// 모달창 호출
		
		var tdArr = new Array();			// 클릭한 행(row) 데이터
		var refundBtn = $(this);
		var tr = refundBtn.parent().parent();
		var td = tr.children();
		
		var cancelData = new Object();		// json 데이터 생성
		cancelData.merchantUid = td.eq(1).text();
		cancelData.cancelAmount = td.eq(3).text();		
		console.log(cancelData);

		$('#refundCheckBtn').click(function () {
			cancelData.cancelReason = $("#refundReason").val();
			cancelData.cancelpAmount = $("#partialAmount").val();
			
			var refund_type = $("input[name=refundType]:checked").val()	// 환불 타입 결정
			console.log(refund_type);			
			if(refund_type == "all"){		// 전액 환불
				cancelData.cancelReqAmount = cancelData.cancelAmount;
			} 
			if(refund_type == "partial") {	// 부분 환불								
				cancelData.cancelReqAmount = cancelData.cancelpAmount;
			}	
			console.log(cancelData.cancelReqAmount);
		
			$.ajax({
                type: "post",
                dataType: "json",
                contentType : "application/json; charset=UTF-8",
                data: JSON.stringify(cancelData),
                url: "/ddarawazoom/payRefund", // data 보낼 주소                	                    	
                success: function(result){	// data 전송 성공 했을때	                		                    	
                	console.log(result);
                	if(result == 1){
                		console.log("Payment Cancle All Success");
                		var msg = '결제 취소를 완료하였습니다.';	                		        	            	
                	} else if (result == -1) {
                		console.log("Alredy All Canclled");
                		var msg = '이미 전액 최소된 주문입니다.';
                	} else {
                		console.log("Payment Cancle Failed");
                		var msg = '결제 최소에 실패하였습니다. 전화 문의(1661-0808)';
                	}
                	alert(msg);
                	$('#refundModal').modal('hide');
                }
            });
		});
	});	
	
	
	//04. 취소 상세 내역 출력
	$(".refundDone").click(function (){
		var tdArr = new Array();			// 클릭한 행(row) 데이터
		var refundDone = $(this);
		var tr = refundDone.parent().parent();
		var td = tr.children();
		var imp_Uid = td.eq(0).text();
		var trIndex = tr.index()+1;
		
		$.ajax({
            type: "post",
    		data: {"imp_Uid":imp_Uid},
            url: "/ddarawazoom/cancel", // data 보낼 주소		                    	                    	
            success: function(cancelList){	// data 전송 성공 했을때                		                    	
            	console.log(cancelList);
            	var detail="";
            	$.each(cancelList, function(index, item) {
            		detail += item.cancelledAt + " ";
            		detail += item.cancelReason + "</br>";
            	});
            	$("tr:eq("+trIndex+") #c-detail").toggle();
            	$("tr:eq("+trIndex+") #c-detail").html(detail);      	           
            }
        });
	});
			
});
</script>

<section class="masthead">
	<div class="d-flex justify-content-center">
		<p>${ZoomDTO.num}번   |</p>
		<p>${ZoomDTO.title}   |</p>
		<p>${ZoomDTO.price}원   |</p>
		<button id="payBtn" >결제하기</button>		
		<label id="result"></label><br/>
	</div>
	
	<div class="table-responsive">
		<table id="paymentList" class="table table-striped table-sm">
			<thead>
	            <tr>
					<th scope="col">결제번호</th>
	              	<th scope="col">상품번호</th>
	              	<th scope="col">강의</th>
	              	<th scope="col">결제금액</th>
	              	<th scope="col">환불금액</th>
	              	<th scope="col">구매자</th>
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
		              	<td>
		              		${paymentDTO.buyerName}</br>
		              		${paymentDTO.buyerTel}</br>
		              		${paymentDTO.buyerEmail}</br>
		              	</td>
		              	<td>${paymentDTO.paidAt}</td>
		              	<td>		              		
		              		<c:if test="${paymentDTO.status == 'paid'}">		              				 	 
	               				<button class="btn btn-sm btn-success" disabled>결제완료</button></br>
		              			<button class="refundBtn btn btn-sm btn-secondary" data-toggle="modal" data-target="#refundModal">
	              					취소하기
	              				</button> 
              				</c:if>		              				
		              		<c:if test="${paymentDTO.status == 'cancelled'}">
		              			<button class="refundDone btn btn-sm btn btn-danger" id="">취소완료</button></br>		              				              			
		              			<div id="c-detail" style="display: none;"></div>
		              		</c:if>							
		              		<c:if test="${paymentDTO.amount - paymentDTO.cancelAmount > 0}">		              			
		              			<button class="refundBtn btn btn-sm btn-outline-dark" data-toggle="modal" data-target="#refundModal">
		              				잔여금액 취소하기          				
	              				</button>		              			
		              		</c:if>		              			              		
		              	</td>
            		</tr>
				</c:forEach>        
			</tbody>
		</table>
	</div>
	
</section>


<!-- Modal -->
<!-- 
<div class="modal fade" id="refundModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-6 shadow">
      <div class="modal-header border-bottom-0">
        <h5 class="modal-title">결제 취소</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body px-5 py-2">
      	<div class="form-floating mb-2">
	        <input type="text" class="form-control rounded-4" id="refundReason" placeholder="환불 사유가 무엇인가요?">
	        <label for="refundReason" >환불 사유가 무엇인가요?</label>
        </div>
      </div>
      
      <div class="d-flex gap-5 justify-content-center">
  		<div class="list-group mx-0">
  			<label class="list-group-item d-flex gap-2">
      			<input class="form-check-input flex-shrink-0" type="radio" name="refundType" id="refundAll" value="all" checked>     			
      			<span>
       				전액 환물
				</span>
    		</label>
    		<label class="list-group-item d-flex gap-2">
      			<input class="form-check-input flex-shrink-0" type="radio" name="refundType" id="refundPartial" value="partial">
      			<span>
       				일부 환불 <input type="number" name="partailAmount" id="partialAmount" value=""></input>
      			</span>
    		</label> 	
		</div>
      </div>
      
      <div class="modal-footer flex-column border-top-0">
        <button type="button" class="btn btn-lg btn-primary w-100 mx-0 mb-2" id="refundCheckBtn">Save changes</button>
        <button type="button" class="btn btn-lg btn-light w-100 mx-0" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> -->
