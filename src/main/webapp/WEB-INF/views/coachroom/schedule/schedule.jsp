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

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>

<div class="container-fluid">	
	<div class="row">
	    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	      <div class="position-sticky pt-3">
	        <ul class="nav flex-column">
	          <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="#" onclick="window.location='/coachroom'">
	              <span data-feather="home"></span>
	              코치룸
	            </a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="#" onclick="window.location='/coachroom/schedule'">
	              <span data-feather="file"></span>
	              스케줄 관리
	            </a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="#" onclick="window.location='/coachroom/info'">
	              <span data-feather="user"></span>
	              내 정보 관리
	            </a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="#">
	              <span data-feather="users"></span>
	              회원 관리
	            </a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="#">
	              <span data-feather="bar-chart-2"></span>
	              리뷰 관리
	            </a>
	          </li>
	        </ul>
	        
	        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="link-secondary" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul>
        
	      </div>
	    </nav>
	    <div id='calendar' style="postion: relative;"></div>
	</div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="/resources/coach/custom/js/dashboard.js"></script>

<%@ include file="../../layout/footer.jsp"%>

