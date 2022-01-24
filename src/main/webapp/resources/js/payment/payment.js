$(document).ready(function(){
   	
   	//01. 결제 준비
	var IMP = window.IMP;
	IMP.init("imp37432029");  //가맹점 식별 코드

	//02. 결제 하기
	$('#payBtn').click(function() {	// 결제하기 버튼 클릭      

		var paymentData = new Object();	// json 데이터 생성
		paymentData.merchantUid = "${ZoomDTO.merchant_uid}"+"-ORD"+"${cnt}";
		paymentData.c_id = "${ZoomDTO.c_id}";
		paymentData.c_num = "${ZoomDTO.num}"; 
		console.log(paymentData);
		
		IMP.request_pay({		// iamport 결제 요청
			pg: "nice",						// pg사
	        pay_method: "card",				// 지불 수단
	        merchant_uid: paymentData.merchantUid,		// 제품 주문번호
	        name: "${ZoomDTO.title}",		// 강의명
	        amount: 2000,					// 강의(제품) 가격
	        buyer_name: "buyer_id",			// 구매자 id
	        buyer_email: "test@test.com",	// 구매자 email
	        buyer_tel: "010-4242-4242"		// 구매자 전화번호
	        },
          
	        function (rsp) {	// 결제 callback
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