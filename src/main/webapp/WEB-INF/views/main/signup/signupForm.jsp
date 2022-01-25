<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/user/custom/js/user.js" type="text/javascript"></script>

<link href="/resources/coach/custom/css/form-validation.css" rel="stylesheet">

<style>
.custom-form-control {
  display: block;
  width: 100%;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 500;
  line-height: 1.5;
  color: #212529;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  border-radius: 0.25rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.custom-is-invalid {
	border-color: #dc3545;
    padding-right: calc(1.5em + 0.75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.font {
  width: 100%;
  margin-top: 0.25rem;
  font-size: 0.875em;
  color: #dc3545;
}
</style>

<script>
$(document).ready(function(){
	// 아이디 중복체크
	$("#idCheck").click(function(){
		// ajax 호출
		$.ajax({
			// 값을 보내는 방식
			type : "post",
			// 호출할 링크(컨트롤과 연결)
			url : "/ddarawazoom/idCheck",
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
		
		if($("#pwCheck").text() == '비밀번호가 다릅니다.'){
			return false;
		}
	});
	
});

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('checkbox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
}
</script>

<div class="container-fluid">
    
    <div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
	        <h4 class="mb-3">회원가입</h4>
	        <form class="needs-validation" novalidate action="/ddarawazoom/signupPro" method="post" onsubmit="submit_check">
	          <div class="row g-3">
	            <div class="col-8">
	              <label for="id" class="form-label">* 아이디</label>
	              <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요." required>
	              <div class="invalid-feedback">
	                아이디는 필수항목입니다.
	              </div>
	            </div>
				<div class="col-4" style="float: right;">
				    <input style="margin-top: 31px;" type="button"
				    	class="btn btn-primary mb-3 form-control" id="idCheck" value="중복확인"/>
				</div>
				<label id=result class="font" style="margin-top: 0px;"></label>
				
	            <div class="col-12">
	              <label for="password" class="form-label">* 비밀번호</label>
	              <div class="input-group has-validation">
	                <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해주세요." required>
	              <div class="invalid-feedback">
	                  비밀번호는 필수항목입니다.
	                </div>
	              </div>
	            </div>
	
				<div class="col-12">
	              <label for="re-pw" class="form-label">* 비밀번호 재확인</label>
	              <div class="input-group has-validation">
	                <input type="password" class="form-control" id="re-pw" name="re-pw" placeholder="비밀번호를 확인해주세요." required>
	              	<div class="invalid-feedback">
	                  비밀번호를 확인해주세요.
	                </div>
	              </div>
	            </div>
				<label id=pwCheck class="font"></label>
				
	            <div class="col-12">
	              <label for="email" class="form-label">* 이메일</label>
	              <input type="email" class="form-control" id="email" name="email" placeholder="exapmle@email.com" required>
	              <div class="invalid-feedback">
	                이메일은 필수항목입니다.
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="nickname" class="form-label">* 닉네임</label>
	              <input type="text" class="form-control" id="nick" name="nick" placeholder="닉네임을 입력하세요." required>
	              <div class="invalid-feedback">
	                닉네임은 필수항목입니다.
	              </div>
	            </div>

			    <div class="form-check">
			      <input type="checkbox" class="form-check-input" id="checkbox1" name="checkbox" onclick="selectAll(this);">
			      <label class="form-check-label" for="checkbox1">약관 전체동의</label>
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
