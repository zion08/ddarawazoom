
$(document).ready(function(){
	  
	var amountData = new Array();
	var payData = new Array();
	
	var maxAmount;
	
	$.ajax({
	  url : "/coachroom/getPayment",
	  type : "post",
	  contentType : "application/json; charset=UTF-8",
	  success : function(data){
		  console.log(data);
  
		  for(var key in data){
			  
			  if(data[key] > 0){
				  console.log(key);
				  payData.push(key);
				  
				  console.log(data[key]);
				  amountData.push(data[key]);
			  }
			  
		  }
		  
		  maxAmount = Math.max(...amountData);
		  
		  console.log(payData);
		  console.log(amountData);
		  console.log(maxAmount);
	  }
	})
	
	feather.replace({ 'aria-hidden': 'true' })
  
	// Graphs
	var ctx = document.getElementById('myChart')
	// eslint-disable-next-line no-unused-vars
	var myChart = new Chart(ctx, {
	  type: 'line',
	  data: {
		labels: payData,
		datasets: [{
			label: '월별 매출 (단위: 원)',
			backgroundColor: '#0066ff',
			borderColor: '#0066ff',
			pointHoverBackgroundColor: 'white',
			pointHoverBorderColor: '#black',
			borderWidth: 3,
			display : true,
			fill: false,
			stack: 'combined',
			type: 'line',
			data: amountData
		}]
	  },
	  options: {
		  elements: {
			  line: {
				  fill: false
			  },
			  point: {
				  hoverRadiuse: 7,
				  radius: 5
			  }
		  },
		  scales: {
			  xAxes: [{
				  ticks: {
					  fontColor : 'rgba(12, 13, 13, 1)',
					  fontSize : 15
					  }
				  }],
			  yAxes: [{
				  ticks:{
					  max: maxAmount,
					  min: 0,
					  stepSize:500,
					  autoSkip: false,
					  fontColor : 'rgba(12, 13, 13, 1)',
					  fontSize : 14
				  },
				  stacked: true
			  }]
		  },
		  interaction: {
			  mode: 'index',
			  intersect: false,
		  },
		  title: {
			  display: false
		  }
	  }
	})
  });