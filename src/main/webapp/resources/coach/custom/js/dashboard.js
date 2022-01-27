	/* globals Chart:false, feather:false */

	$(document).ready(function(){
	  'use strict'
	  
	  var amountData = new Array();
	  var payData = new Array();
	  
	  $.ajax({
		url : "/coachroom/getPayment",
		type : "post",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			console.log(data);
	
			for(var key in data){
				console.log(key);
				payData.push(key);
				
				console.log(data[key]);
				amountData.push(data[key]);
			}
			console.log(payData);
			console.log(amountData);
		}
	  });
	  
	  feather.replace({ 'aria-hidden': 'true' })
	
	  // Graphs
	  var ctx = document.getElementById('myChart')
	  // eslint-disable-next-line no-unused-vars
	  var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: payData,
	      datasets: [{
	        data: amountData,
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
