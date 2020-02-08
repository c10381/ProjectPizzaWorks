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
</head>
<body>
	<section class="content-header">
		<div class="container-fluid row">
			<div class="col-md-1">
				<button
					onclick="loadingPage('${request.contextPath}/shopManageSystem/products')"
					class="btn btn-block btn-secondary">返回</button>
			</div>
			<!-- col end -->
			<div class="col-md-4"></div>
			<!-- col end -->
			<div class="col-md-2">
				<h2>產品資料</h2>
			</div>
			<!-- col end -->
		</div>
		<!-- row end -->
	</section>
	<!-- content-header end -->
	<section class="content">
		<form:form method='POST' modelAttribute="product"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="col-md-12">
					<div class="row">
						<div class="form-group">
							<strong>商品編號: </strong> <span>${product.productId} </span>
							<form:input type="hidden" path="productId"
								value="${product.productId}" />
						</div>
						<!-- form-group end -->
					</div>
					<!-- row end -->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<h4>
									<label>名稱：</label>
									<form:input id="productName" type='text' path="productName"
										value="${product.productName}" class='form-control' />
								</h4>
							</div>
							<!-- form-group end -->
							<div class="form-group">
								<label>簡述：</label>
								<textarea id="briefInfo" name="briefInfo" cols=50 rows=5
									class='form-control' style="resize: none">${product.briefInfo}</textarea>
							</div>
							<!-- form-group end -->
						</div>
						<!-- col end -->
						<div class="col-md-6">
							<img
								id="${request.contextPath}/images/Products/${product.imagePath}"
								src="<c:url value='/picture/${product.productId}'/>" />
							<div class="input-group mt-3" >
								<div class="custom-file">
									<form:input id="productImage" path="productImage" type='file'
										class="custom-file-input" onchange="readURL(this)"
										targetID="${request.contextPath}/images/Products/${product.imagePath}"
										accept="image/gif, image/jpeg, image/png" />
									<label class="custom-file-label" for="productImage">請選擇圖片</label>
								 </div>
							 </div>
						</div>
						<!-- col end -->
					</div>
					<!-- row end -->
					<p></p>
					<div class="row mt-3">
						<div class="col-md-6">
							<div class="form-group ">
								<label>辣度：</label>
								<form:input type="text" path="spicyLevel"
									value="${product.spicyLevel}" class='form-control' />
							</div>
							<!-- form-group end -->
							<div class="form-group">
								<div class="custom-control custom-checkbox">
									<label for="vegetableOnly">純素食：</label>
									<form:checkbox id="vegetableOnly" path="vegetableOnly"
										value='1' />
								</div>
								<div class="custom-control custom-checkbox">
									<label for="seafood">有無海鮮：</label>
									<form:checkbox id="seafood" value='1' path="seafood" />
								</div>
								<div class="custom-control custom-checkbox">
									<label for="pork">有無豬肉：</label>
									<form:checkbox id="pork" value='1' path="pork" />
								</div>
								<div class="custom-control custom-checkbox">
									<label for="beef">有無牛肉：</label>
									<form:checkbox id="beef" value='1' path="beef" />
								</div>
								<div class="custom-control custom-checkbox">
									<label for="chicken">有無雞肉：</label>
									<form:checkbox id="chicken" value='1' path="chicken" />
								</div>
							</div>
							<!-- form-group end -->
						</div>
						<!-- col end -->
						<div class="col-md-6">
							<div class="form-group">
								<label>單價：</label>
								<form:input type="text" path="unitPrice"
									value="${product.unitPrice}" class='form-control' />
							</div>
							<!-- form-group end -->
							<div class="form-group">
								<div class="custom-control custom-checkbox">
									<label for="activeStatus">上架狀態：</label>
									<form:checkbox id="activeStatus" value='1' path="activeStatus" />
								</div>
							</div>
							<!-- form-group end -->
						</div>
						<!-- col end -->
					</div>
					<!-- row end -->
					<div class="row">
						<p></p>
						<div class="col-sm-2">
						
						</div>
						<!-- col end -->
						<div class="col-sm-6"></div>
						<!-- col end -->
						<div class="col-sm-2">
							<button
								onclick="loadingPage('${request.contextPath}/shopManageSystem/updateRecipeById?id=${product.productId}')"
								class="btn btn-block btn-info">查詢BOM</button>
						</div>
						<!-- col end -->
						<div class="col-sm-2">
							<input id="btnUpdate" type='submit' value="提交修改"
								class="btn btn-block btn-warning float-right" />
						</div>
						<!-- col end -->
					</div>
					<!-- row end -->
				</div>
				<!-- col end -->
			</fieldset>
		</form:form>
	</section>
	<!-- content end -->
	<script>
		//將form資料塞入
		//function formSubmit(requestURL, requestMethod, formName) {
		$(document).ready(function(){
			$("#product").submit(function(e){
				e.preventDefault();
				console.log($("#product")[0]);
				var formData = new FormData($("#product")[0]);
				
				$.ajax({
					url:$("#product").attr('action'),
					method:$("#product").attr('method'),
					data:formData,
					contentType: false,
                    processData: false,
					//url : "${pageContext.request.contextPath}" + requestURL,
					//method : requestMethod,
					//data : $('form[name=' + formName + ']').serialize(),
					error : function(error) {
						console.log(error)
					},
					success : function(data) {
						$('.content-wrapper').empty();
						$('.content-wrapper').load("${pageContext.request.contextPath}/shopManageSystem/products");
					}
				});
			});
		});
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