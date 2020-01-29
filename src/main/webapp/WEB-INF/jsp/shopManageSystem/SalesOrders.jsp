<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="UTF-8">
<title>SalesOrders</title>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid row">
			<div class="col-md-1">
				<button onclick="loadingPage('/backendSystem/backendIndex')"
					class="btn btn-block btn-secondary">返回</button>
			</div>
			<!-- col end -->
			<div class="col-md-4"></div>
			<!-- col end -->
			<div class="col-md-2">
				<h1>產品訂單</h1>
			</div>
			<!-- col end -->
		</div>
		<!-- container row end -->
	</section>
	<!-- <hr style="height: 1px; border: none; color: #333; background-color: #333;"> -->
	<section class="content">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<tr>
									<th>訂單編號</th>
									<th>客戶編號</th>
									<th>訂購時間</th>
									<th>取餐時間</th>
									<th>是否需要外送</th>
									<th>外送地址</th>
									<th>訂單總價</th>
									<th>訂單狀態</th>
								</tr>
								<c:forEach var='salesOrder' items='${salesOrders}'>
									<tr>
										<td
											onclick="loadingPage('${request.contextPath}/shopManageSystem/getSalesOrder?id=${salesOrder.salesOrderId}')">
											<b style='font-size: 16px;'>${salesOrder.salesOrderId}</b>
										</td>
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
						</div>
						<!-- card-body table end -->
					</div>
					<!--  card end -->
				</div>
				<!-- col end -->
			</div>
			<!-- row end -->
		</div>
		<!-- container end -->
	</section>
	<!-- content end -->
</body>
</html>
