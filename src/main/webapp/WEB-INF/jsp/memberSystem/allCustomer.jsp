<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客資料檢視</title>
</head>
<body>
	<div align="center">
		<h2>顧客資料</h2>
		<table id="Table" class="display">
			<thead>
				<th>帳號</th>
				<th>姓</th>
				<th>名</th>
				<th>性別</th>
				<th>生日</th>
				<th>電話</th>
				<th>地址</th>
				<th>狀態</th>
			</thead>
		</table>
	</div>
	<script>
		var table = $('#Table')
				.DataTable(
						{
							ajax : {
								url : "${pageContext.request.contextPath}/memberSystem/getAllCustomer",
								//默認不使用Key,直接讀取的Object Array
								dataSrc : "",
							},
							columns : [ {
								data : "email"
							}, {
								data : "lastName"
							}, {
								data : "firstName"
							}, {
								data : "gender",
								render : function(data){
									if(data==1){
										return "男";
									}else if(data==2){
										return "女";
									}
								},
							},{
								data : "birthDate"
							}, {
								data : "cellphone"
							}, {
								data : "address"
							}, {
								data : "activeStatus",
								render : function(data){
									if(data==0){
										return "會員刪除";
									}else if(data==1){
										return "未啟用";
									}else if(data==2){
										return "改密碼";
									}else if(data==3){
										return "已啟用";
									}
								},
							}, ],
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
	</script>
</body>
</html>