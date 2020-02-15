
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.highcharts-figure, .highcharts-data-table table {
	min-width: 320px;
	max-width: 800px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

input[type="number"] {
	min-width: 50px;
}

#container {
	height: 400px;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 310px;
	max-width: 800px;
	margin: 1em auto;
}

#datatable {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

#datatable caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

#datatable th {
	font-weight: 600;
	padding: 0.5em;
}

#datatable td, #datatable th, #datatable caption {
	padding: 0.5em;
}

#datatable thead tr, #datatable tr:nth-child(even) {
	background: #f8f8f8;
}

#datatable tr:hover {
	background: #f1f7ff;
}

#container {
	height: 400px;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 310px;
	max-width: 800px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}
</style>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
</head>

<body>


	<section class="content">
		<div class="container-fluid text-center">
			<!-- -------------------------圓餅圖------------------------------------ -->
			<div class="row">
				<div class="col-md-4">
					<div id="select_products"></div>
					<select class="select_products" multiple="multiple"></select>
				</div>
				<div class="col-md-2">
					<button class="btn btn-primary" onclick="getSelectedOptions()">測試輸出</button>
				</div>
			</div>
			<div>
				<!-- 產品下拉式選單 -->
				<b>選取一個產品名稱</b><select id="show"></select>
				<!-- 小日曆-起日 -->
				<div class="calendar">
					<input type="text" data-input id="startDate" /><a
						class="input-button" title="toggle" data-toggle> <i
						class="far fa-calendar-alt"></i>
					</a>
				</div>

				<!-- 小日曆-迄日 -->
				<div class="calendar">
					<input type="text" data-input id="endDate" /><a
						class="input-button" title="toggle" data-toggle> <i
						class="far fa-calendar-alt"></i>
					</a>
				</div>
			</div>
			<!-- 送出鈕1 -->
			<div>
				<button id="btnAdd" onclick="sendPieChartInfo()">送出</button>
			</div>

			<!-- 呼叫圓餅圖 -->

			<div class="col-lg-6 col-md-6 col-sm-6">
				<figure class="highcharts-figure">
					<div id="container1"></div>
					<p class="highcharts-description">公式：[一定期間] [A披薩銷售額 / 所有披薩銷售額]</p>
				</figure>
			</div>
		</div>
	</section>
	<script>
		//下拉式選單Get值(共用)
		$.ajax({
			url : "${pageContext.request.contextPath}/pDropDownMenu",
			type : "GET",
			error : function(jsa_str) {
				console.log("error");
			},
			success : function(jsa_str) {
				showOptions(jsa_str);
				showOptions_test(jsa_str);
			}
		});
		
		//PieChart下拉式選單-塞值
		function showOptions_test(jsa_str) {
			console.log(jsa_str);
			//var options = JSON.parse(jsa_str);<=Bug
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				//value是值，但顯示是名稱
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#show").append(option);
				//$("#select_products").append(option);
			}
		};
		
		var input_option = []; 
		
		function getSelectedOptions(){
			var selected_option = $("div.selected");
			input_option.length = 0;
			for(let i = 0; i<selected_option.length; i++){
				let option = new Object();
				option["productId"] = selected_option[i].dataset.value; 
				option["productName"] = selected_option[i].innerText;
				input_option.push(option);
			}
			console.log(input_option);
		}
		
		//PieChart下拉式選單-塞值
		function showOptions(jsa_str) {
			//console.log(jsa_str);
			//var options = JSON.parse(jsa_str);<=Bug
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				//value是值，但顯示是名稱
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				//$("#show").append(option);
				$(".select_products").append(option);
			}

			$('.select_products').fSelect({
				placeholder : '請選擇產品',
				numDisplayed : 3,
				overflowText : '已選擇 {n} 產品',
				noResultsText : '搜尋無結果',
				searchText : '搜尋',
				showSearch : true
			});
		};

		//小月曆-------------建立且在標籤中插入小月曆----------------------
		function insertTimeGroup(){
			flatpickr({
			    "plugins": [new rangePlugin({ input: "#secondRangeInput"})]
			});
		}
		
		function insertTime() {
			flatpickr(".calendar", {
				altInputClass : "form-group",
				//enableTime : true,
				plugins : [ new confirmDatePlugin({
					confirmText : "確定",
					showAlways : false,
					theme : "light"
				}) ],
				//time_24hr : true,
				//minDate : "today",
				//maxDate : new Date().fp_incr(7),
				wrap : true,
			});
		}
		//跑上述函式
		insertTime();

		//----------------------------圓餅圖--------------------------------

		//1. AJAX：圓餅圖(GET值)
		$.ajax({
			//去此處抓值
			url : "${pageContext.request.contextPath}/PieChartTest_proto",
			type : "GET",
			error : function(data1) {
				console.log("error");
			},
			success : function(data1) {
				showPieChart(data1);
			}
		});
		
		//2. 第一次呼叫圓餅圖(Highchart)
		function showPieChart(data1) {
			var dropListName = $("#show option:selected").text();
			Highcharts
					.chart(
							//等於<div id=container1>
							'container1',
							{
								chart : {
									plotBackgroundColor : null,
									plotBorderWidth : null,
									plotShadow : false,
									type : 'pie'
								},
								title : {
									text : '披薩銷售額佔比圓餅圖'
								},
								subtitle : {
									text : '資料來源：訂單'
								},
								tooltip : {
									pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
								},
								accessibility : {
									point : {
										valueSuffix : '%'
									}
								},
								plotOptions : {
									pie : {
										allowPointSelect : true,
										cursor : 'pointer',
										dataLabels : {
											enabled : true,
											format : '<b>{point.name}</b>: {point.percentage:.1f} %'
										}
									}
								},
								series : [ {
									name : 'Brands',
									colorByPoint : true,
									data : [ {
										name : dropListName,
										y : data1.product1,
										sliced : true,
										selected : true
									}, {
										name : '其他',
										y : 1 - data1.product1
									} ]
								} ]
							});
		};
		
		//3. AJAX：圓餅圖(POST後GET值)
		function sendPieChartInfo() {
			$.ajax({
				url : "${pageContext.request.contextPath}/PieChartPost",
				data : {
					//POST方法下的Query String
					"jsa_str" : $("#show").val(),
					"startDate" : document.getElementById("startDate").value,
					"endDate" : document.getElementById("endDate").value
				},
				type : "POST",
				success : function(data) {
					//以空字串取代原來div內的東西，再生成圖片
					$("#container1").html("");
					showPieChart2(data);
				}
			});
		};
		//4. POST後的圓餅圖
		function showPieChart2(data) {
			var dropListName2 = $("#show option:selected").text();
			Highcharts
					.chart(
							'container1',
							{
								chart : {
									plotBackgroundColor : null,
									plotBorderWidth : null,
									plotShadow : false,
									type : 'pie'
								},
								title : {
									text : '披薩銷售額佔比圓餅圖'
								},
								subtitle : {
									text : '資料來源：訂單'
								},
								tooltip : {
									pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
								},
								accessibility : {
									point : {
										valueSuffix : '%'
									}
								},
								plotOptions : {
									pie : {
										allowPointSelect : true,
										cursor : 'pointer',
										dataLabels : {
											enabled : true,
											format : '<b>{point.name}</b>: {point.percentage:.1f} %'
										}
									}
								},
								series : [ {
									name : '披薩名稱',
									colorByPoint : true,
									data : [ {
										name : dropListName2,
										y : data.product1,
										sliced : true,
										selected : true
									}, {
										name : 'other',
										y : 1 - data.product1
									} ]
								} ]
							});
		};
	</script>
</body>

</html>