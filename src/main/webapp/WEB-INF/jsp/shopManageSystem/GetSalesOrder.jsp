<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>SalesOrder</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
<script>
	
</script>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>訂單資訊</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<form:form method='POST' modelAttribute="salesOrder"
			class='form-horizontal'>
			<fieldset>
				<div class="row">
					<div class="col-md-5">
						<p>
							<strong>訂單編號: </strong> <span class='label label-warning'>
								${salesOrder.salesOrderId} </span>
							<form:input type="hidden" path="salesOrderId"
								value="${salesOrder.salesOrderId}" />
						</p>
						<h3>
							訂購人編號：
							<form:input id="memberId" type='text' path="memberId"
								value="${salesOrder.memberId}" class='form:input-large' />
						</h3>
						<p>
							訂購時間：
							<form:input type="text" path="orderTime"
								value="${salesOrder.orderTime}" class='form:input-large' />
						</p>
						<p>
							取貨時間：
							<form:input type="text" path="requireTime"
								value="${salesOrder.requireTime}" class='form:input-large' />
						</p>
						<p>
							是否需要外送：
							<form:input type="text" path="needDelivery"
								value="${salesOrder.needDelivery}" class='form:input-large' />
						</p>
						<p>
							外送地址：
							<form:input type="text" path="deliverAddress"
								value="${salesOrder.deliverAddress}" class='form:input-large' />
						</p>
						<p>
							總價：
							<form:input type="text" path="totalSales"
								value="${salesOrder.totalSales}" class='form:input-large' />
						</p>
						<table>
							<c:forEach var='salesOrderDetail' items='${salesOrder.salesOrderDetails}'>
								<tr>
									<td><b style='font-size: 16px;'>${salesOrderDetail.productId}</b></td>
									<td><input type="text" value='${salesOrderDetail.unitPrice}' name='unitPrice'></td>
									<td><input type="text" value='${salesOrderDetail.quantity}' name='quantity'></td>
									<td><input type="text" value='${salesOrderDetail.doubleCheese}' name='doubleCheese'></td>
									<td><input type="text" value='${salesOrderDetail.crustTypeId}' name='crustTypeId'></td>
									<td><input type="text" value='${salesOrderDetail.discount}' name='discount'></td>
								</tr>
							</c:forEach>
						</table>
						<p>
							<a href="<spring:url value='/shopManageSystem/salesOrders'/>"
								class="btn btn-default"> <span
								class="glyphicon-hand-left glyphicon"></span>返回
							</a>
							<!-- <a href='#' class='btn btn-warning btn-large'> <input
								id="btnUpdate" type='submit'
								class='glyphicon-shopping-cart glyphicon' value="提交修改" />
							</a> -->
						</p>
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
	<script>
	function scanCheckBoxStatus(){		
		if(${product.vegetableOnly}==1){
			document.getElementsByName("vegetableOnly").checked = true;
		}
		if(${product.seafood}==1){
			document.getElementById("seafood").checked = true;
		}
		if(${product.pork}==1){
			document.getElementById("pork").checked = true;
		}
		if(${product.beef}==1){
			document.getElementById("beef").checked = true;
		}
		if(${product.chicken}==1){
			document.getElementById("chicken").checked = true;
		}
	}
	scanCheckBoxStatus();
	</script>
</body>
</html>