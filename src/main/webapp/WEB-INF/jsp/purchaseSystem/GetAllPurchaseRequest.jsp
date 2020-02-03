<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>原物料一覽</title>
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
	<c:out value="${product }"></c:out>
	<section class="py-5">
		<div class="container text-center ">
			<h1>請購單清單</h1>
			
			<table id="prTable" class="text-center">
				<thead>
					<tr>
						<th>RID</th>
						<th>請購時間</th>
						<th>請購者員工編號</th>
						<th>請購原因</th>
						<th>請購總額</th>
						<th>請求狀態</th>
					</tr>
				</thead>
			</table>
		</div>
	</section>
	<script>
		$(document).ready(function() {
			$("#prTable").dataTable(
							{
								"ajax" : {
									"url" : "http://localhost:8080/ProjectPizzaWorks/getAllPurchaseRequestJSON",
									"type" : "GET",
									"dataSrc" : "",
								},
								"columns" : [ {
									"data" : "pRequestId"
								}, {
									"data" : "requestTime"
								}, {
									"data" : "proposalerId" 
								}, {
									"data" : "purchaseReason"
								}, {
									"data" : "totalPrice" 
								}, ],
								"lengthMenu" : [ 10, 20 ],
								"searching" : false,
								"info" : false,
								order: [[ 1, "desc" ]],
								columnDefs: [{
				                    targets: [3],
				                    orderable: false,
				                }],
							});
						});
	</script>
</body>
</html>