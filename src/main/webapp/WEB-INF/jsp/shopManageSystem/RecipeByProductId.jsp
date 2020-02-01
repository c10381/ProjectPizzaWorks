<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="UTF-8">
<!-- <script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<title>BOM</title>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid row">
			<div class="col-md-1">
				<button
					onclick="loadingPage('${request.contextPath}/shopManageSystem/getProductById?id=${productId}')"
					class="btn btn-block btn-secondary">返回</button>
			</div>
			<!-- col end -->
			<div class="col-md-4"></div>
			<!-- col end -->
			<div class="col-md-2">
				<h2>產品食譜</h2>
			</div>
			<!-- col end -->
		</div>
		<!-- row end -->
	</section>
	<section class="content">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-0">
							<form:form method="POST" modelAttribute="recipeForm"
								class='form-horizontal'>
								<table id="recipeList" class="table table-hover text-nowrap">
									<tr>
										<th>材料編號</th>
										<th>材料名稱</th>
										<th>使用量</th>
										<th>單位</th>
									</tr>
									<c:forEach var='recipe' items='${recipeForm}'
										varStatus="status">
										<tr>
											<td>${recipe.material.materialsId}</td>
											<td>${recipe.material.materialsName}</td>
											<td><input class='form-control' type="text" value="${recipe.quantity}"/></td>
											<td>${recipe.unit}</td>
										</tr>
										<c:set var="totalNumber" value="${status.count}" />
									</c:forEach>
								</table>
							</form:form>
						</div>
						<!-- card-body end -->
					</div>
					<!-- card end -->
				</div>
				<!-- col end -->
			</div>
			<!-- row end -->
		</div>
		<!-- container end -->
		<div class="row">
			<p></p>
			<div class="col-sm-4">
			
			</div>
			<!-- col end -->
			<div class="col-sm-4"></div>
			<!-- col end -->
			<div class="col-sm-4">
				<input id="btnUpdate" value="提交修改" class="btn btn-block btn-warning" />
			</div>
			<!-- col end -->
		</div>
		<!-- row end -->
	</section>
	<!-- content end -->
	<script>
		var totalNumber = ${totalNumber};
		var recipes = [];

		function getRecipesTable() {
			for (var i = 1; i <= totalNumber; i += 1) {
				var table_row = document.getElementById("recipeList").rows[i]
				var recipe = new Object();
				recipe["productId"] = ${productId};
				recipe["materialsId"] = table_row.cells[0].innerHTML;
				recipe["quantity"] = table_row.cells[2].children[0].value;
				recipe["unit"] = table_row.cells[3].innerHTML;
				recipes.push(recipe);
			}
			//console.log(recipes);
		}

		$("#btnUpdate").click(function() {
			getRecipesTable();
			$.ajax({
				//url : "${pageContext.request.contextPath}/shopManageSystem/updateRecipeById",
				//data : {"recipes" : JSON.stringify(recipes)},
				url : "${pageContext.request.contextPath}/shopManageSystem/updateRecipeBean",
				data : JSON.stringify(recipes),
				type : "POST",
			    contentType: "application/json",
			    
				error : function(data) {
					console.log(JSON.stringify({
					recipes : recipes
				}));
				console.log("Error");
				console.log(data);
				},
				success : function(data) {
					//console.log(recipes);
					console.log(data);
				}
			});
		});

		$("#btnUpdate").click(function() {
			getRecipesTable();
			recipe_str = recipes.toString();
		});
	</script>
</body>
</html>
