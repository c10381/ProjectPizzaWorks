
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

	<!-- ----------------------------------------直方圖------------------------------------- -->
	<div class="row">
	<!-- 產品勾選選單 -->
		<div class="col-lg-3 align-items-end" style ="margin-top: 1rem">
			<div class="form-group">
				<select class="productSelect" multiple="multiple"> </select>
				<p class="text-center text-sm text-success">最少一項，最多五項</p>
			</div>
			<!-- 小日曆-起日 -->
			<div class="calendar form-group">
				<label for="startDateHisotgram">起日</label>
				<input type="text" data-input id="startDateHisotgram" /><a
					class="input-button" title="toggle" data-toggle> <i
					class="far fa-calendar-alt"></i>
				</a>
			</div>
			<!-- 小日曆-迄日 -->
			<div class="calendar form-group ">
				<label for="endDateHisotgram">迄日</label>
				<input type="text" data-input id="endDateHisotgram" /><a
					class="input-button" title="toggle" data-toggle> <i
					class="far fa-calendar-alt"></i>
				</a>
			</div>
			<!-- 送出鈕 -->
			<button id="btnAdd" class="btn btn-success btn-sm "onclick="sendHistogramInfo()">送出</button>
		</div> 
		<!--  col -->
		
		<!-- 直方圖 -->
		<div class="col-lg-9">
			<figure class="highcharts-figure">
				<div id="container3"></div>
				<p class="highcharts-description"></p>
			</figure>
		</div>
		<!--  col -->
	</div>
	<!-- row -->
	

	<script>
		$(function() {
			// 載入option選單
			appendOption();
			//小日曆插入時間
			insertTime();
			
		});

		//獲取所有產品選單(Get值)
		function appendOption() {
			$.ajax({
				url : "${pageContext.request.contextPath}/pDropDownMenu",
				type : "GET",
				error : function(jsa_str) {
					console.log("error");
				},
				success : function(jsa_str) {
					// 獲得所有產品陣列，並依次加入
					jsa_str.forEach(function(item, index) {
						generateProductOption(item);
					})
					// 全部放入後重新reload一次fSelect才可
					// 載入fSelect函式庫
					window.fs_test = $('.productSelect').fSelect({
						placeholder : '請選擇產品品項',
						numDisplayed : 2,
						overflowText : '已選擇{n}項',
						noResultsText : '查無產品',
						searchText : '搜尋品項',
						showSearch : true
					}); 
				}
			});
		}
		function generateProductOption(product) {
			let strOneItem = '';
			strOneItem = '<option value="' + product.productId + '">'
					+ product.productName + '</option>';
			$(".productSelect").append(strOneItem);
		} 

		//小月曆-------------建立且在標籤中插入小月曆----------------------
		function insertTime() {
		  flatpickr(".calendar", {
				altInputClass : "form-group",
				plugins : [ new confirmDatePlugin({
					confirmText : "確定",
					showAlways : false,
					theme : "light"
				}) ],
				wrap : true,
			});
		}
		
		function numeroAdosCaracteres( fecha ) {
		    if (fecha > 9){
		        return ""+fecha;
		    }else{
		        return "0"+fecha;
		    }
		}
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
									type : 'column',
									height: (9 / 16 * 100) + '%', 
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
										text : '新台幣元'
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
										},
									},
								} ],
							// End of Series
							});
			// End of HighChart
		}

		//3. 按鈕點擊後會觸發onclick事件，將選取值Post給後端，獲取資料
		function sendHistogramInfo() {
			var JSONObject = {};
			let count = 0;
			let startDate = $("#startDateHisotgram").val();
			let endDate = $("#endDateHisotgram").val(); 
			let aryProductName =[];
			/*  validation */ 
			var numItems = $('.fs-wrap .selected').length; 
			if(numItems > 5){
				swal("最多選擇五項商品"); 
				return ; 
			}
			if(numItems = 0){
				swal("至少需選擇一項商品"); 
				return ; 
			}
			if(startDate==""||endDate==""){
				swal("起/迄時間不可為空"); 
				return ; 
			}
			
			/* 1-1 判斷fSelect下的選取  
				   取得productId(option的value值)，Controlle要求字串所以數字要轉為字串*/
			$(".fs-wrap .selected").each(function(index, value) {
				count += 1;
				let key = "productId" + count;
				let val = ($(this).data("value")).toString();
				JSONObject[key] = val;
				aryProductName.push($(this).children(".fs-option-label").text()); 
				
			})
			// 1-2 時間區段
			JSONObject["startDate"] = startDate; 
			JSONObject["endDate"] = endDate
	
			$.ajax({
				url : "${pageContext.request.contextPath}/HistogramPost",
				data : {
					//POST方法下的Query String(value為一JSONObj)
					"HistogramInfo" : JSON.stringify(JSONObject)
				},
				type : "POST",
				success : function(data) {
					//以空字串取代原來div內的東西，再生成圖片
					$("#container3").html("");
					 showHistogramPost(data , aryProductName); 
				}
			}); 
		}

		//4. 被3呼叫函式，資料接到後產出直方圖(Highchart)
		function showHistogramPost(data , aryProductName) {
			Highcharts
					.chart(
							'container3',
							{
								chart : {
									type : 'column', 
									height: (9 / 16 * 100) + '%'
								},
								title : {
									text : '銷售額佔比直方圖'
								},
								subtitle : {
									text : 'Source: 訂單'
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
										text : ''
									}
								},
								legend : {
									enabled : false
								},
								tooltip : {
									pointFormat : '<b>{point.y:.2f}</b>'
								},
								series : [ {
									name : 'Population',
									data : [ [ aryProductName[0], data.product1 ],
											[ aryProductName[1], data.product2 ],
											[ aryProductName[2], data.product3 ],
											[ aryProductName[3], data.product4 ],
											[ aryProductName[4], data.product5 ], 
											],
									dataLabels : {
										enabled : true,
										rotation : -90,
										color : '#FFFFFF',
										align : 'right',
										format : '{point.y:.2f}', // one decimal
										y : 10, // 10 pixels down from the top
										style : {
											fontSize : '13px',
											fontFamily : 'Verdana, sans-serif'
										}
									}
								} ]
							// End of Series
							});
			// End of Highchart
		}
	</script>

</body>
</html>