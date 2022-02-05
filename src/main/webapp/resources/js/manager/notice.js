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
			url : "/ddarawazoom/noticeDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert("본 공지글은 삭제되었습니다.");
					window.location.reload();
					window.location="/ddarawazoom/notice";
				}
			} 
		});
		
		}else{
		//Tyey clicked no
	}
}

// 공지사항 댓글 작성
function commentWrite(){

	if($("#writer_id").val == "" || $("#comment").val == "" || $("#pw").val == ""){
		return false;
	}
	
	var commentWrite = JSON.stringify($('form#commentForm').serializeObject());
	
	$.ajax({
		data : commentWrite,
		url : "/ddarawazoom/commentWrite",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data == 1){
				alert("댓글이 작성되었습니다.");
				location.reload();
			}
		}
	});
}

// 대댓글 창
function reComment(c_num){
	console.log(c_num);
	var url = "/ddarawazoom/reComment?c_num=" + c_num;
	var name = "recomment";
	var option = "width=500, height=300, left=100, top=50";
	
	window.open(url, name, option);
}

// 대댓글 작성
function reCommentPro(){
	var data = JSON.stringify($('form#recomment_Form').serializeObject());
	
	if($("#content").val() == ""){
		alert('댓글을 작성해주세요.');
		return false;
	}
	
	$.ajax({
		data : data,
		url : "/ddarawazoom/reCommentPro",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			var result = parseInt(data);
			
			if(result == 0){
				alert("정보가 잘못 입력되었습니다. 다시 입력해주세요.");
				return false;
			}else{
				alert("대댓글이 작성되었습니다~!");
					$('#recomment_Form').submit();
					opener.document.location.reload();
					window.close();
			}
		}
	});
}


// 공지사항 댓글 삭제
function commentDelete(c_num){
	if(window.confirm('정말로 댓글을 삭제를 원하십니까?') == true){
		
		var url = "/ddarawazoom/commentDelete?c_num=" + c_num;
		var name = "comment_delete";
		var option = "width=500, height=300, left=100, top=50";
		
		window.open(url, name, option);
	} 
}

// 댓글 삭제 후, 상태 변경
function commentDeletePro(){
	
	var data = JSON.stringify($('form#commentDelete').serializeObject());
	
	if($("#pw").val() == ""){
		alert('비밀번호를 입력해주세요.');
		return false;
	}
		
	$.ajax({
		data : data,
		url : "/ddarawazoom/commentDeletePro",
		type : "POST",
		contentType : "application/json; charset=UTF-8", 
		success : function(data){
			var result = parseInt(data);
			
			if(result == 0){
				alert('패스워드가 틀렸습니다.');
				return false;
			}else{
				if(window.confirm('삭제 후, 복구가 되지 않습니다. 정말로 삭제 하시겠습니까?') == true){
					opener.parent.location.reload();
					window.close();
					$('#commentDelete').submit();
				}
			}
		}
	});
}	

// 공지사항 댓글 수정 페이지
function commentUpdate(c_num){
	var url = "/ddarawazoom/commentUpdate?c_num="+c_num;
	var name = "comment_update";
	var option = "width=500, height=300, left=100, top=50";
	
	window.open(url,name,option);
}

// 공지사항 댓글 수정
function commentUpdatePro(){
	
	var data = JSON.stringify($('form#comment_UpdateForm').serializeObject());
	
	if($("#content").val() == "" || $("#pw").val() == ""){
		return false;
	}
	
	$.ajax({
		data : data,
		url : "/ddarawazoom/commentUpdatePro",
		type : "POST",
		contentType :  "application/json; charset=UTF-8",
		success : function(data){
			var result = parseInt(data);
			
			if(result == 0){
				alert("정보가 잘못 입력되었습니다. 다시 입력해주세요.");
				return false;
			}else{
				alert("정보가 수정되었습니다. 비밀번호를 잘 기억해두세요!");
					opener.parent.location.reload();
					window.close();
					$('#comment_UpdateForm').submit();
			}
		}
	});
}

// 관리자 댓글 삭제
function managerDeletedChange(number){
	if(window.confirm('댓글 삭제 진행을 하시겠습니까?') == true){
	
			$.ajax({
			data : JSON.stringify({ c_num : number}),
			url : "/manager/commentDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert("댓글 삭제가 완료되었습니다.");
					window.location.reload();
				}
			} 
		});
		
		}else{
		//Tyey clicked no
	}
}
