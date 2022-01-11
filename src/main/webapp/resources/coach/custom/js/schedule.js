	
	function getEvent(){
		$.ajax({
			type: "get",
			url: "/coachroom/getSchedule", 
			dataType: "json",
			async: false, // ajax는 비동기식이기 때문에 return을 하기 못함 / 따라서 해당 코드를 추가함으로서 동기식으로 변경 후 리턴
			success: function(result){
				event = result;
			}
		});
		return event;
	}
	
	function click_add(){
		var url = "/coachroom/add_event";
		var name = "add_event";
		var option = "width=600, height=600 left=100, top=50, location=no";
		window.open(url, name, option);
	}
 
 	//add schedule
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

	function click_ok(){

		var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
		
		$.ajax({
			data : scheduleData,
			url : "/coachroom/add_eventPro",
			type : "POST",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				opener.parent.location.reload();
				window.close();
			}
		});
	};
 