<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="UTF-8">
<!-- 
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
	 <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />
  <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<title>Products</title>
</head>
<body>
	<section>
		<div>
			<a href="SalesManageIndex">返回</a>
			<div class="container" style="text-align: center">
				<h1>產品清單</h1>
			</div>
		</div>
	</section>
	<!-- 
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;"> -->
	<table id="myDataTable"  class="display"  >
        <thead>
            <tr>
                <th>#</th>
                <th>產品名稱</th>
                <th>產品簡介</th>
                <th>上架狀態</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var='product' items='${products}'>
        	<tr>
        		<td><a href="<spring:url value='/shopManageSystem/getProductById?id=${product.productId}'/>"
                        		>${product.productId}</a></td>
        		<td>${product.productName}</td>
        		<td>${product.briefInfo}</td>
        		<td>${product.activeStatus}</td>
        	</tr>
        	
        	</c:forEach>
        </tbody>
    </table>
	<section class="container">
		<div class="row">
			<c:forEach var='product' items='${products}'>
				<div class="col-sm-6 col-md-3" style="width: 300px; height: 550px">
					<div class="thumbnail" style="width: 200px; height: 100px">
						<img width='200' height='200'
							src="<c:url value='/picture/${product.productId}'/>" />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${product.productName}</b>
							</p>
							<p>簡介：${product.briefInfo}</p>
							<p>單價：${product.unitPrice}</p>
							<p>上架狀態: ${product.activeStatus}</p>
							<p>
								<a
									href="<spring:url value='/shopManageSystem/getProductById?id=${product.productId}'/>"
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon"></span>詳細資料
								</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<script type="text/javascript">
        $(function () {
            $("#myDataTable").DataTable({
                searching: false, //關閉filter功能
                columnDefs: [{
                    targets: [3],
                    orderable: false,
                }]
            });
        });
    </script>
</body>
</html>
