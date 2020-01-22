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
							訂購人編號：${salesOrder.memberId}
						</h3>
						<p>
							訂購時間：${salesOrder.orderTime}
						</p>
						<p>
							取貨時間：${salesOrder.requireTime}
						</p>
						<p>
							是否需要外送：${salesOrder.needDelivery}
						</p>
						<p>
							外送地址：${salesOrder.deliverAddress}
						</p>
						<p>
							總價：${salesOrder.totalSales}
						</p>
						<p>
							訂單狀態：${salesOrder.orderStatus}
						</p>
						<p>
							備註：${salesOrder.note}
						</p>
						<table>
						<tr>
						<th>產品名稱</th>
						<th>產品單價</th>
						<th>總數</th>
						<th>是否要加雙倍起司</th>
						<th>餅皮</th>
						<th>折扣</th>
						</tr>
							<c:forEach var='salesOrderDetail' items='${salesOrder.salesOrderDetails}' varStatus="i">
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
						<p>
							<button onclick="loadingPage('/shopManageSystem/salesOrders')">返回</button>
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