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
	});
	
});

function submit_check(){
	
	console.log("script run");
	
	if($("#id").val() == "" || $("#pw").val() == "" || $("#re-pw").val() == "" || $("#email").val() == "" || $("#nick").val() == "" || $("#checkbox2").val() == ""){
		return false;
	}
	
}

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('checkbox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
}
	