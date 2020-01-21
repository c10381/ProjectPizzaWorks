<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

<title>會員登入</title>
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
			<a href="../../index2.html"><b>Pizza</b>會員登入</a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">${errorMessage}</p>
				<p class="login-box-msg">${CLoginOK.lastName}</p>
				<form action="${pageContext.request.contextPath}/memberSystem/loginCheck" method="post">
					<div class="input-group mb-3">
						<input type="email" class="form-control" placeholder="請輸入信箱" name="email">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="請輸入密碼" name="password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="remember"> <label
									for="remember"> 記住我 </label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">登入</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

				<!-- /.social-auth-links -->

				<p class="mb-1">
					<a href="${pageContext.request.contextPath}/memberSystem/forgetpwd">忘記密碼</a>
				</p>
				
				<p class="mb-1">
					<a href="${pageContext.request.contextPath}/memberSystem/customer_register">註冊</a>
				</p>

			<!-- /.login-card-body -->
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
</body>
</html>