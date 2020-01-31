<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
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
	<section class="content">
		<div class="row">
			<div class="col-md-8">
				<div class="card card-default">
					<div class="card-header">
						<div class="card-title">
							<i class="fas fa-cookie"></i>食譜
						</div>
						<!-- card-title end -->
					</div>
					<!--  card-header end -->
					<div class="card-body">
						<table id="table_recipes" class="display">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>食材編號</th>
									<th>食材名稱</th>
									<th>使用量</th>
									<th>單位</th>
								</tr>
							</thead>
							<tfoot>
							</tfoot>
						</table>
						<p>&nbsp;</p>
						<p>
							<input type="button" value="新增產品" onclick="sumbitDataTable()"
								class="btn btn-success float-right" />
						</p>
					</div>
					<!-- card-body -->
				</div>
				<!-- card -->
			</div>
			<!-- col end -->
			<div class="col-md-4">
				<div class="card card-default">
					<div class="card-header">
						<div class="card-title">
							<i class="fas fa-box-open"></i>食材
						</div>
						<!-- card-title end -->
					</div>
					<!--  card-header end -->
					<div class="card-body">
						<table id="table_materials" class="display">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>食材編號</th>
									<th>食材名稱</th>
									<th>單位</th>
								</tr>
							</thead>
							<tfoot>
							</tfoot>
						</table>
					</div>
					<!-- card-body -->
				</div>
				<!-- card -->
			</div>
			<!-- col end -->
		</div>
		<!-- row end -->
	</section>
	<!-- content end -->
	<script type="text/javascript">
		var products = [
			<c:forEach var="material" items="${materials}" varStatus='status'>
				["",
				"${material.materialsId}",
				"${material.materialsName}",
				"${material.unit}"
				]
				<c:if test="${!status.last}">,</c:if>
			</c:forEach>
			];
		
		//console.log(products);
		
        $(function () {
        	var table = $("#table_materials").DataTable({
                searching: false, //關閉filter功能
                data: products,
                responsive: true,
                
                columnDefs: [{
                    targets: [0,2,3],
                    orderable: false,
                }, {
	                targets: 0,
	                data: null,
	                defaultContent: "<button id='btnRemoveToAdd' class='btn btn-success'>添加至食譜</button>"
				}]
            });
        	
            $('#table_materials tbody').on('click', '[id*=btnRemoveToAdd]', function () {
                var nowRow = table.row($(this).parents('tr'));
            	var data = table.row($(this).parents('tr')).data();
                console.log(data);
            	var new_row = new Object();
            	new_row['materialsId'] = data[1];
            	new_row['materialsName'] = data[2];
            	new_row['unit'] = data[3];
            	console.log(new_row);
            	$('#table_recipes').DataTable().row.add([
            		"<button id='btn_RemoveToAddR'>移除至食譜</button>",
            		data[1],
            		data[2],
            		"<input type='text id=txt_quantity'/>",
            		data[3]
            	]).draw();
            	nowRow.remove().draw();
            });
        });
        
        $(function () {
        	var table = $("#table_recipes").DataTable({
                searching: false, //關閉filter功能
                responsive: true,
                
                columnDefs: [{
                    targets: [0,2,3,4],
                    orderable: false,
                }, {
	                targets: 0,
	                data: null,
	                defaultContent: "<button id='btnRemoveToAddR' class='btn btn-success'>移除至食譜</button>"
				}, {
					targets: 3,
	                data: null,
	                defaultContent: "<input type='text' id='txt_quantity' />"
				}]
        	
            });
            
            $('#table_recipes tbody').on('click', '[id*=btnRemoveToAddR]', function () {
                var nowRow = table.row($(this).parents('tr'));
            	var data = nowRow.data();
                //console.log(data);
            	var new_row = new Object();
            	new_row['materialsId'] = data[1];
            	new_row['materialsName'] = data[2];
            	new_row['unit'] = data[4];
            	//console.log(new_row);
            	$('#table_materials').DataTable().row.add([
            		"<button id='btn_RemoveToAdd' class='btn btn-success'>添加至食譜</button>",
            		data[1],
            		data[2],
            		data[4]
            	]).draw();
            	nowRow.remove().draw();
            });
        });

		var recipes = [];
		
        function getRecipesTable() {
			var totalNumber = document.getElementById("table_recipes").rows.length;
			for (var i = 1; i < totalNumber; i += 1) {
				var table_row = document.getElementById("table_recipes").rows[i];
				var recipe = new Object();
				recipe["materialsId"] = table_row.cells[1].innerHTML;
				recipe["quantity"] = table_row.cells[3].children[0].value;
				recipe["unit"] = table_row.cells[4].innerHTML;
				recipes.push(recipe);
			}
			//console.log(recipes);
		}

		// EXTRACT AND SUBMIT TABLE DATA.
		function sumbitDataTable() {
			// LOOP THROUGH EACH ROW OF THE TABLE.
			recipes.length = 0;
			getRecipesTable();
			//console.log('Data send:\n' + JSON.stringify({recipes: recipes}));
			sendData();
		}

		function sendData() {
			$.ajax({
					url : "${pageContext.request.contextPath}/shopManageSystem/AddNewProduct",
					data : {
						"recipes" : JSON.stringify(recipes)
					},
					type : "POST",
					error : function() {
						console.log(JSON.stringify({
							recipes : recipes
						}));
						console.log("Error");
					},
					success : function(data) {
						loadingPage("${request.contextPath}/"+data);
						//alert("食譜儲存"+data);
					}
			});
		}
	</script>
</body>
</html>