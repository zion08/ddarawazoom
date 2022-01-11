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
	    	  
	    	  var url = "/coachroom/schedule_popup?id="+arg.event.id+"&c_id="+arg.event.extendedProps.c_id;
	    	  var name = "schedule_popup";
	    	  var option = "top=10, left=10, width=300, height=150, status=no, menubar=no, toolbar=no, resizable=no";
	    		
	    	  window.open(url, name, option);
	    	  
	    	  
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

