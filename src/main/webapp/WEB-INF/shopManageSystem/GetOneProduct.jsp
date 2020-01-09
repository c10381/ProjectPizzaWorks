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
<title>Product</title>
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
				<h2>產品資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<form:form method='POST' modelAttribute="productBean"
			class='form-horizontal'>
			<div class="row">
				<div class="col-md-5">
					<h3>
						名稱：<input id="productName" type="text" name="productName"
							value="${product.productName}">
					</h3>
					<p>
						簡述：
						<textarea id="briefInfo" name="briefInfo" cols=50 rows=5
							style="resize:none">${product.briefInfo}</textarea>
					</p>
					<p>
						單價：<input type="text" name="brieunitPricefInfo"
							value="${product.unitPrice}">
					</p>
					<p>
						辣度：<input type="text" name="spicyLevel"
							value="${product.spicyLevel}">
					</p>
					<p>
						<label>純素食：<input type="checkbox" name="vegetableOnly"
							value="1"></label>
					</p>
					<p>
						<label>有無海鮮：<input id="seafood" type="checkbox"
							name="seafood" value="1"></label>
					</p>
					<p>
						<label>有無豬肉：<input id="pork" type="checkbox" name="pork"
							value="1"></label>
					</p>
					<p>
						<label>有無牛肉：<input id="beef" type="checkbox" name="beef"
							value="1"></label>
					</p>
					<p>
						<label>有無雞肉：<input id="chicken" type="checkbox"
							name="chicken" value="1"></label>
					</p>
					<p>
						圖片路徑：<input type="text" name="imagePath"
							value="${product.imagePath}">
					</p>

					<p>
						<strong>商品編號: </strong> <span class='label label-warning'>
							${product.productId} </span>
					</p>
					<p>
						<a href="<spring:url value='/shopManageSystem/products' />"
							class="btn btn-default"> <span
							class="glyphicon-hand-left glyphicon"></span>返回
						</a> <a href='#' class='btn btn-warning btn-large'> <span
							class='glyphicon-shopping-cart glyphicon'></span>提交修改
						</a>
					</p>
				</div>
			</div>
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