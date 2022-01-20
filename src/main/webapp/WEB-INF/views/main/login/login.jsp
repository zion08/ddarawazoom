<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="form-sigminbox text-center">
	<main class="form-signin">
	
		<form name="loginForm" action="/ddarawazoom/loginPro" method="post">
			<img class="mb-4" width="72" height="57" src="../../resources/image/Exercise.svg"/>
		    <h1 class="h3 mb-3 fw-normal">따라와Zoom과 운동해요</h1>
		
		    <div class="form-floating">
		    	<input type="text" class="form-control" 
		    	id="floatingInput" placeholder="name@example.com"
		    	name="id">
		    	<label for="floatingInput">ID</label>
		   
		     
		    </div>
		    <div class="form-floating">
		    	<input type="password" class="form-control" 
		    	id="floatingPassword" placeholder="Password"
		    	name="pw">
		    	<label for="floatingPassword">Password</label>
		    </div>
		
		    <div class="checkbox mb-3">
		    	<label>
		        	<input type="checkbox" value="remember-me"> Remember me
		    	</label>
		    </div>
		    
		    
		   <div class="findidpw">
		   		<label>
		   			<input type="button" value="아이디 찾기" onclick="window.location='/ddarawazoom/findid'">
		   			<input type="button" value="비밀번호 찾기" onclick="window.location='/ddarawazoom/findpw';">
		   		</label>
		   </div>
		    
		    <!-- 보라색 로그인 버튼 -->
		    <input type="submit"
		    class="w-100 btn btn-lg btn-secondary mb-3"
		    value="Login"/>
		    
		    <!-- 카카오톡 로그인 버튼 -->
		    <input type="button"  
		    class="w-100 btn btn-lg btn-warning" 
		    value="kakao login"
		    onclick="kakaoLogin();"/>   
            <!-- onclick="document.location.href='/ddarawazoom/kakaologin'" -->
            <!-- name="kakaoLogin()" -->
            
            <!-- 네이버 로그인 버튼 -->
		    <input type="button"  
		    class="w-100 btn btn-lg btn-warning2" 
		    value="NAVER"
		    onclick="naverLogin();"/>

	</form>
       
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('69f6fb713056a0808093de1d55e49ca1'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); 
// sdk초기화여부판단

//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
             console.log(response)
          },
          fail: function (error) { 
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
  
  
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
           console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
	    	
		
	</main>
</div>


<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "Q8u8GsOeEH5xiXdR6N0V", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/ddarawazoom/login", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>





<%@ include file="../../layout/footer.jsp"%>