
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

function update_submit(){
	if($("#c_name").val() == "" || $("#c_nick").val() == "" || $("#c_email").val() == "" || $("#c_birth").val() == "" || $("#c_gender").val() == ""){
		return false;
	}

	var updateInfo = JSON.stringify($('form#updateForm').serializeObject());
	
	$.ajax({
		data : updateInfo,
		url : "/coachroom/infoUpdateData",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(result){
			if(result == 1){
				alert("수정 완료.");
			}
		}
	});
}

function imgUpdateForm(){
	var url = "/coachroom/imgUpdate";
	var name = "img_update";
	var option = "width=500, height=200 left=100, top=50, location=no";
	
	window.open(url, name, option);
}

function imgUpdatePro(){

	if($("#formFile") == "") {
		return false;
	} else {
	
		var form = new FormData();
        form.append( "save", $("#formFile")[0].files[0] );
        
		console.log($("#formFile")[0].files[0]);
	
		$.ajax({
			url : "/coachroom/imgUpdatePro",
			type : "POST",
			processData : false,
			contentType : false,
			data : form,
			success : function(result){
				if(result == 1){
					alert("업로드 완료.");
					opener.parent.location.reload();
					window.close();
				} else {
					alert("이미지만 업로드 가능합니다.");
				}
			}
		});
	}
}

