<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>SalesOrders</title>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>訂單一覽</h1>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<table>
			<tr>
				<th>訂單編號</th>
				<th>客戶編號</th>
				<th>訂購時間</th>
				<th>取餐時間</th>
				<th>是否需要外送</th>
				<th>外送地址</th>
				<th>訂單總價</th>
				<th>訂單狀態<th>
			</tr>
			<c:forEach var='salesOrder' items='${salesOrders}'>
				<tr>
					<td><a
						href="<spring:url value='/shopManageSystem/getSalesOrder?id=${salesOrder.salesOrderId}'/>">
							<b style='font-size: 16px;'>${salesOrder.salesOrderId}</b>
					</a></td>
					<td>${salesOrder.memberId}</td>
					<td>${salesOrder.orderTime}</td>
					<td>${salesOrder.requireTime}</td>
					<td>${salesOrder.needDelivery}</td>
					<td>${salesOrder.deliverAddress}</td>
					<td>${salesOrder.totalSales}</td>
					<td>${salesOrder.orderStatus}</td>
				</tr>
			</c:forEach>
		</table>

		
	</section>
</body>
</html>
