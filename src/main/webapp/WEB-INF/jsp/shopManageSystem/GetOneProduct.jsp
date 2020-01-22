<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<title>Product</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
<script>
	
</script>
</head>
<body>
	<section>
		<div align="left">
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<form:form method='POST' modelAttribute="product"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="row">
					<div class="col-md-5">
						<h3>
							名稱：
							<form:input id="productName" type='text' path="productName"
								value="${product.productName}" class='form:input-large' />
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
									path="vegetableOnly" class='form:input-large' value='1' /></label>
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
						<p><label>上架狀態：<form:checkbox id="activeStatus" value='1'
									path="activeStatus" class='form:input-large' /></label>
						</p>
						<p>
							圖片路徑：<input type="text" name="imagePath"
								value="${product.imagePath}">
						</p>

						<p>
							<strong>商品編號: </strong> <span class='label label-warning'>
								${product.productId} </span>
							<form:input type="hidden" path="productId"
								value="${product.productId}" />
						</p>
						
						<form:input id="productImage" path="productImage" type='file'
							class='form:input-large' onchange="readURL(this)"
							targetID="${request.contextPath}/images/Products/${product.imagePath}"
							accept="image/gif, image/jpeg, image/png" /> <img
							id="${request.contextPath}/images/Products/${product.imagePath}"
							src="<c:url value='/picture/${product.productId}'/>" />
							
						<p>
							<a href="<spring:url value='/shopManageSystem/products' />"
								class="btn btn-default"> <span
								class="glyphicon-hand-left glyphicon"></span>返回
							</a> <a href='#' class='btn btn-warning btn-large'> <input
								id="btnUpdate" type='submit'
								class='glyphicon-shopping-cart glyphicon' value="提交修改" />
							</a>
						</p>					
					</div>
				</div>
			</fieldset>
		</form:form>
		<a
			href="<spring:url value='/shopManageSystem/updateRecipeById?id=${product.productId}' />"
			class='btn btn-warning btn-large'> <input id="btnRecipeGet"
			type='button' class='glyphicon-shopping-cart glyphicon' value="查詢BOM" />
		</a>

	</section>
	<script>
		function readURL(input){
			if(input.files && input.files[0]){
				var imageTagID = input.getAttribute("targetID");
				var reader = new FileReader();
				reader.onload = function (e) {
					var img = document.getElementById(imageTagID);
					img.setAttribute("src", e.target.result);
				}
			reader.readAsDataURL(input.files[0]);
			}
		}												
		$("#btnUpdatePicture").click(function(){
			getRecipesTable();
			$.ajax({
				url: "${pageContext.request.contextPath}/shopManageSystem/updateRecipeById",
				data: {"recipes":JSON.stringify(recipes)},
				type: "POST",
				error:function(){
					console.log(JSON.stringify({recipes: recipes}));
					console.log("Error");
				},
				success: function(data){
					//console.log(recipes);
					console.log(data);
				}
			})
		})
						
		$("#btnUpdate").click(function(){
			getRecipesTable();
			recipe_str=recipes.toString();			
		})
	</script>
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
		if(${product.activeStatus}==1){
			document.getElementById("activeStatus").checked = true;
		}
	}
	scanCheckBoxStatus();
	</script>
</body>
</html>