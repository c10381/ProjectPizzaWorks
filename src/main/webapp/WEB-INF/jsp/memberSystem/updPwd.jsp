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

<title>密碼修改</title>
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
			<a href="../../index2.html"><b>Pizza</b>會員密碼修改</a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">${errorMessage}</p>
				<p class="login-box-msg">${CLoginOK.lastName}</p>
				<form action="${pageContext.request.contextPath}/memberSystem/doUpdPwd"  method="post">

					<div class="input-group mb-3">
						<input type='password' class="form-control" placeholder="請輸入舊密碼"  name='oldPwd' id='oldPwd'/>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type='password' class="form-control" placeholder="請輸入新密碼"  name='newPwd' id='newPwd'/>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>				
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="請再次輸入密碼" name="chkPwd" id='chkPwd'>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>					
					<div class="row">
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">送出</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

				<!-- /.social-auth-links -->

			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->
	
	
	<script type="text/javascript">
	
	$(function() {
		$("#password").change(function() {
			var pwd1 = $("#password").val();
			var pwd2 = $("#validpwd").val();
			if (pwd2 != pwd1) {
				$("#btnAdd").prop("disabled", true);
				var errMsgP = document.createElement("span");
				$("#errbox").append(errMsgP);
				$("#errbox > span").attr("id", "errMsg");
				$("#errMsg").text("密碼不一致，請確認您的輸入！");
				$("#errMsg").attr({
					"class" : "text",
					"class" : "text-danger"
				})
			} else {
				$("#errMsg").remove();
				$("#btnAdd").prop("disabled", false);
			}
		})

		$("#validpwd").change(function() {
			var pwd1 = $("#password").val();
			var pwd2 = $("#validpwd").val();
			if (pwd2 != pwd1) {
				$("#btnAdd").prop("disabled", true);
				var errMsgP = document.createElement("span");
				$("#errbox").append(errMsgP);
				$("#errbox > span").attr("id", "errMsg");
				$("#errMsg").text("密碼不一致，請確認您的輸入！");
				$("#errMsg").attr({
					"class" : "text",
					"class" : "text-danger"
				})
			} else {
				$("#errMsg").remove();
				$("#btnAdd").prop("disabled", false);
			}
		})
	})
	
	</script>
	
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