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
	<div id="tabs" style="width: 50%; margin: auto;">
		<div id="registerOneMember">
			<section>
				<div class='container'>
					<h1 style="text-align: center">員工忘記密碼確認</h1>
				</div>
			</section>

		</div>
		<!-- /registerOneMember -->
		<div id="registerManyMember">
			<div>

				<table id="Table" class="display">
					<thead>
						<th>RID</th>
						<th>帳號(Email)</th>
						<th>請求時間</th>
						<th>允許人</th>
						<th>允許時間</th>
						<th>請求狀態</th>
						<th>備註</th>
						<th>回應</th>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<!-- /registerManyMember -->
	</div>
	<!-- /tag -->
	<script>
	//1. WTF??為啥沒東西(DB裡頭有)
	console.log("${Bean.approver.memberId}");
	console.log("${Bean.approverId}");
				//呼叫DataTable
				var table=$('#Table').DataTable({
					data : [
					<c:forEach items="${List}" var="Bean">
					{
						'rowId':"${Bean.vRequestId}",
						'vRequestId':"${Bean.vRequestId}",
						'email':"${Bean.email}",
						'requestTime':"${Bean.requestTime}",
						//======有問題
						<c:choose>
							<c:when test="${Bean.approver}=='null'">
								'approverName':"",
							</c:when>
							<c:when test="${Bean.approver} !='null'">
								'approverName':"${Bean.approver.memberId}",
							</c:when>
						</c:choose>
						//======
						'approverName':"${Bean.approverId}",
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
								'responseComment':"<input type='text'></input>",
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${Bean.requestStatus == 3}">
								'response':"<div id='${Bean.vRequestId}ButtonArea'><button onclick='responseCommit(${Bean.vRequestId})'>核准</button><button onclick='responseRefuse(${Bean.vRequestId})'>拒絕</button></div>",
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
					console.log(table.row(id-1).data(6));
					$.ajax({
						url : "${pageContext.request.contextPath}/memberSystem/CoworkerPWRequest",
						//後端的MemberID寫不進去DB
						data : {
							"Answer":true,
							"id" : id,
							"responseComment":"456",
						},
						type : "Post",
						error : function() {
							console.log("error");
						},
						success : function(data) {
							console.log(data);
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
							"responseComment":"123",
						},
						type : "Post",
						error : function() {
							console.log("error");
						},
						success : function(data) {
							console.log(data);
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