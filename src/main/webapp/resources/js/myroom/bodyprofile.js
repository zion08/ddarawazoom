// ajax로 view -> controller로 여러개의 값 전송할 때 필요한 코드
$.fn.serializeObject = function(){
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		var name = $.trim(this.name),
			value = $.trim(this.value);
		
		if (o[name]) {
			if (!o[name].push) {
				o[name] = [o[name]];
			}
			o[name].push(value || '');
		} else {
			o[name] = value || '';
		}
	});
	return o;
};


// 몸무게 그래프
$(document).ready(function(){
	var weight = new Array();
		var date = new Array();
		$.ajax({
			type: "post",
			url: "/myroom/getBodyList", 
			dataType: "json",
			async: false,
			success: function(result){
				var bodyList = JSON.stringify(result);
				var jsonList = JSON.parse(bodyList);
				
				console.log(jsonList);
				
				for(var i = 0; i < jsonList.length; i++){
					
					var b_list = jsonList[i];
					
					weight.push(jsonList[i].b_weight);
					
					// 날짜 리스트 안에 가져온 날짜 정보를 주입
					date.push(b_list.parse_date);
				}
			}
		});
		
		console.log(weight);
		console.log(date);
		
		var ctx = document.getElementById('weightChart').getContext('2d');
			var chart = new Chart(ctx, { 
				type: 'line', 
				data: {
					labels: date,
					datasets: [
						{
							label: '몸무게',
							backgroundColor: '#80b6f4',
                            borderColor: '#80b6f4',
                            pointBorderColor: '#80b6f4',
                            pointBackgroundColor: '#80b6f4', 
                            pointHoverBackgroundColor: 'white', //hover시 pointBacground
                            pointHoverBorderColor: '#black',
			                borderWidth: 3,
			                fillColor: "#79D1CF",
			                strokeColor: "#79D1CF",
			                display : true,
			                fill: false,
							data: weight
						}]
					},
				options: {
					maintainAspectRatio: false, //차트 비율 유지하지 않음
					randing: true,
					tooltips: {
						enabled:false
					}, // hover시 보였던 툴팁 제거
					hover: {
						animationDuration: 0
					}, // 차트 위에 값 나타내기
					animation: {
						duration: 1,
						onComplete: function(){
							var chartInstance = this.chart,
	                        ctx = chartInstance.ctx;
		                    ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
		        			ctx.textAlign = "center";
		    				ctx.font = "22px Open Sans";
		    				ctx.fillStyle = 'black';
	    				
	    				
		    				Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
		    					var meta = chartInstance.controller.getDatasetMeta(i);
		    					Chart.helpers.each(meta.data.forEach(function (bar, index) {
		    						data = dataset.data[index];
		    						if(i==0){
		    							ctx.fillText(data, bar._model.x+18, bar._model.y-15); 
		    						} else {
		    							ctx.fillText(data, bar._model.x+18, bar._model.y-15);
		    						}
		    					}),this)
		    				}),this);
		    			}
		    		},
					responsive: true,
					legend:{
						display:false
					},
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
							ticks:{
								fontColor : 'rgba(12, 13, 13, 1)',
								fontSize : 14
							}
						}],
						yAxes: [{
							ticks:{
								max:150,
								min: 0,
								stepSize: 10,
								autoSkip: false,
								fontColor : 'rgba(12, 13, 13, 1)',
								fontSize : 13
							},
							stacked: true
						}]
					},
					interaction: {
						mode: 'index',
						intersect: false,
					},
						title: {
							display: true,
							text: '몸무게 변화',
							fontSize: 23
						}
					}
				});
			});
		
		

// 근육량 체지방량 그래프		
$(document).ready(function(){
	
	var muscle = new Array();
	var bodyfat = new Array();
	var date = new Array();
	
	$.ajax({
		type: "post",
		url: "/myroom/getBodyList", 
		dataType: "json",
		async: false,
		success: function(result){
			var bodyList = JSON.stringify(result);
			var jsonList = JSON.parse(bodyList);
			
			for(var i = 0; i < jsonList.length; i++){
				
				var b_list = jsonList[i];
				
				muscle.push(jsonList[i].b_muscle);
				bodyfat.push(jsonList[i].b_bodyfat);
				date.push(b_list.parse_date);
			}
		}
	});
	
	console.log(muscle);
	console.log(bodyfat);
	
	var ctx = document.getElementById('muscleBodyChart').getContext('2d');
		var chart = new Chart(ctx, { 
			type: 'bar', 
			data: {
				labels: date,
				datasets: [
					{
						label: '근육량',
						backgroundColor: '#0066ff',
					    borderColor: '#0066ff',
					    pointHoverBackgroundColor: 'white',
                        pointHoverBorderColor: '#black',
		                borderWidth: 3,
		                display : true,
		                fill: false,
		                stack: 'combined',
		                type: 'line',
						data: muscle
					},
					{
						label: '체지방량',
						backgroundColor: '#ff91c2',
		                borderColor: '#ff91c2',
		                display : true,
		                fill: false,
		                stack: 'combined',
		                type:'bar',
						data: bodyfat
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
							max:50,
							min: 0,
							stepSize:10,
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
					display: true,
					text: '근육량 / 체지방량 변화',
					fontSize:23
				}
			},
		});
	});
				
				
// 바디 사이즈 그래프				
$(document).ready(function(){
		var chest = new Array();
		var waist = new Array();
		var arm = new Array();
		var thigh = new Array();
		var hip = new Array();
		var date = new Array();

		$.ajax({
			type: "post",
			url: "/myroom/getBodyList", 
			dataType: "json",
			async: false,
			success: function(result){
				var bodyList = JSON.stringify(result);
				var jsonList = JSON.parse(bodyList);
				
				console.log(jsonList.length);
				
				for(var i = 0; i < jsonList.length; i++){
					
					var b_list = jsonList[i];
					
					chest.push(jsonList[i].b_chest);
					waist.push(jsonList[i].b_waist);
					arm.push(jsonList[i].b_arm);
					thigh.push(jsonList[i].b_thigh);
					hip.push(jsonList[i].b_hip);
					date.push(b_list.parse_date);
				}
			}
		});
		
		console.log(chest);
		console.log(waist);
		console.log(arm);
		console.log(thigh);
		console.log(hip);
		console.log(date);
		
		var ctx = document.getElementById('bodySizeChart').getContext('2d');
			var chart = new Chart(ctx, { 
				type: 'horizontalBar', 
				data: {
					labels: date,
					datasets: [
						{
							label: '가슴 둘레',
							backgroundColor: '#ff91c2',
			                borderColor: '#ff91c2',
			                borderWidth: 2,
			                display : true,
							data: chest
						},
						{
							label: '허리 둘레',
							backgroundColor: '#FFE4B5',
			                borderColor: '#FFE4B5',
			                borderWidth: 2,
			                display : true,
							data: waist
						},
						{
							label: '팔뚝 둘레',
							backgroundColor: '#FFB6C1',
			                borderColor: '#FFB6C1',
			                borderWidth: 2,
			                display : true,
							data: arm
						},
						{
							label: '허벅지 둘레',
							backgroundColor: '#66CDAA',
			                borderColor: '#66CDAA',
			                borderWidth: 2,
			                display : true,
							data: thigh
						},
						{
							label: '엉덩이 둘레',
							backgroundColor: '#9370DB',
			                borderColor: '#9370DB',
			                borderWidth: 2,
			                display : true,
							data: hip
						}]
					},
				options: {
					responsive: true,
					tooltips: {
						enabled:true
					},
					hover: {
						animationDuration: 0
					},
					elements: {
						line: {
							fill: false
						},
						point: {
							hoverRadius: 7,
							radius: 5
						}
					},
					scales: {
						xAxes: [{
							ticks: {
							display: false,
							fontColor : 'rgba(12, 13, 13, 1)',
							fontSize : 15
							},
							gridLines: {
								display:false,
								drawBorder: false
							},
							stacked: true
						}],
						yAxes: [{
							ticks:{
								max:400,
								min: 0,
								stepSize:100,
								autoSkip: false,
								fontColor : 'rgba(12, 13, 13, 1)',
								fontSize : 15
							},
							stacked: true
						}]
					},
					interaction: {
						mode: 'index',
						intersect: false,
					},
					title: {
						display: true,
						text: '바디 사이즈 변화',
						fontSize: 25
					}
				},
			});
		});
