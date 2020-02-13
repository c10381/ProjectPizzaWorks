<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>原物料一覽</title>
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
</style>
</head>
<body>
	<section class="py-5">
		<div class="container text-center ">
			<h1>原物料庫存清單</h1>
			<div class="alert alert-warning alert-dismissible fade" role="alert">
				<strong></strong>筆原料低於最低庫存量，請盡速申請購買 
				<span onclick="loadingPage('/purchase/FormPurchaseRequest')" class="ml-2"> 點擊建立請購單</span>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
			</div>
			<table id="materials" class="text-center hover">
				<thead>
					<tr>
						<th>原料編號</th>
						<th>原料名稱</th>
						<th>庫存數量</th>
						<th>最低庫存數量</th>
						<th>供應商編號</th>
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
			$("#materials").DataTable(
							{
								"ajax" : {
									"url" : "../getAllMaterialsJSON",
									"type" : "GET",
									"dataSrc" : "",
								},
								"columns" : [ {
									"data" : "materialsId"
								}, {
									"data" : "materialsName"
								}, {
									"data" : "quantity" ,render: $.fn.dataTable.render.number(',', '', 0, '')
								}, {
									"data" : "reorderLevel" ,render: $.fn.dataTable.render.number(',', '', 0, '')
								}, {
									"data" : "supplierId",
									"render": function(data, type, row, meta){
										return "華泰";
									},
									"defualtContent": "華泰",
								}, {
									"data" : "unit"
								}, ],
								"lengthMenu" : [ 10, 20 ],
								"searching" : false,
								"info" : false,

								"createdRow" : function(row,data) {
									
									if (data.quantity <= data.reorderLevel) {
										count += 1;
										$(row).addClass("text-danger");
									}
									if (count>0){
										$(".alert strong").html(count);
										$(".alert").removeClass('hide');
										$(".alert").addClass('show');										
									}
								}
							});
						});
	</script>
</body>
</html>