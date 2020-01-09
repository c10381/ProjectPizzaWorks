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
		<form:form method='POST' modelAttribute="product"
			class='form-horizontal'>
			<fieldset>
				<div class="row">
					<div class="col-md-5">
						<h3>
							名稱：
							<form:input id="productName" type='text' path="productName" value="${product.productName}" class='form:input-large' />
						</h3>
						<p>
							簡述：
							<textarea id="briefInfo" name="briefInfo" cols=50 rows=5
								style="resize: none">${product.briefInfo}</textarea>
						</p>
						<p>
							單價：
							<form:input type="text" path="unitPrice"
								value="${product.unitPrice}" class='form:input-large' />
						</p>
						<p>
							辣度：
							<form:input type="text" path="spicyLevel"
								value="${product.spicyLevel}" class='form:input-large' />
						</p>
						<p>
							<label>純素食：<form:checkbox id="vegetableOnly"
									path="vegetableOnly" class='form:input-large' value='1'/></label>
						</p>
						<p>
							<label>有無海鮮：<form:checkbox id="seafood" value='1'
									path="seafood" class='form:input-large' /></label>
						</p>
						<p>
							<label>有無豬肉：<form:checkbox id="pork" value='1'
									path="pork" class='form:input-large' /></label>
						</p>
						<p>
							<label>有無牛肉：<form:checkbox id="beef" value='1'
									path="beef" class='form:input-large' /></label>
						</p>
						<p>
							<label>有無雞肉：<form:checkbox id="chicken" value='1'
									path="chicken" class='form:input-large' /></label>
						</p>
						<p>
							圖片路徑：<input type="text" name="imagePath"
								value="${product.imagePath}">
						</p>

						<p>
							<strong>商品編號: </strong> <span class='label label-warning'>
								${product.productId} </span>
								<form:input type="hidden" path="productId"
								value="${product.productId}"/>
						</p>
						<p>
							<a href="<spring:url value='/shopManageSystem/products' />"
								class="btn btn-default"> <span
								class="glyphicon-hand-left glyphicon"></span>返回
							</a> <a href='#' class='btn btn-warning btn-large'> 
							<input id="btnUpdate" type='submit'
								class='glyphicon-shopping-cart glyphicon' value="提交修改"></input>
							</a>
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