<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ include file="../../layout/iamport.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">	
	
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
    
    $(document).ready(function(){
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
		                    		console.log("payment All Success");
		        	            	msg += '(' + rsp.name +')';	        	            	
		                    	} else {
		                    		console.log("payment Warn");
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
		$('#payCancelBtn').click(function () {
			var imp_uid = $("#impUid").val();
			var merchant_uid = $("#merchantUid").val();
			console.log(imp_uid);
			console.log(merchant_uid)
			
			$.ajax({
                type: "post", 
                url: "/ddarawazoom/paycancelPro", // data 보낼 주소
                data: {
                	"imp_uid": imp_uid,
					"merchant_uid": merchant_uid
					},	                    	
                success: function(result){	// data 전송 성공 했을때
                	confirm = parseInt(result);	// 문자>순자 변환	                    	
                	console.log(result);
                	if(confirm == 1){
                		console.log("payment Cancle All Success");
                		var msg = '결제 취소 완료';
                		        	            	
                	} else {
                		
                	}
                	alert(msg);
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
		<table class="table table-striped table-sm">
			<thead>
	            <tr>
					<th scope="col">결제번호</th>
	              	<th scope="col">상품번호</th>
	              	<th scope="col">강의명</th>
	              	<th scope="col">결제금액</th>
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
		              	<td>
		              		${paymentDTO.buyerName}</br>
		              		${paymentDTO.buyerTel}</br>
		              		${paymentDTO.buyerEmail}</br>
		              	</td>
		              	<td>${paymentDTO.paidAt}</td>
		              	<td>
		              		${paymentDTO.status}
		              		<c:if test="${paymentDTO.status == 'paid'}">
		              			<input type="hidden" id="impUid" value="${paymentDTO.impUid}" />
		              			<input type="hidden" id="merchantUid" value="${paymentDTO.merchantUid}" />
		              			<button id="payCancelBtn" onclick="run(param1)">
		              				취소하기		              				
	              				</button>
		              		</c:if>		              		
		              	</td>
            		</tr>
				</c:forEach>        
          </tbody>
        </table>
      </div>
	
</section>



<%@ include file="../../layout/footer.jsp"%>