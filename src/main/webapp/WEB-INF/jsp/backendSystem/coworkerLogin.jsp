<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Log in</title>
<!-- Tell the browser to be responsive to screen width -->
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
<body class="hold-transition login-page" style="background: url(${pageContext.request.contextPath}/images/shopSystem/bg_4.jpg) no-repeat fixed;background-size: cover;">
	<div class="login-box" style="background:white;">
		<div class="login-logo">
			<a href="../../index2.html"><b>Pizza</b>後台登入</a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">${errorMessage}</p>
				<form action="${pageContext.request.contextPath}/backendSystem/" method="post">
					<div class="input-group mb-3">
						<input type="email" class="form-control" placeholder="Email" name="email" value="" id="email">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="Password" name="password" value="" id="password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<!-- <input type="checkbox" id="remember"> <label
									for="remember"> Remember Me </label>  -->
								<a href="${pageContext.request.contextPath}/memberSystem/coworkerfPW">忘記密碼</a>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Sign
								In</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

				<!-- /.social-auth-links -->

				<p class="mb-1">
				</p>

			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->
	<!-- Login Demo btns-->
		<footer class="footer fixed-bottom">
			<div style="margin:20px auto;width:530px">
				<div id="admin" class="btn btn-default btn-sm" style="margin:5px">管理員</div>
				<div id="webadmin" class="btn btn-default btn-sm" style="margin:5px">網站管理員</div>
				<div id="Service" class="btn btn-default btn-sm" style="margin:5px">客服人員</div>
				<div id="purchase" class="btn btn-default btn-sm" style="margin:5px">進貨人員</div>
				<div id="sales" class="btn btn-default btn-sm" style="margin:5px">銷貨人員</div>
				<div id="stock" class="btn btn-default btn-sm" style="margin:5px">存貨人員</div>
			</div>

		</footer>
	</div>
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/adminlte.min.js"></script>
	<script>
		$().ready(function(){
			$("#admin").click(function(){
				$("#email").val("admin@pizza.com");
				$("#password").val("P@ssw0rd");
			});
			$("#webadmin").click(function(){
				$("#email").val("webadmin@pizza.com");
				$("#password").val("P@ssw0rd");
			});
			$("#Service").click(function(){
				$("#email").val("service@pizza.com");
				$("#password").val("P@ssw0rd");
			});
			$("#purchase").click(function(){
				$("#email").val("purchase@pizza.com");
				$("#password").val("P@ssw0rd");
			});
			$("#sales").click(function(){
				$("#email").val("sales@pizza.com");
				$("#password").val("P@ssw0rd");
			});
			$("#stock").click(function(){
				$("#email").val("stock@pizza.com");
				$("#password").val("P@ssw0rd");
			});
		});
	</script>
</body>
</html>
