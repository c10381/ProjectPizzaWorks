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
			<c:forEach var='salesOrder' items='${salesOrders}'>
				<tr>
					<td><a href="<spring:url value='/shopManageSystem/getSalesOrder?id=${salesOrder.salesOrderId}'/>">
						<b style='font-size: 16px;'>${salesOrder.salesOrderId}</b></a></td>
					<td><input type="text" value='${salesOrder.memberId}' name='memberId'></td>
					<td><input type="text" value='${salesOrder.orderTime}' name='orderTime'></td>
					<td><input type="text" value='${salesOrder.requireTime}' name='requireTime'></td>
					<td><input type="text" value='${salesOrder.needDelivery}' name='needDelivery'></td>
					<td><input type="text" value='${salesOrder.deliverAddress}' name='deliverAddress'></td>
					<td><input type="text" value='${salesOrder.totalSales}' name='totalSales'></td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>
