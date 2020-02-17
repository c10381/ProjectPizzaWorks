
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

</head>

<body>
	<script src="${pageContext.request.contextPath}/js/backendSystem/highcharts.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/series-label.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/data.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/exporting.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/export-data.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/accessibility.js"></script>

	<!-- -------------------------圓餅圖HTML------------------------------------ -->
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
			<input type="text" data-input id="endDate" /><a class="input-button"
				title="toggle" data-toggle> <i class="far fa-calendar-alt"></i>
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

		<!-- -------------------------------------折線圖HTML------------------------------------------------- -->

		<!-- 產品下拉式選單for Line Chart -->
		<div class="row">
			<b>選取一個產品名稱</b> <select id="productList"></select>
			<b>選取一個產品名稱</b> <select id="productList2"></select>
			<!-- 請選擇起迄兩個月 -->
			<!-- 小日曆-起日 -->
			<div class="calendar ml-3">
				<input type="text" data-input id="startDateLine" /><a
					class="input-button" title="toggle" data-toggle> <i
					class="far fa-calendar-alt"></i>
				</a>
			</div>
		</div>
		<!-- 送出鈕2 -->
		<div>
			<button id="btnAdd" onclick="sendLineChartInfo()">送出</button>
		</div>


		<!-- 呼叫折線圖 -->
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<figure class="highcharts-figure">
					<div id="container2"></div>
					<p class="highcharts-description">公式：[一定期間] [A披薩平均售價-平均成本]
						/[A披薩平均售價]</p>
				</figure>
			</div>
		</div>

		<!-- ----------------------------------------直方圖------------------------------------- -->
		<!-- 產品下拉式選單 -->
		<div>
			<select id="histogramDropList1"></select> 
			<select id="histogramDropList2"></select> 
			<select id="histogramDropList3"></select>
			<select id="histogramDropList4"></select> 
			<select id="histogramDropList5"></select>
			<!-- 送出鈕 -->
			<button id="btnAdd" onclick="sendHistogramInfo()">送出</button>
			<div class="calendar">
				<input type="text" data-input id="startDateHisotgram" /><a
					class="input-button" title="toggle" data-toggle> <i
					class="far fa-calendar-alt"></i>
				</a>
			</div>

			<!-- 小日曆-迄日 -->
			<div class="calendar">
				<input type="text" data-input id="endDateHisotgram" /><a
					class="input-button" title="toggle" data-toggle> <i
					class="far fa-calendar-alt"></i>
				</a>
			</div>
			<!-- 直方圖 -->
			<div class="col-lg-6 col-md-6 col-sm-6">
				<figure class="highcharts-figure">
					<div id="container3"></div>
					<p class="highcharts-description">Chart showing use of rotated
						axis labels and data labels. This can be a way to include more
						labels in the chart, but note that more labels can sometimes make
						charts harder to read.</p>
				</figure>
			</div>
		</div>
	

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
				showOptionsLineChart1(jsa_str);
				showOptionsLineChart2(jsa_str);
				showOptionsHistogram1(jsa_str);
				showOptionsHistogram2(jsa_str);
				showOptionsHistogram3(jsa_str);
				showOptionsHistogram4(jsa_str);
				showOptionsHistogram5(jsa_str);
			}
		});
		//PieChart下拉式選單-塞值
		function showOptions(jsa_str) {
			console.log(jsa_str);
			//var options = JSON.parse(jsa_str);<=Bug
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				//value是值，但顯示是名稱
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#show").append(option);
			}
			;
		};
		//LineChart下拉式選單-塞值1
		function showOptionsLineChart1(jsa_str) {
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				var option = $("<option>").val(options[i].productId).text(options[i].productName);
				$("#productList").append(option);
			}
			;
		};
		//LineChart下拉式選單-塞值2
		function showOptionsLineChart2(jsa_str) {
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				var option = $("<option>").val(options[i].productId).text(options[i].productName);
				$("#productList2").append(option);
			}
			;
		};
		//Histogram下拉式選單-塞值1
		function showOptionsHistogram1(jsa_str) {
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#histogramDropList1").append(option);
			}
			;
		};
		//Histogram下拉式選單-塞值2
		function showOptionsHistogram2(jsa_str) {
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#histogramDropList2").append(option);
			}
			;
		};
		//Histogram下拉式選單-塞值3
		function showOptionsHistogram3(jsa_str) {
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#histogramDropList3").append(option);
			}
			;
		};
		//Histogram下拉式選單-塞值4
		function showOptionsHistogram4(jsa_str) {
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#histogramDropList4").append(option);
			}
			;
		};
		//Histogram下拉式選單-塞值5
		function showOptionsHistogram5(jsa_str) {
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#histogramDropList5").append(option);
			}
			;
		};
		//小月曆-------------建立且在標籤中插入小月曆----------------------
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

		//---------------以下折線圖部分------------------

		////1. AJAX：折線圖(GET值)
		$.ajax({
			url : "${pageContext.request.contextPath}/LineChart",
			type : "GET",
			error : function(data2) {
				console.log("error");
			},
			success : function(data2) {
				showLineChart(data2);
			}
		});
		//2. 第一次呼叫折線圖(Highchart)
		function showLineChart(data2) {
			var dropListName = $("#productList option:selected").text();
			var dropListName2 = $("#productList2 option:selected").text();
			Highcharts.chart('container2', {
				chart : {
					width: 800
				},
				title : {
					text : '披薩毛利率趨勢'
				},

				subtitle : {
					text : '資料來源：1. 產品資料表；2. 食材BOM表、3. 進貨歷史資料表；4. 單位轉換表'
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
						rangeDescription : '範圍：3個月'
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
						//起年(yyyy)，起月(0為1月)，起日(1為1日)
						pointStart : Date.UTC(2020, 0, 1),
						pointIntervalUnit : 'month'
					}
				},

				series : [ {
					name : dropListName,
					data : [ data2, 0.5, 0.4, 0.45, 0.55 ]
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
		};

		//3. AJAX：折線圖(POST後GET值)
		function sendLineChartInfo() {
			//宣告一個JSON變數，儲存下拉式選單的值
			var test_input = {
				productId : $("#productList").val(),
				startDateLine : $("#startDateLine").val(),
				productId2 : $("#productList2").val(),
			}
			//test_input.productId = $("#productList").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/LineChartPost",
				data : {
					//POST方法下的Query String(value為一JSONObj)
					"lineChartInfo" : JSON.stringify(test_input)
				},
				type : "POST",
				success : function(data) {
					//以空字串取代原來div內的東西，再生成圖片
					$("#container2").html("");
					showLineChart2(data);
				}
			});
		}
		//4. POST後的折線圖
		function showLineChart2(data) {
			//欲POST的下拉式選單內容
			var dropListName = $("#productList option:selected").text();
			var dropListName2 = $("#productList2 option:selected").text();
			//將後端傳回的字串年月日轉成整數型別
			var startYearInt = parseInt(data.startYear);
			var startMonthInt = parseInt(data.startMonth);
			var startDayInt = parseInt(data.startDay);
			
			Highcharts.chart('container2', {
				title : {
					text : '披薩毛利率趨勢'
				},

				subtitle : {
					text : '資料來源：1. 產品資料表；2. 食材BOM表、3. 進貨歷史資料表；4. 單位轉換表'
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
						rangeDescription : '範圍：3個月'
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
						//(2020y,1m,1d)
						//做活的，直接在前端拆解小月曆的年月日(Date.UTC是網路語法)
						//Month-1是因為JS月份從1起算，+3是因為前端傳endDate後端引用startDate(-3)
						pointStart : Date.UTC(startYearInt, startMonthInt,
								startDayInt),
						pointIntervalUnit : 'month'
					}
				},
				//放入單一產品折線圖(值)
				series : [ 
					{
						name : dropListName,
						data : [ data.oneProductGp1, data.oneProductGp2,
							 data.oneProductGp3, data.oneProductGp4, data.oneProductGp5 ]
					},
					{
						name : dropListName2,
						data : [ data.oneProductGp6, data.oneProductGp7,
							 data.oneProductGp8, data.oneProductGp9, data.oneProductGp10 ]
					}
					],
				//不攸關
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
		};

		//-----------------------------------以下直方圖----------------------------------
		//1. AJAX：第一次呼叫直方圖(GET值)
		$.ajax({
			//去此處抓值
			url : "${pageContext.request.contextPath}/HistogramGet",
			type : "GET",
			error : function(data) {
				console.log("error");
			},
			success : function(data) {
				showHistogram(data);
				console.log(data);
			}
		});
		//2. 第一次呼叫直方圖，塞入標籤
		function showHistogram(data) {
			var histogramDropList1 = $("#productList1 option:selected").text();
			var histogramDropList2 = $("#productList2 option:selected").text();
			var histogramDropList3 = $("#productList3 option:selected").text();
			var histogramDropList4 = $("#productList4 option:selected").text();
			var histogramDropList5 = $("#productList5 option:selected").text();
			
			Highcharts
					.chart(
							'container3',
							{
								chart : {
									type : 'column'
								},
								title : {
									text : '銷售額佔比直方圖'
								},
								subtitle : {
									text : '資料來源：訂單'
								},
								xAxis : {
									type : 'category',
									labels : {
										rotation : -45,
										style : {
											fontSize : '13px',
											fontFamily : 'Verdana, sans-serif'
										}
									}
								},
								yAxis : {
									min : 0,
									title : {
										text : '%'
									}
								},
								legend : {
									enabled : false
								},
								tooltip : {
									pointFormat : 'Population in 2017: <b>{point.y:.1f} millions</b>'
								},
								series : [ {
									name : '披薩種類',
									data : [ [ '炭火食肉披薩(大)', data.product1 ],
											[ '炭火食肉披薩(小)', data.product2 ],
											[ '白醬鮭魚披薩(大)', data.product3 ],
											[ '白醬鮭魚披薩(小)', data.product4 ],
											[ '美式嗆司臘腸披薩(大)', data.product5 ], ],
									dataLabels : {
										enabled : true,
										rotation : -90,
										color : '#FFFFFF',
										align : 'right',
										format : '{point.y:.1f}', // one decimal
										y : 10, // 10 pixels down from the top
										style : {
											fontSize : '13px',
											fontFamily : 'Verdana, sans-serif'
										}
									}
								} ]
							});
		}
		//3. AJAX：折線圖(POST後GET值)
		function sendHistogramInfo() {
			var JSONObject = {
				productId1 : $("#histogramDropList1").val(),
				productId2 : $("#histogramDropList2").val(),
				productId3 : $("#histogramDropList3").val(),
				productId4 : $("#histogramDropList4").val(),
				productId5 : $("#histogramDropList5").val(),
				startDate : $("#startDateHisotgram").val(),
				endDate : $("#endDateHisotgram").val(),
			}
			var histogramDropList1 = $("#productList1 option:selected").text();
			var histogramDropList2 = $("#productList2 option:selected").text();
			var histogramDropList3 = $("#productList3 option:selected").text();
			var histogramDropList4 = $("#productList4 option:selected").text();
			var histogramDropList5 = $("#productList5 option:selected").text();
			/* console.log($("#startDateLine").val());
			console.log($("#endDateLine").val());
			 */
			//test_input.productId = $("#productList").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/HistogramPost",
				data : {
					//POST方法下的Query String(value為一JSONObj)
					"HistogramInfo" : JSON.stringify(JSONObject)
				},
				type : "POST",
				success : function(data) {
					console.log(data);
					//以空字串取代原來div內的東西，再生成圖片
					$("#container3").html("");
					showHistogramPost(data);
				}
			});
		}
		//4. Post後直方圖(Highchart)
		function showHistogramPost(data) {
			Highcharts
					.chart(
							'container3',
							{
								chart : {
									type : 'column'
								},
								title : {
									text : '銷售額佔比直方圖'
								},
								subtitle : {
									text : 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
								},
								xAxis : {
									type : 'category',
									labels : {
										rotation : -45,
										style : {
											fontSize : '13px',
											fontFamily : 'Verdana, sans-serif'
										}
									}
								},
								yAxis : {
									min : 0,
									title : {
										text : 'Population (millions)'
									}
								},
								legend : {
									enabled : false
								},
								tooltip : {
									pointFormat : 'Population in 2017: <b>{point.y:.1f} millions</b>'
								},
								series : [ {
									name : 'Population',
									data : [ [ '產品1', data.product1 ],
											[ '產品2', data.product2 ],
											[ '產品3', data.product3 ],
											[ '產品4', data.product4 ],
											[ '產品5', data.product5 ], ],
									dataLabels : {
										enabled : true,
										rotation : -90,
										color : '#FFFFFF',
										align : 'right',
										format : '{point.y:.1f}', // one decimal
										y : 10, // 10 pixels down from the top
										style : {
											fontSize : '13px',
											fontFamily : 'Verdana, sans-serif'
										}
									}
								} ]
							});
		}
	</script>
</body>

</html>