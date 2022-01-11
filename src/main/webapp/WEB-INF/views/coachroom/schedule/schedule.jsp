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
<script src='/resources/coach/lib/main.js'></script>

<link href="/resources/coach/custom/css/schedule.css" rel="stylesheet" />
<script src="/resources/coach/custom/js/schedule.js" type="text/javascript"></script>	

<script>
	var event;
	
	$(document).ready(function(){
		getEvent();
		console.log(event);
	});
	
	document.addEventListener('DOMContentLoaded', function calendarEvent(eventData) {
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
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      eventClick: function(arg) {
	    	  console.log(arg);
	    	  console.log(arg.event);
	    	  console.log(arg.event.title);
	    	  console.log(arg.event.extendedProps.c_id);
	    	  
	    	  if(confirm("일정"+arg.event.title+"을 삭제하시겠습니까?")){
	    		  
	    		  $.ajax({
	    	    	  type : "POST",
	    	    	  url : "/coachroom/delete_event",
	    	    	  dataType : "json",
	    	    	  ontentType : "application/json; charset=UTF-8",
	    	    	  data : {
	    	    	  		id: arg.event.id
	    	    	  		},
	    	    	  success : function(response) {
	    	    	  alert("일정이 삭제되었습니다.");
	    	    	  arg.event.remove()
	    	    	  location.reload();
	    	    	 }
	    	     });
	    		  
	    	  } else {
	    		  return false;
	    	  }
	      },	
	      
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

