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
<title>New Stock History</title>

<script>
	
</script>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>確認進貨紀錄</h2>
			</div>
		</div>
	</section>
	<section class="content">
			<div class="col-md-12">
				<div class="card card-default">
					<div class="card-header">
						<div class="card-title">
							<i class="fas fa-cookie"></i>進貨紀錄單
						</div>
						<!-- card-title end -->
					</div>
					<!--  card-header end -->
					<div class="card-body">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="memberName" class="col-form-label">進貨紀錄單確認者：</label>
									<input type="hidden" id="memberId" value="${Mem_LoginOK.memberId}" /> 
									<input id="memberName" type='text' value="${Mem_LoginOK.lastName}${Mem_LoginOK.firstName}"
										class='form-control' disabled />
								</div>
								<!-- form-group end -->
							</div>
							<!-- col end -->
							<div class="col-sm-6">
								<div class="form-group">
									<label for="requestTime" class="col-form-label">進貨紀錄時間：</label>
									<input id='requestTime' type='text' class="form-control"
										disabled />
								</div>
								<!-- form-group end -->
							</div>
							<!-- col end -->
						</div>
						<hr>
						<div class="row">
							<br>
							<div class="col-sm-3">
								<input type="button" value="提交進貨紀錄"  onclick="sumbitDataTable()"
								class="btn btn-success " />
							</div>
							<br>
						</div>
						
						<hr>
						<br>
						<div class="row">
							<h4>進貨細項</h4>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table id="table_requestDetails" class="display">
									<thead>
										<tr>
											<th>貨品編號</th>
											<th>貨品名稱</th>
											<th>保存期限</th>
											<th>進貨箱數</th>
											<th>每箱單價</th>
											<th>每箱數量</th>
											<th>每箱單位</th>
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
		
		 function isNumberKey(evt)
	      {
	         var charCode = (evt.which) ? evt.which : event.keyCode
	         if (charCode > 31 && (charCode < 48 || charCode > 57))
	            return false;

	         return true;
	      }
		 
		 function insertTime() {
			flatpickr(".flatpickr", {
				altInputClass : "form-group",
				plugins : [ new confirmDatePlugin({
					confirmText : "確定",
					showAlways : false,
					//theme : "light",
					theme : "dark",
				}) ],
				//enableTime : true,
				//time_24hr : false,
				minDate : "today",
				//maxDate : new Date().fp_incr(7),
				wrap : true,
			});
		}
		 /*
		function temp_name(){
			insertTime();
	 		$(".flatpickr-input").val("");
	 		$(".flatpickr-input").each(function() {
	 			console.log($(this).val());
	 			if($(this).val()!=""){
	 				cart.requireTime = ($(this).val());
	 			}
	 			;
	 		})
		 }*/
		// 外帶方式確認
		/* function checkDeliver() {
		 	$("#delieverModal").modal("show");
		 	$(".delieveryInfo").hide();
		 	insertTime();

		 	$("select[name='delieverType']").change(function() {
		 		$(".flatpickr-input").val("");
		 		$(".takeOutInfo").toggle();
		 		$(".delieveryInfo").toggle();
		 	})

		 	$("#delieverModal .next").click(function() {
		 		var deliverType = $("#delieverModal select").val();

		 		// 取得需求日期

		 		$(".flatpickr-input").each(function() {
		 			console.log($(this).val());
		 			if($(this).val()!=""){
		 				cart.requireTime = ($(this).val());
		 			}
		 			;
		 		})

		 		if (deliverType == "delivery") {
		 			cart.needDelivery = 1;
		 			cart.deliverAddress = $("#address").val();
		 		} else {
		 			cart.needDelivery = 0;
		 		}
		 		checkPizza();
		 	})
		 }*/
	</script>

	<script type="text/javascript">
	
		var materialsUnits = ${materialsUnits};
		var suppliersProvisions = ${suppliersProvisions};
		
		var sRequestDetails = [];
		
		var stockRequest_json = ${stockRequest_jsonStr};
		//console.log(products);
		for(var i=0; i<stockRequest_json.stockRequestDetails.length; i++){
			var srDetail = stockRequest_json.stockRequestDetails[i];
			var sRequestDetail = [];
			var mid = srDetail.materialsId;
			sRequestDetail.push(srDetail.materialsId);
			sRequestDetail.push(srDetail.materialsName);
			sRequestDetail.push("");
			sRequestDetail.push(srDetail.quantity);
			sRequestDetail.push(suppliersProvisions[mid-1].unitPrice);
			sRequestDetail.push(materialsUnits[mid-1].quantityPerUnit);
			sRequestDetail.push(materialsUnits[mid-1].unit);
			sRequestDetails.push(sRequestDetail);
		}
		
        $(function () {
        	var table = $("#table_requestDetails").DataTable({
                searching: false, //關閉filter功能
                data: sRequestDetails,
                responsive: true,
                order: [[ 0, "asc" ]],
                columnDefs: [{
                    targets: [1,2,3,4,5,6],
                    orderable: false,
                }, {
					targets: 2,
	                data: null,
	                render: function(data, type, row, meta){
	                	var quantity = data[2];
	                	var input_html = "<div class='flatpickr'><input type='text' data-input/> <a class='input-button' title='toggle' data-toggle><i class='far fa-calendar-alt'></i></a></div>";
	           		 	insertTime();
	                	return input_html;
	                },
	                defaultContent: ""
				}]
        	
            });
        });
       
		
		var stockRequest;
		
        function getRequestsTable() {
			var totalNumber = document.getElementById("table_requestDetails").rows.length;
			var sRequest = new Object();
			var requestDetails = [];
			sRequest["sRequestId"] = stockRequest_json.sRequestId;
			sRequest["approverId"] = $('#memberId').val();
			sRequest["pOrderId"] = stockRequest_json.pOrderId;
			//sRequest["totalSale"] = $("#totalSale").val();
			var flag = false;
			for (var i = 1; i < totalNumber; i += 1) {
				var table_row = document.getElementById("table_requestDetails").rows[i];
				var sRequestDetails = new Object();
				sRequestDetails["materialsId"] = table_row.cells[0].innerHTML;
				var expiryDate  = table_row.cells[2].children[0].children[0].value;
				if(expiryDate === ""){
					flag = true;
					break;
				}
				sRequestDetails["expiryDate"] = expiryDate;
				sRequestDetails["quantity"] = table_row.cells[3].innerHTML;
				sRequestDetails["unitPrice"] = table_row.cells[4].innerHTML;
				sRequestDetails["quantityPerUnit"] = table_row.cells[5].innerHTML;
				sRequestDetails["unit"] = table_row.cells[6].innerHTML;
				requestDetails.push(sRequestDetails);
			}
			sRequest["stockRequestDetails"] = requestDetails;
			stockRequest = sRequest;
			return flag;
			//console.log(recipes);
		}

		// EXTRACT AND SUBMIT TABLE DATA.
		function sumbitDataTable() {
			// LOOP THROUGH EACH ROW OF THE TABLE.
			
			var flag = getRequestsTable();
			if(!flag){
				//console.log('Data send:\n' + JSON.stringify({stockRequest: stockRequest}));
				sendData();
			}else{
				alert("你必須輸入所有貨品的保存期限!");
			}
		}

		function sendData() {
			$.ajax({
					url : "${pageContext.request.contextPath}/saveStockHistory",
					data : {
						"stockRequest" : JSON.stringify(stockRequest)
					},
					type : "POST",
					error : function() {
						console.log(JSON.stringify({
							stockRequest : stockRequest
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