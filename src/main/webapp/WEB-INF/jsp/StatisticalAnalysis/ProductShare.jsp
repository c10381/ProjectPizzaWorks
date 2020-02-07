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
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-6">

			<figure class="highcharts-figure">
				<div id="container1"></div>
				<p class="highcharts-description">公式：[一定期間] [A披薩銷售額 / 所有披薩銷售額]</p>
			</figure>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-6">
			<figure class="highcharts-figure">
				<div id="container2"></div>
				<p class="highcharts-description">公式：[一定期間] [A披薩平均售價-平均成本]
					/[A披薩平均售價]</p>
			</figure>
		</div>
	</div>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>

	<script>
		//$.ajax({
		//url : "${pageContext.request.contextPath}/statisticalAnalysisSystem/PieChartTest_proto",
		//type : "GET",
		//success : function(data1) {
		//console.log(data1);
		//showPieChart(data1);
		//}
		//});

		//function showPieChart(data1) {
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
								text : '2020/1~3炭火食肉披薩銷售額占比'
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
									name : '炭火食肉披薩',
									y : 8.3,
									sliced : true,
									selected : true
								}, {
									name : '白醬鮭魚披薩',
									y : 5.7
								}, {
									name : '其他',
									y : 100 - 8.3 - 5.7
								} ]
							} ]
						});
		//}

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
				type: 'datetime',
				dateTimeLabelFormats: {
					month: '%Y-%m'
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
					pointIntervalUnit: 'month'
				}
			},

			series : [ {
				name : '炭火食肉披薩',
				data : [ 50, 53, 47 ]
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
	</script>
</body>
</html>