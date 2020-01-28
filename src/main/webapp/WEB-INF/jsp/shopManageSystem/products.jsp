<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="UTF-8">
<!-- 
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<!-- 	 <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />
  <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> -->
<title>Products</title>
</head>
<body>
	<section>
		<div>
			<button
				onclick="loadingPage('${pageContext.request.contextPath}/backendSystem/backendIndex')">返回</button>
			<div class="container" style="text-align: center">
				<h1>產品清單</h1>
			</div>
		</div>
	</section>
	<!-- 
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;"> -->

	<div class="container">
		<table id="myDataTable" class="display">
			<thead>
				<tr>
					<th>#</th>
					<th>產品名稱</th>
					<th>上架狀態</th>
					<th>詳細資訊</th>
				</tr>
			</thead>
			<tfoot>
			</tfoot>
		</table>
	</div>
	<script type="text/javascript">
		var products = [
		<c:forEach var='product' items='${products}' varStatus='status'>
			["${product.productId}",
			"${product.productName}",
			"${product.activeStatus}"
			]
			<c:if test="${!status.last}">,</c:if>
		</c:forEach>
		];
		
		//console.log(products);
		
        $(function () {
        	var table = $("#myDataTable").DataTable({
                searching: false, //關閉filter功能
                data: products,
                responsive: true,
                
                columnDefs: [{
                    targets: [1,2,3],
                    orderable: false,
                },{
	                targets: 2,
	                data: null,
	                render: function(data, type, row, meta){
						if(data[2]== "1"){
							return "<select id='sltStatus'><option value=0 >未上架</option><option value=1 selected>已上架</option></select>";
	                	}else if(data[2] == "0"){
	                		return "<select id='sltStatus'><option value=0 selected>未上架</option><option value=1>已上架</option></select>";
	                	}
	                	return data;
	                },
	                defaultContent: ""
				}, {
	                targets: -1,
	                data: null,
	                defaultContent: "<button id='btnDetails' value='Get Details' >詳細資料</button>"
				}]
            });
            
            $('#myDataTable tbody').on('click', '[id*=btnDetails]', function () {
                var data = table.row($(this).parents('tr')).data();
                var productId = data[0]; 
                loadingPage('${request.contextPath}/shopManageSystem/getProductById?id='+productId);
            });
            
            $('#myDataTable tbody').on('change', '[id*=sltStatus]', function () {
            	var data = table.row($(this).parents('tr')).data();
                var activeStatus = this.value;
                var product = new Object();
                product["productId"] = data[0]
                product["activeStatus"] = activeStatus;
                $.ajax({
    				url: "${pageContext.request.contextPath}/shopManageSystem/updateProductStatus",
    				data: {"product":JSON.stringify(product)},
    				type: "POST",
    				
    				error:function(){
    					console.log(JSON.stringify({product: product}));
    					console.log("Error");
    				},
    				success: function(data){
    					console.log(data);
    					alert("狀態修改"+data);
    				}
    			})
                this.val = activeStatus;
            });
        });
        
    </script>
</body>
</html>
