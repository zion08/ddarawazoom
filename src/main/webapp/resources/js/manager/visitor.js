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

// 방문자 날짜 검색 유효성 검사
$(document).ready(function(){
	$('#btn').click(function(){
		
		if($('#visitDate').val() == ''){
			alert('날짜를 입력해 주세요.');
			document.visitorDate.visitDate.focus();
			return false;
		}
	})
});
