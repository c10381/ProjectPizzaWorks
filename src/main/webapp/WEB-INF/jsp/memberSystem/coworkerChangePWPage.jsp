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
<!-- icon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/shopSystem/icon.png">
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
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
</head>

<body class="hold-transition login-page"
	style="background: url(${pageContext.request.contextPath}/images/shopSystem/bg_4.jpg) no-repeat fixed;background-size: cover;">
		<div class="login-box" style="background: transparent;">
			<div class="login-logo">
				<b style="color: #fac564;">Pizza Bite Manager<br>Forget Password</b>
			</div>
			<!-- /.login-logo -->
			<div class="card">
				<div class="card-body login-card-body" style="background: url(${pageContext.request.contextPath}/images/shopSystem/bg_4.jpg) no-repeat fixed;background-size: cover;">
					<p class="login-box-msg">${errorMessage}</p>
						<form
					action="${pageContext.request.contextPath}/memberSystem/coworkerchangePW"
					method="Post">
					<input type="hidden" class="form-control" id="email" name="email"
						value="${email}">

					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="請輸入密碼"
							id="password" name="password" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="確認密碼"
							id="Compassword" name="comfirmPassword" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					
					<!-- 佔位子空格用 -->
					<div class="login-box-msg"></div>
					<!-- /.social-auth-links -->
					<div class="row">
						<div class="col-12">
							<div id="SendButton">
								<button class="btn btn-block btn-seconary" style="background: #fac564;">送出變更密碼</button>
							</div>
						</div>
						<!-- /.col -->
					</div>

				</form>
						

					<!-- /.social-auth-links -->

					<p class="mb-1"></p>

					<!-- /.login-card-body -->
				</div>
			</div>
			<!-- /.login-box -->
			<!-- Login Demo btns-->
			<footer class="footer fixed-bottom justify-content-center align-self-center">
				<div style="margin: 0 auto 50px auto; width: 100px" class="justify-content-center align-items-center">
					<div id="admin" class="btn btn-default btn-md" style="margin: 5px;background: #fac564;color: black;">一鍵輸入</div>
					
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
	<!-- sweetalert -->
    <script src="${pageContext.request.contextPath}/js/backendSystem/sweetalert.min.js"></script>
	<script>
	$().ready(function(){
		$("#admin").click(function(){
			$("#password").val("Do!ng123");
			$("#Compassword").val("Do!ng123");
		});
	});
	</script>
</body>
</html>
