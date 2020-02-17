
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.highcharts-figure  {
	min-width: 320px;
	max-width: 90%;
	margin: 1em auto;
}

.highcharts-container{
	height: 70vh; 
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

</style>
<script src="${pageContext.request.contextPath}/js/backendSystem/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/js/backendSystem/series-label.js"></script>
<script src="${pageContext.request.contextPath}/js/backendSystem/data.js"></script>
<script src="${pageContext.request.contextPath}/js/backendSystem/exporting.js"></script>
<script src="${pageContext.request.contextPath}/js/backendSystem/export-data.js"></script>
<script src="${pageContext.request.contextPath}/js/backendSystem/accessibility.js"></script>
<script src="${pageContext.request.contextPath}/js/backendSystem/rangePlugin.js"></script>
</head>

<body>


	<section class="content">
		<div class="container-fluid text-center">
			<!-- -------------------------圓餅圖------------------------------------ -->
			<div class="row">
				<div class="col-md-4">
					<div id="select_products">
						<label>選擇產品：</label>
						<select class="select_products" multiple="multiple"></select>
					</div>
				</div>
				<!-- col end -->
				<div class="col-md-6">
					<label>起始日期：<input placeholder="Select Date"
						id="select_date" /></label> <label>結束日期：<input
						placeholder="Select Date" id="select_date2" /></label>
				</div>
				<!-- col end -->
				<div class="col-md-2">
					<button class="btn btn-primary" onclick="sendPieChartInput()">統計銷量</button>
				</div>
				<!-- col end -->
			</div>
			<!-- row end -->
			<div class="row">
				<!-- 呼叫圓餅圖 -->
				<div class="col-lg-12 col-md-12 col-sm-12">
					<figure class="highcharts-figure">
						<div id="container1"></div>
						<p class="highcharts-description">公式：[一定期間] [A披薩銷售額 / 所有披薩銷售額]</p>
					</figure>
				</div>
			</div>
			<!-- row end -->
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
			}
		});

		var input_json = {};

		function getSelectedOptions() {
			var selected_option = $("div.selected");
			var input_option = [];
			var flag = false;
			for (let i = 0; i < selected_option.length; i++) {
				let option = new Object();
				option["productId"] = selected_option[i].dataset.value;
				option["productName"] = selected_option[i].innerText;
				input_option.push(option);
				flag = true;
			}
			input_json["input_option"] = input_option;

			let start_date = $("#select_date").val();
			let end_date = $("#select_date2").val();
			if (!(start_date == "" || end_date == "")) {
				input_json["startDate"] = $("#select_date").val();
				input_json["endDate"] = $("#select_date2").val();
			} else {
				alert("請選擇時間區間!");
				return false;
			}
			console.log(input_json);
			return flag
		}

		//PieChart下拉式選單-塞值
		function showOptions(jsa_str) {
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
		function insertTimeGroup() {
			flatpickr("input", {
				"plugins" : [ new rangePlugin({
					input : "#select_date2",
				}) ]
			});
		}
		insertTimeGroup();

		//3. AJAX：圓餅圖(POST後GET值)
		function sendPieChartInput() {
			if (getSelectedOptions()) {
				$
						.ajax({
							url : "${pageContext.request.contextPath}/GetPieChartValue",
							data : {
								"input_json" : JSON.stringify(input_json)
							},
							type : "POST",
							success : function(data) {
								//以空字串取代原來div內的東西，再生成圖片
								var pie_value = [];
								var remaining = 1;
								for (let i = 0; i < data.length; i++) {
									pie_value_object = new Object();
									let y = data[i].productValue;
									pie_value_object["name"] = data[i].productName;
									pie_value_object["y"] = y;
									pie_value_object["sliced"] = true;
									pie_value_object["selected"] = false;
									remaining -= y;
									pie_value.push(pie_value_object);
								}
								pie_value_object = new Object();
								pie_value_object["name"] = "其他";
								pie_value_object["y"] = remaining;
								pie_value.push(pie_value_object);
								$("#container1").html("");
								showPieChartByData(pie_value);
							}
						});
			}
		};

		//4. POST後的圓餅圖
		function showPieChartByData(data) {
			console.log(data);
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
									name : '銷售比例',
									colorByPoint : true,
									data : data
								} ]
							});
		};

		//小月曆-------------建立且在標籤中插入小月曆----------------------
		function insertTimeGroup() {
			flatpickr("input", {
				"plugins" : [ new rangePlugin({
					input : "#select_date2",
				}) ]
			});
		}
		insertTimeGroup();

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
	</script>
</body>

</html>