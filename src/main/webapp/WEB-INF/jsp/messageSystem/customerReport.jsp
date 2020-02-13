<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="hidden"></input>
	<div class="card-warning h-75 mx-auto">
		<div class="card-header">
		<i class='fas fa-times' style='font-size:20px; float:left ' onclick='floatPageClose()'></i>
			<h2 class="card-title mx-3">客服回報單</h2>
		</div>
		<!-- /.card-header -->
		<div class="card-body">
			<form role="form">
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
							<label>客戶Email</label> <input type="text"
								class="form-control" id="memberEmail" value="${CustomerEmail}" disabled>
						</div>
					</div>
					<div class="col-sm-12">
						<!-- textarea -->
						<div class="form-group">
							<label>客戶需求</label>
							<textarea class="form-control" id="queryContent" rows="3" placeholder="請輸入文字..."></textarea>
						</div>
					</div>
					<div class="col-sm-12">
						<!-- text input -->
						<div class="form-group">
							<label>回應人</label> <input type="text" id="coworkerName" class="form-control" value="${Mem_LoginOK.lastName}${Mem_LoginOK.firstName}" disabled>
						</div>
					</div>
					<div class="col-sm-12">
						<!-- textarea -->
						<div class="form-group">
							<label>回應</label>
							<textarea class="form-control" id="replyContent" rows="3" placeholder="Enter ..."></textarea>
						</div>
					</div>
					<div class="float-right">
						<button class="btn btn-primary" onclick="sendCustomerReport(event)">
								<i class="far fa-envelope"></i> 送出
						</button>
						<button class="btn btn-primary" onclick="democustomerButton(event)">
								<i class="far fa-hand-peace"></i> Demo
						</button>
					</div>
				</div>
				
			</form>
		</div>
		<!-- /.card-body -->
	</div>
	<script>
	
	function sendCustomerReport(e){
		e.preventDefault();
		var memberEmail=$("#memberEmail").val();
		var queryContent=$("#queryContent").val();
		var coworkerID=${Mem_LoginOK.memberId};
		var replyContent=$("#replyContent").val();
		console.log(memberEmail+","+queryContent+","+coworkerID+","+replyContent);
		var Bean={
				'memberEmail':memberEmail,
				'queryContent':queryContent,
				'coworkerID':coworkerID,
				'replyContent':replyContent,
			};
		console.log(JSON.stringify(Bean));
			if(queryContent==""){
				swal("客戶需求不得為空", "", "error");
			}else if(replyContent==""){
				swal("回應內容不得為空", "", "error");
			}else{
				$.ajax({
					url:"${pageContext.request.contextPath}/messageSystem/insertcustomerReport",
					type:"Post",
					data:JSON.stringify(Bean),
					contentType:'application/json;charset=UTF-8',
					success:function(){
						swal("新增成功", "", "success");
						floatPageClose();
					},
					error:function(){
						swal("傳送失敗", "請再試一次", "error");
					}
				})
			}
		}

	function democustomerButton(e){
		e.preventDefault();
		$("#queryContent").val("顧客表示上次吃得Pizza好像有點問題，還有拉肚子");
		$("#replyContent").val("已特別關懷，並請他下次出示證明，免費請一份Pizza");
	}
	</script>
</body>
</html>