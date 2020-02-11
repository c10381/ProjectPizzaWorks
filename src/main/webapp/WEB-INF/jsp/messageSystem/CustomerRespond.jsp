<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客訴資訊</title>
<style>
.details-control {
	cursor: pointer;
}

.details-control:hover {
	color: #FF8040;
}

.modal-backdrop{
	display:none;
}

</style>
</head>
<body>
<!-- 右上角關閉按鈕 -->
	<section>
		<div class="container-fluid text-center">
			<i class='fas fa-times' style='font-size:20px;margin:7px; float:left ' onclick='floatPageClose()'></i>
			<h2>客服回應一覽</h2>
			<table id="prTable" class="text-center display">
				<thead>
					<tr>
						<th></th>
						<th>QID</th>
						<th>客訴人</th>
						<th>客訴時間</th>
						<th>狀態</th>
						<th>回應時間</th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
	</section>
		<!-- Modal -->
		<div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<input type="hidden" value=""></input>
						<h5 class="modal-title" id="exampleModalLongTitle">
							客服回應表 | <br>回饋客戶：<span></span>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h6>提供意見：</h6>
						<div id='sltStatus' class="mb-3 text-lg" ></div>
						<hr class="mb-2">
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
	<script>
	$(document).ready(function () {
		var customerRequest=null;
		var memberList=null;
		//關掉dataTable的警告
		$.fn.dataTable.ext.errMode = 'none';
		
		var table = $("#prTable").DataTable(
	        {
	        	/* "data":customerRequest, */
	        	"ajax": {
	                "url": "${pageContext.request.contextPath}/messageSystem/AllCustomerRequest",
	                "type": "GET",
	                "dataSrc": function(data){
	                	customerRequest=data.customerRequest;
	    				memberList=data.memberList;
	    				return customerRequest;
		                },
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
	                'dom': 'Rlfrtip',
	            }, {
	                "data": "queryId"
	            }, {
	            	"data" : "memberEmail",
					render : function(data){
						for(var i=0;i<memberList.length;i++){
							if(data==memberList[i].Email){
								return memberList[i].fullName;
								break;
								}
							}
					},
	            }, {
	                "data": "queryDate",
	                "render": function (data) {
						return data.substring(0,data.lastIndexOf("."));
	                }
	            }, {
	                "data": "replyStatus", 
	                "render": function (data) {
	                	if(data==0){
							return "未回復"; 
		                }
	                	else if(data==1){
							return "已即時回覆"; 
		                }
	                	else if(data==2){
							return "已使用信件回覆"; 
		                }
	                }
	            },{
	                "data": "replyDate", 
	                "render": function (data) {
	                	if(data==undefined){
							return "---"; 
		                }
	                	else{
							return data.substring(0,data.lastIndexOf("."));
			                }
	                	
	                }
	            }, ],
	            "columnDefs": [
	                // 核准狀態
	                {
	                	"targets" : 6,
	                	"data" : "replyStatus",
	                	/* "width" : "15%", */
	                	"render": function (data, type, row, meta) {
	                		if(data==0){
	                			return "<div><button class='btn btn-success btn-sm btnResponse' data-toggle='modal' data-target='#ModalCenter'>回覆</button></div>"
			                }
                        }
                    }
                ], 
	        });
		
		/* 表格的開關  */
		var lastClick = []; 
	    $('#prTable tbody').on('click', 'td.details-control', function () {
	    	var tr = $(this).closest('tr');
	        var row = table.row(tr);
	    	var queryId = table.row(tr).data().queryId;
			
	     	
	     	/* if (row.data().readTime == undefined && check() == false){
	     			/* alert("此筆資料尚未讀取過"); */
		     /* 		updateReadTime(queryId);
		     		lastClick.push(queryId);
	     	}; */ 
	     	
	        if ( row.child.isShown() ) {
	            // This row is already open - close it
	            row.child.hide();
	            tr.removeClass('shown');
	            tr.find('i').toggleClass('fa-plus');
	            tr.find('i').toggleClass('fa-minus');
	        }
	        else {
	            // Open this row
	            row.child( format(row.data().queryId,customerRequest,memberList) ).show();
	            tr.addClass('shown');
	            tr.find('i').toggleClass('fa-plus');
	            tr.find('i').toggleClass('fa-minus');
	        }
	    });
	
	    var monitorData;
	    var customerRequestBean;
	    var CustomerName;
	    var CustomerEmail;
	    
		    $("#prTable tbody").on("click", ".btnResponse" ,function (){
				var tr = $(this).closest('tr');
				monitorData = table.row(tr).data();
				//console.log(monitorData);
				CustomerEmail = table.row(tr).data().memberEmail;
		    	//console.log(CustomerEmail);
		    	$(".modal-header input").val(table.row(tr).data().queryId);
		    	
		    	for(var i=0;i<memberList.length;i++){
					if(CustomerEmail==memberList[i].Email){
						CustomerName=memberList[i].fullName;
						break;
						}
				}
				for(var i=0;i<customerRequest.length;i++){
					if(customerRequest[i].memberEmail==CustomerEmail){
						customerRequestBean=customerRequest[i];
						break;
					}
				}
				// 每次點擊都先清空意見欄
				$(".modal-body textarea").text("");
				
				// Modal 標頭
				$("#exampleModalLongTitle span").html(CustomerEmail);
				
				// Modal Option
				var status = table.row(tr).data().requestStatus;
				var str = "";
				
            	str += monitorData.queryContent;
				$("#sltStatus").html(str);
			});
			
			// 按下按鈕寄出信件
			$("#updateResponse").click(function(){
				//console.log(monitorData);
				let comment = $(".modal-body textarea").val();
				let queryId = $(".modal-header input").val();
				/* console.log(Bean); */
				$.ajax({
		  		    type : "Post", 
		  		    url : "${pageContext.request.contextPath}/messageSystem/replyoffline",
		  		    data: {
						"queryId":monitorData.queryId,
						"CustomerEmail":monitorData.memberEmail,
						"CustomerName":CustomerName,
						"queryContent":monitorData.queryContent,
						"coworkerEmail":memberEmail,
						"replyContent":comment,
						},

		   		}).done(function(data){
		   			alert("成功");
		   			$('#ModalCenter').one('hidden.bs.modal').modal("hide");
		   			/* floatPage('${pageContext.request.contextPath}/messageSystem/CustomerRespondSystem'); */
		   		}).fail(function(){
		   			console.log("失敗");
		   			return false;
		   		}) 
				
			}) 
    	
	
	});
	
	
     // 下拉式選單的表格
	function format (queryId,customerRequest,memberList) {
		
		let customerRequestBean=null;
		for(var i=0;i<customerRequest.length;i++){
			if(customerRequest[i].queryId==queryId){
				//console.log(customerRequest[i]);
				customerRequestBean=customerRequest[i];
				break;
			}
		}
		let str ="";
	 
    	 str += '<table class="table table-bordered text-center mt-2 col-md-12 align-self-center align-items-center">'+
     			'<thead class="thead-info"><tr>'+
     				'<th class="w-25">客戶</th><th class="w-25">回饋內容</th><th class="w-25">回應人</th><th class="w-25">回應內容</th>'+
     			'</tr></thead>';
     	var CustomerName=null;
    		for(var i=0;i<memberList.length;i++){
    			//console.log(customerRequestBean.memberName);
				if(customerRequestBean.memberEmail==memberList[i].Email){
					CustomerName=memberList[i].fullName;
					break;
					}
			}

    		str += '<tr>'
    		str += '<td>'+ CustomerName + '<br>'+customerRequestBean.memberEmail + '</td>';
    		str += '<td>'+ customerRequestBean.queryContent + '</td>';
    		if(customerRequestBean.replyStatus==0){
    			str += '<td>---</td>';
        		str += '<td>---</td>';
            }else{
                for(var i=0;i<memberList.length;i++){
                    //console.log(memberList[i].memberId);
                	if(memberList[i].memberId==customerRequestBean.coworkerID){
                		str += '<td>'+ memberList[i].fullName + '</td>';
                    }
                }
                
    		str += '<td>'+ customerRequestBean.replyContent + '</td>';
            }
    		str += '</tr>';
    	
	    return str;
	    }
	
	</script>
</body>
</html>