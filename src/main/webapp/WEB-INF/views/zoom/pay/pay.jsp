<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ include file="../../layout/iamport.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">	
   
    $(document).ready(function(){
    	//01. 결제 준비
		var IMP = window.IMP;
		IMP.init("imp37432029");  //가맹점 식별 코드
		
		var date = new Date();
	    var year = date.getFullYear().toString();
	    var month = date.getMonth() + 1;
	    month = month < 10 ? '0' + month.toString() : month.toString();
	    var day = date.getDate();
	    day = day < 10 ? '0' + day.toString() : day.toString();
	    var hour = date.getHours();
	    hour = hour < 10 ? '0' + hour.toString() : hour.toString();
	    var minites = date.getMinutes();
	    minites = minites < 10 ? '0' + minites.toString() : minites.toString();
	    var seconds = date.getSeconds();
	    seconds = seconds < 10 ? '0' + seconds.toString() : seconds.toString();

	    var paystart = year + month + day + hour + minites + seconds;
	    
		//02. 결제 하기
		$('#payBtn').click(function() {	// IMP.request_pay(param, callback) 결제창 호출      
			var merchant_uid = "ddz"+${ZoomDTO.num}+"C"+paystart;
			console.log(merchant_uid);
			
			IMP.request_pay({		// parameter 설정 and 결제 완료 후 함수
				pg: "nice",						// pg사
		        pay_method: "card",				// 지불 수단
		        merchant_uid: merchant_uid,		// 제품 고유 번호 (강의 번호)
		        name: "testtest",
		        amount: 1000,					// 강의(제품) 가격
		        buyer_name: "buyer_id",			// 구매자 id
		        buyer_email: "test@test.com",	// 구매자 email
		        buyer_tel: "010-4242-4242"		// 구매자 전화번호
		        }, 
	          
		        function (rsp) { // callback
		            if (rsp.success) {	            		       	            		            	
		            	// 결제 성공 시 로직
		            	console.log(rsp);
		            	var msg = '결제 완료';
		            	$.ajax({
		                    type: "post", 
		                    url: "/ddarawazoom/payPro", // data 보낼 주소
		                    data: {
		                    	"imp_uid": rsp.imp_uid,
								"merchant_uid": rsp.merchant_uid
								},	                    	
		                    success: function(result){	// data 전송 성공 했을때
		                    	confirm = parseInt(result);	// 문자>순자 변환	                    	
		                    	console.log(result);
		                    	if(confirm == 1){
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
		
		
		//03. 환물 하기
		$("#refundBtn").click(function(){
			$("#refundModal").modal('show');			

			var merchant_uid = $("#merchantUid").val();
			var refund_req_amount = $("#refundReqAmount").val();
			
			$('#refundCheckBtn').click(function () {
				var refund_reason = $("#refundReason").val();
				var refund_partail = $("#refundPartial").val();
				if (refund_partail > 0){
					refund_req_amount = refund_req_amount - refund_partail;
				}
				console.log(merchant_uid);
				console.log(refund_req_amount);
				console.log(refund_reason);
			
				$.ajax({
	                type: "post", 
	                url: "/ddarawazoom/payRefund", // data 보낼 주소
	                data: {
	                	"merchant_uid": merchant_uid,
						"refund_reason": refund_reason,
						"refund_req_amount": refund_req_amount
						},	                    	
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
	                		var msg = '결제 최소에 실패하였습니다.';
	                	}
	                	alert(msg);
	                }
	            });

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
		<table class="table table-striped table-sm">
			<thead>
	            <tr>
					<th scope="col">결제번호</th>
	              	<th scope="col">상품번호</th>
	              	<th scope="col">강의명</th>
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
		              	<td>${paymentDTO.name}</td>
		              	<td>${paymentDTO.amount}</td>
		              	<td>${paymentDTO.cancelAmount}</td>
		              	<td>
		              		${paymentDTO.buyerName}</br>
		              		${paymentDTO.buyerTel}</br>
		              		${paymentDTO.buyerEmail}</br>
		              	</td>
		              	<td>${paymentDTO.paidAt}</td>
		              	<td>
		              		${paymentDTO.status}</br>
		              		<c:if test="${paymentDTO.status == 'paid'}">
		              			<input type="hidden"  id="merchantUid" value="${paymentDTO.merchantUid}"/>
		              			<input type="hidden"  id="refundReqAmount" value="${paymentDTO.amount}"/>
		              			<button id="refundBtn" data-toggle="modal" data-target="#exampleModal">
		              				취소하기		              				
	              				</button>
		              		</c:if>
		              		<c:if test="${paymentDTO.status == 'cancelled'}">
		              			${paymentDTO.cancelledAt}
		              			(${paymentDTO.cancelReason})</br>
		              		</c:if>		              		
		              	</td>
            		</tr>
				</c:forEach>        
			</tbody>
		</table>
	</div>
	
</section>


<!-- Modal -->
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
      			<input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios" checked>
      			<span>
       				전액 환물
				</span>
    		</label>
    		<label class="list-group-item d-flex gap-2">
      			<input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios" value="" >
      			<span>
       				일부 환불 <input type="text" id="refundPartial"></input>
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
</div>

<%@ include file="../../layout/footer.jsp"%>