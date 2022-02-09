<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/user/custom/js/user.js" type="text/javascript"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>

<link href="/resources/coach/custom/css/form-validation.css" rel="stylesheet">
<link href="/resources/user/custom/css/user.css" rel="stylesheet">


<script>
$(document).ready(function(){
	// 아이디 중복체크
	$("#idCheckcoach").click(function(){
		// ajax 호출
		$.ajax({
			// 값을 보내는 방식
			type : "post",
			// 호출할 링크(컨트롤과 연결)
			url : "/ddarawazoom/idCheckcoach",
			// 보낼 파라미터
			data : { id : $("#id").val() } ,
			// 값을 성공적으로 가져왔을 때 data에 값을 대입
			success : function(data){
				console.log(data);
				a = parseInt(data);
				if(a == 1){
					$("#result").html("<font color='red'>이미 사용중인 아이디입니다. 다른 아이디를 사용해주세요.</font>");
					$("#id").attr('class', 'custom-form-control custom-is-invalid');
				} else if(a == 0) {
					$("#result").html("<font color='green'>사용가능한 아이디입니다.</font>");
				} else if(a == -1){
					$("#result").html("<font color='red'>아이디를 입력해주세요.</font>");
					$("#id").attr('class', 'custom-form-control custom-is-invalid');
				}
			}
		});
	});
	
	$("form").submit(function(){
		if($("#pw").val() != $("#re-pw").val()){
			$("#pwCheck").html("<font color='red'>비밀번호가 다릅니다.</font>");
			$("#pw").attr('class', 'custom-form-control custom-is-invalid');
			$("#re-pw").attr('class', 'custom-form-control custom-is-invalid');
			return false;
		}
		
		if($("#result").text() == '아이디를 입력해주세요.' || $("#result").text() == '이미 사용중인 아이디입니다. 다른 아이디를 사용해주세요.'){
			return false;
		}
	});
	
});

</script>




<script>
$(document).ready(function(){
	// 닉네임 중복체크
	$("#nickCheckcoach").click(function(){
		// ajax 호출
		$.ajax({
			// 값을 보내는 방식
			type : "post",
			// 호출할 링크(컨트롤과 연결)
			url : "/ddarawazoom/nickCheckcoach",
			// 보낼 파라미터
			data : { nick : $("#nick").val() } ,
			// 값을 성공적으로 가져왔을 때 data에 값을 대입
			success : function(data){
				console.log(data);
				a = parseInt(data);
				if(a == 1){
					$("#outcome").html("<font color='red'>이미 사용중인 닉네임입니다. 다른 닉네임을 사용해주세요.</font>");
					$("#nick").attr('class', 'custom-form-control custom-is-invalid');
				} else if(a == 0) {
					$("#outcome").html("<font color='green'>사용가능한 닉네임입니다.</font>");
				} else if(a == -1){
					$("#outcome").html("<font color='red'>닉네임을 입력해주세요.</font>");
					$("#nick").attr('class', 'custom-form-control custom-is-invalid');
				}
			}
		});
	
		
		if($("#outcome").text() == '닉네임를 입력해주세요.' || $("#outcome").text() == '이미 사용중인 닉네임입니다. 다른 닉네임을 사용해주세요.'){
			return false;
		}
	});
	
});

</script>






<div class="container-fluid">
    
    <div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
	        <h4 class="mb-3">코치 회원가입</h4>
	        <form class="needs-validation" novalidate action="/ddarawazoom/coachsignupPro" method="post" onsubmit="submit_check">
	          <div class="row g-3">
	          
	          	<!-- 아이디 -->
	            <div class="col-8">
	              <label for="id" class="form-label">* 아이디</label>
	              <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요." required>
	              <div class="invalid-feedback">
	                아이디는 필수항목입니다.
	              </div>
	            </div>
	            <!-- 아이디 중복확인 -->
				<div class="col-4" style="float: right;">
				    <input style="margin-top: 31px;" type="button"
				    	class="btn btn-primary mb-3 form-control" id="idCheckcoach" value="중복확인"/>
				</div>
				<label id=result class="font" style="margin-top: 0px;"></label>
				
				<!-- 비밀번호 -->
	            <div class="col-12">
	              <label for="password" class="form-label">* 비밀번호</label>
	              <div class="input-group has-validation">
	                <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해주세요." required>
	              <div class="invalid-feedback">
	                  비밀번호는 필수항목입니다.
	                </div>
	              </div>
	            </div>
	
				<!-- 비밀번호 재확인 -->
				<div class="col-12">
	              <label for="password" class="form-label">* 비밀번호 재확인</label>
	              <div class="input-group has-validation">
	                <input type="password" class="form-control" id="re-pw" name="re-pw" placeholder="비밀번호를 확인해주세요." required>
	              	<div class="invalid-feedback">
	                  비밀번호를 확인해주세요.
	                </div>
	              </div>
	            </div>
				<label id=pwCheck class="font"></label>
				
				<!-- 이름 -->
				<div class="col-12">
	              <label for="name" class="form-label">* 이름</label>
	              <div class="input-group has-validation">
	                <input type="text" class="form-control" id="name" name="name" placeholder="이름" required>
	              <div class="invalid-feedback">
	                  이름은 필수항목입니다.
	                </div>
	              </div>
	            </div>
	            
	            <!-- 이메일 -->
	            <div class="col-12">
	              <label for="email" class="form-label">* 이메일</label>
	              <input type="email" class="form-control" id="email" name="email" placeholder="example@email.com" required>
	              <div class="invalid-feedback">
	                이메일은 필수항목입니다.
	              </div>
	            </div>
	
				<!-- 닉네임 -->
	            <div class="col-8">
	              <label for="nickname" class="form-label">* 닉네임</label>
	              <input type="text" class="form-control" id="nick" name="nick" placeholder="닉네임을 입력하세요." required>
	              <div class="invalid-feedback">
	                닉네임은 필수항목입니다.
	              </div>
	            </div>
	            
	            <!-- 닉네임 중복확인 -->
	            <div class="col-4" style="float: right;">
				    <input style="margin-top: 31px;" type="button"
				    	class="btn btn-primary mb-3 form-control" id="nickCheckcoach" value="중복확인"/>
				</div>
				<label id=outcome class="font" style="margin-top: 0px;"></label>
	            
	            <!-- 성별 -->
	            <div class="col-12">
	            	
	              <label for="sex" class="form-label">* 성별</label><br/>
	              	<div class="col-2" style="float: left;">
	              		<input type="radio" id="male" name="gender">남</div>
	            	<div class="col-10" style="float: right;">
	            		<input type="radio" id="female" name="gender">여</div>
	              <div class="invalid-feedback">
	                성별은 필수항목입니다.
	              </div>
	            </div>
	            
	            <!-- 연락처 -->
	            <div class="col-12">
	              <label for="tel" class="form-label">* 연락처</label>
	              <input type="text" class="form-control" id="tel" name="tel" placeholder="-를 제외한 연락처" required>
	              <div class="invalid-feedback">
	                연락처는 필수항목입니다.
	              </div>
	            </div>
	            
	            <!-- 프로필 사진 -->
	            <div class="col-12">
	              <label for="tel" class="form-label"> 프로필 사진</label>
	              <input type="file" class="form-control" id="tel" name="tel" placeholder="프로필 사진을 올려주세요" required>
	              <div class="invalid-feedback">
	                연락처는 필수항목입니다.
	              </div>
	            </div>
	           
	          	            
	            <!-- 관련 소속 -->
	            <div class="col-12">
	              <label for="agent" class="form-label"> 관련 소속 화살표 어떻게 만들어!!!!!</label>
	              	<select id="dropdown" class="form-control" data-toggle="button"
	             	 id="company" name="company" placeholder="소속을 선택하시오. 선택하라고오오오오" required>
	              			<option selected>압구정휘트니스</option>
	              			<option selected>청담휘트니스</option>
	              			<option selected>호완체육관</option>
	              			<option selected>대치동휘트니스</option>
	              			<option selected>삼성역휘트니스</option>
	              	</select>
	              
	              
	            </div>
	            


			    <div class="form-check">
			      <input type="checkbox" class="form-check-input" id="checkbox1" name="checkbox" required onclick="selectAll(this);">
			      <label class="form-check-label" for="checkbox1">약관 전체동의</label>
			      <div class="invalid-feedback">약관에 동의하셔야합니다.</div>
			    </div>
			    <div class="form-check">
			      <input type="checkbox" class="form-check-input" id="checkbox2" name="checkbox" required>
			      <label class="form-check-label" for="checkbox2">개인정보 수집 이용동의(필수)</label>
			      <div class="invalid-feedback">약관에 동의하셔야합니다.</div>
			    </div>
			    <div class="form-check">
			      <input type="checkbox" class="form-check-input" id="checkbox3" name="checkbox">
			      <label class="form-check-label" for="checkbox3">마케팅 활용 및 광고성 정보 수신 동의(선택)</label>
			    </div>	

	          </div>
	
	          <hr class="my-4">
	          
	          <button class="w-40 btn btn-primary btn-lg" type="submit">
	          	회원가입
	          </button>
	          
	          <input type="button" class="w-40 btn btn-danger btn-lg" onclick="window.location='/ddarawazoom'" value="메인으로" />
	        </form>
	      </div>
	    </div>
	  </main>
	</div>
    
</div>

<script src="/resources/coach/custom/js/form-validation.js"></script>



















<%@ include file="../../layout/footer.jsp"%>