<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="${pageContext.request.contextPath}/js/backendSystem/highcharts.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/series-label.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/data.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/exporting.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/export-data.js"></script>
	<script src="${pageContext.request.contextPath}/js/backendSystem/accessibility.js"></script>

	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<figure class="highcharts-figure">
				<div id="container"></div>
				<p class="highcharts-description">公式：[銷貨成本] / [(期初存貨+期末存貨)/2]</p>
			</figure>
		</div>
	</div>

	<script>
		////1. AJAX：折線圖(GET)
		//$.ajax({
			//url : "${pageContext.request.contextPath}/GetInvTurnover",
			//type : "GET",
			//error : function(data) {
				//console.log("error");
			//},
			//success : function(data) {
				//showLineChart(data);
			//}
		//});
		//2. 第一次呼叫折線圖(Highchart)
		function showLineChart(data) {
			Highcharts.chart('container', {
				chart : {
					width : 800
				},
				title : {
					text : '存貨周轉率趨勢'
				},

				subtitle : {
					text : '資料來源：1. 產品資料表；2. 食材BOM表、3. 進貨歷史資料表；4. 單位轉換表；5.訂單'
				},

				yAxis : {
					title : {
						text : '次數'
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
						pointStart : Date.UTC(2019, 5, 1),
						pointIntervalUnit : 'month'
					}
				},

				series : [ {
					name : '所有商品',
					//data : [ data.invT1, data.invT2, data.invT3 ]
					data : [ 4.45, 5.68, 4.01 ]
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
		showLineChart(null);
	</script>
</body>
</html>