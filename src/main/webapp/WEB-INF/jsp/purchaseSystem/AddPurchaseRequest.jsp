<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>請購單</title>
<style>
textarea {
	resize: none;
}

</style>

</head>
<body>
	<section class="py-5">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8 mx-auto">
					<div class="card">
						<div class="card-header bg-light">請購單</div>
						<div class="card-body">
							<form class="needs-validation" novalidate>
								<div class="form-group row ">
									<label for="requestTime" class="col-sm-2 col-form-label">日期</label>
									<div class='col-sm-4' id='requestTime'>
										<input type='text' class="form-control" disabled />
									</div>
								</div>
								<div class="form-group row ">
									<label for="proposalerName" class="col-sm-2 col-form-label">承辦人</label>
									<div class='col-sm-4' id='proposalerId'>
										<input type='text' class="form-control"
											value="${Mem_LoginOK.firstName }" disabled />
										<input type="hidden" name="proposalerId" value="${Mem_LoginOK.memberId }"/>
									</div>
								</div>
								<div class="form-group row">
									<label for="purchaseReason" class="col-sm-2 col-form-label">請購理由</label>
									<div class='col-sm-4' id='purchaseReason'>
										<textarea cols="50" rows="3" name = "purchaseReason" maxlength="100"
											class="form-control" placeholder="請簡述本次請購理由..." required></textarea>
										<div class="invalid-feedback">請輸入請購理由</div>
									</div>
								</div>
								<div class="form-group row">
									<label for="unitPrice" class="col-sm-2 col-form-label">請購總額</label>
									<div class='col-sm-4' id='unitPrice'>
										<input type='text' name="totalPrice" id="totalPrice" class="form-control"
											value="" disabled required/>
									</div>
								</div>
								<hr>
								
								<div class="row">
									<div class="mr-2">
										<button type="button" name="add" id="add" class="btn btn-info">新增品項</button>
									</div>
										<button type="button" id="to_submit" class="btn btn-success">送出請購單</button>
								</div>
								
								<!-- <div class="alert alert-warning alert-dismissible text-right mt-2 d-none" role="alert">
									去那邊點選新增喔喔喔喔<i class="fas fa-arrow-right"></i>
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    									<span aria-hidden="true">&times;</span>
  									</button>
								</div> -->

								<br>
								<table id="prRequest" class="table table-striped text-center">
									<thead>
										<tr>
											<th></th>
											<th>品項編號</th>
											<th>品項名稱</th>
											<th>請求數量</th>
											<th>請求單價</th>
											<th></th>
										</tr>
									</thead>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-none materials">
					<div class="card card-default">
						<div class="card-header bg-light">
							<div class="card-title">
								<i class="fas fa-box-open"></i> 庫存品項
							</div>
							<!-- card-title end -->
						</div>
						<!--  card-header end -->
						<div class="card-body">
							<table id="table_materials" class="table table-striped text-center">
								<thead>
									<tr>
										<th>&nbsp;</th>
										<th>品項編號</th>
										<th>品項名稱</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<script>
		$(document).ready(function() {
			var date = new Date();
			$("#requestTime input").val(date.yyyymmdd());
			materials_table();
			toggle_Item(); 
			fetch_data();
		})	
			
		
		// 對於明細表的操作
		var fetch_data = function () {
			var dataTable = $('#prRequest').DataTable({
				"language": {
				      "emptyTable": "尚未有請購項目",
				},
				lengthChange: false,
				columnDefs: {
	                targets: [0],
	                orderable: false,
	                data: null,
	            },
				"searching" : false,
				"info" : false,
			});
			
			delete_Item(dataTable);
		}
		
		
		var toggle_Item = function(){
			 $("#add").click(function(){ 
				if($(this).html()=="新增品項"){
					$(this).html("取消新增")
					$(".materials").removeClass("d-none");
					new_item_html();
					insert_Item();
				}else{
					$(this).html("新增品項");
					$(".materials").addClass("d-none");
					$(".new_item").remove();
				}
			})
		}  
		
		
		// 將填入資料塞入附表表格
		var insert_Item = function(){
				$("#prRequest").on("click","#insert",function(e){
				e.preventDefault();

				if(validationInsert()){
					var totalPrice = $("#totalPrice").val();
					
					/* 塞到dateTables */
					var data = [];
					$(".new_item td:not(:first)").each(function(){
						value = $(this).html();
						data.push(value);
					})
					$("#prRequest").DataTable().row.add([
	            		'<input type="checkbox" value="' + data[0] + '">',
	            		data[0],
	            		data[1],
	            		data[2],
	            		data[3],
	            		'<a href="#" class="delete"><i class="far fa-trash-alt"></i></a>'
	            	]).draw(); 
					new_item_html();
					
					// 更新主表總額
					if(totalPrice!=""){
						totalPrice = parseInt(totalPrice);
					}
					totalPrice += data[2]*data[3];
					$("#totalPrice").val(totalPrice);
					
					// 更動material的按鈕
					$("#btnAddToRemove").remove();
				} 
			})
		}
		
		var validationInsert = function(){
			let td4= $('.new_item td:nth-of-type(4)').html();
			let td5= $('.new_item td:nth-of-type(5)').html();
			if($(".new_item td:not(:first)").html()==""){
				alert("請從品項表添加項目");
				return false;
			}
			if(td4==""){
				alert("請求數量需填入");
				$('.new_item td:nth-of-type(4)').focus();
				return false;
			}
			if(isNaN(td4)){
				alert("請求數量需為數字");
				return false;
			}
			if(td5==""){
				alert("請求單價需填入");
				$('.new_item td:nth-of-type(5)').focus();
				return false;
			}
			if(isNaN(td5)){
				alert("請求單價需為數字");
				return false;
			}
			if(td4<1||td5<1){
				alert("數量/單價不可小於0");
				return false;
			}
			return true; 
		}
		
		  // 對於品項表的操作
		var materials_table = function(){
			$(".item_input").hide();
			var table = $("#table_materials").DataTable({
	            ajax: {
						"url" : "../getAllMaterialsJSON",
						"type" : "GET",
						"dataSrc" : "", 
	            },
				columns : [ 
					{"data": ""},
					{"data" : "materialsId"}, 
					{"data" : "materialsName"},
					 ],
				
				/* searching: false, */ //關閉filter功能
				lengthChange: false,
	            responsive: true,
	            columnDefs: [{
	                targets: [0,2],
	                orderable: false,
	            }, {targets: 0,
	                data: null,
	                defaultContent: "<button id='btnRemoveToAdd' class='btn btn-info'><i class='fas fa-plus'></i></button>"
				}]
			});
			
			let flag = false;
			$('#table_materials tbody').on('click', '[id*=btnRemoveToAdd]', function () {
				
				// 當有點擊過，要先將被點擊過的按鈕狀態改回來
				if(flag ==true){
					$("#btnAddToRemove").children().removeClass("fa-minus").addClass("fa-plus");
					$("#btnAddToRemove").removeClass("btn-danger").addClass("btn-info");
					$("#btnAddToRemove").attr("id","btnRemoveToAdd");
				}
				var nowRow = table.row($(this).parents('tr'));
	        	var data = table.row($(this).parents('tr')).data();
	        	$('.new_item td:nth-of-type(2)').html(data.materialsId);
	        	$('.new_item td:nth-of-type(3)').html(data.materialsName);
	        	$('.new_item td:nth-of-type(4)').focus();
	        	
	        	// 更改按鈕狀態
	        	$(this).attr("id","btnAddToRemove");
	        	$(this).removeClass("btn-info").addClass("btn-danger");
	        	$(this).children().removeClass("fa-plus").addClass("fa-minus");
	        	flag = true;
	        });
		};
			

		
		var delete_Item = function(dataTable){
			$("#prRequest").on("click",".delete",function(e){
				e.preventDefault();
				// 刪除明細表的資料
				var nowRow = dataTable.row($(this).parents('tr'));
            	var data = dataTable.row($(this).parents('tr')).data();
            	nowRow.remove().draw();
            	
            	console.log(data)
            	// 還原材料表的狀態
				
			})	
		}
		// 主表 加新增資料列
		var new_item_html = function(){
			   var html = '<tr class="new_item">';
			   html += '<td></td>';
			   html += '<td data-col="1"></td>';
			   html += '<td data-col="2"></td>';
			   html += '<td contenteditable data-col="3" v></td>';
			   html += '<td contenteditable data-col="4"></td>';
			   html += '<td><a href="#" id="insert" class="text-info mr-1"><i class="fas fa-check"></i></a>';
			   html += '<a href="#" id="cancle" class="text-danger"><i class="fas fa-times"></i></a></td>';
			   html += '</tr>';
			   $('#prRequest').prepend(html);
		  };

		Date.prototype.yyyymmdd = function() {
			var mm = this.getMonth() + 1; // getMonth() is zero-based
			var dd = this.getDate();
			return [ this.getFullYear(), (mm > 9 ? '' : '0') + mm,
					(dd > 9 ? '' : '0') + dd ].join('-');
		};
		
		// 要送出的資料至後端
		var getSubmitData= function (){
			$("#to_submit").click(function(){
				// 資料檢查
				var forms = document.getElementsByClassName('needs-validation');
				var table = $('#prRequest').DataTable();
			    // Loop over them and prevent submission
			    var validation = Array.prototype.filter.call(forms, function(form) {
			        if (form.checkValidity() === false) {
			        	 form.classList.add('was-validated');
			        }else if(table.data().length==0){
			        	alert("每筆請購單至少要有一品項");
			        }else{
			        	let new_purchaseRequests = {};
						// 取得上方主檔內容
						$("form input, form textarea").each(function(){
							var input = $(this);
							if(input.attr("name")!= undefined){
								new_purchaseRequests[input.attr("name")] = input.val();
							}
						})
						// 取得dataTable的明細內容
						new_purchaseRequests.purchaseRequestDetails = [];
						// 從頭開始讀起
						table.rows().eq(0).each( function ( index ) {
							//取得每列的資料陣列 
					    	var data = table.row(index).data();
							var detail = {}
							detail["materialsId"] = data[1];
							detail["quantity"] = data[3];
							detail["unitPrice"] = data[4];
							new_purchaseRequests.purchaseRequestDetails.push(detail);
						} );
						if(confirm("確定送出請購單?")){
						 sendData(new_purchaseRequests)
						 }
			        }
			     })
			})
		}();
		
		function sendData(new_purchaseRequests) {
			$.ajax({
					url : "../insertOnePurchaseRequest",
					data : {
						"purchaseRequests" : JSON.stringify(new_purchaseRequests)
					},
					type : "POST"
					}).done(function(){
						alert("新增成功"); 
						loadingPage('/purchase/GetAllPRequest');
					}).fail(function(){
						alert("新增失敗");
					});
			}
	</script>
</body>
</html>