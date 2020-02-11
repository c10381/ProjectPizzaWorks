<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>原物料一覽</title>
<style>
.details-control {
	cursor: pointer;
}

.details-control:hover {
	color: #FF8040;
}
</style>
</head>
<c:set var="privilegeId" value="${Mem_LoginOK.privilegeId}" />
<body>
	<section class="py-5">
		<div class="container-fluid text-center">
			<h1>銷貨單清單</h1>
			<table id="slTable" class="text-center display">
				<thead>
					<tr>
						<th>LID</th>
						<th>銷貨者</th>
						<th>銷貨時間</th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
	</section>
	
	<script>
	$(document).ready(function () {
		var table = $("#slTable").DataTable(
	        {
	            "ajax": {
	                "url": "../shopManageSystem/GetAllSalesListJSON",
	                "type": "GET",
	                "dataSrc": "",
	                /*
	                "success": function(data){
	                	console.log("Yee");
	                	console.log(data);
	                },
	                "error": function(data){
	                	console.log("oof");
	                	console.log(data);
	                },*/
	            },
	            "responsive": true, 
	            "lengthMenu": [10, 20],
	            "searching": false,
	            "info": true,
	            "order": [[0, "desc"]],
	            // 欄位的操作
	            "columns": [{
	                "data": "salesListId"
	            }, {
	                "data": "fullName"
	            }, {
	                "data": "orderTime"
	            },],
	            "columnDefs": [
	                // 核准狀態
	                {
	                	"targets" : 3,
	                	"data" : "sRequestId",
	                	"width" : "8%",
	                	"render": function (data, type, row, meta) {
	                		return "<div><button class='btn btn-success btn-sm detailbtn'>詳細資訊</button></div>"
                        }
	                }
                ],
	        });
		
		// 導向單一產品頁面
		$('#slTable tbody').on('click', '.detailbtn', function(){
			var tr = $(this).closest('tr');
	    	var salesListId = table.row(tr).data().salesListId;
		    loadingPage('${request.contextPath}/shopManageSystem/GetSalesList?id='+salesListId);
		});
	});

	</script>
</body>
</html>