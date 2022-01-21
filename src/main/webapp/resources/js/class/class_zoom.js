document.addEventListener('DOMContentLoaded', function calendarEvent(eventData) {
		var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      locale: 'ko',
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      eventClick: function(arg) {
	    	  console.log(arg);
	    	  
	    	  window.location="/ddarawazoom/zclasscontent?num="+arg.event.id;
	      },	
	      
	      events: getEvent()
	      
	    });

	    calendar.render();
	  });
	