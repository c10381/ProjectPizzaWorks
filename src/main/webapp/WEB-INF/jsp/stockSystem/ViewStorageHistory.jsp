<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>庫存歷史檢視</title>
<!-- <link rel="stylesheet"
	href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">  -->
<!-- <link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/dataTables.material.min.css"> -->
 <!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css">  -->
<style>
 .alert > span{
 color: white;
 text-decoration:underline;
 cursor : pointer;
 }
 .alert > span:hover{
 color: black;
 }
 #records{
    width : 100% !important
}
</style>
</head>
<body>
	<section class="py-5">
		<div class="container text-center ">
			<h1>庫存歷史檢視</h1>			
			<table id="records" class="text-center hover">
				<thead>
					<tr>
						<th>庫存編號</th>
						<th>入庫單號</th>
						<th>原料名稱</th>
						<th>總進貨額</th>
						<th>總進貨量</th>
						<th>該批餘量</th>
						<th>入庫時間</th>
						<th>過期時間</th>
						<th>最小單位</th>
					</tr>
				</thead>
			</table>
		</div>
	</section>
	<!-- <script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> -->
	<!-- <script src="https://cdn.datatables.net/1.10.20/js/dataTables.material.min.js"></script> -->
	<script>
		$(document).ready(function() {
			let count = 0;
			$("#records").DataTable(
							{
								"ajax" : {
									"url" : "../getStorageHistoryJSON",
									"type" : "GET",
									"dataSrc" : "",
								},

								"columns" : [ {
									"data" : "storageHistoryId"
								}, {
									"data" : "sRequestId"
								}, {
									"data" : "materialsName"
								}, {
									"data" : "unitPrice" ,render: $.fn.dataTable.render.number(',', '', 0, '')
								}, {
									"data" : "quantity" 
								}, {
									"data" : "remainingQuantity"
								}, {
									"data" : "stockTime"
								}, {
									"data" : "expiryTime"
								}, {
									"data" : "unit"
								}],
				                "order": [[ 0, 'desc' ]],
								"lengthMenu" : [ 10, 20 ],
								"searching" : false,
								"info" : true,
								"autowidth": false,
								"responsive": false,
							});
						});
	</script>
</body>
</html>