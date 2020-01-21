<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
<title>Product</title>
<script>
	
</script>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>材料一覽</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<table id="materialsTable">
			<tr>
				<th>材料編號</th>
				<th>材料名稱</th>
				<th>單位</th>
				<th>testRemove</th>
			</tr>
			<c:forEach var="material" items="${materials}">
				<tr>
					<td>${material.materialsId}</td>
					<td>${material.materialsName}</td>
					<td>${material.unit}</td>
					<td><button id='rm' onclick="removeRow_material(this)">Remove</button></td>
				</tr>
			</c:forEach>
		</table>
	</section>

	<!--THE CONTAINER WHERE WE'll ADD THE DYNAMIC TABLE-->
	<div id="cont"></div>

	<p>
		<input type="button" id="bt" value="Sumbit Data" onclick="sumbit()" />
	</p>
	<script>
		// ARRAY FOR HEADER.
		const arrHead = [ '#', 'productId', 'productName', 'quantity', 'unit'];
		// SIMPLY ADD OR REMOVE VALUES IN THE ARRAY FOR TABLE HEADERS.
		// FIRST CREATE A TABLE STRUCTURE BY ADDING A FEW HEADERS AND
		// ADD THE TABLE TO YOUR WEB PAGE.
		var recipe;
		var material;
		var recipes = [];
		
		function createTable() {
			var recipeTable = document.createElement('table');
			recipeTable.setAttribute('id', 'recipeTable'); // SET THE TABLE ID.
			var tr = recipeTable.insertRow(-1);
			for (var h = 0; h < arrHead.length; h++) {
				var th = document.createElement('th'); // TABLE HEADER.
				th.innerHTML = arrHead[h];
				tr.appendChild(th);
			}
			var div = document.getElementById('cont');
			div.appendChild(recipeTable); // ADD THE TABLE TO YOUR WEB PAGE.
		}
		
		createTable();
		
		// DELETE TABLE ROW.
		function removeRow_material(oButton) {
			var materialsTable = document.getElementById('materialsTable');
			var thisRow = oButton.parentNode.parentNode;
			
			recipe = new Object();
			recipe["materialsId"] = thisRow.cells[0].innerHTML;
			recipe["materialsName"] = thisRow.cells[1].innerHTML;
			recipe["unit"] = thisRow.cells[2].innerHTML;
			addRow_recipe(recipe);
			materialsTable.deleteRow(oButton.parentNode.parentNode.rowIndex); // BUTTON -> TD -> TR.
		}
		
		// DELETE TABLE ROW.
		function removeRow_recipe(oButton) {
			var recipeTable = document.getElementById('recipeTable');
			var thisRow = oButton.parentNode.parentNode;
			
			material = new Object();
			material["materialsId"] = thisRow.cells[1].innerHTML;
			material["materialsName"] = thisRow.cells[2].innerHTML;
			material["unit"] = thisRow.cells[4].innerHTML;
			addRow_material(material);
			recipeTable.deleteRow(oButton.parentNode.parentNode.rowIndex); // BUTTON -> TD -> TR.
		}
		
		function addRow_recipe(recipe){
			var recipeTable = document.getElementById('recipeTable');
			var rowCnt = recipeTable.rows.length; // GET TABLE ROW COUNT.
			var tr = recipeTable.insertRow(rowCnt); // TABLE ROW.
			for (var c = 0; c < arrHead.length; c++) {
				var td = document.createElement('td'); // TABLE DEFINITION.
				td = tr.insertCell(c);
				if (c == 0) { // FIRST COLUMN.
					// ADD A BUTTON.
					var button = document.createElement('input');
					// SET INPUT ATTRIBUTE.
					button.setAttribute('type', 'button');
					button.setAttribute('value', 'Remove');
					button.setAttribute('id', 'rm');
					// ADD THE BUTTON's 'onclick' EVENT.
					button.setAttribute('onclick', 'removeRow_recipe(this)');
					td.appendChild(button);
				} 
				else if(c == 1){
					///var ele = document.createElement('input');
					//ele.setAttribute('type', 'text');
					//ele.setAttribute('value', recipe.materialsId);
					//td.appendChild(ele);
					td.innerHTML = recipe.materialsId;
				}
				else if(c == 2){
					//var ele = document.createElement('input');
					//ele.setAttribute('type', 'text');
					//ele.setAttribute('value', recipe.materialsName);
					//td.appendChild(ele);
					td.innerHTML = recipe.materialsName;
				}
				else if(c == 4){
					//var ele = document.createElement('input');
					//ele.setAttribute('type', 'text');
					//ele.setAttribute('value', recipe.unit);
					//td.appendChild(ele);
					td.innerHTML = recipe.unit;
				}
				else {
					// CREATE AND ADD TEXTBOX IN EACH CELL.
					var ele = document.createElement('input');
					ele.setAttribute('type', 'text');
					ele.setAttribute('value', '');
					td.appendChild(ele);
				}
			}
		}
		
		function addRow_material(material){
			//console.log(material);
			var materialsTable = document.getElementById('materialsTable');
			var rowCnt = materialsTable.rows.length; // GET TABLE ROW COUNT.
			var tr = materialsTable.insertRow(rowCnt); // TABLE ROW.
			tr = materialsTable.insertRow(rowCnt);
			for (var c = 0; c < arrHead.length; c++) {
				var td = document.createElement('td'); // TABLE DEFINITION.
				td = tr.insertCell(c);
				if (c == 0) { // FIRST COLUMN.
					td.innerHTML = material.materialsId;
				} 
				else if(c == 1){
					td.innerHTML = material.materialsName;
				}
				else if(c == 2){
					td.innerHTML = material.unit;
				}
				else if(c == 3){
					// ADD A BUTTON.
					var button = document.createElement('input');
					// SET INPUT ATTRIBUTE.
					button.setAttribute('type', 'button');
					button.setAttribute('value', 'Remove');
					button.setAttribute('id', 'rm');
					// ADD THE BUTTON's 'onclick' EVENT.
					button.setAttribute('onclick', 'removeRow_material(this)');
					td.appendChild(button);
				}
				//else {
					// CREATE AND ADD TEXTBOX IN EACH CELL.
				//	var ele = document.createElement('input');
				//	ele.setAttribute('type', 'text');
				//	ele.setAttribute('value', '');
				//	td.appendChild(ele);
				//}
			}
		}
		
		function getRecipesTable(){
			var totalNumber = document.getElementById("recipeTable").rows.length;
			for(var i=1; i<totalNumber; i+=1){
				var table_row = document.getElementById("recipeTable").rows[i];
				var recipe = new Object();
				recipe["materialsId"] = table_row.cells[1].innerHTML;
				recipe["quantity"] = table_row.cells[3].children[0].value;
				recipe["unit"] = table_row.cells[4].innerHTML;
				recipes.push(recipe);
			}
			//console.log(recipes);
		}
		
		// EXTRACT AND SUBMIT TABLE DATA.
		function sumbit() {
			// LOOP THROUGH EACH ROW OF THE TABLE.
			recipes.length = 0;
			getRecipesTable();
			//console.log('Data send:\n' + JSON.stringify({recipes: recipes}));
			sendData();
		}
		
		function sendData(){
			$.ajax({
				url: "${pageContext.request.contextPath}/shopManageSystem/AddNewProduct",
				data: {"recipes":JSON.stringify(recipes)},
				type: "POST",
				
				error:function(){
					console.log(JSON.stringify({recipes: recipes}));
					console.log("Error");
				},
				success: function(data){
					console.log(data);
					window.location.replace(data);
					//console.log(recipes);
					//console.log(${product.productId});
					//alert("食譜儲存"+data);
					//document.location.href="${pageContext.request.contextPath}/shopManageSystem/getProductById?id=${product.productId}";
				}
			})
			
		}
		
	</script>
</body>
</html>