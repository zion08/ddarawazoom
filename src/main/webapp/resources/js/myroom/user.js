// ajax로 view -> controller로 여러개의 값 전송할 때 필요한 코드
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


// 회원 정보 수정
function infoUpdate_submit(){
	if($("#pw").val() == "" || $("#email").val() == "" || $("#nick").val() == ""){
		return false;
	}

	var updateInfo = JSON.stringify($('form#updateForm').serializeObject());
	
	$.ajax({
		data : updateInfo,
		url : "/myroom/infoUpdateData",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data == 1){
				alert("수정 되었습니다.");
			}
		}
	});
}

// 프로필 수정 팝업창
function imgUpdateForm(){
	var url = "/myroom/imgUpdate";
	var name = "img_update";
	var option = "width=500, height=300, left=100, top=50";
	
	window.open(url, name, option);
}

// 프로필 사진 변경
function imgUpdatePro(){

	if($("#formFile") == "") {
		return false;
	}
	
	var form = new FormData();
    form.append( "save", $("#formFile")[0].files[0] );
        
	console.log($("#formFile")[0].files[0]);
	
	$.ajax({
		url : "/myroom/imgUpdatePro",
		type : "POST",
		processData : false,
		contentType : false,
		data : form,
		async: false,
		success : function(data){
			var result = parseInt(data);
			if(result == 1){
				alert("업로드 완료되었습니다.");
				opener.parent.location.reload();
				window.close();
			} else {
				alert("이미지만 업로드 가능합니다.");
			}
		}
	});
}


// 멤버 탈퇴 확인 페이지
function userDelete(){
	if(window.confirm('정말로 탈퇴를 원하십니까?') == true){
	
		var url = "/myroom/userDelete";
		var name = "user_delete";
		var option = "width=500, height=300, left=100, top=50";
		
		window.open(url, name, option);
	}
}

// 멤버 탈퇴 후, 상태 변경
function userDeletePro(){
	
		if($("#pw").val() == ''){
			alert('비밀번호를 입력해주세요');
			return false;
		}
		
		$.ajax({
			data : $("#pw").serializeArray(),
			url : "/myroom/userDeletePro",
			type : "POST",
			dataType : "json",
			success : function(data){
				var result = parseInt(data);
				
				if(result == 0){
					alert("패스워드가 틀렸습니다");
					return false;
				}else{
					if(window.confirm('멤버 탈퇴를 정말로 하시겠습니까?')){
						$('#userDelete').submit();
						opener.parent.location.reload();
						window.close();
					}
				}
			}
		});
	}

