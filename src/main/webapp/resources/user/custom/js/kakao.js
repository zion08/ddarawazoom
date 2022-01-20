
Kakao.init('fe7344bb892ab9d3081040d3d8b90568'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); 
// sdk초기화여부판단

//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      scope: 'profile_nickname, profile_image, account_email',
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
			console.log(response)
			
			var id = response.id+"kakaoLogin"; // 카카오 회원 번호
			var nick = response.properties.nickname; // 카카오 닉네임
			var email = response.kakao_account.email; // 카카오 이메일
			var kakaoImg = response.properties.profile_image; // 카카오 프로필 사진
			
			var kakaoData = JSON.stringify({
				'id' : id,
				'nick' : nick,
				'email' : email,
				'img' : kakaoImg
			})
			
        	$.ajax({
				data : kakaoData,
				url : "/ddarawazoom/kakaoLogin",
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if(data == 1){
						alert("로그인 되었습니다.");
						window.location="/ddarawazoom";
					}
				}
			});
			
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
function kakaoLogout(){
	if (!Kakao.Auth.getAccessToken()) {
	  console.log('Not logged in.');
	  window.location="/ddarawazoom";
	}

	Kakao.Auth.logout(function() {
	  console.log(Kakao.Auth.getAccessToken());
	  window.location="/ddarawazoom/logout";
	});
}
