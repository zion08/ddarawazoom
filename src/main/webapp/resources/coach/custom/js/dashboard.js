/* globals Chart:false, feather:false */

$(document).ready(function(){
  'use strict'
  
  var amountData = new Array();
  var paidDate = new Array();
  
  $.ajax({
	url : "/coachroom/getPayment",
	type : "post",
	contentType : "application/json; charset=UTF-8",
	success : function(data){
		console.log(data);
		
		for (var i = 0; i < data.length; i++){
			
		}
	}
  });
  
  feather.replace({ 'aria-hidden': 'true' })

  // Graphs
  var ctx = document.getElementById('myChart')
  // eslint-disable-next-line no-unused-vars
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday'
      ],
      datasets: [{
        data: [
          15339,
          21345,
          18483,
          24003,
          23489,
          24092,
          12034
        ],
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: '#007bff',
        borderWidth: 4,
        pointBackgroundColor: '#007bff'
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: false
          }
        }]
      },
      legend: {
        display: false
      }
    }
  })
})
