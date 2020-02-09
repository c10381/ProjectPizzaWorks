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
</style>

</head>

<body>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>

	<div>
		<b>選取一個產品名稱</b> <select id="show"></select>
		<div class="flatpickr">
			<input type="text" data-input id="startDate"/> <a class="input-button"
				title="toggle" data-toggle> <i class="far fa-calendar-alt"></i>
			</a>
		</div>
	</div>

	<div>
		<button id="btnAdd" onclick="sendProduct()">送出</button>
	</div>

	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-6">
			<figure class="highcharts-figure">
				<div id="container1"></div>
				<p class="highcharts-description">公式：[一定期間] [A披薩銷售額 / 所有披薩銷售額]</p>
			</figure>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-6">
			<figure class="highcharts-figure">
				<div id="container2"></div>
				<p class="highcharts-description">公式：[一定期間] [A披薩平均售價-平均成本]
					/[A披薩平均售價]</p>
				<input type="button" onclick="test_chart()" value="test">
			</figure>
		</div>
	</div>


	<script>
	
		function insertTime() {
			flatpickr(".flatpickr", {
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
		insertTime();
		
		function sendProduct() {
			console.log($("#show").val());
			console.log($("#startDate").val());
			console.log(document.getElementById("startDate").value);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/catchPInfoFromClient",
				data : {
					"jsa_str" : $("#show").val()
				},
				type : "POST",
				success : function(data) {
				console.log('reach');
				//以空字串取代原來div內的東西，再生成圖片
				$("#container1").html("");
				showPieChart2(data);
				}
			});
		};

		//呈現現有產品名稱的下拉式選單
		$.ajax({
			url : "${pageContext.request.contextPath}/pDropDownMenu",
			type : "GET",
			error : function(jsa_str) {
				console.log("error");
			},
			success : function(jsa_str) {
				console.log('reach');
				console.log(jsa_str);
				showOptions(jsa_str);
			}
		});

		//呼叫圓餅圖要的資料的ajax
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
		//呼叫折現圖要的資料的ajax
		$.ajax({
			url : "${pageContext.request.contextPath}/LineChart",
			type : "GET",
			error : function(data2) {
				console.log("error");
			},
			success : function(data2) {
				console.log(data2);
				showLineChart(data2);
			}
		});
		//讀取Jsonarray_Str給option標籤函式
		function showOptions(jsa_str) {
			console.log(jsa_str);
			//var options = JSON.parse(jsa_str);
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				console.log(options.length);
				console.log(options[i].productName);
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#show").append(option);
			}
		}
		//呈現圓餅圖函式
		function showPieChart(data1) {
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
									text : 'Browser market shares in January, 2018'
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
										name : 'product1',
										y : data1.product1,
										sliced : true,
										selected : true
									}, {
										name : 'product2',
										y : data1.product2
									}, {
										name : 'other',
										y : 1 - data1.product1 - data1.product2
									} ]
								} ]
							});
		};
		//POST後的圓餅圖
		function showPieChart2(data) {
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
									text : 'Browser market shares in January, 2018'
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
										name : 'product1',
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
		//呈現折現圖函式
		function showLineChart(data2) {
			Highcharts.chart('container2', {

				title : {
					text : '2020/1~3炭火食肉披薩毛利率趨勢'
				},

				subtitle : {
					text : ''
				},

				yAxis : {
					title : {
						text : '毛利率'
					}
				},

				xAxis : {
					type : 'datetime',
					dateTimeLabelFormats : {
						month : '%Y-%m'
					},
					accessibility : {
						rangeDescription : '範圍：2020/1-3'
					}
				},

				legend : {
					layout : 'vertical',
					align : 'right',
					verticalAlign : 'middle'
				},

				plotOptions : {
					series : {
						label : {
							connectorAllowed : true
						},
						pointStart : Date.UTC(2020, 0, 1),
						pointIntervalUnit : 'month'
					}
				},

				series : [ {
					name : '炭火食肉披薩',
					data : [ data2, 0.5, 0.4 ]
				} ],

				responsive : {
					rules : [ {
						condition : {
							maxWidth : 500
						},
						chartOptions : {
							legend : {
								layout : 'horizontal',
								align : 'center',
								verticalAlign : 'bottom'
							}
						}
					} ]
				}
			});
		}

		function test_chart() {
			console.log('test reach');
		}
	</script>
</body>

</html>