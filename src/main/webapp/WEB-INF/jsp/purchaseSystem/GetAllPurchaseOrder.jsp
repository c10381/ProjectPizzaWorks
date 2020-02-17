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
		<div class="container-fluid text-center ">
			<h1>採購單清單</h1>
			<table id="poTable" class="text-center display">
				<thead>
					<tr>
						<th>RID</th>
						<th>採購時間</th>
						<th>採購者</th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
	</section>
	<script>
	$(document).ready(function () {
		var table = $("#poTable").DataTable(
	        {
	            "ajax": {
	                "url": "${request.contextPath}/getAllPurchaseOrderJSON",
	                "type": "GET",
	                "dataSrc": "",
	            },
	            "responsive": true, 
	            "lengthMenu": [10, 20],
	            "searching": false,
	            "info": false,
	            "order": [[0, "desc"]],
	           
	            // 欄位的操作
	           "columns": [{
	                "data": "pOrderId"
	            }, {
	                "data": "requestTime"
	            },{
	            	"data": "fullName"
	            }
	            ],
	            "columnDefs": [
	               {
	                	"targets" : 3,
	                	"data" : "pOrderId",
	                	"width" : "8%",
	                	"render": function (data, type, row, meta) {
	                		return "<div><button class='btn btn-success btn-sm detailbtn'>詳細資訊</button></div>"
                        }
                    }
                ], 
	        });
		
		// 導向單一產品頁面
		$('#poTable tbody').on('click', '.detailbtn', function(){
			var tr = $(this).closest('tr');
	    	var pOrderId = table.row(tr).data().pOrderId;		
	    	loadingPage('${request.contextPath}/getOnePurchaseOrder?id='+pOrderId);
		}); 
		
		/* 表格的開關  */
		/* var lastClick = []; 
	    $('#prTable tbody').on('click', 'td.details-control', function () {
	    	var tr = $(this).closest('tr');
	        var row = table.row(tr);
	    	var pRequestId = table.row(tr).data().pRequestId;
			
	        if ( row.child.isShown() ) {
	            // This row is already open - close it
	            row.child.hide();
	            tr.removeClass('shown');
	            tr.find('i').toggleClass('fa-plus');
	            tr.find('i').toggleClass('fa-minus');
	        }
	        else {
	            // Open this row
	            row.child( format(row.data()) ).show();
	            tr.addClass('shown');
	            tr.find('i').toggleClass('fa-plus');
	            tr.find('i').toggleClass('fa-minus');
	        }
	    }); */
	    
	});
	
	</script>
</body>
</html>