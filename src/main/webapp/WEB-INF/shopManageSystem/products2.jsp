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
		<table>
			<c:forEach var='product' items='${products}'>
				<tr>
					<td><img width='100' height='200'
						src="<c:url value='/_global/images/${product.imagePath}'/>" />
					</td>
					<td><b style='font-size: 16px;'>${product.productName}</b></td>
					
					<td><textarea cols='50' rows='5' name='briefInfo'>${product.briefInfo}</textarea></td>
					<td><input type="text" value='${product.unitPrice}' name='unitPrice'></td>
					<td><input type="text" value='${product.activeStatus}' name='activeStatus'></td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>
