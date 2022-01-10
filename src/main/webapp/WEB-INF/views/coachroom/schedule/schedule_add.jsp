<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="/resources/coach/custom/css/schedule.css" rel="stylesheet" />
<script src="/resources/coach/custom/js/schedule.js" type="text/javascript"></script>	

<script>
	$(document).ready(function(){
		$.datepicker.setDefaults({
				dateFormat: "yy-mm-dd",
				showOtherMonths: true,
				showMonthAfterYear: true,
				changeYear: true,
				changeMonth: true,
			yearSuffix: "년",
			
			monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dayNamesMin: ["일","월","화","수","목","금","토"],
			dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"]
		});
		
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		
		$("#startDate").datepicker("setDate", "today");
		$("#endDate").datepicker("setDate", "today");
	});
</script>

</head>
<body>
	
	<div class="group" id="popupGroup">
	
		<div class="group-head">
			<h1 class="zTree-h1"> 일정 추가 </h1>
		</div>
		
		<div class="group-body">
			<form id="scheduleData">
				
				<div class = "top">
					<input class = "subject" type="text" name="title" placeholder="강의 제목을 입력해주세요." />
				</div>
				
				<div class="domain">
					<h3 class = "zTree-h3"> 수강생 이름 </h3>
				</div>
				<div class="domain">
					<input class="date" type="text" name="m_id" />
				</div>
				
				<div class="domain">
					<h3 class = "zTree-h3"> 코치 이름 </h3>
				</div>
				<div class="domain">
					<input class="date" type="text" name="c_id" />
				</div>
				
				<div class="domain">
					<h3 class = "zTree-h3">시작 날짜</h3>
				</div>
				<div class="domain">
					<input class="date" id="startDate" type="text" name="start" />
				</div>
				
				<div class="domain">
					<h3 class = "zTree-h3">종료 날짜</h3>
				</div>
				<div class="domain">
					<input class="date" id="endDate" type="text" name="end" />
				</div>
				
			</form>
			
			<button class = "ok-button" type= "button" onclick="click_ok();">확인</button>
			
		</div>
	</div>
	
</body>
</html>