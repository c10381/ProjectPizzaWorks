<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>原物料一覽</title>
<style>
 .alert > span{
 color: white;
 text-decoration:underline;
 cursor : pointer;
 }
 .alert > span:hover{
 color: black;
 }
.details-control{
	cursor: pointer;
}
.details-control:hover{
	color: #FF8040;
}
</style>
</head>

<body>
	<section class="py-5">
		<div class="container-fluid text-center ">
			<h1>請購單清單</h1>
			<table id="prTable" class="text-center display">
				<thead>
					<tr>
						<th></th>
						<th>RID</th>
						<th>請購時間</th>
						<th>請購者</th>
						<th>請購原因</th>
						<th>請購總額</th>
						<th>請求狀態</th>
						<th></th>
					</tr>
				</thead>
			</table>
			
		</div>
	</section>
	<script>
	$(document).ready(function () {
	    var table = $("#prTable").DataTable(
	        {
	            "ajax": {
	                "url": "http://localhost:8080/ProjectPizzaWorks/getAllPurchaseRequestJSON",
	                "type": "GET",
	                "dataSrc": "",
	            },
	            "responsive": true, 
	            "lengthMenu": [10, 20],
	            "searching": false,
	            "info": false,
	            "order": [[1, "desc"]],

	            // 欄位的操作
	            "columns": [{
	                "data": null,
	                "defaultContent": '<i class="fas fa-plus"></i>',
	                "className": 'details-control',
	                "orderable": false,

	            }, {
	                "data": "pRequestId"
	            }, {
	                "data": "requestTime"
	            }, {
	                "data": "fullName"
	            }, {
	                "data": "purchaseReason"
	            }, {
	                "data": "totalPrice", render: $.fn.dataTable.render.number(',', '', 0, '')
	            },],
	            "columnDefs": [
	                // 核准狀態
	                {
	                    "targets": 6,
	                    "data": "requestStatus",
	                    "render": function (data, type, row, meta) {
	                        switch (data) {
	                            case 0:
	                                return '未核准';
	                            case 1:
	                                return '退回';
	                            case 2:
	                                return '核准但未進貨';
	                            case 3:
	                                return '核准已進貨';
	                            case 4:
	                                return '拒絕';
	                        }
	                    }
	                },{
	                	"targets" : 7,
	                	"data" : "requestStatus",
	                	"render": function (data, type, row, meta) {
	                		// 對於權限渲染網頁不同
	                		<c:set var="privilegeId" value="${Mem_LoginOK.privilegeId}"/>
	                		<c:choose>
	        					<c:when test="${(privilegeId==4)|| (privilegeId==7)}">
	        						if(data==0){
	        							return "<div><button>核准</button><button>拒絕</button></div>"
	        						}
	        						return "";
	        					</c:when>
	        					<c:otherwise>
		        					if(data==0||data==1){
		        						return "<div class='btn btn-success'>修改</div>";
	        						}
        						return "";
	        					</c:otherwise>
        					</c:choose>
                        }
                    }
                ],
	        });
		
	    
		var lastClick = []; 
		
	    $('#prTable tbody').on('click', 'td.details-control', function () {
	    	console.log(lastClick)
	    	var tr = $(this).closest('tr');
	        var row = table.row(tr);
	    	var pRequestId = table.row(tr).data().pRequestId;
			
	     	// 判斷是否讀取過，還沒的話要傳送讀取時間到後台
	     	var check = function(){
	     		if (lastClick.length == 0){
	     			return false; 
	     		}
	     		for(var i = 0 ; i < lastClick.length ; i++){
	     			if(lastClick[i] == pRequestId){
	     				return true;
    				};
	     		}
	     		return false;
	     	}
	     	if (row.data().readTime == undefined && check() == false){
	     			/* alert("此筆資料尚未讀取過"); */
		     		updateReadTime(pRequestId);
		     		lastClick.push(pRequestId);
	     	};
	     	// <------End ------>
	 
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
	    } );
	});
	
          function updateReadTime(pRequestId){
        	  $.ajax({
     		    type : "PUT", 
     		    url : "../purchase/updateReadTime",
     		    data: JSON.stringify({
     		    	"pRequestId": pRequestId,
     		    	}),
     		    contentType: "application/json; charset=utf-8",
     		    dataType : "text"
	     		}).done(function(data){
	     			return true;
	     		}).fail(function(){
	     			console.log("失敗");
	     			return false;
	     		})
     	};
	
	function format (d) {
		let responseComment = (d.responseComment!=undefined)?  d.responseComment : "尚未回覆";
		let responseTime = (d.responseTime!=undefined)?  d.responseTime : "尚未回覆";
		
		let str =""
	    // `d` is the original data object for the row
	    str+= '<table cellpadding="5" cellspacing="0"">'+
	        '<tr>'+
		        '<td>回覆時間：'+responseTime+'</td>'+
	            '<td>批注：'+responseComment+'</td>'+
	        '</tr>'
	        +'</table>';
	        
	     str += '<table class="table table-bordered text-center mt-2">'+
	     			'<thead class="thead-info"><tr>'+
	     				'<th>產品名稱</th><th>請求數量</th><th>產品名稱</th>'+
	     			'</tr></thead>';
	     
	    	d.purchaseRequestDetails.forEach(function(item, index, array){
	    		str += '<tr>'
	    		str += '<td>'+ item.materialsName + '</td>';
	    		str += '<td>'+ item.quantity + '</td>';
	    		str += '<td>'+ item.unitPrice + '</td>';
	    		str += '</tr>';
	    	})
	    
	    return str;
	}
	</script>
</body>
</html>