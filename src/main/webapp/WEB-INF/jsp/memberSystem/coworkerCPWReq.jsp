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
				$('#Table').DataTable({
					data : [
					<c:forEach items="${List}" var="Bean">
					{
						'vRequestId':"${Bean.vRequestId}",
						'email':"${Bean.email}",
						'requestTime':"${Bean.requestTime}",
						'approverName':"${Bean.approverId.lastName+Bean.approverId.firstName}",
						'responseTime':"${Bean.responseTime}",
						<c:choose>
							<c:when test="${Bean.requestStatus == 1}">
								'requestStatus':"未驗證",
							</c:when>
							<c:when test="${Bean.requestStatus == 2}">
								'requestStatus':"已驗證",
							</c:when>
							<c:when test="${Bean.requestStatus == 3}">
								'requestStatus':"申請修改密碼",
							</c:when>
							<c:when test="${Bean.requestStatus == 4}">
								'requestStatus':"申請密碼通過",
							</c:when>
						</c:choose>
						'responseComment':"${Bean.responseComment}",
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
	</script>

</body>
</html>