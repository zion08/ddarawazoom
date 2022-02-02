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

// 공지사항 삭제
function noticeDelete(number){
	if(window.confirm('정말로 삭제 하시겠습니까?') == true){
		
		$.ajax({
			data : JSON.stringify({num : number}),
			url : "/manager/noticeDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert("본 공지글은 삭제되었습니다.");
					window.location.reload();
				}
			} 
		});
		
		}else{
		//Tyey clicked no
	}
}

// 공지사항 댓글 작성
function commentWrite(){
	if($("#writer_id").val == "" || $("#comment") == ""){
		return false;
	}
	
	var commentWrite = JSON.stringify($('form#commentForm').serializeObject());
	
	$.ajax({
		data : commentWrite,
		url : "/manager/commentWrite",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data == 1){
				alert("댓글이 작성되었습니다.");
			}
		}
	});
}