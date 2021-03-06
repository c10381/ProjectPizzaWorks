<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>員工資料檢視</title>
</head>
<body>
	<div align="center">
		<h2>員工資料</h2>
		<table id="Table" class="display">
			<thead>
				<tr>
					<th>帳號</th>
					<th>姓</th>
					<th>名</th>
					<th>性別</th>
					<th>身分</th>
					<th>生日</th>
					<th>電話</th>
					<!-- <th>地址</th> -->
					<th>狀態</th>
					<th></th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
		<!-- Modal -->
		<div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
			
				<div class="modal-content">
				
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">
							顧客狀態 | <span></span>
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
						<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
						<button type="button" class="btn btn-primary" id="updateResponse">變更狀態</button>
					</div>
				</div>
			</div>
		</div>
	<script>
		var table = $('#Table')
				.DataTable(
						{
							ajax : {
								url : "${pageContext.request.contextPath}/memberSystem/getAllMember",
								//默認不使用Key,直接讀取的Object Array
								dataSrc : "",
							},
							searching : false,
							bSort : false, //禁止排序
							info : false, //去掉底部文字
							columns : [
									{
										data : "email"
									},
									{
										data : "lastName"
									},
									{
										data : "firstName"
									},
									{
										data : "gender",
										render : function(data) {
											if (data == 1) {
												return "男";
											} else if (data == 2) {
												return "女";
											}
										},
									},
									{
										data : 'privilegeId',
										render : function(data) {
											if (data == 2) {
												return "網站後台管理員";
											} else if (data == 3) {
												return "銷貨負責人";
											} else if (data == 4) {
												return "進貨負責人";
											} else if (data == 5) {
												return "存貨負責人";
											} else if (data == 6) {
												return "客服人員";
											} else if (data == 7) {
												return "管理者";
											}
										},
									},
									{
										data : "birthDate"
									},
									{
										data : "cellphone"
									},
									{
										/* data : "address"
										}, { */
										data : "activeStatus",
										render : function(data) {
											if (data == 0) {
												return "會員刪除";
											} else if (data == 1) {
												return "未啟用";
											} else if (data == 2) {
												return "改密碼";
											} else if (data == 3) {
												return "已啟用";
											}
										},
									},
									{
										data : 'privilegeId',
										render : function(data){
											if(data==7){
												return "";
											}else{
												return '<div><button type="button" class="btn btn-danger btn-sm btnResponse" data-toggle="modal" data-target="#ModalCenter">狀態變更</button></div>';
											}
										}

									} ],
							//columns
							//中文化相關
							oLanguage : {
								"sProcessing" : "處理中...",
								"sLengthMenu" : "顯示 _MENU_ 項結果",
								"sZeroRecords" : "查無結果",
								"sInfo" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
								"sInfoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
								"sInfoFiltered" : "(從 _MAX_ 項結果過濾)",
								"sSearch" : "搜尋:",
								"oPaginate" : {
									"sFirst" : "首頁",
									"sPrevious" : "上頁",
									"sNext" : "下頁",
									"sLast" : "尾頁"
								}
							}
						});
	    var monitorData;
		// 當權限為可審核才可以載入此段javascript
		    $("#Table tbody").on("click", ".btnResponse" ,function (){
				var tr = $(this).closest('tr');
				monitorData = table.row(tr).data();
				//console.log("monitorData : " + monitorData);
		    	var activeStatus = table.row(tr).data().activeStatus;
		    	var fullName=table.row(tr).data().lastName+table.row(tr).data().firstName;
				//console.log("activeStatus : " + activeStatus);
				// Modal 標頭
				$("#exampleModalLongTitle span").html(fullName);
				
				// Modal Option
				var status = table.row(tr).data().activeStatus;
				var op_text = ["已停權", "未啟用", "改密碼", "已啟用"];
				var str = "";
				for(var i = 0; i<op_text.length; i++){
            		if(i==status){
            			str += "<option value="+i+" selected >"+op_text[i]+"</option>";
            		}else{
            			str += "<option value="+i+" >"+op_text[i]+"</option>";
            		}
            	}
				$("#sltStatus").html(str);
			});
		
		    $("#updateResponse").click(function(){
				//console.log(monitorData);
				let status = $("#sltStatus").val();
				
				if(status==null){
					alert("請更動狀態");
					return ;
				}
				
				/*var updateInfo = {};
				updateInfo.orderStatus = status;
				updateInfo.salesOrderId = monitorData.salesOrderId;
				console.log(JSON.stringify(updateInfo));*/
				monitorData.activeStatus = status;
				//console.log(status);
				
				$.ajax({
			  	    type : "PUT", 
			  	    url : "../memberSystem/saveCustomerStatus",
			  	    data: JSON.stringify(monitorData),
			  	    contentType: "application/json; charset=utf-8",
			   	}).done(function(data){
			   		alert("成功");
			   		$('#ModalCenter').one('hidden.bs.modal',function(){
					loadingPage("/memberSystem/allMember");
					}).modal("hide");
			   	}).fail(function(){
			   		console.log("失敗");
			   		return false;
			   	});			
			});			
	</script>
</body>
</html>