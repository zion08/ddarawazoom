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


// 관심 등록 추가
function zoomLikeWrite(){
	if(window.confirm('소중한 내 관심Zoom에 담으시겠습니까?')){
	
		$.ajax({
			data : JSON.stringify({ num : number }),
			url : "/myroom/likeZoom_in",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async: false,
			success : function(data){
				if(data == 1){
					alert('소중한 내 관심 Zoom에 담겼습니다.');
				}
			}
		});
	}

	
fuction zoomLikeDelete(number){
	if(window.confirm('관심Zoom에서 등록해제 하시겠습니까?')){
	
		console.log(number);
	
		
		$.ajax({
			data : JSON.stringify({ num : number }),
			url : "/myroom/likeZoom_out",
			type= "POST",
			contentType : "application/json; charset=UTF-8",
			async: false,
			success : function(data){
				if(data == 1){
					alert('관심Zoom에서 등록해제 되었습니다.');
					window.location.reload();
				}
			}
		});
	}
	else{
		// They clicked no
	}
}