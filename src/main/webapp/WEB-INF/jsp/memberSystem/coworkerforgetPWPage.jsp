<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

<title>忘記密碼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backendSystem/all.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backendSystem/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backendSystem/adminlte.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

</head>

<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html"><b>Pizza後台忘記密碼請求</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<div class="login-box-msg">${errorMessage}</div>
				<div class="login-box-msg">${CLoginOK.lastName}</div>

				<div class="input-group mb-3">
					<input type="email" class="form-control" placeholder="請輸入信箱"
						name="email" id="email">
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-envelope"></span>
						</div>
					</div>
				</div>
				<!-- 佔位子空格用 -->
				<div class="login-box-msg"></div>
				<!-- /.social-auth-links -->
				<div class="row">
					<div class="col-6">
						<div class="icheck-primary">
							<a href="${pageContext.request.contextPath}/backendSystem/coworkerLogin" class="btn btn-primary btn-block" >返回登入畫面</a>
						</div>
					</div>

					<div class="col-6">
						<div id="SendButton">
							<button class="btn btn-primary btn-block" onclick="SendToBack()">送出變更密碼請求</button>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<div id="admin" class="btn btn-default btn-sm">員工甲</div>
			</div>
		</div>
	</div>
	<!-- /.login-box -->


	<script
		src="${pageContext.request.contextPath}/js/shopManageSystem/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/js/shopManageSystem/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/js/shopManageSystem/adminlte.min.js"></script>
	<script>
	$().ready(function(){
		$("#admin").click(function(){
			$("#email").val("asd@pizza.com");
			$("#password").val("P@ssw0rd");
		});
	}
		function SendToBack() {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/memberSystem/coworkforgetPWrequest",
						data : {
							"email" : $("#email").val()
						},
						type : "Get",
						error : function() {
							alert("Something Wrong.");
						},
						success : function(data) {
							console.log(data);
							$("#SendButton").empty();
							if(data=="ok"){
								$("#SendButton").append("<div class='col-8'>已通知管理員</div>");
							}else{
								$("#SendButton").append("<div class='col-8'>系統無此Email</div>");
							}
							
						}
					})
		}
	</script>
</body>

</html>