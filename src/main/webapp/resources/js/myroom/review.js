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


function reviewUpdate_submit(){
	if($("#content").val() == "" || $("#grade").val() == ""){
		return false;
	}
	
	var updateReview = JSON.stringify($('form#updateForm').serializeObject());
	
		$.ajax({
			data : updateReview,
			url : "/myroom/reviewUpdateData",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("작성하신 댓글이 수정되었습니다.");
				}
			}
		});
	}


function delete_review(number){
	
	console.log(number);
	
	if(window.confirm('작성하신 댓글 삭제를 원하십니까?') == true){
		
		$.ajax({
			data : JSON.stringify({ review_num : number }),
			url : "/myroom/reviewDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async: false,
			success : function(data){
				if(data == 1){
					alert("본 댓글은 삭제 되었습니다.");
					window.location.reload();
				}
			}
		});
	}
	else{
		//Tyey clicked no
	}
}
	