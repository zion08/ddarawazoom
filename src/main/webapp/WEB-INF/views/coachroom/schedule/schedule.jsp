<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href='/resources/coach/lib/main.css' rel='stylesheet' />
<link href="/resources/coach/custom/css/schedule.css" rel="stylesheet" />
<script src='/resources/coach/lib/main.js'></script>

<script>

	function getEvent(){
		var events;
		$.ajax({
			type: "POST",
			url: "/coachroom/getSchedule",
			dataType: "json",
			async: false, // ajax는 비동기식이기 때문에 return을 하기 못함 / 따라서 해당 코드를 추가함으로서 동기식으로 변경 후 리턴
			success: function(result){
				events = result;
			}
		});
		console.log(events);
		return events;
	}
	
	function click_add(){
		var url = "/coachroom/add_event";
		var name = "add_event";
		var option = "width=600, height=600 left=100, top=50, location=no";
		window.open(url, name, option);
	}
	
	function deleteEvent(){
		
		$.ajax({
			data : JSON.stringify({ 
				id: event.id,
				c_id: event.c_id,
				title: event.title
			}),
			url : "/coachroom/delete_event",
			type : "POST",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				alert("일정이 삭제되었습니다.");
				location.reload();
			}
    	});
	}
	
  document.addEventListener('DOMContentLoaded', function calendarEvent(eventData, events) {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	
   	  customButtons: {
   		addEvents: {
   			text: '일정 추가',
   			click: function(){
   				click_add();
   			}
   		}  
   	  },	
    	
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'addEvents,dayGridMonth,timeGridWeek,timeGridDay'
      },
      locale: 'ko',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      eventClick: function(event, jsEvent, view) {
    	  console.log(event.id);
    	  if(confirm("일정"+event+"을 삭제하시겠습니까?")){
    		  
    		  $.ajax({
    	  			url : "/coachroom/delete_event",
    	  			type : "POST",
    	  			data : JSON.stringify({ 
    	  				id: event.id,
    	  				c_id: event.c_id,
    	  				title: event.title
    	  			}),
    	  			dataType : "json",
    	  			contentType : "application/json; charset=UTF-8",
    	  			success : function(data) {
    	  				alert("일정이 삭제되었습니다.");
    	  				location.reload();
    	  			}
    	     });
    	  }
    	  
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events

      events: getEvent()
    	  
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>
	  	
    <div id='calendar' style="postion: relative;">
    
    </div>

</body>
</html>

<%@ include file="../../layout/footer.jsp"%>

