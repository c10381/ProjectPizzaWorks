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
				<h2>新增採購單</h2>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-8">
				<div class="card card-default">
					<div class="card-header">
						<div class="card-title">
							<i class="fas fa-cookie"></i>採購單
						</div>
						<!-- card-title end -->
					</div>
					<!--  card-header end -->
					<div class="card-body">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="memberName" class="col-form-label">採購單申請人：</label>
									<input type="hidden" id="memberId" value="${Mem_LoginOK.memberId}" /> 
									<input id="memberName" type='text' value="${Mem_LoginOK.lastName}${Mem_LoginOK.firstName}"
										class='form-control' disabled />
								</div>
								<!-- form-group end -->
							</div>
							<!-- col end -->
							<div class="col-sm-6">
								<div class="form-group">
									<label for="requestTime" class="col-form-label">採購單申請時間：</label>
									<input id='requestTime' type='text' class="form-control"
										disabled />
								</div>
								<!-- form-group end -->
							</div>
							<!-- col end -->
						</div>
						<!-- row end -->
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for='briefInfo'>採購單簡述：</label>
									<!-- <textarea id="briefInfo" class='form-control' style="resize: none" ></textarea> -->
									<textarea id="briefInfo" class='form-control'></textarea>
								</div>
								<!-- form-group end -->
							</div>
							<!-- col end -->
						</div>
						<!-- row end -->
						<hr>
						<div class="row">
							<div class="col-sm-2 col-md-1">
								<input type="button" value="提交採購單"  onclick="sumbitDataTable()"
								class="btn btn-success" />
							</div>
						</div>
						<hr>
						<div class="row">
							<h4>採購細項</h4>
							<hr>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table id="table_requestDetails" class="display">
									<thead>
										<tr>
											<th>食材編號</th>
											<th>食材名稱</th>
											<th>需求數</th>
											<th>單價</th>
											<th>&nbsp;</th>
										</tr>
									</thead>
									<tfoot>
									</tfoot>
								</table>
							</div>
						</div>
						<!-- <p>&nbsp;</p>
						<p>
							<input type="button" value="新增進貨單"  onclick="sumbitDataTable()"
								class="btn btn-success float-right" />
						</p> -->
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
						<div class="row">
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table id="table_materials" class="display">
									<thead>
										<tr>
											<th>&nbsp;</th>
											<th>食材編號</th>
											<th>食材名稱</th>
										</tr>
									</thead>
									<tfoot>
									</tfoot>
								</table>
							</div>
						</div>
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
	<script>
		$(document).ready(
				function() {
					Date.prototype.yyyymmdd = function() {
						var mm = this.getMonth() + 1; // getMonth() is zero-based
						var dd = this.getDate();

						return [ this.getFullYear(), (mm > 9 ? '' : '0') + mm,
								(dd > 9 ? '' : '0') + dd ].join('-');
					};

					var date = new Date();
					$("#requestTime").val(date.yyyymmdd());
				});
	</script>

	<script type="text/javascript">
		var materials = [
		<c:forEach var="material" items="${materials}" varStatus='status'>
			["","${material.materialsId}","${material.materialsName}"]
			<c:if test="${!status.last}">,</c:if>
		</c:forEach>
		];
		var sRequestDetails = [];
		
		var purchaseRequest_json = ${purchaseRequest_jsonStr};
		//console.log(products);
		for(var i=0; i<purchaseRequest_json.purchaseRequestDetails.length; i++){
			var srDetail = purchaseRequest_json.purchaseRequestDetails[i];
			var sRequestDetail = [];
			sRequestDetail.push(srDetail.materialsId);
			sRequestDetail.push(srDetail.materialsName);
			sRequestDetail.push("");
			sRequestDetail.push(srDetail.unitPrice);
			sRequestDetail.push("");
			sRequestDetails.push(sRequestDetail);
		}
		
        $(function () {
        	var table = $("#table_materials").DataTable({
                searching: false, //關閉filter功能
                data: materials,
                responsive: true, 
                order: [[ 1, "asc" ]],
                columnDefs: [{
                    targets: [0,2],
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
            	console.log(new_row);
            	$('#table_requestDetails').DataTable().row.add([
            		data[1],
            		data[2],
            		"<input type='text id=txt_quantity'/>",
            		"",
            		"<button id='btn_RemoveToAddR'>移除至請求</button>"
            	]).draw();
            	nowRow.remove().draw();
            });
        });
        
        $(function () {
        	var table = $("#table_requestDetails").DataTable({
                searching: false, //關閉filter功能
                data: sRequestDetails,
                responsive: true,
                order: [[ 0, "asc" ]],
                columnDefs: [{
                    targets: [1,2,3,4],
                    orderable: false,
                }, {
	                targets: 4,
	                data: null,
	                defaultContent: "<button id='btnRemoveToAddR' class='btn btn-success'>移除至食譜</button>"
				}, {
					targets: 2,
	                data: null,
	                defaultContent: "<input type='text' id='txt_quantity' />"
				}]
        	
            });
            
            $('#table_requestDetails tbody').on('click', '[id*=btnRemoveToAddR]', function () {
                var nowRow = table.row($(this).parents('tr'));
            	var data = nowRow.data();
                //console.log(data);
            	var new_row = new Object();
            	new_row['materialsId'] = data[0];
            	new_row['materialsName'] = data[1];
            	new_row['unit'] = data[2];
            	//console.log(new_row);
            	$('#table_materials').DataTable().row.add([
            		"<button id='btn_RemoveToAdd' class='btn btn-success'>添加至請求</button>",
            		data[0],
            		data[1]
            	]).draw();
            	nowRow.remove().draw();
            });
        });
       
		
		var purchaseRequest;
		
        function getRequestsTable() {
			var totalNumber = document.getElementById("table_requestDetails").rows.length;
			var pRequest = new Object();
			var requestDetails = [];
			pRequest["pRequestId"] = purchaseRequest_json.pRequestId;
			pRequest["proposalerId"] = $('#memberId').val();
			pRequest["briefInfo"] = $("#briefInfo").val();
			for (var i = 1; i < totalNumber; i += 1) {
				var table_row = document.getElementById("table_requestDetails").rows[i];
				var pRequestDetails = new Object();
				pRequestDetails["materialsId"] = table_row.cells[0].innerHTML;
				pRequestDetails["quantity"] = table_row.cells[2].children[0].value;
				pRequestDetails["unitPrice"] = table_row.cells[3].innerHTML;
				requestDetails.push(pRequestDetails);
			}
			pRequest["purchaseRequestDetails"] = requestDetails;
			purchaseRequest = pRequest;
			//console.log(recipes);
		}

		// EXTRACT AND SUBMIT TABLE DATA.
		function sumbitDataTable() {
			// LOOP THROUGH EACH ROW OF THE TABLE.
			
			getRequestsTable();
			console.log('Data send:\n' + JSON.stringify({purchaseRequest: purchaseRequest}));
			//sendData();
		}

		function sendData() {
			$.ajax({
					url : "${pageContext.request.contextPath}/shopManageSystem/AddNewProduct",
					data : {
						"purchaseRequest" : JSON.stringify(purchaseRequest)
					},
					type : "POST",
					error : function() {
						console.log(JSON.stringify({
							purchaseRequest : purchaseRequest
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