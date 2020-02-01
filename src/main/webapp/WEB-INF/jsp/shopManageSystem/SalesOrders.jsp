<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="UTF-8">
<title>SalesOrders</title>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid row">
			<div class="col-md-1">
				<button onclick="loadingPage('/backendSystem/backendIndex')"
					class="btn btn-block btn-secondary">返回</button>
			</div>
			<!-- col end -->
			<div class="col-md-4"></div>
			<!-- col end -->
			<div class="col-md-2">
				<h1>訂單清單</h1>
			</div>
			<!-- col end -->
		</div>
		<!-- container row end -->
	</section>
	<!-- <hr style="height: 1px; border: none; color: #333; background-color: #333;"> -->
	<section class="content">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<table id="table_salesOrder"
								class="display">
								<thead>
									<tr>
										<th>#</th>
										<th>客戶編號</th>
										<th>訂購時間</th>
										<th>取餐時間</th>
										<th>需要外送</th>
										<th>外送地址</th>
										<th>訂單總價</th>
										<th>訂單狀態</th>
										<th>&nbsp;</th>
									</tr>
								</thead>
								<tfoot>
								</tfoot>
							</table>
						</div>
						<!-- card-body end -->
					</div>
					<!--  card end -->
				</div>
				<!-- col end -->
			</div>
			<!-- row end -->
		</div>
		<!-- container end -->
	</section>
	<!-- content end -->
	<script type="text/javascript">
		var salesOrders = [
			<c:forEach var='salesOrder' items='${salesOrders}' varStatus='status'>
		["${salesOrder.salesOrderId}",
			"${salesOrder.memberId}",
			"${salesOrder.orderTime}",
			"${salesOrder.requireTime}",
			"${salesOrder.needDelivery}",
			"${salesOrder.deliverAddress}",
			"${salesOrder.totalSales}",
			"${salesOrder.orderStatus}"]
		<c:if test="${!status.last}">,</c:if>
	</c:forEach>
	];
		
		$(function () {
        	var table = $("#table_salesOrder").DataTable({
                searching: false, //關閉filter功能
                data: salesOrders,
                responsive: true,
                order: [[ 2, "desc" ]],
                columnDefs: [{
                    targets: [1,4,5,6,7,8],
                    orderable: false,
                },{
	                targets: 7,
	                data: null,
	                render: function(data, type, row, meta){
	                	var op_val = data[7];
	                	var op_text = ["未接單","拒絕該單", "已接單", "可取餐", "運送中", "已結單"];
	                	var select_html = "<select id='sltStatus' class='form-control'>";
	                	for(var i = 0; i<6; i++){
	                		if(i==op_val){
	                			select_html += "<option value="+i+" selected >"+op_text[i]+"</option>";
	                		} else{
	                			select_html += "<option value="+i+" >"+op_text[i]+"</option>";
	                		}
	                	}
	                	select_html += "</select>";
	                	return select_html;
	                },
	                defaultContent: ""
				}, {
	                targets: -1,
	                data: null,
	                defaultContent: "<button id='btnDetails' class='btn btn-success'>詳細資料</button>"
				}]
            });
            
            $('#table_salesOrder tbody').on('click', '[id*=btnDetails]', function () {
                var data = table.row($(this).parents('tr')).data();
                var salesOrderId = data[0]; 
                loadingPage('${request.contextPath}/shopManageSystem/getSalesOrder?id='+salesOrderId);
            });
            
            $('#table_salesOrder tbody').on('change', '[id*=sltStatus]', function () {
            	var data = table.row($(this).parents('tr')).data();
                var orderStatus = this.value;
                var salesOrder = new Object();
                salesOrder["salesOrderId"] = data[0]
                salesOrder["orderStatus"] = orderStatus;
                $.ajax({
    				url: "${pageContext.request.contextPath}/shopManageSystem/updateSalesOrderStatus",
    				data: {"salesOrder":JSON.stringify(salesOrder)},
    				type: "POST",
    				
    				error:function(){
    					console.log(JSON.stringify({salesOrder: salesOrder}));
    					console.log("Error");
    				},
    				success: function(data){
    					console.log(data);
    					alert("狀態修改"+data);
    				}
    			})
                this.val = orderStatus;
            });
        });
	</script>
</body>
</html>
