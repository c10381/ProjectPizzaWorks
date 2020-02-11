<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Request</title>
</head>
<body>
<section class="content-header">
		<div class="container-fluid row">
			<div class="col-md-1">
				<button
					onclick="loadingPage('${request.contextPath}/shopManageSystem/GetAllSalesList')"
					class="btn btn-block btn-secondary">返回</button>
			</div>
			<!-- col end -->
			<div class="col-md-4"></div>
			<!-- col end -->
			<div class="col-md-2">
				<h1>銷貨單資訊</h1>
			</div>
			<!-- col end -->
		</div>
		<!-- row end -->
	</section>
	<section class="content">
		<div class="container">
			<div class="card">
				<div class="card-body">
					<form>
						<fieldset>
							<div class="row">
								<div class="col-md-6">
									<strong>銷貨單編號: <span id="salesListId"></span></strong>
								</div>
								<!-- col end -->
								<div class="col-md-6">下單時間：<span id="orderTime"></span></div>
								
								<!-- col end -->
							</div>
							<!-- row end -->
							<div class="row">
								<div class="col-md-6">銷貨者：<span id="memberId"></span></div>
								<!-- col end -->
							</div>
							<!-- row end -->
							<div class="table-responsive p-0 mt-4 ">
								<table id ="sldTable" class="table table-hover text-nowrap text-center">
									<thead>
										<tr>
											<th>品項編號</th>
											<th>品項名稱</th>
											<th>出貨數量</th>
											<th>單位</th>
										</tr>
									</thead>
								</table>
							</div>
							<!--  table end -->
						</fieldset>
					</form>
				</div>
				<!-- card-body end -->
			</div>
			<!-- card end -->
		</div>
		<!-- container end -->
	</section>
	<!-- content end -->
	<script>
		
		$(function(){
			slReq = ${salesList_jsonStr};
			dataToHtml(slReq);
		})
		
		function dataToHtml(data){
			$("#salesListId").html(data.salesListId);
			$("#memberId").html(data.fullName);
			$("#orderTime").html(data.orderTime);
			
			$("#sldTable").DataTable({
				"data" : slReq.salesListDetails,	
	            "columns":[
	            	{"data" : "materialsId" },
	            	{"data" : "materialsName" },
	             	{"data" : "quantity" },
	             	{"data" : "unit"}
	           	],
           		"searching": false,
	            "lengthChange": false,
	            // 關閉上下頁
	            "bPaginate": false,
	            "language" :{
	            	"InfoEmpty": "顯示第 0 至 0 項結果，共 0 項",
	            	"info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
	            }
			});
		}
		
	</script>
</body>
</html>