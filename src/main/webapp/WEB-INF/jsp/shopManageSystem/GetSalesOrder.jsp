<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>SalesOrder</title>
<script>
	
</script>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid row">
			<div class="col-md-1">
				<button
					onclick="loadingPage('${request.contextPath}/shopManageSystem/GetAllSalesOrder')"
					class="btn btn-block btn-secondary">返回</button>
			</div>
			<!-- col end -->
			<div class="col-md-4"></div>
			<!-- col end -->
			<div class="col-md-2">
				<h1>訂單資訊</h1>
			</div>
			<!-- col end -->
		</div>
		<!-- row end -->
	</section>
	<section class="content">
		<div class="container">
			<div class="card">
				<div class="card-body">
					<form:form method='POST' modelAttribute="salesOrder">
						<fieldset>
							<div class="row">
								<div class="col-md-6">
									<strong>訂單編號: ${salesOrder.salesOrderId}</strong>
									<form:input type="hidden" path="salesOrderId"
										value="${salesOrder.salesOrderId}" />
								</div>
								<!-- col end -->
								<div class="col-md-6">訂購人編號：${salesOrder.memberId}</div>
								<!-- col end -->
							</div>
							<!-- row end -->
							<div class="row">
								<div class="col-md-6">訂購時間：${salesOrder.orderTime}</div>
								<!-- col end -->
								<div class="col-md-6">取貨時間：${salesOrder.requireTime}</div>
								<!-- col end -->
							</div>
							<!-- row end -->
							<div class="row">
								<div class="col-md-6">是否需要外送：${salesOrder.needDelivery}</div>
								<!-- col end -->
								<div class="col-md-6">外送地址：${salesOrder.deliverAddress}</div>
								<!-- col end -->
							</div>
							<!-- row end -->
							<div class="row">
								<div class="col-md-6">總價：${salesOrder.totalSales}</div>
								<!-- col end -->
								<div class="col-md-6">訂單狀態：${salesOrder.orderStatus}</div>
								<!-- col end -->
							</div>
							<!-- row end -->
							<div class="row">
								<div class="col-md-6">備註：${salesOrder.note}</div>
								<!-- col end -->
							</div>
							<!-- row end -->
							<div class="table-responsive p-0">
								<table class="table table-hover text-nowrap">
									<tr>
										<th>產品名稱</th>
										<th>產品單價</th>
										<th>總數</th>
										<th>要加起司</th>
										<th>餅皮</th>
										<th>折扣</th>
									</tr>
									<c:forEach var='salesOrderDetail'
										items='${salesOrder.salesOrderDetails}' varStatus="i">
										<tr>
											<td><b style='font-size: 16px;'>${products[i.index].productName}</b></td>
											<td>${salesOrderDetail.unitPrice}</td>
											<td>${salesOrderDetail.quantity}</td>
											<td>${salesOrderDetail.doubleCheese}</td>
											<td>${crusts[i.index].crustTypeName}</td>
											<td>${salesOrderDetail.discount}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<!--  table end -->
						</fieldset>
					</form:form>
				</div>
				<!-- card-body end -->
			</div>
			<!-- card end -->
		</div>
		<!-- container end -->
	</section>
	<!-- content end -->
	
</body>
</html>