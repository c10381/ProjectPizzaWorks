<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>BOM</title>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>Recipe資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<form:form method="POST" modelAttribute="recipeForm"
			class='form-horizontal' >
			<table id="recipeList">
				<tr>
					<th>材料編號</th>
					<th>材料名稱</th>
					<th>使用量</th>
					<th>單位</th>
				</tr>
				<c:forEach var='recipe' items='${recipeForm}'
					varStatus="status">
					<tr>
						<td id="materialsId${status.index}">${recipe.material.materialsId}</td>
						<td id="materialsName${status.index}">${recipe.material.materialsName}</td>
						<td><input id="quantity${status.index}" type="text"
							value="${recipe.quantity}" class='form:input-large' /></td>
						<td id="unit${status.index}">${recipe.unit}</td>
					</tr>
					<c:set var="totalNumber" value="${status.count}" />
				</c:forEach>
			</table>
			<p>
				<a href="<spring:url value='/shopManageSystem/getProductById?id=${productId}' />"
					class="btn btn-default"> <span
					class="glyphicon-hand-left glyphicon"></span>返回
				</a> &nbsp;				
			</p>
		</form:form>
		
		<button id="btnUpdate" >提交修改</button>
	</section>
	<script>
		var totalNumber = ${totalNumber};
		var recipes = [];
		
		function getRecipesTable(){
			for(var i=1; i<=totalNumber; i+=1){
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
		
		$("#btnUpdate").click(function(){
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
</body>
</html>
