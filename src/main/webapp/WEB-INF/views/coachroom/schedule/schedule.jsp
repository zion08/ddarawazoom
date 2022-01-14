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

	$(document).ready(function(){
		
		var event = getEvent();
	
		console.log(event);
	
		// calendar element 취득
		var calendarEl = document.getElementById('calendar');
		
		// full-calendar 생성
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      
	      // 헤더부분에 들어갈 커스텀 버튼 생성
	   	  customButtons: {
	   		addEvents: {
	   			text: '일정 추가',
	   			click: function(){
	   				click_add();
	   			}
	   		}  
	   	  },
	      headerToolbar: { // 헤더에 들어갈 버튼
	        left: 'prev,next today',
	        center: 'title',
	        right: 'addEvents,dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      locale: 'ko', // 한국어 설정
	      navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	      editable: true, // 수정가능 확인 여부
	      dayMaxEvents: true, // 이벤트의 갯수가 많을 경우 표시되는 갯수 제한
	      eventClick: function(arg) { // 이벤트를 클릭했을 시 실행될 부분
	    	  
	    	  console.log(arg); // 현재 캘린더에 들어있는 모든 값
	    	  console.log(arg.event); // 캘린더에 들어있는 event 값
	    	  console.log(arg.event.title); // 캘린더에 들어있는 event의 title값
	    	  console.log(arg.event.extendedProps.c_id); // 추가로 집어넣은 그 외의 데이터(코치 아이디) 값
	    	  
	    	  // 새 팝업창 띄우기
	    	  var url = "/coachroom/schedule_popup?id="+arg.event.id+"&c_id="+arg.event.extendedProps.c_id;
	    	  var name = "schedule_popup";
	    	  var option = "top=10, left=10, width=300, height=150, status=no, menubar=no, toolbar=no, resizable=no";
	    		
	    	  window.open(url, name, option);
	    	  
	      },	
	      // 이벤트
	      events: event
	      
	    });
		// 캘린더 랜더링
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

<body>
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

