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
#soTable{
    width : 100% !important
}
</style>
</head>
<c:set var="privilegeId" value="${Mem_LoginOK.privilegeId}" />
<body>
	<section class="content">
		<div class="container-fluid text-center">
			<h1>訂單清單</h1>
			<table id="soTable" class="text-center display">
				<thead>
					<tr>
						<th>OID</th>
						<th>訂購者</th>
						<th>訂餐時間</th>
						<th>取餐時間</th>
						<th>需要外送</th>
						<th>外送地址</th>
						<th>產品總數</th>
						<th>訂單總價</th>
						<th>訂單狀態</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
	</section>

	<c:if test="${(privilegeId==3)|| (privilegeId==7)}">
		<!-- Modal -->
		<div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">
							訂單審核 | 訂單編號:<span><span>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h6>狀態更動</h6>
						<select id='sltStatus'></select>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="updateResponse">變更狀態</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">關閉</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<script>
	$(document).ready(function () {
		var table = $("#soTable").DataTable(
	        {
	            "ajax": {
	                "url": "${pageContext.request.contextPath}/shopManageSystem/getAllSalesOrdersJSON",
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
	            //"width":"100%",
	            //"scrollX": "100%",
	            "autowidth": false, 
	            "responsive": false, 
	            "lengthMenu": [10, 20],
	            "searching": false,
	            "info": true,
	            "order": [[0, "desc"]],
	            // 欄位的操作
	            "columns": [{
	                "data": "salesOrderId" 
	            }, {
		            "data": "fullName"
	            }, {
	                "data": "orderTime"
	            }, {
	                "data": "requireTime" 
	            }, {
		            "data": "needDelivery",
		            "render": function(data, type, row, meta){
		            	switch (data){
		            		case 0: 
		            			return "來店取餐";
		            		case 1:
		            			return "需外送";
		            	}
		            }
	            }, {
		            "data": "deliverAddress"
	            }, {
	                "data": "salesOrderDetails", 
	                "render": function (data, type, row, meta) {
	                	//str = "共" + data.length + "項";
	                	return "共" + data.length + "項";
		        }}, {
			        "data": "totalSales",
			        "defaultContent": ""
		        }, {
			        "data": "orderStatus"
	            },],
	            "columnDefs": [
	                // 核准狀態
	                {
	                	"targets":[2,3],
	                	"width": "10%"
	                },{
	                    "targets": 8,
	                    "data": "orderStatus",
	                    "orderable": true,
	                    "render": function (data, type, row, meta) {
	                        switch (data) {
	                            case 0:
	                                return '未接單';
	                            case 1:
	                                return '拒絕該單';
	                            case 2:
	                                return '已接單';
	                            case 3:
	                                return '可取餐';
	                            case 4:
	                                return '運送中';
	                            case 5:
	                                return '已結單';
	                        }
	                    }
	                },{
	                	"targets" : 9,
	                	"data" : "sRequestId",
	                	"width" : "8%",
	                	"render": function (data, type, row, meta) {
	                		return "<div><button class='btn btn-success btn-sm detailbtn'>詳細資訊</button></div>"
                        }
                    },{
	                	"targets" : 10,
	                	"data" : "orderStatus",
	                	"width" : "8%",
	                	"render": function (data, type, row, meta) {
	                		// 對於權限渲染網頁不同
	                		<c:choose>
	        					<c:when test="${(privilegeId==3)|| (privilegeId==7)}">
	        						if(data==5){
	        							return "";
	        						}
	        						return '<div><button type="button" class="btn btn-danger btn-sm btnResponse" data-toggle="modal" data-target="#ModalCenter">狀態變更</button></div>';
	        					</c:when>
	        					<c:otherwise>
		        					//if(data==0||data==1){
		        						//return "<div class='btn btn-primary btn-sm'>修改</div>";
	        						//}
        							return "";
	        					</c:otherwise>
        					</c:choose>
                        }
                    }
                ],
	        });
		z
		// 導向單一產品頁面
		$('#soTable tbody').on('click', '.detailbtn', function(){
			var tr = $(this).closest('tr');
	    	var salesOrderId = table.row(tr).data().salesOrderId;
	    	loadingPage('${request.contextPath}/shopManageSystem/getSalesOrder?id='+salesOrderId);
		});
		
		/* 表格的開關  */
		
		var lastClick = []; 
	    $('#soTable tbody').on('click', 'td.details-control', function () {
	    	var tr = $(this).closest('tr');
	        var row = table.row(tr);
	    	var sRequestId = table.row(tr).data().sRequestId;
			
	     	// 判斷是否讀取過，還沒的話要傳送讀取時間到後台
	     	<c:if test="${privilegeId==4}">
	     	var check = function(){
	     		if (lastClick.length == 0){
	     			return false; 
	     		}
	     		for(var i = 0 ; i < lastClick.length ; i++){
	     			if(lastClick[i] == sRequestId){
	     				return true;
    				};
	     		}
	     		return false;
	     	}
	     	if (row.data().readTime == undefined && check() == false){
	     			/* alert("此筆資料尚未讀取過"); */
		     		updateReadTime(sRequestId);
		     		lastClick.push(sRequestId);
	     	};
	     	</c:if>
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
	    });
	    
	    <c:if test="${(privilegeId==3)|| (privilegeId==7)}">
	    var monitorData;
		// 當權限為可審核才可以載入此段javascript
		    $("#soTable tbody").on("click", ".btnResponse" ,function (){
				var tr = $(this).closest('tr');
				monitorData = table.row(tr).data();
				console.log(monitorData);
		    	var salesOrderId = table.row(tr).data().salesOrderId;
				
				// Modal 標頭
				$("#exampleModalLongTitle span").html(salesOrderId);
				
				// Modal Option
				var status = table.row(tr).data().orderStatus;
            	var op_text = ["未接單","拒絕該單", "已接單", "可取餐", "運送中", "已結單"];
				var str = "";
				for(var i = 0; i<op_text.length; i++){
					if(status>=3){
						if(i==status){
							str += "<option value="+i+" selected disabled>"+op_text[i]+"</option>";
						} else if(i<status){
	            			str += "<option value="+i+" disabled>"+op_text[i]+"</option>";
						} else{
	            			str += "<option value="+i+" >"+op_text[i]+"</option>";
						}
					} else if(status==2){
						if(i==status){
							str += "<option value="+i+" selected disabled>"+op_text[i]+"</option>";
						} else if(i == 3){
							str += "<option value="+i+">"+op_text[i]+"</option>";
						} else{
	            			str += "<option value="+i+" disabled>"+op_text[i]+"</option>";
						}
					} else{
						if(i>2){
							str += "<option value="+i+" disabled>"+op_text[i]+"</option>";
						} else{
	            			str += "<option value="+i+" >"+op_text[i]+"</option>";
						}
					}
            	}
				$("#sltStatus").html(str);
			});
		
			
			// 獲取要更新的資料
			$("#updateResponse").click(function(){
				console.log(monitorData);
				let status = $("#sltStatus").val();
				
				if(status==null){
					alert("請更動狀態");
					return ;
				}
				
				/*var updateInfo = {};
				updateInfo.orderStatus = status;
				updateInfo.salesOrderId = monitorData.salesOrderId;
				console.log(JSON.stringify(updateInfo));*/
				monitorData.orderStatus = status;
				console.log(status);
				if(status == 3){
					$.ajax({
			  		    type : "PUT", 
			  		    url : "../shopManageSystem/saveSalesList",
			  		    data: JSON.stringify(monitorData),
			  		    contentType: "application/json; charset=utf-8",
			   		}).done(function(data){
			   			alert("成功");
			   			$('#ModalCenter').one('hidden.bs.modal',function(){
						loadingPage("/shopManageSystem/GetAllSalesOrder");
						}).modal("hide");
			   		}).fail(function(){
			   			console.log("失敗");
			   			return false;
			   		});
				} else{
					$.ajax({
			  		    type : "PUT", 
			  		    url : "../shopManageSystem/updateResponse",
			  		    data: JSON.stringify(monitorData),
			  		    contentType: "application/json; charset=utf-8",
			   		}).done(function(data){
			   			alert("成功");
			   			$('#ModalCenter').one('hidden.bs.modal',function(){
			   				loadingPage("../shopManageSystem/GetAllSalesOrder")
						}).modal("hide");
			   		}).fail(function(){
			   			console.log("失敗");
			   			return false;
			   		});
				}
			});
    	</c:if> 
	
	});

	
	// 點擊打開按鈕，會新增讀取時間
   	function updateReadTime(sRequestId){
     	  $.ajax({
  		    type : "PUT", 
  		    url : "../stock/updateReadTime",
  		    data: JSON.stringify({
  		    	"sRequestId": sRequestId,
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
	
     /*// 下拉式選單的表格
	function format (d) {
		let responseComment = (d.responseComment!=undefined)?  d.responseComment : "尚未回覆";
		let responseTime = (d.responseTime!=undefined)?  d.responseTime : "尚未回覆";
		let str =""
	    // `d` is the original data object for the row
	 /*    str+= '<table cellpadding="5" cellspacing="0"">'+
	        '<tr>'+
		        '<td>回覆時間：'+responseTime+'</td>'+
	            '<td>批注：'+responseComment+'</td>'+
	        '</tr>'
	        +'</table>'; */
    /* str += '<table class="table table-bordered text-center mt-2 col-md-8 align-self-center">'+
     			'<thead class="thead-info"><tr>'+
     				'<th>產品名稱</th><th>請求數量</th>'+
     			'</tr></thead>';
    	d.purchaseRequestDetails.forEach(function(item, index, array){
    		str += '<tr>'
    		str += '<td>'+ item.materialsName + '</td>';
    		str += '<td>'+ item.quantity + '</td>';
    		str += '</tr>';
    	})
	    return str;
	    }
	*/
	</script>
</body>
</html>