<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>產品清單</h1>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<c:forEach var='product' items='${products}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
					<div class="thumbnail" style="width: 320px; height: 340px">
						<img width='100' height='200'
							src="<c:url value='../_global/images/${product.imagePath}'/>" />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${product.productName}</b>
							</p>
							<p>簡介：${product.briefInfo}</p>
							<p>單價：${product.unitPrice}</p>
							<p>上架狀態: ${product.activeStatus}</p>
							
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>
