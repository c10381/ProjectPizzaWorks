<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
</head>
<body>
	<div id="tabs">
		<div id="registerOneMember">
			<section>
				<div class='container'>
					<h1 style="text-align: center">請求修改密碼</h1>
				</div>
			</section>

		</div>
		<!-- /registerOneMember -->
		<div id="registerManyMember">
			<div>

				<table id="Table" class="display">
					<thead>
						<tr>
							<th>RID</th>
							<th>帳號(Email)</th>
							<th>請求時間</th>
							<th>允許人</th>
							<th>允許時間</th>
							<th>請求狀態</th>
							<th>備註</th>
							<th>回應</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<!-- /registerManyMember -->
	</div>
	<!-- /tag -->
	<script>
				//呼叫DataTable
				var table=$('#Table').DataTable({
					data : [
					<c:forEach items="${List}" var="Bean">
					{
						'DT_RowId':"${Bean.vRequestId}",
						'vRequestId':"${Bean.vRequestId}",
						'email':"${Bean.email}",
						'requestTime':"${Bean.requestTime}",
						'approverName':"${Bean.approver.lastName}${Bean.approver.firstName}",
						'responseTime':"${Bean.responseTime}",
						<c:choose>
							<c:when test="${Bean.requestStatus == 1}">
								'requestStatus':"帳號未驗證",
							</c:when>
							<c:when test="${Bean.requestStatus == 2}">
								'requestStatus':"帳號啟用",
							</c:when>
							<c:when test="${Bean.requestStatus == 3}">
								'requestStatus':"尚未簽核",
							</c:when>
							<c:when test="${Bean.requestStatus == 4}">
								'requestStatus':"核准申請",
							</c:when>
							<c:when test="${Bean.requestStatus == 5}">
								'requestStatus':"拒絕申請",
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${Bean.requestStatus != 3}">
								'responseComment':"${Bean.responseComment}",
							</c:when>
							<c:otherwise>
								'responseComment':"<div id='${Bean.vRequestId}response'><input type='text' class='form-control' id='${Bean.vRequestId}responseComment'></input></div>",
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${Bean.requestStatus == 3}">
								'response':"<div id='${Bean.vRequestId}ButtonArea'><button class='btn btn-sm btn-danger' onclick='responseCommit(${Bean.vRequestId})'>核准</button><button class='btn btn-sm btn-Info' onclick='responseRefuse(${Bean.vRequestId})'>拒絕</button></div>",
							</c:when>
							<c:otherwise>
								'response':"",
							</c:otherwise>
						</c:choose>
						
					},
					</c:forEach>
					],
					columns : [ {
						data : 'vRequestId'
					},  {
						data : 'email'
					}, {
						data : 'requestTime'
					}, {
						data : 'approverName'
					}, {
						data : 'responseTime'
					}, {
						data : 'requestStatus'
					}, {
						data : 'responseComment'
					}, {
						data : 'response'
					}, ],
					//中文化相關
					oLanguage : {
						"sProcessing" : "處理中...",
						"sLengthMenu" : "顯示 _MENU_ 項結果",
						"sZeroRecords" : "沒有匹配結果",
						"sInfo" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
						"sInfoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
						"sInfoFiltered" : "(從 _MAX_ 項結果過濾)",
						"sSearch" : "搜索:",
						"oPaginate" : {
							"sFirst" : "首頁",
							"sPrevious" : "上頁",
							"sNext" : "下頁",
							"sLast" : "尾頁"
						}
					}
				});
				function responseCommit(id){
					console.log(id);
					
					//可以用這個方法選取指定欄位資料
					//console.log(table.row("#"+id).data().requestStatus);
					
					var responseComment=$("#"+id+"responseComment").val()
					$.ajax({
						url : "${pageContext.request.contextPath}/memberSystem/CoworkerPWRequest",
						data : {
							"Answer":true,
							"id" : id,
							"responseComment":responseComment,
						},
						type : "Post",
						error : function() {
							console.log("error");
						},
						success : function(data) {
							console.log(data);
							$("#"+id+"response").empty();
							$("#"+id+"response").append(responseComment);
							$("#"+id).children()[5].innerHTML="已簽核";
							
							$("#"+id+"ButtonArea").empty();
							if(data==true){
								$("#"+id+"ButtonArea").append("已送出回應");
							}else{
								$("#"+id+"ButtonArea").append("錯誤，此會員狀態可能未啟用");
							}
							
						}
					}) 
					
				}
				function responseRefuse(id){
					$.ajax({
						url : "${pageContext.request.contextPath}/memberSystem/CoworkerPWRequest",
						data : {
							"Answer":false,
							"id" : id,
							"responseComment":responseComment,
						},
						type : "Post",
						error : function() {
							console.log("error");
						},
						success : function(data) {
							console.log(data);
							$("#"+id+"response").empty();
							$("#"+id+"response").append(responseComment);
							$("#"+id).children()[5].innerHTML="已簽核";
							$("#"+id+"ButtonArea").empty();
							if(data==true){
								$("#"+id+"ButtonArea").append("已送出回應");
							}else{
								$("#"+id+"ButtonArea").append("錯誤，此會員狀態可能未啟用");
							}
							
						}
					})
					
				}
	</script>

</body>
</html>