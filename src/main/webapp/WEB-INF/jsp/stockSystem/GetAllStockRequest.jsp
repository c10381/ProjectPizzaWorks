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
			<h1>進貨單清單</h1>
			<table id="srTable" class="text-center display">
				<thead>
					<tr>
						<th>RID</th>
						<th>進貨時間</th>
						<th>進貨者</th>
						<th>進貨項目</th>
						<th>請求狀態</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
	</section>

	<c:if test="${(privilegeId==5)|| (privilegeId==7)}">
		<!-- Modal -->
		<div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">
							進貨單審核 | 進貨單號:<span><span>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h6>狀態更動</h6>
						<select id='sltStatus'></select>
						<hr>
						<h6>意見回覆</h6>
						<textarea cols="48" rows="5" class="p-1"></textarea>

						<div class="quickComment mt-2">
							<button type="button" class="btn btn-outline-secondary btn-sm">如擬辦理</button>
							<button type="button" class="btn btn-outline-secondary btn-sm">OKOK
								NOPROBLEM</button>
							<button type="button" class="btn btn-outline-secondary btn-sm">不能同意辦理</button>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="updateResponse">送出審核</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">關閉</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	<script>
	$(document).ready(function () {
		var table = $("#srTable").DataTable(
	        {
	            "ajax": {
	                "url": "http://localhost:8080/ProjectPizzaWorks/getAllStockRequestJSON",
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
	            "info": false,
	            "order": [[0, "desc"]],
	            // 欄位的操作
	            "columns": [{
	                "data": "sRequestId"
	            }, {
	                "data": "requestTime"
	            }, {
	                "data": "fullName"
	            }, {
	                "data": "stockRequestDetails", 
	                "render": function (data, type, row, meta) {
	                	//console.log(data);
	                	let size = data.length;
	                	let firstItem = data[0].materialsName;
	                	str = firstItem + "等" + size + "項";
	                	//console.log(str);
	                	return str;
	                }
	            },],
	            "columnDefs": [
	                // 核准狀態
	                {
	                    "targets": 4,
	                    "data": "requestStatus",
	                    "orderable": true,
	                    "render": function (data, type, row, meta) {
	                        switch (data) {
	                            case 0:
	                                return '尚未審核';
	                            case 1:
	                                return '退回';
	                            case 2:
	                                return '核准但未進貨';
	                        }
	                    }
	                },{
	                	"targets" : 5,
	                	"data" : "sRequestId",
	                	"width" : "8%",
	                	"render": function (data, type, row, meta) {
	                		return "<div><button class='btn btn-success btn-sm detailbtn'>詳細資訊</button></div>"
                        }
                    },{
	                	"targets" : 6,
	                	"data" : "requestStatus",
	                	"width" : "8%",
	                	"render": function (data, type, row, meta) {
	                		// 對於權限渲染網頁不同
	                		<c:choose>
	        					<c:when test="${(privilegeId==5)|| (privilegeId==7)}">
	        						if(data==0){
	        							return '<div><button type="button" class="btn btn-danger btn-sm btnResponse" data-toggle="modal" data-target="#ModalCenter">批覆</button></div>';
	        						}
	        						return "";
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
		
		// 導向單一產品頁面
		$('#srTable tbody').on('click', '.detailbtn', function(){
			var tr = $(this).closest('tr');
	    	var sRequestId = table.row(tr).data().sRequestId;
	    	<c:choose>
				<c:when test="${(privilegeId==4)}">
		    		loadingPage('${request.contextPath}/getOneStockRequest?id='+sRequestId+"&read=true");
		    	</c:when>
		    	<c:otherwise>
		    		loadingPage('${request.contextPath}/getOneStockRequest?id='+sRequestId+"&read=false");
				</c:otherwise>
			</c:choose>
		});
		
		/* 表格的開關  */
		var lastClick = []; 
	    $('#srTable tbody').on('click', 'td.details-control', function () {
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
	    
	    <c:if test="${(privilegeId==5)|| (privilegeId==7)}">
	    var monitorData;
		// 當權限為可審核才可以載入此段javascript
		    $("#srTable tbody").on("click", ".btnResponse" ,function (){
				var tr = $(this).closest('tr');
				monitorData = table.row(tr).data();
				console.log(monitorData);
		    	var sRequestId = table.row(tr).data().sRequestId;
				// 每次點擊都先清空意見欄
				$(".modal-body textarea").text("");
				
				// Modal 標頭
				$("#exampleModalLongTitle span").html(sRequestId);
				
				// Modal Option
				var status = table.row(tr).data().requestStatus;
				var op_text = ["尚未審核", "拒絕", "核准"];
				var str = "";
				for(var i = 0; i<op_text.length; i++){
            		if(i==status){
            			str += "<option value="+i+" selected >"+op_text[i]+"</option>";
            		} else{
            			str += "<option value="+i+" >"+op_text[i]+"</option>";
            		}
            	}
				$("#sltStatus").html(str);
			});
		
			// 快速意見的按鈕
			$(".quickComment .btn").click(function(){
				let val = $(this).text();
				$(".modal-body textarea").text(val);
			})
			
			// 獲取要更新的資料
			$("#updateResponse").click(function(){
				console.log(monitorData);
				let comment = $(".modal-body textarea").val();
				let status = $("#sltStatus").val();
				
				if(status==0){
					alert("若要核准進貨單，需更動狀態");
					return ;
				}
				
				var updateInfo = {};
				updateInfo.requestStatus = status;
				updateInfo.responseComment = comment;
				updateInfo.sRequestId = monitorData.sRequestId;
				
				$.ajax({
		  		    type : "PUT", 
		  		    url : "../stock/updateResponse",
		  		    data: JSON.stringify(updateInfo),
		  		    contentType: "application/json; charset=utf-8",
		   		}).done(function(data){
		   			alert("成功");
		   			$('#ModalCenter').one('hidden.bs.modal',function(){
		   				if(status==2){
							loadingPageWithData("/convertToStockHistoryPage",{"stockRequest_jsonStr":JSON.stringify(monitorData)});
						}else{
							loadingPage("/stock/GetAllStockRequest")
							}
					}).modal("hide");
		   		}).fail(function(){
		   			console.log("失敗");
		   			return false;
		   		});
				
			})
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