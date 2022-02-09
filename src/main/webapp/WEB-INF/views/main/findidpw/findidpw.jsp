<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- ajax 여러 개의 값을 받기 위한 것 -->

<script> 

$.fn.serializeObject = function(){
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		var name = $.trim(this.name),
			value = $.trim(this.value);
		
		if (o[name]) {
			if (!o[name].push) {
				o[name] = [o[name]];
			}
			o[name].push(value || '');
		} else {
			o[name] = value || '';
		}
	});
	return o;
};
</script>

<script type="text/javascript">
         function contentsView(objValue) {
        	 
             if (objValue == 'id') {
                 $('#findid').css('display', 'block');
                 $('#findpw').css('display', 'none'); 
                 //display 'none'은= div가 보이지않는!
                 return false;
             }
             if (objValue == 'pw') {
                 $('#findid').css('display', 'none');
                 $('#findpw').css('display', 'block');
                 return false;
             }
         }
</script>
        
<script>
         function findId(){
        	 var data = { name : $("#name").val(), tel : $("#tel").val() }
        	 $.ajax({
            	data : data,
         		url : "/ddarawazoom/findidpwPro",
         		
         		contentType : "application/json; charset=UTF-8",
         		success : function(data){
         			if(data != null){
         				$("#result").html("고객님의 아이디는 <font color='green'>"+data+"</font>입니다.");
         			} else {
         				$("#result").html("<font color='red'>아이디가 존재하지 않습니다.</font>");
         			}
         			
         		}
             });
         }
</script>         
         
<script>     
function findPw(){
 			 alert("꺄아아아아");
 			 //var sth = document.getElementById("email").value;
 			 var sth = {email : $("#email").val}
        	 var data = {name : $("#pw_name").val(), 
        			 id : $("#pw_id").val(), 
        			 email : $("#email").val() }
        	 $.ajax({
            	data : data,
         		url : "/ddarawazoom/findpwPro",
         		type: "GET",
         		contentType : "application/json; charset=UTF-8",
         		success : function(data){
         			if(data == 1){
         				$("#result");
         				window.location="/ddarawazoom/sendEmail?email="+sth
         			}else{
         				alert("메시지가 발송되지 않았습니다. 사용자 정보를 확인하세요");
         			}
         		//alert(data);	
         		}
         		
             });
         }
         
</script>      
     	
        


<h1>아이디/비밀번호</h1>


<!-- findidpw의 name이 위아래 둘 다 같아줘야 radio 중복선택이 되지 않는다. -->
<!-- onclick의 () 안에 id 값을 적어준다. -->

   <input type="radio" id="id" name="findidpw" 
   checked=checked onclick="javascript:contentsView('id');">아이디 찾기
   
   <input type="radio" id="pw" name="findidpw" 
   	onclick="javascript:contentsView('pw');">비밀번호 찾기
   <br/>
   
   
   <div id="findid" >   
      <input type="text" id="name" name="name" placeholder="이름">
      <br/>

      <input type="text" id="tel" name="tel" placeholder="-을 제외한 연락처">
      <br/>
      
      <input type="button" value="확인" onclick="findId();">
      <br/>
      
      <label id="result"></label>
      
      <br/>
      
   </div>

   <div id="findpw">
   
   	  <input type="text" id="pw_name" name="name" placeholder="이름">
      <br/>
      
      <input type="text" id="pw_id" name="id" placeholder="아이디">
      <br/>

      <input type="text" id="email" name="email" placeholder="이메일" >
   
      <input type="button" value="이메일전송 본인확인" onclick="findPw();">
      <br/>

      <br/>
      
   </div>




<%@ include file="../../layout/footer.jsp"%>