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
			</tr>
			<c:forEach var='salesOrder' items='${salesOrders}'>
				<tr>
					<td><a
						href="<spring:url value='/shopManageSystem/getSalesOrder?id=${salesOrder.salesOrderId}'/>">
							<b style='font-size: 16px;'>${salesOrder.salesOrderId}</b>
					</a></td>
					<td><input type="text" value='${salesOrder.memberId}'
						name='memberId'></td>
					<td><input type="text" value='${salesOrder.orderTime}'
						name='orderTime'></td>
					<td><input type="text" value='${salesOrder.requireTime}'
						name='requireTime'></td>
					<td><input type="text" value='${salesOrder.needDelivery}'
						name='needDelivery'></td>
					<td><input type="text" value='${salesOrder.deliverAddress}'
						name='deliverAddress'></td>
					<td><input type="text" value='${salesOrder.totalSales}'
						name='totalSales'></td>
				</tr>
			</c:forEach>
		</table>

		<table id="saleOrders" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<td></td>
					<td>訂單編號</td>
					<td>客戶編號</td>
					<td>訂購時間</td>
					<td>取餐時間</td>
					<td>是否需要外送</td>
					<td>外送地址</td>
					<td>訂單總價</td>
				</tr>
			</thead>
		</table>
	</section>
</body>
</html>
