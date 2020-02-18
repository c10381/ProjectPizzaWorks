
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.highcharts-figure {
	min-width: 320px;
	max-width: 90%;
	margin: 1em auto;
}

.highcharts-container {
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
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/highcharts.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/series-label.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/data.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/exporting.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/export-data.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/accessibility.js"></script>

	<!-- -------------------------------------折線圖HTML------------------------------------------------- -->

	<!-- 產品下拉式選單for Line Chart -->
	<div class="row">
		<div class="col-md-3">
			<div class="col-sm-12">
				<label><b>選取一個產品名稱</b> <select id="productList"></select></label>
			</div>
			<div class="col-sm-12">
				<label><b>選取一個產品名稱</b><select id="productList2"></select></label>
			</div>
		</div>
		<!-- 請選擇起迄兩個月 -->
		<!-- 小日曆-起日 -->
		<div class="calendar col-md-3">
			<b>選取起日</b>
			<input type="text" data-input id="startDateLine" /><a
				class="input-button" title="toggle" data-toggle> <i
				class="far fa-calendar-alt"></i>
			</a>
		</div>

		<!-- 送出鈕2 -->
		<div class="col-md-2">
			<button class="btn btn-primary" id="btnAdd" onclick="sendLineChartInfo()">送出</button>
		</div>
	</div>

	<!-- 呼叫折線圖 -->
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
		<!-- <div> -->
			<figure class="highcharts-figure">
				<div id="container2"></div>
				<p class="highcharts-description">公式：[一定期間] [A披薩平均售價-平均成本]
					/[A披薩平均售價]</p>
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
				showOptionsLineChart1(jsa_str);
				showOptionsLineChart2(jsa_str);
			}
		});
		//LineChart下拉式選單-塞值1
		function showOptionsLineChart1(jsa_str) {
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#productList").append(option);
			}
			;
		};
		//LineChart下拉式選單-塞值2
		function showOptionsLineChart2(jsa_str) {
			var options = jsa_str;
			for (i = 0; i < options.length; i++) {
				var option = $("<option>").val(options[i].productId).text(
						options[i].productName);
				$("#productList2").append(option);
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
						pointStart : Date.UTC(startYearInt, startMonthInt+2,
								startDayInt),
						pointIntervalUnit : 'month'
					}
				},
				//放入單一產品折線圖(值)
				series : [
						{
							name : dropListName,
							data : [ data.oneProductGp1, data.oneProductGp2,
									data.oneProductGp3, data.oneProductGp4,
									data.oneProductGp5 ]
						},
						{
							name : dropListName2,
							data : [ data.oneProductGp6, data.oneProductGp7,
									data.oneProductGp8, data.oneProductGp9,
									data.oneProductGp10 ]
						} ],
				//不攸關
				responsive : {
					rules : [ {
						condition : {
							maxWidth : 800
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
	</script>
</body>

</html>